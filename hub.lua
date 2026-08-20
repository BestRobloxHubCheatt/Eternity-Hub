-- ============================================
-- ETERNITY HUB - MAIN MENU
-- ============================================
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local SAN_DIEGO_URL = "https://raw.githubusercontent.com/BestRobloxHubCheatt/Eternity-Hub/refs/heads/main/sandiego.lua"

-- ============================================
-- СОЗДАНИЕ GUI
-- ============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EternityHubMain"
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.7
background.BorderSizePixel = 0
background.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 550, 0, 450)
mainFrame.Position = UDim2.new(0.5, -275, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 40)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Заголовок
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 70)
header.BackgroundColor3 = Color3.fromRGB(50, 40, 90)
header.BackgroundTransparency = 0.2
header.BorderSizePixel = 0
header.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.Text = "✨ ETERNITY HUB"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 20)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.BackgroundTransparency = 0.1
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- ============================================
-- КОНТЕЙНЕР ДЛЯ РАЗДЕЛОВ
-- ============================================
local container = Instance.new("Frame")
container.Size = UDim2.new(1, -20, 1, -90)
container.Position = UDim2.new(0, 10, 0, 80)
container.BackgroundTransparency = 1
container.Parent = mainFrame

-- ============================================
-- РАЗДЕЛ "SETTINGS"
-- ============================================
local settingsSection = Instance.new("Frame")
settingsSection.Size = UDim2.new(0, 250, 1, 0)
settingsSection.Position = UDim2.new(0, 0, 0, 0)
settingsSection.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
settingsSection.BackgroundTransparency = 0.2
settingsSection.BorderSizePixel = 0
settingsSection.ClipsDescendants = true
settingsSection.Parent = container

local settingsIcon = Instance.new("TextLabel")
settingsIcon.Size = UDim2.new(0, 50, 0, 50)
settingsIcon.Position = UDim2.new(0.5, -25, 0, 15)
settingsIcon.Text = "⚙️"
settingsIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsIcon.TextScaled = true
settingsIcon.BackgroundTransparency = 1
settingsIcon.Font = Enum.Font.GothamBold
settingsIcon.Parent = settingsSection

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0, 30)
settingsTitle.Position = UDim2.new(0, 0, 0, 70)
settingsTitle.Text = "SETTINGS"
settingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTitle.TextScaled = true
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.BackgroundTransparency = 1
settingsTitle.Parent = settingsSection

local settingsDesc = Instance.new("TextLabel")
settingsDesc.Size = UDim2.new(1, -20, 0, 60)
settingsDesc.Position = UDim2.new(0, 10, 0, 105)
settingsDesc.Text = "Configure script settings, hotkeys and preferences."
settingsDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
settingsDesc.TextSize = 14
settingsDesc.TextWrapped = true
settingsDesc.Font = Enum.Font.Gotham
settingsDesc.BackgroundTransparency = 1
settingsDesc.Parent = settingsSection

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 120, 0, 35)
settingsBtn.Position = UDim2.new(0.5, -60, 0, 180)
settingsBtn.Text = "🔧 OPEN"
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.TextSize = 14
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 200)
settingsBtn.BackgroundTransparency = 0.1
settingsBtn.BorderSizePixel = 0
settingsBtn.Parent = settingsSection

settingsBtn.MouseButton1Click:Connect(function()
    print("[ETERNITY] Settings opened")
    -- Здесь будет окно настроек
end)

-- ============================================
-- РАЗДЕЛ "GAMES"
-- ============================================
local gamesSection = Instance.new("Frame")
gamesSection.Size = UDim2.new(0, 250, 1, 0)
gamesSection.Position = UDim2.new(0.5, 0, 0, 0)
gamesSection.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
gamesSection.BackgroundTransparency = 0.2
gamesSection.BorderSizePixel = 0
gamesSection.ClipsDescendants = true
gamesSection.Parent = container

local gamesIcon = Instance.new("TextLabel")
gamesIcon.Size = UDim2.new(0, 50, 0, 50)
gamesIcon.Position = UDim2.new(0.5, -25, 0, 15)
gamesIcon.Text = "🎮"
gamesIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
gamesIcon.TextScaled = true
gamesIcon.BackgroundTransparency = 1
gamesIcon.Font = Enum.Font.GothamBold
gamesIcon.Parent = gamesSection

local gamesTitle = Instance.new("TextLabel")
gamesTitle.Size = UDim2.new(1, 0, 0, 30)
gamesTitle.Position = UDim2.new(0, 0, 0, 70)
gamesTitle.Text = "GAMES"
gamesTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
gamesTitle.TextScaled = true
gamesTitle.Font = Enum.Font.GothamBold
gamesTitle.BackgroundTransparency = 1
gamesTitle.Parent = gamesSection

-- Список игр
local gamesList = Instance.new("ScrollingFrame")
gamesList.Size = UDim2.new(1, -10, 0, 200)
gamesList.Position = UDim2.new(0, 5, 0, 105)
gamesList.BackgroundTransparency = 1
gamesList.CanvasSize = UDim2.new(0, 0, 0, 250)
gamesList.ScrollBarThickness = 4
gamesList.Parent = gamesSection

local games = {
    {name = "San Diego Border Roleplay", url = SAN_DIEGO_URL, icon = "🌴"},
}

for i, gameData in ipairs(games) do
    local gameBtn = Instance.new("TextButton")
    gameBtn.Size = UDim2.new(1, -10, 0, 40)
    gameBtn.Position = UDim2.new(0, 5, 0, (i-1) * 45 + 5)
    gameBtn.Text = gameData.icon .. " " .. gameData.name
    gameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    gameBtn.TextSize = 13
    gameBtn.TextXAlignment = Enum.TextXAlignment.Left
    gameBtn.Font = Enum.Font.Gotham
    gameBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    gameBtn.BackgroundTransparency = 0.3
    gameBtn.BorderSizePixel = 0
    gameBtn.Parent = gamesList
    
    gameBtn.MouseEnter:Connect(function()
        gameBtn.BackgroundTransparency = 0.1
    end)
    gameBtn.MouseLeave:Connect(function()
        gameBtn.BackgroundTransparency = 0.3
    end)
    
    gameBtn.MouseButton1Click:Connect(function()
        print("[ETERNITY] Loading script for: " .. gameData.name)
        screenGui:Destroy()
        pcall(function()
            loadstring(game:HttpGet(gameData.url))()
        end)
    end)
end

gamesList.CanvasSize = UDim2.new(0, 0, 0, #games * 45 + 10)

-- ============================================
-- АНИМАЦИЯ ПОЯВЛЕНИЯ
-- ============================================
mainFrame.Position = UDim2.new(0.5, -275, 0.5, -255)
background.BackgroundTransparency = 1
for i = 0, 1, 0.05 do
    task.wait(0.02)
    background.BackgroundTransparency = 0.7 - (i * 0.7)
    mainFrame.Position = UDim2.new(0.5, -275, 0.5, -225 + (i * -25))
end

print("[ETERNITY] Hub loaded successfully!")
print("[ETERNITY] Press Right Shift to toggle menu")
