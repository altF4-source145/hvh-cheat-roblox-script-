if game.CoreGui:FindFirstChild("Fleecaa4kMenu") then game.CoreGui.Fleecaa4kMenu:Destroy() end
local TS, P, R, U, L = game:GetService("TweenService"), game:GetService("Players"), game:GetService("RunService"), game:GetService("UserInputService"), game:GetService("Lighting")
local lp, cam, isAim, curT = P.LocalPlayer, workspace.CurrentCamera, false, nil
local SG = Instance.new("ScreenGui", game.CoreGui) SG.Name = "Fleecaa4kMenu"
local MF = Instance.new("Frame", SG) MF.Size = UDim2.new(0,260,0,770) MF.Position = UDim2.new(0.5,-130,0.4,-385) MF.BackgroundColor3 = Color3.fromRGB(15,15,15) MF.Active, MF.Draggable = true, true
Instance.new("UICorner", MF).CornerRadius = UDim.new(0,12)
local TL = Instance.new("Frame", MF) TL.Size = UDim2.new(1,0,0,3) TL.BackgroundColor3 = Color3.fromRGB(255,30,60) Instance.new("UICorner", TL).CornerRadius = UDim.new(0,12)
local T1 = Instance.new("TextLabel", MF) T1.Size = UDim2.new(1,-40,0,45) T1.Position = UDim2.new(0,16,0,3) T1.Text = "fleecaa4k'menu" T1.TextColor3 = Color3.fromRGB(255,255,255) T1.Font, T1.TextSize, T1.TextXAlignment = Enum.Font.GothamBold, 16, Enum.TextXAlignment.Left T1.BackgroundTransparency = 1
local T2 = Instance.new("TextLabel", MF) T2.Size = UDim2.new(0,50,0,45) T2.Position = UDim2.new(0,142,0,3) T2.Text = "RAGE" T2.TextColor3 = Color3.fromRGB(255,30,60) T2.Font, T2.TextSize, T2.TextXAlignment = Enum.Font.GothamBold, 16, Enum.TextXAlignment.Left T2.BackgroundTransparency = 1
local CB = Instance.new("TextButton", MF) CB.Size = UDim2.new(0,26,0,26) CB.Position = UDim2.new(1,-36,0,12) CB.BackgroundColor3 = Color3.fromRGB(255,255,255) CB.Text = "×" CB.TextColor3 = Color3.fromRGB(150,150,150) CB.Font, CB.TextSize, CB.BackgroundTransparency = Enum.Font.GothamBold, 20, 1
local OB = Instance.new("TextButton", SG) OB.Size = UDim2.new(0,160,0,40) OB.Position = UDim2.new(0,10,0,10) OB.BackgroundColor3 = Color3.fromRGB(15,15,15) OB.Text = "[+] Open fleecaa4k" OB.TextColor3 = Color3.fromRGB(255,30,60) OB.Font, OB.TextSize, OB.Visible = Enum.Font.GothamBold, 13, false Instance.new("UICorner", OB).CornerRadius = UDim.new(0,8)
local OL = Instance.new("Frame", OB) OL.Size = UDim2.new(0,4,1,0) OL.BackgroundColor3 = Color3.fromRGB(255,30,60) CB.MouseButton1Click:Connect(function() MF.Visible, OB.Visible = false, true end) OB.MouseButton1Click:Connect(function() MF.Visible, OB.Visible = true, false end)
local INF = Instance.new("Frame", MF) INF.Size = UDim2.new(1,-32,0,50) INF.Position = UDim2.new(0,16,1,-66) INF.BackgroundColor3 = Color3.fromRGB(22,22,22) Instance.new("UICorner", INF).CornerRadius = UDim.new(0,6)
local INFT = Instance.new("TextLabel", INF) INFT.Size = UDim2.new(1,-12,1,-4) INFT.Position = UDim2.new(0,6,0,2) INFT.Text = "Status: fleecaa4k'menu active" INFT.TextColor3 = Color3.fromRGB(160,160,160) INFT.Font, INFT.TextSize, INFT.TextWrapped, INFT.BackgroundTransparency = Enum.Font.GothamMedium, 11, true, 1

