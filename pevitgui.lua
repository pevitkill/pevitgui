local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LP = Players.LocalPlayer

local pulseActive = true

local catMsg, catMsgLabel
local function cat(parent, x, y)
    local c = Instance.new("Frame")
    c.Size = UDim2.new(0,40,0,46); c.Position = UDim2.new(0,x,0,y)
    c.BackgroundTransparency = 1; c.Parent = parent
    local e1 = Instance.new("Frame"); e1.Size = UDim2.new(0,10,0,12); e1.Position = UDim2.new(0,5,0,0)
    e1.BackgroundColor3 = Color3.fromRGB(255,240,230); e1.BorderSizePixel = 0; e1.Parent = c
    local e1c = Instance.new("UICorner"); e1c.CornerRadius = UDim.new(0,3); e1c.Parent = e1
    local e2 = e1:Clone(); e2.Position = UDim2.new(0,25,0,0); e2.Parent = c
    local ei1 = Instance.new("Frame"); ei1.Size = UDim2.new(0,5,0,7); ei1.Position = UDim2.new(0,7,0,2)
    ei1.BackgroundColor3 = Color3.fromRGB(255,180,200); ei1.BorderSizePixel = 0; ei1.Parent = c
    local ei1c = Instance.new("UICorner"); ei1c.CornerRadius = UDim.new(0,2); ei1c.Parent = ei1
    local ei2 = ei1:Clone(); ei2.Position = UDim2.new(0,27,0,2); ei2.Parent = c
    local hd = Instance.new("Frame"); hd.Size = UDim2.new(0,34,0,30); hd.Position = UDim2.new(0,3,0,8)
    hd.BackgroundColor3 = Color3.fromRGB(255,240,230); hd.BorderSizePixel = 0; hd.Parent = c
    local hc = Instance.new("UICorner"); hc.CornerRadius = UDim.new(0,12); hc.Parent = hd
    local ey1 = Instance.new("Frame"); ey1.Size = UDim2.new(0,5,0,7); ey1.Position = UDim2.new(0,7,0,11)
    ey1.BackgroundColor3 = Color3.fromRGB(20,20,20); ey1.BorderSizePixel = 0; ey1.Parent = hd
    local ey1c = Instance.new("UICorner"); ey1c.CornerRadius = UDim.new(1,0); ey1c.Parent = ey1
    local ey2 = ey1:Clone(); ey2.Position = UDim2.new(0,22,0,11); ey2.Parent = hd
    local ns = Instance.new("Frame"); ns.Size = UDim2.new(0,3,0,3); ns.Position = UDim2.new(0,15,0,19)
    ns.BackgroundColor3 = Color3.fromRGB(255,150,170); ns.BorderSizePixel = 0; ns.Parent = hd
    local nc = Instance.new("UICorner"); nc.CornerRadius = UDim.new(1,0); nc.Parent = ns
    local bl1 = Instance.new("Frame"); bl1.Size = UDim2.new(0,4,0,2); bl1.Position = UDim2.new(0,3,0,21)
    bl1.BackgroundColor3 = Color3.fromRGB(255,180,200); bl1.BorderSizePixel = 0; bl1.Parent = hd
    local bl1c = Instance.new("UICorner"); bl1c.CornerRadius = UDim.new(1,0); bl1c.Parent = bl1
    local bl2 = bl1:Clone(); bl2.Position = UDim2.new(0,27,0,21); bl2.Parent = hd
    local bd = Instance.new("Frame"); bd.Size = UDim2.new(0,24,0,12); bd.Position = UDim2.new(0,8,0,36)
    bd.BackgroundColor3 = Color3.fromRGB(255,240,230); bd.BorderSizePixel = 0; bd.Parent = c
    local bdc = Instance.new("UICorner"); bdc.CornerRadius = UDim.new(0,5); bdc.Parent = bd

    catMsg = Instance.new("Frame")
    catMsg.Size = UDim2.new(0, 130, 0, 26)
    catMsg.Position = UDim2.new(0, -135, 0, 12)
    catMsg.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    catMsg.BackgroundTransparency = 1
    catMsg.BorderSizePixel = 0
    catMsg.Parent = c
    local cmc = Instance.new("UICorner"); cmc.CornerRadius = UDim.new(0, 6); cmc.Parent = catMsg
    local cms = Instance.new("UIStroke"); cms.Color = Color3.fromRGB(80, 80, 90); cms.Thickness = 1; cms.Transparency = 1; cms.Parent = catMsg
    catMsgLabel = Instance.new("TextLabel")
    catMsgLabel.Size = UDim2.new(1, -8, 1, 0)
    catMsgLabel.Position = UDim2.new(0, 4, 0, 0)
    catMsgLabel.BackgroundTransparency = 1
    catMsgLabel.Text = "тг:pevitsuleg"
    catMsgLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    catMsgLabel.Font = Enum.Font.GothamBold
    catMsgLabel.TextSize = 11
    catMsgLabel.TextTransparency = 1
    catMsgLabel.TextXAlignment = Enum.TextXAlignment.Center
    catMsgLabel.Parent = catMsg

    task.spawn(function()
        while c.Parent do
            local t = tick()
            c.Position = UDim2.new(0,x,0,y - math.abs(math.sin(t*2))*2)
            if math.floor(t*2) % 6 == 0 then
                ey1.Size = UDim2.new(0,5,0,1); ey2.Size = UDim2.new(0,5,0,1)
                task.wait(0.15)
                ey1.Size = UDim2.new(0,5,0,7); ey2.Size = UDim2.new(0,5,0,7)
            end
            e1.Rotation = math.sin(t*4)*8; e2.Rotation = -math.sin(t*4)*8
            task.wait(0.03)
        end
    end)
