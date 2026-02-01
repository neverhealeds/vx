local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Load WindUI at the start to ensure it's available globally
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
end)

if not success or not WindUI then
    warn("vxnity hub: Failed to load WindUI library.")
    return
end

-- System Loader UI
local function ShowSystemLoader(onFinished)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "vxnitySystemLoader"
    ScreenGui.IgnoreGuiInset = true
    
    local success, coreGui = pcall(function() return game:GetService("CoreGui") end)
    ScreenGui.Parent = (success and coreGui) or LocalPlayer:WaitForChild("PlayerGui")

    -- Background Blur
    local Blur = Instance.new("BlurEffect")
    Blur.Size = 0
    Blur.Parent = Lighting
    TweenService:Create(Blur, TweenInfo.new(1), {Size = 15}):Play()

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 420, 0, 240)
    MainFrame.Position = UDim2.new(0.5, -210, 0.5, -120)
    MainFrame.BackgroundColor3 = Color3.fromHex("#080808")
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.BackgroundTransparency = 1
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromHex("#9d56ff")
    UIStroke.Thickness = 2.5
    UIStroke.Transparency = 1
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Parent = MainFrame

    -- Soft Glow behind frame
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "Glow"
    Glow.BackgroundTransparency = 1
    Glow.Position = UDim2.new(0, -50, 0, -50)
    Glow.Size = UDim2.new(1, 100, 1, 100)
    Glow.Image = "rbxassetid://6015667343"
    Glow.ImageColor3 = Color3.fromHex("#9d56ff")
    Glow.ImageTransparency = 1
    Glow.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Position = UDim2.new(0, 0, 0.2, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "vxnity hub"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 46
    Title.Font = Enum.Font.GothamBold
    Title.TextTransparency = 1
    Title.Parent = MainFrame

    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#ffffff")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#9d56ff"))
    })
    TitleGradient.Parent = Title

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Size = UDim2.new(1, 0, 0, 20)
    SubTitle.Position = UDim2.new(0, 0, 0.45, 0)
    SubTitle.BackgroundTransparency = 1
    SubTitle.Text = "PREMIUM EXECUTION SYSTEM"
    SubTitle.TextColor3 = Color3.fromHex("#9d56ff")
    SubTitle.TextSize = 13
    SubTitle.Font = Enum.Font.GothamBold
    SubTitle.TextTransparency = 1
    SubTitle.Parent = MainFrame

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.new(1, 0, 0, 30)
    Status.Position = UDim2.new(0, 0, 0.8, 0)
    Status.BackgroundTransparency = 1
    Status.Text = "Initializing..."
    Status.TextColor3 = Color3.fromHex("#aaaaaa")
    Status.TextSize = 14
    Status.Font = Enum.Font.Gotham
    Status.TextTransparency = 1
    Status.Parent = MainFrame

    local BarBack = Instance.new("Frame")
    BarBack.Size = UDim2.new(0.7, 0, 0, 4)
    BarBack.Position = UDim2.new(0.15, 0, 0.72, 0)
    BarBack.BackgroundColor3 = Color3.fromHex("#1a1a1a")
    BarBack.BorderSizePixel = 0
    BarBack.BackgroundTransparency = 1
    BarBack.Parent = MainFrame

    local BarBackCorner = Instance.new("UICorner")
    BarBackCorner.CornerRadius = UDim.new(1, 0)
    BarBackCorner.Parent = BarBack

    local BarFill = Instance.new("Frame")
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromHex("#9d56ff")
    BarFill.BorderSizePixel = 0
    BarFill.Parent = BarBack

    local BarFillCorner = Instance.new("UICorner")
    BarFillCorner.CornerRadius = UDim.new(1, 0)
    BarFillCorner.Parent = BarFill

    local BarGlow = Instance.new("ImageLabel")
    BarGlow.BackgroundTransparency = 1
    BarGlow.Position = UDim2.new(0, -10, 0, -10)
    BarGlow.Size = UDim2.new(1, 20, 1, 20)
    BarGlow.Image = "rbxassetid://6015667343"
    BarGlow.ImageColor3 = Color3.fromHex("#9d56ff")
    BarGlow.ImageTransparency = 0.4
    BarGlow.Parent = BarFill

    -- Entrance Animation
    TweenService:Create(MainFrame, TweenInfo.new(0.8, Enum.EasingStyle.Quart), {BackgroundTransparency = 0}):Play()
    TweenService:Create(UIStroke, TweenInfo.new(0.8, Enum.EasingStyle.Quart), {Transparency = 0}):Play()
    TweenService:Create(Glow, TweenInfo.new(1.2, Enum.EasingStyle.Quart), {ImageTransparency = 0.7}):Play()
    TweenService:Create(Title, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0.2), {TextTransparency = 0}):Play()
    TweenService:Create(SubTitle, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0.4), {TextTransparency = 0.3}):Play()
    TweenService:Create(Status, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0.6), {TextTransparency = 0}):Play()
    TweenService:Create(BarBack, TweenInfo.new(0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false, 0.6), {BackgroundTransparency = 0}):Play()

    -- Loading Logic
    task.spawn(function()
        local steps = {
            {0.15, "Authenticating session..."},
            {0.35, "Syncing vxnity cloud..."},
            {0.60, "Bypassing game integrity..."},
            {0.85, "Optimizing UI components..."},
            {1.0, "Ready to execute"}
        }
        
        task.wait(1)
        for _, step in ipairs(steps) do
            Status.Text = step[2]
            local tween = TweenService:Create(BarFill, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(step[1], 0, 1, 0)})
            tween:Play()
            task.wait(0.8)
        end
        
        task.wait(0.5)
        
        -- Exit Animation
        TweenService:Create(Blur, TweenInfo.new(0.6), {Size = 0}):Play()
        local exitTween = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 440, 0, 0),
            Position = UDim2.new(0.5, -220, 0.5, 0)
        })
        
        for _, v in pairs(MainFrame:GetDescendants()) do
            if v:IsA("TextLabel") then
                TweenService:Create(v, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
            elseif v:IsA("Frame") or v:IsA("UIStroke") or v:IsA("ImageLabel") then
                local prop = v:IsA("ImageLabel") and "ImageTransparency" or (v:IsA("UIStroke") and "Transparency" or "BackgroundTransparency")
                TweenService:Create(v, TweenInfo.new(0.4), {[prop] = 1}):Play()
            end
        end
        
        exitTween:Play()
        exitTween.Completed:Wait()
        
        Blur:Destroy()
        ScreenGui:Destroy()
        if onFinished then
            onFinished()
        end
    end)
