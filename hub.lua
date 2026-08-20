-- ============================================
-- ETERNITY HUB - MAIN MENU (FIXED)
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
local function createSection(parent, xPos, icon, title, desc)
    local section = Instance.new("Frame")
    section.Size = UDim2.new(0, 250, 1, 0)
    section.Position = UDim2.new(xPos, 0, 0, 0)
    section.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    section.BackgroundTransparency = 0.2
    section.BorderSizePixel = 0
    section.ClipsDescendants = true
    section.Parent = parent
    
    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 50, 0, 50)
    iconLabel.Position = UDim2.new(0.5, -25, 0, 15)
    iconLabel.Text = icon
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.TextScaled = true
    iconLabel.BackgroundTransparency = 1
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.Parent = section
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Position = UDim2.new(0, 0, 0, 70)
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.BackgroundTransparency = 1
    titleLabel.Parent = section
    
    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -20, 0, 60)
    descLabel.Position = UDim2.new(0, 10, 0, 105)
    descLabel.Text = desc
    descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    descLabel.TextSize = 14
    descLabel.TextWrapped = true
    descLabel.Font = Enum.Font.Gotham
    descLabel.BackgroundTransparency = 1
    descLabel.Parent = section
    
    return section
end

local settingsSection = createSection(container, 0, "⚙️", "SETTINGS", "Configure script settings, hotkeys and preferences.")

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
end)

-- ============================================
-- РАЗДЕЛ "GAMES"
-- ============================================
local gamesSection = createSection(container, 0.5, "🎮", "GAMES", "Select a game to load the script.")

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
        
        local success, result = pcall(function()
            return game:HttpGet(gameData.url)
        end)
        
        if success and result then
            local loadSuccess, loadErr = pcall(function()
                loadstring(result)()
            end)
            if loadSuccess then
                print("[ETERNITY] Script loaded: " .. gameData.name)
            else
                warn("[ETERNITY] Script error: " .. tostring(loadErr))
            end
        else
            warn("[ETERNITY] Failed to load script: " .. tostring(result))
        end
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