end

local msgInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function showCatMessage()
    if not catMsg or not catMsg.Parent then return end
    TweenService:Create(catMsg, msgInfo, {BackgroundTransparency = 0.1}):Play()
    TweenService:Create(catMsgLabel, msgInfo, {TextTransparency = 0}):Play()
    for _, obj in ipairs(catMsg:GetDescendants()) do
        if obj:IsA("UIStroke") then TweenService:Create(obj, msgInfo, {Transparency = 0}):Play() end
    end
    task.wait(3)
    TweenService:Create(catMsg, msgInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(catMsgLabel, msgInfo, {TextTransparency = 1}):Play()
    for _, obj in ipairs(catMsg:GetDescendants()) do
        if obj:IsA("UIStroke") then TweenService:Create(obj, msgInfo, {Transparency = 1}):Play() end
    end
end

task.spawn(function()
    task.wait(3)
    while true do
        task.wait(10)
        pcall(showCatMessage)
    end
end)

local cbInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function makeCheckbox(parent, name, def, fn)
    local st = def
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -8, 0, 26)
    b.BackgroundTransparency = 1
    b.Text = ""; b.BorderSizePixel = 0; b.AutoButtonColor = false; b.Parent = parent
    local bx = Instance.new("Frame")
    bx.Size = UDim2.new(0, 14, 0, 14); bx.Position = UDim2.new(0, 6, 0.5, -7)
    bx.BackgroundColor3 = def and Color3.fromRGB(200,200,200) or Color3.fromRGB(40,40,45)
    bx.BorderSizePixel = 0; bx.Parent = b
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,3); bc.Parent = bx
    local ck = Instance.new("TextLabel")
    ck.Size = UDim2.new(1,0,1,0); ck.BackgroundTransparency = 1
    ck.Text = "✓"; ck.TextColor3 = Color3.fromRGB(20,20,20); ck.TextSize = 11
    ck.Font = Enum.Font.GothamBold; ck.TextTransparency = def and 0 or 1; ck.Parent = bx
    local lb = Instance.new("TextLabel")
    lb.Size = UDim2.new(1,-30,1,0); lb.Position = UDim2.new(0,26,0,0)
    lb.BackgroundTransparency = 1; lb.Text = name
    lb.TextColor3 = def and Color3.fromRGB(240,240,240) or Color3.fromRGB(160,160,170)
    lb.TextSize = 12
    lb.Font = Enum.Font.Gotham; lb.TextXAlignment = Enum.TextXAlignment.Left; lb.Parent = b
    local function tg()
        st = not st
        TweenService:Create(bx, cbInfo, {BackgroundColor3 = st and Color3.fromRGB(200,200,200) or Color3.fromRGB(40,40,45)}):Play()
        TweenService:Create(ck, cbInfo, {TextTransparency = st and 0 or 1}):Play()
        TweenService:Create(lb, cbInfo, {TextColor3 = st and Color3.fromRGB(240,240,240) or Color3.fromRGB(160,160,170)}):Play()
        if fn then fn(st) end
    end
    b.MouseButton1Click:Connect(tg); b.TouchTap:Connect(tg)
