local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield", true))()

local Window = Rayfield:CreateWindow({
    Name = "Dig To Earth's Core | Drained",
    LoadingTitle = "Dig To Earth's Core | Drained",
    LoadingSubtitle = "Get Drained",
    ConfigurationSaving = {Enabled = false}
})

local MainTab = Window:CreateTab("Main")

local DiscordSection = MainTab:CreateSection("discord.gg/8A6k73JqCM")

MainTab:CreateToggle({
    Name = "Infinite Money",
    CurrentValue = false,
    Callback = function(value)
        _G.GetWins = value
        if value then
            Rayfield:Notify({
                Title = "Infinite Money",
                Content = "Infinite money enabled!",
                Duration = 3,
                Image = 4483362458
            })
            while _G.GetWins do
                local cashArgs = {[1] = "Cash", [2] = 50005463548395500000}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddRewardEvent"):FireServer(unpack(cashArgs))
                local spinArgs = {[1] = 8}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(spinArgs))
                task.wait(0.1)
            end
        else
            Rayfield:Notify({
                Title = "Infinite Money",
                Content = "Infinite money disabled!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MainTab:CreateToggle({
    Name = "Infinite Gems",
    CurrentValue = false,
    Callback = function(value)
        _G.GetGems = value
        if value then
            Rayfield:Notify({
                Title = "Infinite Gems",
                Content = "Infinite gems enabled!",
                Duration = 3,
                Image = 4483362458
            })
            while _G.GetGems do
                local args = {[1] = "Gems", [2] = 5000546546500000}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddRewardEvent"):FireServer(unpack(args))
                task.wait(0.1)
            end
        else
            Rayfield:Notify({
                Title = "Infinite Gems",
                Content = "Infinite gems disabled!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MainTab:CreateToggle({
    Name = "Infinite Spins",
    CurrentValue = false,
    Callback = function(value)
        _G.GetSpins = value
        if value then
            Rayfield:Notify({
                Title = "Infinite Spins",
                Content = "Infinite spins enabled!",
                Duration = 3,
                Image = 4483362458
            })
            while _G.GetSpins do
                local args = {[1] = "Spins", [2] = 500}
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddRewardEvent"):FireServer(unpack(args))
                task.wait(0.1)
            end
        else
            Rayfield:Notify({
                Title = "Infinite Spins",
                Content = "Infinite spins disabled!",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

MainTab:CreateButton({
    Name = "Get Free Pet",
    Callback = function()
        local args = {[1] = "Triple Dominus"}
        for i = 1, 3 do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PetCageEvent"):FireServer(unpack(args))
        end
        Rayfield:Notify({
            Title = "Get Free Pet",
            Content = "Triple Dominus pet received!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

MainTab:CreateButton({
    Name = "10x Money",
    Callback = function()
        local args = {[1] = 8}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))
        Rayfield:Notify({
            Title = "10x Money",
            Content = "10x Money activated!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

local AdditionalSection = MainTab:CreateSection("Additional Features")

MainTab:CreateButton({
    Name = "Fast Spin",
    Callback = function()
        local SpinEvent = game:GetService("ReplicatedStorage").Remotes.SpinRequestEvent
        for i = 1, 10 do
            SpinEvent:FireServer()
            task.wait(0.05)
        end
        Rayfield:Notify({
            Title = "Fast Spin",
            Content = "10 quick spins completed!",
            Duration = 3,
            Image = 4483362458
        })
    end
})
