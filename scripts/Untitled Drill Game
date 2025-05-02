-- Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield", true))()

local Window = Rayfield:CreateWindow({
    Name = "Untitled Drill Game |Drained",
    LoadingTitle = "Untitled Drill Game | Drained",
    LoadingSubtitle = "By Drained",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Main")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local plr = Players.LocalPlayer

getgenv().settings = {drill = false, sell = false, collect = false, storage = false}

local sellPart = Workspace:FindFirstChild("Scripted"):FindFirstChild("Sell")
local drillsUi = plr.PlayerGui:FindFirstChild("Menu"):FindFirstChild("CanvasGroup").Buy
local handdrillsUi = plr.PlayerGui:FindFirstChild("Menu"):FindFirstChild("CanvasGroup").HandDrills

local plot = nil
for _, p in ipairs(Workspace.Plots:GetChildren()) do
    if p:FindFirstChild("Owner") and p.Owner.Value == plr then
        plot = p
        break
    end
end

MainTab:CreateToggle({
    Name = "Auto Drill",
    CurrentValue = false,
    Callback = function(bool)
        settings.drill = bool
        if bool then
            task.spawn(function()
                while settings.drill do
                    ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit")
                        .Services:WaitForChild("OreService").RE.RequestRandomOre:FireServer()
                    task.wait(0.01)
                end
            end)
        end
    end
})

local lastPos = nil
local function sell()
    lastPos = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart").CFrame
    if lastPos then plr.Character:FindFirstChild("HumanoidRootPart").CFrame = sellPart.CFrame end
    task.wait(0.2)
    local Knit = require(ReplicatedStorage.Packages.Knit)
    Knit.GetService("OreService").SellAll:Fire()
    task.wait(0.2)
    if lastPos then plr.Character:FindFirstChild("HumanoidRootPart").CFrame = lastPos end
end

MainTab:CreateButton({
    Name = "Sell All",
    Callback = function()
        sell()
    end
})

MainTab:CreateToggle({
    Name = "Auto Sell All",
    CurrentValue = false,
    Callback = function(bool)
        settings.sell = bool
        if bool then
            task.spawn(function()
                while settings.sell do
                    sell()
                    task.wait(10)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Collect Drills",
    CurrentValue = false,
    Callback = function(bool)
        settings.collect = bool
        if bool then
            task.spawn(function()
                while settings.collect do
                    if plot and plot:FindFirstChild("Drills") then
                        for _, drill in pairs(plot.Drills:GetChildren()) do
                            if not settings.collect then break end
                            ReplicatedStorage.Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(drill)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Collect Storage",
    CurrentValue = false,
    Callback = function(bool)
        settings.storage = bool
        if bool then
            task.spawn(function()
                while settings.storage do
                    if plot and plot:FindFirstChild("Storage") then
                        for _, storage in pairs(plot.Storage:GetChildren()) do
                            if not settings.storage then break end
                            ReplicatedStorage.Packages.Knit.Services.PlotService.RE.CollectDrill:FireServer(storage)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Drills Shop UI",
    CurrentValue = false,
    Callback = function(bool)
        drillsUi.Visible = bool
    end
})

MainTab:CreateToggle({
    Name = "Handdrills Shop UI",
    CurrentValue = false,
    Callback = function(bool)
        handdrillsUi.Visible = bool
    end
})

MainTab:CreateButton({
    Name = "Anti AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        plr.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end
})