end

local pulseLineFrame, pulseLinePart, pulseGlow, pulseGrad
local function makePulseLine(parent)
    local lf = Instance.new("Frame")
    lf.Size = UDim2.new(1,-20,0,50); lf.Position = UDim2.new(0,10,1,-65)
    lf.BackgroundTransparency = 1; lf.ClipsDescendants = true; lf.Parent = parent
    pulseLineFrame = lf
    local ln = Instance.new("Frame")
    ln.Size = UDim2.new(1,0,0,1); ln.Position = UDim2.new(0,0,0.5,0)
    ln.BackgroundColor3 = Color3.new(1,1,1); ln.BackgroundTransparency = 0.6
    ln.BorderSizePixel = 0; ln.Parent = lf
    pulseLinePart = ln
    local gl = Instance.new("Frame")
    gl.Size = UDim2.new(1,0,0,3); gl.Position = UDim2.new(0,0,0.5,-1)
    gl.BackgroundColor3 = Color3.new(1,1,1); gl.BackgroundTransparency = 0.85
    gl.BorderSizePixel = 0; gl.Parent = lf
    pulseGlow = gl
    local gr = Instance.new("Frame")
    gr.Size = UDim2.new(0,60,0,3); gr.Position = UDim2.new(0,0,0.5,-1)
    gr.BackgroundColor3 = Color3.new(1,1,1); gr.BackgroundTransparency = 0.2
    gr.BorderSizePixel = 0; gr.Parent = lf
    pulseGrad = gr
    local grc = Instance.new("UICorner"); grc.CornerRadius = UDim.new(1,0); grc.Parent = gr
    task.spawn(function()
        while lf.Parent do
            if pulseActive then
                local t = tick()
                local pos = (math.sin(t*1.5)+1)/2
                gr.Position = UDim2.new(pos,-30,0.5,-1)
                local p = (math.sin(t*3)+1)/2
                if ln.BackgroundTransparency < 0.95 then
                    ln.BackgroundTransparency = 0.3+(1-p)*0.5
                    gl.BackgroundTransparency = 0.6+(1-p)*0.3
                end
            end
            task.wait(0.03)
        end
    end)
end

local sg = Instance.new("ScreenGui")
sg.Name = "PevitGUI"; sg.ResetOnSpawn = false; sg.IgnoreGuiInset = true
sg.Parent = game:GetService("CoreGui")

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0,55,0,55)
toggleBtn.Position = UDim2.new(1, -70, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
toggleBtn.Text = "P"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.SciFi
toggleBtn.TextSize = 26
toggleBtn.BorderSizePixel = 0
toggleBtn.AutoButtonColor = false
toggleBtn.Parent = sg
local tbc = Instance.new("UICorner"); tbc.CornerRadius = UDim.new(1, 0); tbc.Parent = toggleBtn

local tbStroke1 = Instance.new("UIStroke")
tbStroke1.Color = Color3.fromRGB(255, 255, 255); tbStroke1.Thickness = 1.5
tbStroke1.Transparency = 0.3; tbStroke1.Parent = toggleBtn

local tbStroke2 = Instance.new("UIStroke")
tbStroke2.Color = Color3.fromRGB(255, 255, 255); tbStroke2.Thickness = 3
tbStroke2.Transparency = 0.85; tbStroke2.Parent = toggleBtn

local tbGrad = Instance.new("UIGradient")
tbGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 10))
}
tbGrad.Rotation = 90
tbGrad.Parent = toggleBtn

toggleBtn.MouseEnter:Connect(function()
    TweenService:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 30)}):Play()
    TweenService:Create(tbStroke1, TweenInfo.new(0.2), {Transparency = 0}):Play()
    TweenService:Create(tbStroke2, TweenInfo.new(0.2), {Transparency = 0.6}):Play()
end)
toggleBtn.MouseLeave:Connect(function()
    TweenService:Create(toggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(12, 12, 14)}):Play()
    TweenService:Create(tbStroke1, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
    TweenService:Create(tbStroke2, TweenInfo.new(0.2), {Transparency = 0.85}):Play()
end)

local btnDragging = false
local btnDragStart, btnStartPos
local btnMoved = false

toggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        btnDragging = true
        btnMoved = false
        btnDragStart = input.Position
        btnStartPos = toggleBtn.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if btnDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - btnDragStart
        if math.abs(delta.X) > 3 or math.abs(delta.Y) > 3 then
            btnMoved = true
        end
        toggleBtn.Position = UDim2.new(
            btnStartPos.X.Scale, btnStartPos.X.Offset + delta.X,
            btnStartPos.Y.Scale, btnStartPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        btnDragging = false
    end
end)

local menuContainer = Instance.new("Frame")
menuContainer.Size = UDim2.new(0, 420, 0, 260)
menuContainer.Position = UDim2.new(1, -412, 0, 75)
menuContainer.BackgroundTransparency = 1
menuContainer.Visible = false
menuContainer.Parent = sg

cat(sg, 355, 25)

local mf = Instance.new("Frame")
mf.Size = UDim2.new(1,0,1,0); mf.BackgroundColor3 = Color3.fromRGB(8,8,10)
mf.BorderSizePixel = 0; mf.Parent = menuContainer
local mc = Instance.new("UICorner"); mc.CornerRadius = UDim.new(0,10); mc.Parent = mf
local glow = Instance.new("UIStroke"); glow.Color = Color3.fromRGB(60,60,70); glow.Thickness = 1.5; glow.Parent = mf
local glow2 = Instance.new("UIStroke"); glow2.Color = Color3.new(1,1,1); glow2.Thickness = 3; glow2.Transparency = 0.85; glow2.Parent = mf

local logoFrame = Instance.new("Frame")
logoFrame.Size = UDim2.new(0,60,0,60); logoFrame.Position = UDim2.new(0,10,0,12)
logoFrame.BackgroundColor3 = Color3.fromRGB(12,12,14); logoFrame.BorderSizePixel = 0; logoFrame.Parent = mf
local lc = Instance.new("UICorner"); lc.CornerRadius = UDim.new(0,8); lc.Parent = logoFrame

local lP = Instance.new("TextLabel")
lP.Size = UDim2.new(1,0,1,0); lP.Text = "P"
lP.TextColor3 = Color3.fromRGB(255, 255, 255)
lP.BackgroundTransparency = 1
lP.Font = Enum.Font.SciFi
lP.TextSize = 44
lP.Parent = logoFrame

local glowOuter = Instance.new("UIStroke")
glowOuter.Color = Color3.fromRGB(255, 255, 255); glowOuter.Thickness = 4
glowOuter.Transparency = 0.7
glowOuter.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
glowOuter.Parent = lP

local glowInner = Instance.new("UIStroke")
glowInner.Color = Color3.fromRGB(255, 255, 255); glowInner.Thickness = 2
glowInner.Transparency = 0.3
glowInner.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
glowInner.Parent = lP

local pTag = Instance.new("TextLabel")
pTag.Size = UDim2.new(0, 200, 0, 14)
pTag.Position = UDim2.new(0, 75, 0, 14)
pTag.BackgroundTransparency = 1
pTag.Text = "Developers:pevitkill"
pTag.TextColor3 = Color3.fromRGB(140, 140, 150)
pTag.Font = Enum.Font.Gotham
pTag.TextSize = 9
pTag.TextXAlignment = Enum.TextXAlignment.Left
pTag.Parent = mf

local pVer = Instance.new("TextLabel")
pVer.Size = UDim2.new(0, 200, 0, 12)
pVer.Position = UDim2.new(0, 75, 0, 28)
pVer.BackgroundTransparency = 1
pVer.Text = "hotfix 0.0.9"
pVer.TextColor3 = Color3.fromRGB(90, 90, 100)
pVer.Font = Enum.Font.Gotham
pVer.TextSize = 8
pVer.TextXAlignment = Enum.TextXAlignment.Left
pVer.Parent = mf

local side = Instance.new("Frame")
side.Size = UDim2.new(0, 110, 1, -95)
side.Position = UDim2.new(0, 10, 0, 82)
side.BackgroundTransparency = 1
side.Parent = mf
local sl = Instance.new("UIListLayout"); sl.Padding = UDim.new(0, 5); sl.Parent = side

local cont = Instance.new("Frame")
cont.Size = UDim2.new(1, -140, 1, -130)
cont.Position = UDim2.new(0, 130, 0, 82)
cont.BackgroundTransparency = 1
cont.Parent = mf
local contL = Instance.new("UIListLayout"); contL.Padding = UDim.new(0, 4); contL.Parent = cont

makePulseLine(mf)