end

-- Security/Clean
for i,b in pairs(workspace.FE.Actions:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

for i,b in pairs(LocalPlayer.Character:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

local a = workspace.FE.Actions
if a:FindFirstChild("KeepYourHeadUp_") then
    a.KeepYourHeadUp_:Destroy()
    local r = Instance.new("RemoteEvent")
    r.Name = "KeepYourHeadUp_"
    r.Parent = a
else
    LocalPlayer:Kick("Anti-Cheat Updated! Send a photo of this Message in our Discord Server so we can fix it.")
end

local function isWeirdName(name)
    return string.match(name, "^[a-zA-Z]+%-%d+%a*%-%d+%a*$") ~= nil
end

local function deleteWeirdRemoteEvents(parent)
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("RemoteEvent") and isWeirdName(child.Name) then
            child:Destroy()
        end
        deleteWeirdRemoteEvents(child)
    end
end

deleteWeirdRemoteEvents(game)

local function LoadVxnityHub()
    -- Debug notification
    WindUI:Notify({
        Title = "vxnity hub",
        Desc = "Loading main script...",
        Icon = "loader",
        Duration = 2
    })
    
    -- Parche para Celular
    local isMobile = UserInputService.TouchEnabled
    local windowSize = isMobile and UDim2.fromOffset(480, 380) or UDim2.fromOffset(600, 520)
    local topbarHeight = isMobile and 40 or 48
    local iconSize = isMobile and 18 or 22

    local Window = WindUI:CreateWindow({
        Title = "vxnity hub",
        Author = "vxnity team",
        Folder = "vxnityHub",
        IconSize = iconSize,
        NewElements = true,
        Size = windowSize,
        HideSearchBar = false,
        OpenButton = {
            Title = "vxnity",
            CornerRadius = UDim.new(0, 8),
            StrokeThickness = 2,
            Enabled = true,
            Draggable = true,
            OnlyMobile = false,
            Scale = 1,
            Color = ColorSequence.new(Color3.fromHex("#9d56ff"), Color3.fromHex("#7b2eff"))
        },
        Topbar = {
            Height = topbarHeight,
            ButtonsType = "Mac",
        },
    })

    do
        WindUI:AddTheme({
            Name = "vxnityPremium",
            Accent = Color3.fromHex("#9d56ff"),
            Dialog = Color3.fromHex("#080808"),
            Outline = Color3.fromHex("#1a1a1a"),
            Text = Color3.fromHex("#ffffff"),
            Placeholder = Color3.fromHex("#808080"),
            Button = Color3.fromHex("#101010"),
            Icon = Color3.fromHex("#9d56ff"),
            WindowBackground = Color3.fromHex("#030303"),
            TopbarButtonIcon = Color3.fromHex("#ffffff"),
            TopbarTitle = Color3.fromHex("#ffffff"),
            TopbarAuthor = Color3.fromHex("#9d56ff"),
            TopbarIcon = Color3.fromHex("#9d56ff"),
            TabBackground = Color3.fromHex("#050505"),
            TabTitle = Color3.fromHex("#808080"),
            TabIcon = Color3.fromHex("#9d56ff"),
            ElementBackground = Color3.fromHex("#0a0a0a"),
            ElementTitle = Color3.fromHex("#ffffff"),
            ElementDesc = Color3.fromHex("#707070"),
            ElementIcon = Color3.fromHex("#9d56ff"),
        })
        WindUI:SetTheme("vxnityPremium")
    end

    local HomeSection = Window:Section({ Title = "Information" })
    local HomeTab = HomeSection:Tab({ Title = "Home", Icon = "home" })

    HomeTab:Section({ Title = "Welcome to vxnity hub" })
    HomeTab:Paragraph({
        Title = "Script Version: 1.2.0",
        Desc = "Stable build for TPS Street Soccer"
    })
    HomeTab:Paragraph({
        Title = "User: " .. LocalPlayer.Name,
        Desc = "Rank: Premium User"
    })
    HomeTab:Section({ Title = "Updates" })
    HomeTab:Paragraph({
        Title = "Latest Update: 2026-02-01",
        Desc = "- Improved Reach\n- optimized ui\n- Fixed Loader issues"
    })

    local Main = Window:Section({ Title = "main" })
    local ReachTab = Main:Tab({ Title = "Reach", Icon = "target" })
    local MossingTab = Main:Tab({ Title = "Mossing", Icon = "wind" })
    local ReactTab = Main:Tab({ Title = "Reacts", Icon = "zap" })

    local Misc = Window:Section({ Title = "Utility & Extra" })
    local HelpersTab = Misc:Tab({ Title = "Helpers", Icon = "shield-check" })
    local AimbotTab = Misc:Tab({ Title = "Aimbot", Icon = "crosshair" })

    local reachEnabled = false
    local reachDistance = 1
    local reachConnection

    ReachTab:Section({ Title = "Leg Reach (Method A)" })

    ReachTab:Toggle({
        Title = "Active FireTouchInterest",
        Desc = "Triggers ball contact automatically",
        Callback = function(Value)
            reachEnabled = Value
            if not Value and reachConnection then
                reachConnection:Disconnect()
                reachConnection = nil
            end

            if Value then
                if reachConnection then reachConnection:Disconnect() end
                reachConnection = RunService.RenderStepped:Connect(function()
                    local player = LocalPlayer
                    local character = player and player.Character
                    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character and character:FindFirstChild("Humanoid")

                    if not (character and rootPart and humanoid) then return end
                    local tps = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
                    if not tps then return end

                    local distance = (rootPart.Position - tps.Position).Magnitude
                    if distance <= reachDistance then
                        local preferredFoot = Lighting:FindFirstChild(player.Name) and Lighting[player.Name]:FindFirstChild("PreferredFoot")
                        if preferredFoot then
                            local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6)
                                and ((preferredFoot.Value == 1) and "Right Leg" or "Left Leg")
                                or ((preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg")

                            local limb = character:FindFirstChild(limbName)
                            if limb then
                                firetouchinterest(limb, tps, 0)
                                firetouchinterest(limb, tps, 1)
                            end
                        end
                    end
                end)
            end
        end
    })

    ReachTab:Slider({
        Title = "Reach Distance",
        Desc = "Adjust the activation range",
        Value = { Min = 1, Max = 15, Default = 1 },
        Callback = function(val)
            reachDistance = tonumber(val)
        end
    })

    ReachTab:Section({ Title = "Leg Reach (Method B)" })

    ReachTab:Input({
        Title = "Leg Hitbox (R6)",
        Desc = "Modifies physical size of legs",
        Value = "1",
        Callback = function(Value) 
            local v = tonumber(Value) or 1
            if LocalPlayer.Character then
                if LocalPlayer.Character:FindFirstChild("Right Leg") then
                    LocalPlayer.Character["Right Leg"].Size = Vector3.new(v, 2, v)
                    LocalPlayer.Character["Left Leg"].Size = Vector3.new(v, 2, v)
                    LocalPlayer.Character["Right Leg"].CanCollide = false
                    LocalPlayer.Character["Left Leg"].CanCollide = false
                end
                if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(v,2,v)
                    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                end
            end
        end
    })

    ReachTab:Input({
        Title = "Legs Size (R15)",
        Desc = "Minimum Size is 1",
        Value = "1",
        Callback = function(Value) 
            local v = tonumber(Value) or 1
            if LocalPlayer.Character then
                if LocalPlayer.Character:FindFirstChild("RightLowerLeg") then
                    LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(v, 2, v)
                    LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(v, 2, v)
                    LocalPlayer.Character["RightLowerLeg"].CanCollide = false
                    LocalPlayer.Character["LeftLowerLeg"].CanCollide = false
                end
                if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(v,2,v)
                    LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                end
            end
        end
    })

    ReachTab:Button({
        Title = "Fake legs (Appear Normal)",
        Callback = function()
            local player = LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")

            if humanoid.RigType == Enum.HumanoidRigType.R6 then
                character["Right Leg"].Transparency = 1
                character["Left Leg"].Transparency = 1

                character["Left Leg"].Massless = true
                local LeftLegM = Instance.new("Part", character)
                LeftLegM.Name = "Left Leg Fake"
                LeftLegM.CanCollide = false
                LeftLegM.Color = character["Left Leg"].Color
                LeftLegM.Size = Vector3.new(1, 2, 1)
                LeftLegM.Position = character["Left Leg"].Position
                
                local MotorHip = Instance.new("Motor6D", character.Torso)
                MotorHip.Part0 = character.Torso
                MotorHip.Part1 = LeftLegM
                MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)

                character["Right Leg"].Massless = true
                local RightLegM = Instance.new("Part", character)
                RightLegM.Name = "Right Leg Fake"
                RightLegM.CanCollide = false
                RightLegM.Color = character["Right Leg"].Color
                RightLegM.Size = Vector3.new(1, 2, 1)
                RightLegM.Position = character["Right Leg"].Position

                local MotorHip2 = Instance.new("Motor6D", character.Torso)
                MotorHip2.Part0 = character.Torso
                MotorHip2.Part1 = RightLegM
                MotorHip2.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                MotorHip2.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            end
        end
    })

    local headReachEnabled = false
    local headReachSize = Vector3.new(1, 1.5, 1)
    local headTransparency = 0.5
    local headOffset = Vector3.new(0, 0, 0)
    local headBoxPart
    local headConnection

    local function updateHeadBox()
        if headBoxPart then headBoxPart:Destroy() end
        headBoxPart = Instance.new("Part")
        headBoxPart.Size = headReachSize
        headBoxPart.Transparency = headTransparency
        headBoxPart.Anchored = true
        headBoxPart.CanCollide = false
        headBoxPart.Color = Color3.fromHex("#9d56ff")
        headBoxPart.Material = Enum.Material.Neon
        headBoxPart.Name = "HeadReachBox"
        headBoxPart.Parent = Workspace
    end

    local function startHeadReach()
        if not headReachEnabled then return end
        if headConnection then headConnection:Disconnect() end
        updateHeadBox()
        headConnection = RunService.RenderStepped:Connect(function()
            local character = LocalPlayer.Character
            if not character then return end
            local head = character:FindFirstChild("Head")
            local tps = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
            if not (head and tps) then return end
            
            headBoxPart.CFrame = head.CFrame * CFrame.new(headOffset)
            
            local relative = headBoxPart.CFrame:PointToObjectSpace(tps.Position)
            if math.abs(relative.X) <= headBoxPart.Size.X / 2 
                and math.abs(relative.Y) <= headBoxPart.Size.Y / 2 
                and math.abs(relative.Z) <= headBoxPart.Size.Z / 2 then
                firetouchinterest(head, tps, 0)
                firetouchinterest(head, tps, 1)
            end
        end)
    end

    MossingTab:Toggle({
        Title = "Active Moss Reach",
        Desc = "Enable head-based interaction range",
        Callback = function(state)
            headReachEnabled = state
            if state then startHeadReach() else 
                if headConnection then headConnection:Disconnect() end
                if headBoxPart then headBoxPart:Destroy() end
            end
        end
    })

    MossingTab:Slider({
        Title = "Range X",
        Value = { Min = 0, Max = 50, Default = 1 },
        Callback = function(val)
            headReachSize = Vector3.new(val, headReachSize.Y, headReachSize.Z)
            if headReachEnabled then updateHeadBox() end
        end
    })

    MossingTab:Slider({
        Title = "Range Y",
        Value = { Min = 0, Max = 50, Default = 1.5 },
        Callback = function(val)
            headReachSize = Vector3.new(headReachSize.X, val, headReachSize.Z)
            headOffset = Vector3.new(headOffset.X, val / 2.5, headOffset.Z)
            if headReachEnabled then updateHeadBox() end
        end
    })

    MossingTab:Slider({
        Title = "Range Z",
        Value = { Min = 0, Max = 50, Default = 1 },
        Callback = function(val)
            headReachSize = Vector3.new(headReachSize.X, headReachSize.Y, val)
            if headReachEnabled then updateHeadBox() end
        end
    })

    MossingTab:Toggle({
        Title = "Stealth Mode",
        Desc = "Makes the reach box invisible",
        Callback = function(v)
            headTransparency = v and 1 or 0.5
            if headReachEnabled and headBoxPart then
                headBoxPart.Transparency = headTransparency
            end
        end
    })

    local currentReactPower = 0
    local reactHookEnabled = false

    local function enableReactHook()
        if reactHookEnabled then return end
        reactHookEnabled = true
        
        local meta = getrawmetatable(game)
        local oldNamecall = meta.namecall
        setreadonly(meta, false)
        
        meta.namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if tostring(method) == "FireServer" and currentReactPower > 0 then
                local name = tostring(self)
                -- Interceptamos todas las acciones de juego para aplicar el react automáticamente
                if table.find({"Kick", "KickC1", "Tackle", "Header", "SaveRA", "SaveLA", "SaveRL", "SaveLL", "SaveT"}, name) then
                    task.spawn(function()
                        local ball = Workspace.TPSSystem:FindFirstChild("TPS")
                        if ball and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            -- Aplicamos la fuerza instantáneamente en la dirección que mira el jugador
                            -- Esto hace que el toque sea fluido y ultra rápido
                            ball.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * currentReactPower
                            
                            -- Efecto visual de "impacto"
                            local h = Instance.new("SelectionBox", ball)
                            h.Adornee = ball
                            h.Color3 = Color3.fromHex("#9d56ff")
                            h.LineThickness = 0.15
                            task.delay(0.2, function() h:Destroy() end)
                        end
                    end)
                end
            end
            return oldNamecall(self, ...)
        end)
        setreadonly(meta, true)
    end

    ReactTab:Section({ Title = "Advanced Auto-Reacts" })

    ReactTab:Button({
        Title = "asolixun react ",
        Desc = "W react",
        Callback = function()
            currentReactPower = 650
            enableReactHook()
            WindUI:Notify({ Title = "React Active", Desc = "asolixun react enabled", Icon = "zap" })
        end
    })

    ReactTab:Button({
        Title = "marianito react ",
        Desc = "goated react?",
        Callback = function()
            currentReactPower = 800
            enableReactHook()
            WindUI:Notify({ Title = "React Active", Desc = "marianito react  enabled", Icon = "zap" })
        end
    })

    ReactTab:Button({
        Title = "wayz react",
        Desc = "best player react",
        Callback = function()
            currentReactPower = 1000
            enableReactHook()
            WindUI:Notify({ Title = "React Active", Desc = "wayz react  enabled", Icon = "zap" })
        end
    })

    ReactTab:Button({
        Title = "Goalkeeper React",
        Callback = function()
            local gkActions = {"SaveRA", "SaveLA", "SaveRL", "SaveLL", "SaveT", "Tackle", "Header"}
            for _, action in ipairs(gkActions) do
                local meta = getrawmetatable(game)
                local oldNamecall = meta.namecall
                setreadonly(meta, false)
                meta.namecall = newcclosure(function(self, ...)
                    local method = tostring(getnamecallmethod())
                    if method == "FireServer" and tostring(self) == action then
                        local args = {...}
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                            args[2] = LocalPlayer.Character.Humanoid.LLCL
                            return oldNamecall(self, unpack(args))
                        end
                    end
                    return oldNamecall(self, ...)
                end)
                setreadonly(meta, true)
            end
        end
    })

    HelpersTab:Section({ Title = "Ball Visuals" })

    HelpersTab:Toggle({
        Title = "ZZZ helper",
        Desc = "Highlights the ball's position",
        Callback = function(state)
            if state then
                local part = Instance.new("Part")
                part.Name = "TPS1"
                part.Size = Vector3.new(9, 0.1, 9)
                part.Anchored = true
                part.BrickColor = BrickColor.new("Bright red")
                part.Transparency = 1 
                part.Parent = Workspace
                
                RunService.RenderStepped:Connect(function()
                    local tpsTarget = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
                    if tpsTarget and part.Parent then
                        part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                    end
                end)
            else
                if Workspace:FindFirstChild("TPS1") then Workspace.TPS1:Destroy() end
            end
        end
    })

    HelpersTab:Section({ Title = "Air Dribble Assistance" })

    HelpersTab:Toggle({
        Title = "air dribble helper",
        Desc = "Show interaction area for air dribbling",
        Callback = function(state)
            if not state and Workspace:FindFirstChild("TPS_Air") then
                Workspace.TPS_Air:Destroy()
            end
        end
    })

    HelpersTab:Slider({
        Title = "Box Dimension",
        Value = { Min = 1, Max = 15, Default = 1 },
        Callback = function(val)
            local part = Workspace:FindFirstChild("TPS_Air") or Instance.new("Part")
            part.Name = "TPS_Air"
            part.Size = Vector3.new(val, 0.1, val)
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1
            part.Parent = Workspace
            
            RunService.RenderStepped:Connect(function()
                local tpsTarget = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
                if tpsTarget and part.Parent then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end)
        end
    })

    HelpersTab:Section({ Title = "Automation" })

    local followBall = false
    local toggleEnabled = false

    HelpersTab:Toggle({
        Title = "inf helper",
        Desc = "Character will move towards the ball automatically",
        Callback = function(state)
            toggleEnabled = state
            if not state then followBall = false end
        end
    })

    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == Enum.KeyCode.B and not gp and toggleEnabled then
            followBall = not followBall
        end
    end)

    RunService.RenderStepped:Connect(function()
        if followBall and toggleEnabled then
            local ball = Workspace.TPSSystem.TPS
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:MoveTo(ball.Position)
            end
        end
    end)

    local isAimbotEnabled = false
    local aimbotTargetPos = Vector3.new(0, 14, 157)
    local laser = Instance.new("Part")
    laser.Name = "vxnity hub aimbot"
    laser.Anchored = true
    laser.CanCollide = false
    laser.Material = Enum.Material.Neon
    laser.Color = Color3.fromHex("#9d56ff")
    laser.Transparency = 1 
    laser.Size = Vector3.new(0.05, 0.05, 1) 
    laser.Parent = Workspace

    local function toggleAimbot(state)
        isAimbotEnabled = state
        laser.Transparency = isAimbotEnabled and 0.4 or 1
    end

    RunService:BindToRenderStep("vxnityAimbotLoop", Enum.RenderPriority.Camera.Value + 1, function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
        
        if isAimbotEnabled and hrp and torso then
            local hrpPos = hrp.Position
            local lookTarget = Vector3.new(aimbotTargetPos.X, hrpPos.Y, aimbotTargetPos.Z)
            hrp.CFrame = CFrame.lookAt(hrpPos, lookTarget)
            
            local startPos = torso.Position + Vector3.new(0, 0.8, 0) 
            local distance = (aimbotTargetPos - startPos).Magnitude
            laser.Size = Vector3.new(0.05, 0.05, distance)
            laser.CFrame = CFrame.lookAt(startPos, aimbotTargetPos) * CFrame.new(0, 0, -distance/2)
        end
    end)

    AimbotTab:Section({ Title = "Aimbot Settings" })

    local AimbotToggle = AimbotTab:Toggle({
        Title = "Enable / Disable Aimbot",
        Callback = function(state)
            toggleAimbot(state)
        end
    })

    AimbotTab:Keybind({
        Title = "Aimbot Keybind",
        Default = Enum.KeyCode.R,
        Callback = function()
            local newState = not isAimbotEnabled
            AimbotToggle:Set(newState) 
        end
    })

    WindUI:Notify({
        Title = "vxnity hub",
        Desc = "Welcome back! Script loaded successfully.",
        Icon = "check",
        Duration = 4
    })
end

-- Execution Entry Point
ShowSystemLoader(function()
    task.wait(0.1) -- Parche de seguridad para asegurar limpieza de UI
    LoadVxnityHub()
end)
