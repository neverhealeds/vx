workspace.FE.Actions.Actions.Banned:Destroy()

for i,lc2 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if lc2:IsA("LocalScript") and string.match(lc2.Name, "1") or string.match(lc2.Name, "2") or string.match(lc2.Name, "3") or string.match(lc2.Name, "4") or string.match(lc2.Name, "5") or string.match(lc2.Name, "6") or string.match(lc2.Name, "7") or string.match(lc2.Name, "8") or string.match(lc2.Name, "9") then
       lc2:Destroy()
    end
end

game:GetService("ReplicatedStorage")["b\007\010\007\010\007"]:Destroy()
game:GetService("ReplicatedStorage")["\010\007\010"]:Destroy()

local x = {
	game:GetService("ReplicatedStorage"):WaitForChild("Events", 5) and game:GetService("ReplicatedStorage").Events:FindFirstChild("AntiCheatRemote"),
	game:GetService("ReplicatedStorage"):WaitForChild("Events", 5) and game:GetService("ReplicatedStorage").Events:FindFirstChild("SecretEvent"),
	game:GetService("ReplicatedStorage"):WaitForChild("Events", 5) and game:GetService("ReplicatedStorage").Events:FindFirstChild("SusRemote"),
}

for _, v in ipairs(x) do
    if v then
        v:Destroy()
    end
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BypassGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 1
frame.Parent = gui

local message = Instance.new("TextLabel")
message.Size = UDim2.new(1, 0, 1, 0)
message.BackgroundTransparency = 1
message.TextColor3 = Color3.fromRGB(255, 255, 255)
message.TextScaled = true
message.Font = Enum.Font.GothamBlack
message.TextTransparency = 1
message.Text = "WAIT A SEC..."
message.Parent = frame

local fadeInTime = 1
TweenService:Create(frame, TweenInfo.new(fadeInTime), {BackgroundTransparency = 0}):Play()
TweenService:Create(message, TweenInfo.new(fadeInTime), {TextTransparency = 0}):Play()

task.wait(3)
message.Text = "kyro.dev is loading..."
task.wait(2)

local fadeOutTime = 1
TweenService:Create(frame, TweenInfo.new(fadeOutTime), {BackgroundTransparency = 1}):Play()
TweenService:Create(message, TweenInfo.new(fadeOutTime), {TextTransparency = 1}):Play()

task.wait(fadeOutTime)
gui:Destroy()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/neverhealeds/vx/refs/heads/main/Vernum%20Gui%20Libary.lua"))()

local Window = Library:Window({
    Title = "kyro.dev | Cringe Soccer",
    Desc = "by kyro.dev",
    Icon = 11136259108,
    Theme = "Amethyst",
    Config = {
        Keybind = Enum.KeyCode.End,
        Size = UDim2.new(0, 530, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Open kyro.dev"
    }
})

local powershootEnabled = false
local powerValue = 180
local reachEnabled = false
local reachDistance = 1
local reachConnection = nil
local headReachEnabled = false
local headReachSize = Vector3.new(1, 1.5, 1)
local headTransparency = 0.5
local headOffset = Vector3.new(0, 0, 0)
local headBoxPart = nil
local headConnection = nil
local usePercentage = false
local percentageValue = 1
local volleyPart = nil
local reachEnabledVolley = false
local reachDistanceVolley = 1
local reachConnectionVolley = nil
local WalkspeedEnabled = false
local CurrentSpeed = 23
local JumpEnabled = false
local CurrentJump = 50
local Disguise = {Enabled = false}
local DisguiseUsername = {Value = ""}
local DisguiseDescription = nil
local followBall = false
local toggleEnabledAir = false
local toggleEnabledInf = false

local KickRemote = workspace:WaitForChild("FE", 9e9):WaitForChild("Actions", 9e9):WaitForChild("Kick", 9e9)
local TPS = workspace:WaitForChild("TPSSystem", 9e9):WaitForChild("TPS", 9e9)

local function getAdjustedSize(val, y, z)
    return Vector3.new(val, y, z)
end

local function updateHeadOffset()
    headOffset = Vector3.new(0, headReachSize.Y / 2.5, 0)
end

local function updateHeadBox()
    if headBoxPart then headBoxPart:Destroy() end
    headBoxPart = Instance.new("Part")
    headBoxPart.Size = headReachSize
    headBoxPart.Transparency = headTransparency
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Color = Color3.fromRGB(255, 105, 180)
    headBoxPart.Material = Enum.Material.Neon
    headBoxPart.Name = "HeadReachBox"
    headBoxPart.Parent = workspace
end

local function startHeadReach()
    if not headReachEnabled then return end
    if headConnection then headConnection:Disconnect() end
    updateHeadBox()
    headConnection = RunService.RenderStepped:Connect(function()
        local character = player.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        if not (head and TPS) then return end
        headBoxPart.CFrame = head.CFrame * CFrame.new(headOffset)
        local boxCFrame, boxSize = headBoxPart.CFrame, headBoxPart.Size
        local relative = boxCFrame:PointToObjectSpace(TPS.Position)
        if math.abs(relative.X) <= boxSize.X / 2 and math.abs(relative.Y) <= boxSize.Y / 2 and math.abs(relative.Z) <= boxSize.Z / 2 then
            firetouchinterest(head, TPS, 0)
            firetouchinterest(head, TPS, 1)
        end
    end)
end

local function stopHeadReach()
    if headConnection then headConnection:Disconnect() end
    if headBoxPart then headBoxPart:Destroy() end
end

local function checkInsideZone()
    if not volleyPart then return false end
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    local pos = root.Position
    local min = volleyPart.Position - (volleyPart.Size / 2)
    local max = volleyPart.Position + (volleyPart.Size / 2)
    return pos.X >= min.X and pos.X <= max.X and pos.Y >= min.Y and pos.Y <= max.Y and pos.Z >= min.Z and pos.Z <= max.Z
end

local CombatTab = Window:Tab({Title = "Reach & Shoot", Icon = 10734947932})
local MiscTab = Window:Tab({Title = "Misc & Settings", Icon = 10734950309})

CombatTab:Section({Title = "Powershoot"})
CombatTab:Toggle({
    Title = "Enable Powershoot",
    Desc = "Press H to shoot with power",
    Value = false,
    Callback = function(v) powershootEnabled = v end
})
CombatTab:Slider({
    Title = "Shoot Power",
    Min = 1,
    Max = 400,
    Value = 180,
    Callback = function(v) powerValue = v end
})

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.H and powershootEnabled then
        KickRemote:FireServer(TPS, powerValue, Vector3.new(900000, 850, 900000), false, false, 1)
    end
end)

