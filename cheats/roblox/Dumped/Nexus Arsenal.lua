--[[
   db     dP""b8 888888  dP""b8 888888 888888 
  dPYb   dP   `" 88__   dP   `" 88__   88__   
 dP__Yb  Yb      88""   Yb  "88 88""   88""   
dP""""Yb  YboodP 888888  YboodP 888888 88     
----------------------------------------------
hi guys, i gave the owner of this script a nice
kind warning that his obfuscation was weak and
that it doesn't protect his script. he laughed
at me, so here's his source + key sys removed.
enjoy :3
]]
local players = game:GetService("Players")
local uis = game:GetService("UserInputService")
local tweens = game:GetService("TweenService")
local startergui = game:GetService("StarterGui")
local runservice = game:GetService("RunService")
local workspace = game:GetService("Workspace")
local camera = workspace.CurrentCamera
local localplayer = players.LocalPlayer
local playergui = localplayer:WaitForChild("PlayerGui")
_G.Aimbot = false
_G.AimPart = "Head"
_G.Fly = false
_G.FlySpeed = 50
_G.ESP = false
_G.Noclip = false
_G.TeamCheck = true
_G.ESPColor = Color3.fromRGB(220, 20, 20)
local theme = {
    BG = Color3.fromRGB(0, 0, 0),
    SURFACE = Color3.fromRGB(8, 8, 8),
    PANEL = Color3.fromRGB(12, 12, 12),
    CARD = Color3.fromRGB(16, 16, 16),
    CARD_HOVER = Color3.fromRGB(24, 24, 24),
    BORDER = Color3.fromRGB(40, 40, 40),
    RED = Color3.fromRGB(220, 20, 20),
    RED_DIM = Color3.fromRGB(160, 10, 10),
    RED_GLOW = Color3.fromRGB(255, 40, 40),
    SUCCESS = Color3.fromRGB(52, 211, 153),
    TEXT_PRI = Color3.fromRGB(200, 200, 210),
    TEXT_SEC = Color3.fromRGB(140, 140, 155),
    TEXT_MUTE = Color3.fromRGB(60, 60, 75),
}
local width = 280
local height = 380
local function create(classname, properties, parent)
    local instance = Instance.new(classname)
    if properties then
        for k, v in pairs(properties) do
            pcall(function() instance[k] = v end)
        end
    end
    if parent then instance.Parent = parent end
    return instance
end
local function round(parent, radius)
    return create("UICorner", { CornerRadius = UDim.new(0, radius or 4) }, parent)
end
local function tween(instance, tween_props, duration, easing_style, easing_dir)
    tweens:Create(instance, TweenInfo.new(duration or 0.15, easing_style or Enum.EasingStyle.Quad, easing_dir or Enum.EasingDirection.Out), tween_props):Play()
end
local function to_color(hex)
    hex = hex:gsub("#", "")
    if #hex ~= 6 then return nil end
    local r, g, b = tonumber("0x" .. hex:sub(1,2)), tonumber("0x" .. hex:sub(3,4)), tonumber("0x" .. hex:sub(5,6))
    if not r or not g or not b then return nil end
    return Color3.fromRGB(r, g, b)
end
local function notify(title, text, noti_duration)
    startergui:SetCore("SendNotification", { Title = title, Text = text, Duration = noti_duration or 5 })
end
local correctkey = "@acegef"
local discordlink = "https://discord.gg/PAgQUfqtwh"
local existing_ui = playergui:FindFirstChild("NexusUI")
if existing_ui then existing_ui:Destroy() end
local screen_gui = create("ScreenGui", {
    Name = "NexusUI",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playergui)
local main_frame = create("Frame", {
    Size = UDim2.new(0, width, 0, height),
    Position = UDim2.new(0.5, -width / 2, 0.4, -height / 2),
    BackgroundColor3 = theme.BG,
    BorderSizePixel = 0,
    ClipsDescendants = false,
    Visible = false,
}, screen_gui)
round(main_frame, 6)
create("UIStroke", { Color = theme.RED_DIM, Thickness = 1.5 }, main_frame)
local function create_corner(pos, w, h, parent)
    return create("Frame", {
        Size = UDim2.new(0, w, 0, h),
        Position = pos,
        BackgroundColor3 = theme.RED,
        BorderSizePixel = 0,
        ZIndex = 8,
    }, parent or main_frame)
end
create_corner(UDim2.new(0, 2, 0, 2), 22, 2)
create_corner(UDim2.new(0, 2, 0, 2), 2, 22)
create_corner(UDim2.new(1, -24, 0, 2), 22, 2)
create_corner(UDim2.new(1, -4, 0, 2), 2, 22)
create_corner(UDim2.new(0, 2, 1, -4), 22, 2)
create_corner(UDim2.new(0, 2, 1, -24), 2, 22)
create_corner(UDim2.new(1, -24, 1, -4), 22, 2)
create_corner(UDim2.new(1, -4, 1, -24), 2, 22)
local title_bar = create("Frame", {
    Size = UDim2.new(1, 0, 0, 32),
    BackgroundColor3 = theme.SURFACE,
    BorderSizePixel = 0,
    ZIndex = 5,
}, main_frame)
round(title_bar, 6)
create("Frame", {
    Size = UDim2.new(1, 0, 0, 1),
    Position = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = theme.RED_DIM,
    BorderSizePixel = 0,
    ZIndex = 6,
}, title_bar)
create("TextLabel", {
    Size = UDim2.new(0, 18, 1, 0),
    Position = UDim2.new(0, 8, 0, 0),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = theme.RED,
    Font = Enum.Font.GothamBlack,
    TextSize = 16,
    ZIndex = 6,
}, title_bar)
create("TextLabel", {
    Size = UDim2.new(0, 180, 1, 0),
    Position = UDim2.new(0, 28, 0, 0),
    BackgroundTransparency = 1,
    Text = "NEXUS // ARSENAL",
    TextColor3 = theme.TEXT_PRI,
    Font = Enum.Font.GothamBlack,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 6,
}, title_bar)
local close_btn = create("TextButton", {
    Size = UDim2.new(0, 22, 0, 22),
    Position = UDim2.new(1, -30, 0.5, -11),
    BackgroundColor3 = theme.RED,
    Text = "x",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 10,
    BorderSizePixel = 0,
    ZIndex = 7,
}, title_bar)
round(close_btn, 4)
close_btn.MouseButton1Click:Connect(function()
    main_frame.Visible = false
end)
local dragging, drag_input, drag_start
title_bar.InputBegan:Connect(function(input_obj)
    if input_obj.UserInputType == Enum.UserInputType.MouseButton1 or input_obj.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        drag_input = input_obj.Position
        drag_start = main_frame.Position
    end
end)
title_bar.InputEnded:Connect(function(input_obj)
    if input_obj.UserInputType == Enum.UserInputType.MouseButton1 or input_obj.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
uis.InputChanged:Connect(function(input_obj)
    if dragging and (input_obj.UserInputType == Enum.UserInputType.MouseMovement or input_obj.UserInputType == Enum.UserInputType.Touch) then
        local delta = input_obj.Position - drag_input
        main_frame.Position = UDim2.new(drag_start.X.Scale, drag_start.X.Offset + delta.X, drag_start.Y.Scale, drag_start.Y.Offset + delta.Y)
    end
end)
local content_frame = create("Frame", {
    Size = UDim2.new(1, -8, 1, -40),
    Position = UDim2.new(0, 4, 0, 36),
    BackgroundTransparency = 1,
}, main_frame)
local function create_toggle(text, y_offset)
    local toggle_frame = create("Frame", {
        Size = UDim2.new(1, 0, 0, 36),
        Position = UDim2.new(0, 0, 0, y_offset),
        BackgroundColor3 = theme.CARD,
        BorderSizePixel = 0,
    }, content_frame)
    round(toggle_frame, 4)
    create("UIStroke", { Color = theme.BORDER, Thickness = 1 }, toggle_frame)
    local label = create("TextLabel", {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        BackgroundTransparency = 1,
        Text = text .. ": OFF",
        TextColor3 = theme.TEXT_PRI,
        Font = Enum.Font.GothamSemibold,
        TextSize = 10,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, toggle_frame)
    local toggle_bg = create("Frame", {
        Size = UDim2.new(0, 32, 0, 16),
        Position = UDim2.new(1, -40, 0.5, -8),
        BackgroundColor3 = theme.BORDER,
        BorderSizePixel = 0,
    }, toggle_frame)
    round(toggle_bg, 8)
    local toggle_dot = create("Frame", {
        Size = UDim2.new(0, 10, 0, 10),
        Position = UDim2.new(0, 3, 0.5, -5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
    }, toggle_bg)
    round(toggle_dot, 5)
    local toggled = false
    local btn = create("TextButton", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "" }, toggle_frame)
    return btn, label, toggle_bg, toggle_dot, toggled
end
local function set_toggle_state(btn, label, toggle_bg, toggle_dot, toggled, text, enabled)
    toggled = enabled
    label.Text = text .. ": " .. (enabled and "ON" or "OFF")
    tween(toggle_bg, { BackgroundColor3 = enabled and theme.RED or theme.BORDER })
    tween(toggle_dot, { Position = enabled and UDim2.new(1, -13, 0.5, -5) or UDim2.new(0, 3, 0.5, -5) })
    return toggled
end
local aimbot_btn, aimbot_lbl, aimbot_bg, aimbot_dot, aimbot_state = create_toggle("Aimbot [E]", 4)
local esp_btn, esp_lbl, esp_bg, esp_dot, esp_state = create_toggle("ESP", 74)
local fly_btn, fly_lbl, fly_bg, fly_dot, fly_state = create_toggle("Fly", 144)
local noclip_btn, noclip_lbl, noclip_bg, noclip_dot, noclip_state = create_toggle("Noclip", 184)
local hitbox_btn, hitbox_lbl, hitbox_bg, hitbox_dot, hitbox_state = create_toggle("Hitbox Expander", 224)
local tpkill_btn, tpkill_lbl, tpkill_bg, tpkill_dot, tpkill_state = create_toggle("Teleport Kill", 264)
local teamcheck_btn, teamcheck_lbl, teamcheck_bg, teamcheck_dot, teamcheck_state = create_toggle("Team Check", 304)
local aim_targets = {"Head", "Upper Body", "Lower Body", "Random"}
local aim_parts_mapping = {
    ["Head"] = {"Head", "HeadHB"},
    ["Upper Body"] = {"Hitbox", "HeadHB", "UpperTorso", "HumanoidRootPart"},
    ["Lower Body"] = {"LowerTorso", "RightUpperLeg", "LeftUpperLeg", "RightLowerLeg", "LeftLowerLeg", "RightFoot", "LeftFoot"},
    ["Random"] = nil,
}
_G.currentAimIdx = 1
local aim_selector = create("Frame", {
    Size = UDim2.new(1, 0, 0, 28),
    Position = UDim2.new(0, 0, 0, 42),
    BackgroundColor3 = theme.SURFACE,
    BorderSizePixel = 0,
}, content_frame)
round(aim_selector, 4)
local aim_lbl = create("TextLabel", {
    Size = UDim2.new(0, 100, 1, 0),
    Position = UDim2.new(0, 8, 0, 0),
    BackgroundTransparency = 1,
    Text = "Aim: Head",
    TextColor3 = theme.TEXT_SEC,
    Font = Enum.Font.GothamMedium,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left,
}, aim_selector)
local aim_prev = create("TextButton", {
    Size = UDim2.new(0, 22, 0, 18),
    Position = UDim2.new(0, 115, 0.5, -9),
    BackgroundColor3 = theme.CARD,
    Text = "<",
    TextColor3 = theme.TEXT_PRI,
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    BorderSizePixel = 0,
}, aim_selector)
round(aim_prev, 3)
local aim_next = create("TextButton", {
    Size = UDim2.new(0, 22, 0, 18),
    Position = UDim2.new(0, 140, 0.5, -9),
    BackgroundColor3 = theme.CARD,
    Text = ">",
    TextColor3 = theme.TEXT_PRI,
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    BorderSizePixel = 0,
}, aim_selector)
round(aim_next, 3)
local function update_aim_text()
    aim_lbl.Text = "Aim: " .. aim_targets[_G.currentAimIdx]
    _G.AimPart = aim_targets[_G.currentAimIdx]
end
aim_prev.MouseButton1Click:Connect(function()
    _G.currentAimIdx = ((_G.currentAimIdx - 2) % #aim_targets) + 1
    update_aim_text()
end)
aim_next.MouseButton1Click:Connect(function()
    _G.currentAimIdx = (_G.currentAimIdx % #aim_targets) + 1
    update_aim_text()
end)
local color_frame = create("Frame", {
    Size = UDim2.new(1, 0, 0, 28),
    Position = UDim2.new(0, 0, 0, 112),
    BackgroundColor3 = theme.SURFACE,
    BorderSizePixel = 0,
}, content_frame)
round(color_frame, 4)
create("TextLabel", {
    Size = UDim2.new(0, 70, 1, 0),
    Position = UDim2.new(0, 8, 0, 0),
    BackgroundTransparency = 1,
    Text = "ESP Hex:",
    TextColor3 = theme.TEXT_SEC,
    Font = Enum.Font.GothamMedium,
    TextSize = 10,
    TextXAlignment = Enum.TextXAlignment.Left,
}, color_frame)
local color_box = create("TextBox", {
    Size = UDim2.new(0, 85, 0, 20),
    Position = UDim2.new(0, 78, 0.5, -10),
    BackgroundColor3 = theme.CARD,
    PlaceholderText = "dc143c",
    PlaceholderColor3 = theme.TEXT_MUTE,
    Text = "dc143c",
    TextColor3 = theme.TEXT_PRI,
    Font = Enum.Font.RobotoMono,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Center,
    BorderSizePixel = 0,
    ClearTextOnFocus = false,
}, color_frame)
round(color_box, 3)
local color_preview = create("Frame", {
    Size = UDim2.new(0, 20, 0, 20),
    Position = UDim2.new(0, 168, 0.5, -10),
    BackgroundColor3 = _G.ESPColor,
    BorderSizePixel = 0,
}, color_frame)
round(color_preview, 3)
local color_set_btn = create("TextButton", {
    Size = UDim2.new(0, 50, 0, 20),
    Position = UDim2.new(0, 192, 0.5, -10),
    BackgroundColor3 = theme.CARD,
    Text = "Set",
    TextColor3 = theme.TEXT_SEC,
    Font = Enum.Font.GothamBold,
    TextSize = 9,
    BorderSizePixel = 0,
}, color_frame)
round(color_set_btn, 3)
color_set_btn.MouseButton1Click:Connect(function()
    local color = to_color(color_box.Text)
    if color then
        _G.ESPColor = color
        color_preview.BackgroundColor3 = color
        if _G.ESP then
            for _, other in ipairs(players:GetPlayers()) do
                if other == localplayer then continue end
                local character = other.Character
                if character then
                    local highlight = character:FindFirstChildOfClass("Highlight")
                    if highlight then
                        highlight.FillColor = color
                        highlight.OutlineColor = Color3.new(math.min(color.R + 0.2, 1), math.min(color.G + 0.2, 1), math.min(color.B + 0.2, 1))
                    end
                end
            end
            for _, adornment in ipairs(screen_gui:GetChildren()) do
                if adornment:IsA("BoxHandleAdornment") then
                    adornment.Color3 = color
                end
            end
        end
    else
        notify("Error", "Invalid hex color", 2)
    end
end)
local function _1lIIIIlI(character)
    local parts = aim_parts_mapping[_G.AimPart]
    if not parts then
        local parts_set = {}
        for _, v in pairs(aim_parts_mapping) do
            for _, n in ipairs(v) do
                parts_set[n] = true
            end
        end
        local parts_list = {}
        for n in pairs(parts_set) do
            local part = character:FindFirstChild(n)
            if part and part:IsA("BasePart") then
                table.insert(parts_list, part)
            end
        end
        if #parts_list == 0 then
            local root_part = character:FindFirstChild("HumanoidRootPart")
            if root_part then table.insert(parts_list, root_part) end
        end
        return parts_list
    end
    local parts_list = {}
    for _, n in ipairs(parts) do
        local part = character:FindFirstChild(n)
        if part and part:IsA("BasePart") then
            table.insert(parts_list, part)
        end
    end
    if #parts_list == 0 then
        local root_part = character:FindFirstChild("HumanoidRootPart")
        if root_part then table.insert(parts_list, root_part) end
    end
    return parts_list
end
local function _lIll1lI1(character)
    local parts_list = {}
    for _, v in pairs(aim_parts_mapping) do
        if type(v) == "table" then
            for _, n in ipairs(v) do
                local part = character:FindFirstChild(n)
                if part and part:IsA("BasePart") then
                    table.insert(parts_list, part)
                end
            end
        end
    end
    if #parts_list == 0 then
        local root_part = character:FindFirstChild("HumanoidRootPart")
        if root_part then table.insert(parts_list, root_part) end
    end
    if #parts_list > 0 then
        return parts_list[math.random(#parts_list)]
    end
end
local function _II11lIl1ll()
    local closest_player, closest_dist = nil, math.huge
    local mouse_pos = uis:GetMouseLocation()
    for _, other in ipairs(players:GetPlayers()) do
        if other == localplayer then continue end
        if _G.TeamCheck and other.Team and localplayer.Team and other.Team == localplayer.Team then continue end
        local character = other.Character
        if not character then continue end
        local root_part = character:FindFirstChild("HumanoidRootPart")
        if not root_part then continue end
        local screen_pos, on_screen = camera:WorldToViewportPoint(root_part.Position)
        if not on_screen then continue end
        local distance = (Vector2.new(screen_pos.X, screen_pos.Y) - mouse_pos).Magnitude
        if distance < closest_dist then
            closest_dist = distance
            closest_player = other
        end
    end
    return closest_player
end
aimbot_btn.MouseButton1Click:Connect(function()
    _G.Aimbot = not _G.Aimbot
    aimbot_state = set_toggle_state(aimbot_btn, aimbot_lbl, aimbot_bg, aimbot_dot, _G.Aimbot, "Aimbot [E]", _G.Aimbot)
end)
uis.InputBegan:Connect(function(input, game_processed)
    if game_processed then return end
    if input.KeyCode == Enum.KeyCode.E then
        _G.Aimbot = not _G.Aimbot
        aimbot_state = set_toggle_state(aimbot_btn, aimbot_lbl, aimbot_bg, aimbot_dot, _G.Aimbot, "Aimbot [E]", _G.Aimbot)
    end
end)
local _1lIll1II1 = {}
local function _II1I1Il1()
    for _, v in ipairs(_1lIll1II1) do
        pcall(function() v:Destroy() end)
    end
    _1lIll1II1 = {}
end
local function _l111llI1l()
    _II1I1Il1()
    for _, other in ipairs(players:GetPlayers()) do
        if other == localplayer then continue end
        if _G.TeamCheck and other.Team and localplayer.Team and other.Team == localplayer.Team then continue end
        local character = other.Character
        if not character then continue end
        local root_part = character:FindFirstChild("HumanoidRootPart")
        if not root_part then continue end
        local adornment = Instance.new("BoxHandleAdornment")
        adornment.Size = Vector3.new(4, 6, 4)
        adornment.Adornee = root_part
        adornment.AlwaysOnTop = true
        adornment.ZIndex = 10
        adornment.Color3 = _G.ESPColor
        adornment.Transparency = 0.3
        adornment.Parent = screen_gui
        table.insert(_1lIll1II1, adornment)
        local highlight = Instance.new("Highlight")
        highlight.Adornee = character
        highlight.FillColor = _G.ESPColor
        highlight.FillTransparency = 0.6
        highlight.OutlineColor = Color3.new(math.min(_G.ESPColor.R + 0.2, 1), math.min(_G.ESPColor.G + 0.2, 1), math.min(_G.ESPColor.B + 0.2, 1))
        highlight.OutlineTransparency = 0.2
        highlight.Parent = screen_gui
        table.insert(_1lIll1II1, highlight)
    end
end
esp_btn.MouseButton1Click:Connect(function()
    _G.ESP = not _G.ESP
    esp_state = set_toggle_state(esp_btn, esp_lbl, esp_bg, esp_dot, _G.ESP, "ESP", _G.ESP)
    if _G.ESP then
        _l111llI1l()
        localplayer.CharacterAdded:Connect(function()
            if _G.ESP then task.wait(1); _l111llI1l() end
        end)
        players.PlayerAdded:Connect(function()
            if _G.ESP then task.wait(1); _l111llI1l() end
        end)
    else
        _II1I1Il1()
    end
end)
fly_btn.MouseButton1Click:Connect(function()
    _G.Fly = not _G.Fly
    fly_state = set_toggle_state(fly_btn, fly_lbl, fly_bg, fly_dot, _G.Fly, "Fly", _G.Fly)
    if _G.Fly then
        local _1lIIII1I1 = Instance.new("BodyGyro")
        local _llIIll1llI = Instance.new("BodyVelocity")
        _1lIIII1I1.P = 9e4
        _1lIIII1I1.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
        _1lIIII1I1.D = 500
        _llIIll1llI.Velocity = Vector3.new(0, 0, 0)
        _llIIll1llI.MaxForce = Vector3.new(9e4, 9e4, 9e4)
        _llIIll1llI.P = 100000
        local _Ill1l1I1
        local function _I1IIlllll(character)
            local root_part = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:WaitForChild("Humanoid")
            _1lIIII1I1.Parent = root_part
            _llIIll1llI.Parent = root_part
            humanoid.PlatformStand = true
            if _Ill1l1I1 then _Ill1l1I1:Disconnect() end
            _Ill1l1I1 = runservice.Heartbeat:Connect(function()
                if not _G.Fly or not root_part.Parent then
                    _1lIIII1I1:Destroy()
                    _llIIll1llI:Destroy()
                    humanoid.PlatformStand = false
                    if _Ill1l1I1 then _Ill1l1I1:Disconnect() end
                    return
                end
                local velocity = Vector3.new()
                if uis:IsKeyDown(Enum.KeyCode.W) then velocity = velocity + camera.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.S) then velocity = velocity - camera.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.A) then velocity = velocity - camera.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.D) then velocity = velocity + camera.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.Space) then velocity = velocity + Vector3.new(0, 1, 0) end
                if uis:IsKeyDown(Enum.KeyCode.LeftShift) then velocity = velocity - Vector3.new(0, 1, 0) end
                if velocity.Magnitude > 0 then
                    _llIIll1llI.Velocity = velocity.Unit * _G.FlySpeed
                else
                    _llIIll1llI.Velocity = Vector3.new(0, 0, 0)
                end
                if not _G.Aimbot then
                    _1lIIII1I1.CFrame = CFrame.new(root_part.Position, root_part.Position + camera.CFrame.LookVector)
                end
            end)
        end
        local character = localplayer.Character
        if character then _I1IIlllll(character) end
        localplayer.CharacterAdded:Connect(function(character)
            if _G.Fly then task.wait(0.5); _I1IIlllll(character) end
        end)
    end
end)
noclip_btn.MouseButton1Click:Connect(function()
    _G.Noclip = not _G.Noclip
    noclip_state = set_toggle_state(noclip_btn, noclip_lbl, noclip_bg, noclip_dot, _G.Noclip, "Noclip", _G.Noclip)
end)
_G.original_hitboxes = {}
local function _lIl1lIIIl()
    _G.HitboxExpand = not _G.HitboxExpand
    hitbox_state = set_toggle_state(hitbox_btn, hitbox_lbl, hitbox_bg, hitbox_dot, _G.HitboxExpand, "Hitbox Expander", _G.HitboxExpand)
    if not _G.HitboxExpand then
        for _, part in ipairs(players:GetPlayers()) do
            if part == localplayer then continue end
            local character = part.Character
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        local part_path = part:GetFullName()
                        if _G.original_hitboxes[part_path] then
                            part.Size = _G.original_hitboxes[part_path]
                            part.Transparency = 0
                            _G.original_hitboxes[part_path] = nil
                        end
                    end
                end
            end
        end
    end
end
hitbox_btn.MouseButton1Click:Connect(_lIl1lIIIl)
runservice.Heartbeat:Connect(function()
    if _G.HitboxExpand then
        for _, part in ipairs(players:GetPlayers()) do
            if part == localplayer then continue end
            local character = part.Character
            if not character then continue end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then continue end
            if _G.TeamCheck and part.Team and localplayer.Team and part.Team == localplayer.Team then continue end
            local root_part = character:FindFirstChild("HumanoidRootPart")
            if root_part then
                local part_path = root_part:GetFullName()
                if not _G.original_hitboxes[part_path] then _G.original_hitboxes[part_path] = root_part.Size end
                root_part.Size = Vector3.new(15, 15, 15)
                root_part.Transparency = 1
                root_part.CanCollide = false
            end
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    local part_path = part:GetFullName()
                    if not _G.original_hitboxes[part_path] then _G.original_hitboxes[part_path] = part.Size end
                    part.Size = Vector3.new(15, 15, 15)
                    part.Transparency = 1
                    part.CanCollide = false
                end
            end
        end
    end
end)
runservice.Stepped:Connect(function()
    if _G.Noclip then
        local character = localplayer.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)
tpkill_btn.MouseButton1Click:Connect(function()
    _G.TeleportKill = not _G.TeleportKill
    tpkill_state = set_toggle_state(tpkill_btn, tpkill_lbl, tpkill_bg, tpkill_dot, _G.TeleportKill, "Teleport Kill", _G.TeleportKill)
end)
teamcheck_btn.MouseButton1Click:Connect(function()
    _G.TeamCheck = not _G.TeamCheck
    teamcheck_state = set_toggle_state(teamcheck_btn, teamcheck_lbl, teamcheck_bg, teamcheck_dot, _G.TeamCheck, "Team Check", _G.TeamCheck)
end)
runservice.Heartbeat:Connect(function()
    if _G.TeleportKill and _G.Aimbot then
        local target_player = _II11lIl1ll()
        if target_player then
            local character = target_player.Character
            local my_char = localplayer.Character
            if character and my_char then
                local root_part = character:FindFirstChild("HumanoidRootPart")
                local my_root = my_char:FindFirstChild("HumanoidRootPart")
                if root_part and my_root then
                    my_root.CFrame = root_part.CFrame * CFrame.new(0, 0, 4)
                    local target_part = character:FindFirstChild("Head") or root_part
                    camera.CFrame = CFrame.new(camera.CFrame.Position, target_part.Position)
                    if mouse1click then
                        mouse1click()
                    end
                end
            end
        end
    end
end)
runservice.Heartbeat:Connect(function()
    if _G.Aimbot then
        local target_player = _II11lIl1ll()
        if target_player then
            local character = target_player.Character
            if character then
                if _G.AimPart == "Random" then
                    local part = _lIll1lI1(character)
                    if part then
                        camera.CFrame = CFrame.new(camera.CFrame.Position, part.Position)
                    end
                else
                    local parts_list = _1lIIIIlI(character)
                    if #parts_list > 0 then
                        camera.CFrame = CFrame.new(camera.CFrame.Position, parts_list[1].Position)
                    end
                end
            end
        end
    end
end)
local toggle_ui_btn = create("TextButton", {
    Size = UDim2.new(0, 44, 0, 44),
    Position = UDim2.new(0, 16, 1, -70),
    BackgroundColor3 = theme.RED,
    Text = "N",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBlack,
    TextSize = 20,
    BorderSizePixel = 0,
    ZIndex = 10,
}, screen_gui)
round(toggle_ui_btn, 8)
create("UIStroke", { Color = theme.RED_GLOW, Thickness = 1.5 }, toggle_ui_btn)
local menu_dragging, drag_input_pos, drag_start_pos
toggle_ui_btn.InputBegan:Connect(function(input_obj)
    if input_obj.UserInputType == Enum.UserInputType.Touch or input_obj.UserInputType == Enum.UserInputType.MouseButton1 then
        menu_dragging = true
        drag_input_pos = input_obj.Position
        drag_start_pos = toggle_ui_btn.Position
    end
end)
toggle_ui_btn.InputEnded:Connect(function(input_obj)
    if input_obj.UserInputType == Enum.UserInputType.Touch or input_obj.UserInputType == Enum.UserInputType.MouseButton1 then
        menu_dragging = false
    end
end)
uis.InputChanged:Connect(function(input_obj)
    if menu_dragging and (input_obj.UserInputType == Enum.UserInputType.Touch or input_obj.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input_obj.Position - drag_input_pos
        toggle_ui_btn.Position = UDim2.new(drag_start_pos.X.Scale, drag_start_pos.X.Offset + delta.X, drag_start_pos.Y.Scale, drag_start_pos.Y.Offset + delta.Y)
    end
end)
toggle_ui_btn.MouseButton1Click:Connect(function()
    main_frame.Visible = not main_frame.Visible
end)
local aim_status_btn = create("TextButton", {
    Size = UDim2.new(0, 56, 0, 26),
    Position = UDim2.new(1, -70, 1, -105),
    BackgroundColor3 = theme.RED,
    Text = "AIM OFF",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBlack,
    TextSize = 10,
    BorderSizePixel = 0,
    ZIndex = 10,
}, screen_gui)
round(aim_status_btn, 6)
create("UIStroke", { Color = theme.RED_GLOW, Thickness = 1.5 }, aim_status_btn)
local btn_dragging, btn_drag_input, btn_drag_start
aim_status_btn.InputBegan:Connect(function(input_obj)
    if input_obj.UserInputType == Enum.UserInputType.Touch or input_obj.UserInputType == Enum.UserInputType.MouseButton1 then
        btn_dragging = true
        btn_drag_input = input_obj.Position
        btn_drag_start = aim_status_btn.Position
    end
end)
aim_status_btn.InputEnded:Connect(function(input_obj)
    if input_obj.UserInputType == Enum.UserInputType.Touch or input_obj.UserInputType == Enum.UserInputType.MouseButton1 then
        btn_dragging = false
    end
end)
uis.InputChanged:Connect(function(input_obj)
    if btn_dragging and (input_obj.UserInputType == Enum.UserInputType.Touch or input_obj.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input_obj.Position - btn_drag_input
        aim_status_btn.Position = UDim2.new(btn_drag_start.X.Scale, btn_drag_start.X.Offset + delta.X, btn_drag_start.Y.Scale, btn_drag_start.Y.Offset + delta.Y)
    end
end)
local function update_aim_btn()
    local enabled = _G.Aimbot
    aim_status_btn.Text = enabled and "AIM ON" or "AIM OFF"
    aim_status_btn.BackgroundColor3 = enabled and theme.SUCCESS or theme.RED
end
aim_status_btn.MouseButton1Click:Connect(function()
    _G.Aimbot = not _G.Aimbot
    aimbot_state = set_toggle_state(aimbot_btn, aimbot_lbl, aimbot_bg, aimbot_dot, _G.Aimbot, "Aimbot [E]", _G.Aimbot)
    update_aim_btn()
end)
update_aim_btn()
local key_gui = create("ScreenGui", {
    Name = "NexusKeySystem",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playergui)
local key_frame = create("Frame", {
    Size = UDim2.new(0, 300, 0, 220),
    Position = UDim2.new(0.5, -150, 0.5, -110),
    BackgroundColor3 = theme.BG,
    BorderSizePixel = 0,
    ClipsDescendants = false,
}, key_gui)
round(key_frame, 6)
create("UIStroke", { Color = theme.RED_DIM, Thickness = 1.5 }, key_frame)
create_corner(UDim2.new(0, 2, 0, 2), 22, 2, key_frame)
create_corner(UDim2.new(0, 2, 0, 2), 2, 22, key_frame)
create_corner(UDim2.new(1, -24, 0, 2), 22, 2, key_frame)
create_corner(UDim2.new(1, -4, 0, 2), 2, 22, key_frame)
create_corner(UDim2.new(0, 2, 1, -4), 22, 2, key_frame)
create_corner(UDim2.new(0, 2, 1, -24), 2, 22, key_frame)
create_corner(UDim2.new(1, -24, 1, -4), 22, 2, key_frame)
create_corner(UDim2.new(1, -4, 1, -24), 2, 22, key_frame)
local key_title_bar = create("Frame", {
    Size = UDim2.new(1, 0, 0, 36),
    BackgroundColor3 = theme.SURFACE,
    BorderSizePixel = 0,
    ZIndex = 5,
}, key_frame)
round(key_title_bar, 6)
create("Frame", {
    Size = UDim2.new(1, 0, 0, 1),
    Position = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = theme.RED_DIM,
    BorderSizePixel = 0,
    ZIndex = 6,
}, key_title_bar)
create("TextLabel", {
    Size = UDim2.new(0, 14, 1, 0),
    Position = UDim2.new(0, 8, 0, 0),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = theme.RED,
    Font = Enum.Font.GothamBlack,
    TextSize = 14,
    ZIndex = 6,
}, key_title_bar)
create("TextLabel", {
    Size = UDim2.new(1, -20, 1, 0),
    Position = UDim2.new(0, 24, 0, 0),
    BackgroundTransparency = 1,
    Text = "NEXUS - SKID SYSTEM",
    TextColor3 = theme.TEXT_PRI,
    Font = Enum.Font.GothamBlack,
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 6,
}, key_title_bar)
local key_content = create("Frame", {
    Size = UDim2.new(1, -16, 1, -48),
    Position = UDim2.new(0, 8, 0, 40),
    BackgroundTransparency = 1,
}, key_frame)
create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 20),
    BackgroundTransparency = 1,
    Text = "Enter your key to unlock Nexus [any key works]",
    TextColor3 = theme.TEXT_SEC,
    Font = Enum.Font.GothamMedium,
    TextSize = 11,
}, key_content)
local key_input = create("TextBox", {
    Size = UDim2.new(1, 0, 0, 32),
    Position = UDim2.new(0, 0, 0, 24),
    BackgroundColor3 = theme.SURFACE,
    PlaceholderText = "key",
    PlaceholderColor3 = theme.TEXT_MUTE,
    Text = "",
    TextColor3 = theme.TEXT_PRI,
    Font = Enum.Font.GothamMedium,
    TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Center,
    BorderSizePixel = 0,
    ClearTextOnFocus = false,
}, key_content)
round(key_input, 4)
local verify_btn = create("TextButton", {
    Size = UDim2.new(0.48, -4, 0, 32),
    Position = UDim2.new(0, 0, 0, 64),
    BackgroundColor3 = theme.RED,
    Text = "VERIFY",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    BorderSizePixel = 0,
}, key_content)
round(verify_btn, 4)
local discord_btn = create("TextButton", {
    Size = UDim2.new(0.48, -4, 0, 32),
    Position = UDim2.new(0.52, 0, 0, 64),
    BackgroundColor3 = theme.CARD,
    Text = "DISCORD",
    TextColor3 = Color3.fromRGB(140, 140, 155),
    Font = Enum.Font.GothamBold,
    TextSize = 11,
    BorderSizePixel = 0,
}, key_content)
round(discord_btn, 4)
local error_lbl = create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 20),
    Position = UDim2.new(0, 0, 0, 104),
    BackgroundTransparency = 1,
    Text = "",
    TextColor3 = theme.RED,
    Font = Enum.Font.GothamSemibold,
    TextSize = 10,
}, key_content)
discord_btn.MouseButton1Click:Connect(function()
    setclipboard(discordlink)
    notify("Link Copied!", "Discord link copied to clipboard.", 4)
end)
verify_btn.MouseButton1Click:Connect(function()
    local entered_key = key_input.Text:gsub("%s+", "")
    if #entered_key == 0 then
        error_lbl.TextColor3 = theme.RED
        error_lbl.Text = "Enter a key."
        return
    end
    if true then
        toggle_ui_btn.Visible = true
        main_frame.Visible = true
        key_gui.Enabled = false
    else
        error_lbl.TextColor3 = theme.RED
        error_lbl.Text = "Invalid key."
    end
end)
toggle_ui_btn.Visible = false
main_frame.Visible = false

notify("Nexus Cracked", "This script was reversed by @acegef. Keep laughing over some bullshit bro, dumped to source in minutes.", 10)