local cnt = 0 local function addTgl(txt, cb) cnt = cnt + 1
    local B = Instance.new("TextButton", MF) B.Size = UDim2.new(0,228,0,42) B.Position = UDim2.new(0,16,0,55+(cnt*50)-50) B.BackgroundColor3 = Color3.fromRGB(24,24,24) B.Text = "  " .. txt B.TextColor3 = Color3.fromRGB(180,180,180) B.Font, B.TextSize, B.TextXAlignment = Enum.Font.GothamMedium, 13, Enum.TextXAlignment.Left Instance.new("UICorner", B).CornerRadius = UDim.new(0,6)
    local SL = Instance.new("TextLabel", B) SL.Size = UDim2.new(0,50,1,0) SL.Position = UDim2.new(1,-60,0,0) SL.Text = "OFF" SL.TextColor3 = Color3.fromRGB(150,50,50) SL.Font, SL.TextSize, SL.TextXAlignment, SL.BackgroundTransparency = Enum.Font.GothamBold, 12, Enum.TextXAlignment.Right, 1
    local act = false B.MouseButton1Click:Connect(function() act = not act
        TS:Create(B, TweenInfo.new(0.25), {BackgroundColor3 = act and Color3.fromRGB(45,20,25) or Color3.fromRGB(24,24,24), TextColor3 = act and Color3.fromRGB(255,255,255) or Color3.fromRGB(180,180,180)}):Play()
        TS:Create(SL, TweenInfo.new(0.25), {TextColor3 = act and Color3.fromRGB(255,30,60) or Color3.fromRGB(150,50,50)}):Play() SL.Text = act and "ON" or "OFF" cb(act)
    end)
    return B
end
_G.Aim, _G.Noc, _G.Spd, _G.Jmp, _G.Rec, _G.HvhAA, _G.TPerson, _G.Spin, _G.Knife, _G.Ammo, _G.Fbr, _G.Esp, _G.Fast, _G.Trg = false, false, false, false, false, false, false, false, false, false, false, false, false, false
local bxs = {}
local function vld(p) return p and p ~= lp and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 end
local function getC() local c, d = nil, 9999 for _, p in ipairs(P:GetPlayers()) do if vld(p) and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then local dist = (lp.Character.HumanoidRootPart.Position - p.Character.Head.Position).Magnitude if dist < d then d, c = dist, p end end end return c end
local function crbx(p) if bxs[p] then return end local b = Drawing.new("Square") b.Thickness, b.Color, b.Filled, b.Visible = 1.5, Color3.fromRGB(0,255,150), false, false bxs[p] = b end
for _, p in ipairs(P:GetPlayers()) do if p ~= lp then crbx(p) end end P.PlayerAdded:Connect(crbx) P.PlayerRemoving:Connect(function(p) if bxs[p] then bxs[p]:Remove() bxs[p] = nil end end)
local oldHip = nil
R.RenderStepped:Connect(function()
    if _G.Aim and U:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        isAim = true
        if not curT or not vld(curT) then curT = getC() end
        if curT and curT.Character and curT.Character:FindFirstChild("Head") then 
            pcall(function()
                local headPos = curT.Character.Head.Position
                cam.CFrame = CFrame.new(cam.CFrame.Position, Vector3.new(headPos.X, headPos.Y, headPos.Z))
            end)
        end
    else isAim, curT = false, nil end
    if _G.Trg and lp:GetMouse().Target then
        local targ = lp:GetMouse().Target.Parent
        local pl = P:GetPlayerFromCharacter(targ)
        if pl and pl ~= lp and vld(pl) then pcall(function() mouse1click() end) end
    end
    if _G.HvhAA and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChild("Humanoid") then
        pcall(function() local r = lp.Character.HumanoidRootPart lp.Character.Humanoid.AutoRotate = false if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and vld(curT) then r.CFrame = CFrame.new(r.Position, Vector3.new(curT.Character.Head.Position.X, r.Position.Y, curT.Character.Head.Position.Z)) else local a = cam.CFrame.LookVector r.CFrame = CFrame.new(r.Position) * CFrame.Angles(0, math.atan2(-a.X, -a.Z) + math.pi, 0) end end)
    elseif not _G.Spin and lp.Character and lp.Character:FindFirstChild("Humanoid") then pcall(function() lp.Character.Humanoid.AutoRotate = true end) end
    if _G.Spin and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and not U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then pcall(function() lp.Character.Humanoid.AutoRotate = false lp.Character.HumanoidRootPart.CFrame = lp.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(45), 0) end) end
    if _G.Knife and vld(curT) and U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and lp.Character:FindFirstChildOfClass("Tool") then pcall(function() local r, t = lp.Character.HumanoidRootPart, lp.Character:FindFirstChildOfClass("Tool") t:Activate() local old = r.CFrame r.CFrame = curT.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2) task.wait() r.CFrame = old end) end
    if _G.TPerson and lp.Character and lp.Character:FindFirstChild("Humanoid") then pcall(function() lp.CameraMaxZoomDistance, lp.CameraMinZoomDistance = 30, 10 if lp.Character.Humanoid.CameraOffset.Z == 0 then lp.CameraOffset = Vector3.new(1.5, 0.5, 3) end end) else pcall(function() if lp.Character and lp.Character:FindFirstChild("Humanoid") and lp.Character.Humanoid.CameraOffset.Z ~= 0 then lp.CameraOffset = Vector3.new(0, 0, 0) end end) end
    if _G.Fbr then L.Ambient, L.OutdoorAmbient, L.Brightness = Color3.new(1,1,1), Color3.new(1,1,1), 2 else L.Brightness = 1 end
    if _G.Ammo and lp.Character and lp.Character:FindFirstChildOfClass("Tool") then pcall(function() local t = lp.Character:FindFirstChildOfClass("Tool") if t:FindFirstChild("Reload") then t.Reload:Destroy() end if t:FindFirstChild("Ammo") then t.Ammo.Value = 999 end end) end
    if _G.Fast and U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and lp.Character and lp.Character:FindFirstChildOfClass("Tool") then pcall(function() local t = lp.Character:FindFirstChildOfClass("Tool") t:Activate() task.wait(0.01) t:Activate() end) end
    
    -- БЕЗОПАСНЫЙ СКОРОСТНОЙ ОБХОД ЧЕРЕЗ ВЫСОТУ БЕДЕР (HIPHEIGHT EXPANSION)
    if _G.Spd and lp.Character and lp.Character:FindFirstChild("Humanoid") then
        pcall(function()
            local h = lp.Character.Humanoid
            if not oldHip then oldHip = h.HipHeight end
            h.HipHeight = 14 -- Приподнимаем модельку, давая огромную легитную длину прыжка/шага
            if h.MoveDirection.Magnitude > 0 and U:IsKeyDown(Enum.KeyCode.Space) then
                lp.Character.HumanoidRootPart.Velocity = lp.Character.HumanoidRootPart.Velocity + (h.MoveDirection * 4)
            end
        end)
    else
        pcall(function()
            if lp.Character and lp.Character:FindFirstChild("Humanoid") and oldHip then
                lp.Character.Humanoid.HipHeight = oldHip
                oldHip = nil
            end
        end)
    end

    for p, b in pairs(bxs) do if _G.Esp and vld(p) and p.Character:FindFirstChild("HumanoidRootPart") then pcall(function() local pos, oS = cam:WorldToViewportPoint(p.Character.HumanoidRootPart.Position) if oS then local size = 1 / (pos.Z * math.tan(math.rad(cam.FieldOfView / 2))) * 1000 local w, h = 3 * size, 4.5 * size b.Size, b.Position, b.Visible = Vector2.new(w, h), Vector2.new(pos.X - w / 2, pos.Y - h / 2), true else b.Visible = false end end) else b.Visible = false end end
