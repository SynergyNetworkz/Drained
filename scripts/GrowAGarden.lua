local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield", true))()

local Window = Rayfield:CreateWindow({
    Name = "Grow a Garden | Drained",
    LoadingTitle = "Grow a Garden | Drained",
    LoadingSubtitle = "Get Drained",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Main")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local BuyPetEgg = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("BuyPetEgg")
local PetEgg = workspace.Farm.Farm.Important.Objects_Physical:FindFirstChild("PetEgg")

local BuySeedStock = ReplicatedStorage.GameEvents.BuySeedStock
local BuyGearStock = ReplicatedStorage.GameEvents.BuyGearStock

local teleportPosition = CFrame.new(-260.47528076171875, 2.999999761581421, -9.200048446655273)
local eggTypes = {1, 2, 3}

local seeds = {
    "Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn",
    "Raspberry", "Pear", "Daffodil", "Watermelon", "Pumpkin", "Apple",
    "Bamboo", "Coconut", "Cactus", "Dragonfruit", "Mango", "Grapes", "Mushroom", "Pepper Seed"
}

local gears = {
    "Watering Can", "Trowel", "Basic Sprinkler", "Advanced Sprinkler",
    "Godly Sprinkler", "Lightning Rod", "Master Sprinkler"
}

local autoBuyEnabled = false
local autoSeedEnabled = false
local autoGearEnabled = false

local purchasedSeeds = {}
local purchasedGears = {}

local function checkIfAllBought(items, purchasedItems)
    for _, item in ipairs(items) do
        if not purchasedItems[item] then
            return false
        end
    end
    return true
end

MainTab:CreateToggle({
    Name = "Auto Buy Eggs",
    CurrentValue = false,
    Callback = function(Value)
        autoBuyEnabled = Value
        if Value then
            task.spawn(function()
                while autoBuyEnabled do
                    for _, id in ipairs(eggTypes) do
                        pcall(function() BuyPetEgg:FireServer(id) end)
                    end
                    task.wait(0.25)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Buy Seeds",
    CurrentValue = false,
    Callback = function(Value)
        autoSeedEnabled = Value
        if Value then
            task.spawn(function()
                while autoSeedEnabled do
                    if checkIfAllBought(seeds, purchasedSeeds) then
                        break
                    end
                    for _, seed in ipairs(seeds) do
                        if not purchasedSeeds[seed] then
                            pcall(function()
                                BuySeedStock:FireServer(seed)
                                purchasedSeeds[seed] = true
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Buy Gears",
    CurrentValue = false,
    Callback = function(Value)
        autoGearEnabled = Value
        if Value then
            task.spawn(function()
                while autoGearEnabled do
                    if checkIfAllBought(gears, purchasedGears) then
                        break
                    end
                    for _, gear in ipairs(gears) do
                        if not purchasedGears[gear] then
                            pcall(function()
                                BuyGearStock:FireServer(gear)
                                purchasedGears[gear] = true
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

MainTab:CreateButton({
    Name = "Teleport to Egg Shop",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = teleportPosition
            Rayfield:Notify({
                Title = "Teleported!",
                Content = "You are now at the egg shop.",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})