CombatTab:Section({Title = "Reach"})
CombatTab:Toggle({
    Title = "Reach (Firetouchinterest)",
    Value = false,
    Callback = function(v)
        reachEnabled = v
        if not v and reachConnection then
            reachConnection:Disconnect()
            reachConnection = nil
        end
        if v then
            if reachConnection then reachConnection:Disconnect() end
            reachConnection = RunService.RenderStepped:Connect(function()
                local character = player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")
                if not (character and rootPart and humanoid and TPS) then return end
                if (rootPart.Position - TPS.Position).Magnitude <= reachDistance then
                    local pref = Lighting:FindFirstChild(player.Name) and Lighting[player.Name]:FindFirstChild("PreferredFoot")
                    if pref then
                        local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6) and (pref.Value == 1 and "Right Leg" or "Left Leg") or (pref.Value == 1 and "RightLowerLeg" or "LeftLowerLeg")
                        local limb = character:FindFirstChild(limbName)
                        if limb then firetouchinterest(limb, TPS, 0) firetouchinterest(limb, TPS, 1) end
                    end
                end
            end)
        end
    end
})
CombatTab:Slider({
    Title = "Reach Distance",
    Min = 1,
    Max = 15,
    Value = 1,
    Callback = function(v) reachDistance = v end
})

CombatTab:Section({Title = "Mossing & Head Reach"})
CombatTab:Toggle({
    Title = "Head Reach",
    Value = false,
    Callback = function(v)
        headReachEnabled = v
        if v then startHeadReach() else stopHeadReach() end
    end
})
CombatTab:Slider({
    Title = "Reach X", Min = 0, Max = 50, Value = 1,
    Callback = function(v) headReachSize = Vector3.new(v, headReachSize.Y, headReachSize.Z) if headReachEnabled then updateHeadBox() end end
})
CombatTab:Slider({
    Title = "Reach Y", Min = 0, Max = 50, Value = 1.5,
    Callback = function(v) headReachSize = Vector3.new(headReachSize.X, v, headReachSize.Z) headOffset = Vector3.new(0, v/2.5, 0) if headReachEnabled then updateHeadBox() end end
})
CombatTab:Slider({
    Title = "Reach Z", Min = 0, Max = 50, Value = 1,
    Callback = function(v) headReachSize = Vector3.new(headReachSize.X, headReachSize.Y, v) if headReachEnabled then updateHeadBox() end end
})

MiscTab:Section({Title = "Performance"})
MiscTab:Button({Title = "Unlock FPS", Callback = function() setfpscap(10000) end})
MiscTab:Button({Title = "FPS Boost", Callback = function()
    Lighting.GlobalShadows = false Lighting.FogEnd = 9e9 settings().Rendering.QualityLevel = 1
    for _, d in pairs(game:GetDescendants()) do
        if d:IsA("BasePart") then d.Material = "SmoothPlastic" d.CastShadow = false elseif d:IsA("Decal") then d.Transparency = 1 end
    end
end})

MiscTab:Section({Title = "Helpers"})
MiscTab:Toggle({
    Title = "ZZZZ Helper",
    Callback = function(state)
        if state then
            local p = Instance.new("Part", workspace) p.Name = "TPS1" p.Size = Vector3.new(9,0.1,9) p.Anchored = true p.Transparency = 0.5 p.Color = Color3.new(1,0,0)
            RunService.RenderStepped:Connect(function() if TPS and p.Parent then p.Position = TPS.Position - Vector3.new(0,1,0) end end)
        else
            if workspace:FindFirstChild("TPS1") then workspace.TPS1:Destroy() end
        end
    end
})

MiscTab:Section({Title = "UI Settings"})
MiscTab:Keybind({
    Title = "Toggle Keybind",
    Key = Enum.KeyCode.End,
    Callback = function(key) Window:SetToggleKey(key) end
})

MiscTab:Section({Title = "Discord"})
MiscTab:Button({
    Title = "Copy Discord Link",
    Callback = function() setclipboard("https://discord.gg/VupDs2wErx") end
})

Library:Notify({Title = "kyro.dev Loaded", Desc = "Enjoy your game!", Time = 5})