local tb = Instance.new("TextButton")
tb.Size = UDim2.new(1, 0, 0, 48)
tb.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
tb.Text = ""
tb.BorderSizePixel = 0
tb.AutoButtonColor = false
tb.Parent = side
local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0, 5); tc.Parent = tb

local nameLbl = Instance.new("TextLabel")
nameLbl.Size = UDim2.new(1, -10, 0, 16)
nameLbl.Position = UDim2.new(0, 8, 0, 8)
nameLbl.BackgroundTransparency = 1
nameLbl.Text = "main"
nameLbl.TextColor3 = Color3.fromRGB(220, 220, 220)
nameLbl.Font = Enum.Font.GothamBold
nameLbl.TextSize = 12
nameLbl.TextXAlignment = Enum.TextXAlignment.Left
nameLbl.Parent = tb

local descLbl = Instance.new("TextLabel")
descLbl.Size = UDim2.new(1, -10, 0, 14)
descLbl.Position = UDim2.new(0, 8, 0, 26)
descLbl.BackgroundTransparency = 1
descLbl.Text = "основные функции"
descLbl.TextColor3 = Color3.fromRGB(100, 100, 110)
descLbl.Font = Enum.Font.Gotham
descLbl.TextSize = 9
descLbl.TextXAlignment = Enum.TextXAlignment.Left
descLbl.Parent = tb

makeCheckbox(cont, "Пульс линии", true, function(v) pulseActive = v end)

local fadeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function fadeMenu(open)
    if open then menuContainer.Visible = true end
    local tweens = {}
    for _, obj in ipairs(menuContainer:GetDescendants()) do
        if obj:IsA("Frame") or obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj.BackgroundTransparency ~= nil then
                if not obj:GetAttribute("OT") then obj:SetAttribute("OT", obj.BackgroundTransparency) end
                local t = open and obj:GetAttribute("OT") or 1
                table.insert(tweens, TweenService:Create(obj, fadeInfo, {BackgroundTransparency = t}))
            end
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                if not obj:GetAttribute("OTT") then obj:SetAttribute("OTT", obj.TextTransparency) end
                local t = open and obj:GetAttribute("OTT") or 1
                table.insert(tweens, TweenService:Create(obj, fadeInfo, {TextTransparency = t}))
            end
        end
        if obj:IsA("UIStroke") then
            if not obj:GetAttribute("OST") then obj:SetAttribute("OST", obj.Transparency) end
            local t = open and obj:GetAttribute("OST") or 1
            table.insert(tweens, TweenService:Create(obj, fadeInfo, {Transparency = t}))
        end
    end
    if pulseLineFrame then
        if not open then
            if pulseLinePart then table.insert(tweens, TweenService:Create(pulseLinePart, fadeInfo, {BackgroundTransparency = 1})) end
            if pulseGlow then table.insert(tweens, TweenService:Create(pulseGlow, fadeInfo, {BackgroundTransparency = 1})) end
            if pulseGrad then table.insert(tweens, TweenService:Create(pulseGrad, fadeInfo, {BackgroundTransparency = 1})) end
        else
            if pulseLinePart then pulseLinePart.BackgroundTransparency = 0.6 end
            if pulseGlow then pulseGlow.BackgroundTransparency = 0.85 end
            if pulseGrad then pulseGrad.BackgroundTransparency = 0.2 end
        end
    end
    for _, tw in ipairs(tweens) do tw:Play() end
    if not open then
        task.wait(0.55)
        menuContainer.Visible = false
    end
end

local isAnimating = false
local function toggleMenu()
    if isAnimating then return end
    isAnimating = true
    if menuContainer.Visible then fadeMenu(false) else fadeMenu(true) end
    task.wait(0.6); isAnimating = false
end

toggleBtn.MouseButton1Click:Connect(function()
    if not btnMoved then toggleMenu() end
end)
toggleBtn.TouchTap:Connect(function()
    if not btnMoved then toggleMenu() end
end)

local dg, ds, sp
logoFrame.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dg = true; ds = i.Position; sp = menuContainer.Position
    end
end)
UIS.InputChanged:Connect(function(i)
    if dg and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local dt = i.Position - ds
        menuContainer.Position = UDim2.new(sp.X.Scale, sp.X.Offset + dt.X, sp.Y.Scale, sp.Y.Offset + dt.Y)
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dg = false end
end)

print("[Pevit] hotfix 0.0.9 loaded 🐱")w
