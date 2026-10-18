-- =================================================================
-- ROBLOX SCRIPT HUB - ROUBE UM OVO (HALLOWEEN UPDATE)
-- Sem Key | Interface Orion Library
-- =================================================================

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "🎃 Roube um Ovo | Halloween Update 🎃",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "StealEggHalloweenConfig",
    IntroText = "Roube um Ovo - Halloween"
})

-- ABA: HALLOWEEN EVENT
local HalloweenTab = Window:MakeTab({
    Name = "🎃 Evento Halloween",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

HalloweenTab:AddToggle({
    Name = "Auto Farm de Doces & Abóboras",
    Default = false,
    Callback = function(Value)
        _G.AutoCandies = Value
        task.spawn(function()
            while _G.AutoCandies do
                task.wait(0.1)
                -- Lógica para recolher doces espalhados pelo mapa
                pcall(function()
                    for _, v in pairs(workspace:GetChildren()) do
                        if v.Name:find("Candy") or v.Name:find("Pumpkin") or v.Name:find("Doce") then
                            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            end
                        end
                    end
                end)
            end
        end)
    end
})

HalloweenTab:AddToggle({
    Name = "Auto Roubar Ovos Fantasma / Amaldiçoados",
    Default = false,
    Callback = function(Value)
        _G.AutoSpookyEggs = Value
        task.spawn(function()
            while _G.AutoSpookyEggs do
                task.wait(0.2)
                -- Lógica para coletar ovos de evento
                pcall(function()
                    for _, egg in pairs(workspace:GetChildren()) do
                        if egg.Name:find("Spooky") or egg.Name:find("Ghost") or egg.Name:find("Fantasma") then
                            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = egg.CFrame
                            end
                        end
                    end
                end)
            end
        end)
    end
})

HalloweenTab:AddButton({
    Name = "Teleporte: Caldeirão da Bruxa",
    Callback = function()
        pcall(function()
            local cauldron = workspace:FindFirstChild("WitchCauldron") or workspace:FindFirstChild("Caldeirao")
            if cauldron then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cauldron.CFrame
            end
        end)
    end
})

-- ABA: PLAYER & UTILITÁRIOS
local PlayerTab = Window:MakeTab({
    Name = "🏃 Jogador",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PlayerTab:AddSlider({
    Name = "Velocidade (WalkSpeed)",
    Min = 16,
    Max = 250,
    Default = 16,
    Color = Color3.fromRGB(255, 115, 0),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

PlayerTab:AddSlider({
    Name = "Força do Pulo (JumpPower)",
    Min = 50,
    Max = 300,
    Default = 50,
    Color = Color3.fromRGB(255, 115, 0),
    Increment = 1,
    ValueName = "Power",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

OrionLib:Init()
