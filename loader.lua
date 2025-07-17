--[[ 
⚠️ EDUCATIONAL PURPOSES ONLY ⚠️
Client-side loading screen (visual only, no server impact)
Now lasts exactly 1 minute
]]

-- Remove existing UI if re-executed
if game.CoreGui:FindFirstChild("DarkHubLoadingScreen") then
    game.CoreGui.DarkHubLoadingScreen:Destroy()
end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DarkHubLoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0.5, 0, 0.25, 0)
Frame.Position = UDim2.new(0.25, 0, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Logo Label (Dark Script)
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Size = UDim2.new(1, 0, 0.4, 0)
LogoLabel.Position = UDim2.new(0, 0, 0, -50)
LogoLabel.BackgroundTransparency = 1
LogoLabel.Text = "Dark Script"
LogoLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
LogoLabel.TextScaled = true
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.Parent = Frame

-- Loading Bar
local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(0, 0, 0.3, 0)
Bar.Position = UDim2.new(0, 0, 0.7, 0)
Bar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
Bar.BorderSizePixel = 0
Bar.Parent = Frame

-- Border around frame
local UIStroke = Instance.new("UIStroke", Frame)
UIStroke.Color = Color3.fromRGB(0, 170, 255)
UIStroke.Thickness = 2

-- Percent Text
local PercentText = Instance.new("TextLabel")
PercentText.Size = UDim2.new(1, 0, 0.3, 0)
PercentText.Position = UDim2.new(0, 0, 0.7, 0)
PercentText.BackgroundTransparency = 1
PercentText.Text = "Dark Hub - Loading... 0%"
PercentText.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentText.TextScaled = true
PercentText.Font = Enum.Font.GothamBold
PercentText.Parent = Frame

-- Animate loading (1 minute = 60 seconds = 100 steps of 0.6s)
spawn(function()
    for i = 1, 100 do
        Bar:TweenSize(UDim2.new(i / 100, 0, 0.3, 0), "Out", "Sine", 0.5, true)
        PercentText.Text = "Dark Hub - Loading... " .. i .. "%"
        wait(0.6) -- 100 steps × 0.6s = 60 seconds
    end

    wait(1)
    ScreenGui:Destroy()
end)