end)
U.InputBegan:Connect(function(i, g) if g then return end if i.KeyCode == Enum.KeyCode.Space and lp.Character and lp.Character:FindFirstChild("Humanoid") then pcall(function() lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end) end end)
R.Stepped:Connect(function() if _G.Noc and lp.Character then for _, p in pairs(lp.Character:GetChildren()) do if p:IsA("BasePart") then p.CanCollide = false end end end end)
local oldC = nil R.RenderStepped:Connect(function() if _G.Rec and U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then pcall(function() if not oldC then oldC = cam.CFrame end cam.CFrame = cam.CFrame:Lerp(oldC, 0.1) end) else oldC = nil end end)

addTgl("RAGE AIMBOT (RMB)", function(s) _G.Aim = s end)
addTgl("TRIGGERBOT (AUTO)", function(s) _G.Trg = s end)
addTgl("NOCLIP WALLS", function(s) _G.Noc = s if not s and lp.Character then pcall(function() for _, p in pairs(lp.Character:GetChildren()) do if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end end end) end end)
addTgl("HIPHEIGHT SPEED BYPASS", function(s) _G.Spd = s end)
addTgl("INFINITE JUMP", function(s) _G.Jmp = s end)
addTgl("NO RECOIL CAMERA", function(s) _G.Rec = s end)
addTgl("HvH LOOK-BACK AA", function(s) _G.HvhAA = s end)
addTgl("FORCE 3RD PERSON", function(s) _G.TPerson = s end)
addTgl("ANTI-AIM SPINBOT", function(s) _G.Spin = s end)
addTgl("RAGE KNIFE AURA", function(s) _G.Knife = s end)
local ammoBtn = addTgl("INFINITE AMMO", function(s) _G.Ammo = s end)
local fastBtn = addTgl("RAPID FIRE KAT", function(s) _G.Fast = s end)
addTgl("FULLBRIGHT MOD", function(s) _G.Fbr = s end)
addTgl("BOX ESP (WH)", function(s) _G.Esp = s end)

ammoBtn.MouseEnter:Connect(function() INFT.Text = "Works only in: Prison Life, Kat, Hood, some Tycoons." INFT.TextColor3 = Color3.fromRGB(255, 150, 0) end)
ammoBtn.MouseLeave:Connect(function() INFT.Text = "Status: fleecaa4k'menu active" INFT.TextColor3 = Color3.fromRGB(160, 160, 160) end)
fastBtn.MouseEnter:Connect(function() INFT.Text = "Optimized fast fire-rate for KAT gun system." INFT.TextColor3 = Color3.fromRGB(255, 30, 60) end)
fastBtn.MouseLeave:Connect(function() INFT.Text = "Status: fleecaa4k'menu active" INFT.TextColor3 = Color3.fromRGB(160, 160, 160) end)
