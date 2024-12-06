local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 400, 0, 400)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
menuFrame.BackgroundColor3 = Color3.fromRGB(169, 169, 169)
menuFrame.BackgroundTransparency = 0.5
menuFrame.BorderSizePixel = 0
menuFrame.BorderRadius = UDim.new(0, 20)
menuFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "The Faceless Hacker Menu"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.TextAlign = Enum.TextAlign.Center
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = menuFrame

local draggable = Instance.new("UIPadding")
draggable.PaddingTop = UDim.new(0, 10)
draggable.PaddingLeft = UDim.new(0, 10)
draggable.Parent = menuFrame

local toggleHighlightButton = Instance.new("TextButton")
toggleHighlightButton.Size = UDim2.new(0, 150, 0, 50)
toggleHighlightButton.Position = UDim2.new(0.5, -75, 0.5, -60)
toggleHighlightButton.Text = "Esp"
toggleHighlightButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleHighlightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleHighlightButton.TextSize = 20
toggleHighlightButton.Parent = menuFrame

local toggleBoxButton = Instance.new("TextButton")
toggleBoxButton.Size = UDim2.new(0, 150, 0, 50)
toggleBoxButton.Position = UDim2.new(0.5, -75, 0.5, 10)
toggleBoxButton.Text = "Box n Studs"
toggleBoxButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleBoxButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBoxButton.TextSize = 20
toggleBoxButton.Parent = menuFrame

local toggleFacelessButton = Instance.new("TextButton")
toggleFacelessButton.Size = UDim2.new(0, 150, 0, 50)
toggleFacelessButton.Position = UDim2.new(0.5, -75, 0.5, 80)
toggleFacelessButton.Text = "Toggle Faceless Menu"
toggleFacelessButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleFacelessButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleFacelessButton.TextSize = 20
toggleFacelessButton.Parent = menuFrame

local toggleStateEsp = false
local toggleStateBox = false
local toggleStateMenu = true

local highlightData = {}

local music = Instance.new("Sound")
music.SoundId = "rbxassetid://1837879082"
music.Parent = game.Players.LocalPlayer.Character
music:Play()

local introLabel1 = Instance.new("TextLabel")
introLabel1.Size = UDim2.new(1, 0, 0, 40)
introLabel1.Position = UDim2.new(0, 0, 0.5, -20)
introLabel1.Text = "MJ IS COOL"
introLabel1.TextColor3 = Color3.fromRGB(255, 255, 255)
introLabel1.TextSize = 30
introLabel1.TextAlign = Enum.TextAlign.Center
introLabel1.BackgroundTransparency = 1
introLabel1.Parent = screenGui

local introLabel2 = Instance.new("TextLabel")
introLabel2.Size = UDim2.new(1, 0, 0, 40)
introLabel2.Position = UDim2.new(0, 0, 0.5, -20)
introLabel2.Text = "Made by MJ and Kayden is cool"
introLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
introLabel2.TextSize = 20
introLabel2.TextAlign = Enum.TextAlign.Center
introLabel2.BackgroundTransparency = 1
introLabel2.Parent = screenGui

local tweenService = game:GetService("TweenService")
local fadeOut = tweenService:Create(introLabel1, TweenInfo.new(1), {TextTransparency = 1})
local fadeIn2 = tweenService:Create(introLabel2, TweenInfo.new(1), {TextTransparency = 0})
local fadeOut2 = tweenService:Create(introLabel2, TweenInfo.new(1), {TextTransparency = 1})

introLabel1.TextTransparency = 1
fadeIn2:Play()
wait(2)
fadeOut:Play()
wait(2)
fadeOut2:Play()
wait(3)
music:Stop()

toggleHighlightButton.MouseButton1Click:Connect(function()
    toggleStateEsp = not toggleStateEsp
    if toggleStateEsp then
        toggleHighlightButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local char = player.Character
                if char:FindFirstChild("HumanoidRootPart") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = char
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.OutlineTransparency = 0.5
                    highlight.Adornee = char
                end
            end
        end
    else
        toggleHighlightButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local char = player.Character
                for _, highlight in pairs(char:GetChildren()) do
                    if highlight:IsA("Highlight") then
                        highlight:Destroy()
                    end
                end
            end
        end
    end
end)

toggleBoxButton.MouseButton1Click:Connect(function()
    toggleStateBox = not toggleStateBox
    if toggleStateBox then
        toggleBoxButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local char = player.Character
                if char:FindFirstChild("HumanoidRootPart") then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Parent = char
                    box.Size = char.HumanoidRootPart.Size * 2
                    box.Adornee = char
                    box.ZIndex = 10
                    box.Color3 = Color3.fromRGB(0, 255, 0)
                    box.OutlineColor = Color3.fromRGB(255, 255, 255)
                    box.OutlineTransparency = 0.5
                    box.Transparency = 0.5
                    highlightData[player] = box
                end
            end
        end
    else
        toggleBoxButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        for player, box in pairs(highlightData) do
            if box and player.Character then
                box:Destroy()
            end
        end
        highlightData = {}
    end
end)

toggleFacelessButton.MouseButton1Click:Connect(function()
    toggleStateMenu = not toggleStateMenu
    if toggleStateMenu then
        menuFrame.Visible = false
    else
        menuFrame.Visible = true
    end
end)

local function updateStuds()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and highlightData[player] then
            local char = player.Character
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
            local label = highlightData[player]:FindFirstChild("Label")
            if not label then
                label = Instance.new("TextLabel")
                label.Size = UDim2.new(0, 200, 0, 50)
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextSize = 20
                label.Text = tostring(math.floor(dist)) .. " Studs"
                label.BackgroundTransparency = 1
                label.Parent = highlightData[player]
            else
                label.Text = tostring(math.floor(dist)) .. " Studs"
            end
        end
    end
end

game:GetService("RunService").Heartbeat:Connect(updateStuds)
