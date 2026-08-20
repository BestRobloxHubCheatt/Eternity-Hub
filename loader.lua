-- ============================================
-- ETERNITY HUB - KEY SYSTEM (FIXED)
-- ============================================
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local CORRECT_KEY = "Etern1ty"
local LINK_URL = "https://discord.gg/your-invite"
local HUB_SCRIPT_URL = "https://raw.githubusercontent.com/BestRobloxHubCheatt/Eternity-Hub/refs/heads/main/hub.lua"

-- ============================================
-- ПРОВЕРКА HTTP-ЗАПРОСА
-- ============================================
local function getScript(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    if success then
        return result
    else
        warn("[ETERNITY] Failed to load script: " .. tostring(result))
        return nil
    end
end

-- ============================================
-- СОЗДАНИЕ GUI
-- ============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EternityHub"
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.75
background.BorderSizePixel = 0
background.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 380)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 65)
header.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
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
closeBtn.Position = UDim2.new(1, -40, 0, 17)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.BackgroundTransparency = 0.1
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

local lockIcon = Instance.new("TextLabel")
lockIcon.Size = UDim2.new(0, 60, 0, 60)
lockIcon.Position = UDim2.new(0.5, -30, 0, 80)
lockIcon.Text = "🔒"
lockIcon.TextColor3 = Color3.fromRGB(255, 200, 50)
lockIcon.TextScaled = true
lockIcon.BackgroundTransparency = 1
lockIcon.Font = Enum.Font.GothamBold
lockIcon.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 25)
statusLabel.Position = UDim2.new(0, 20, 0, 150)
statusLabel.Text = "ENTER KEY TO CONTINUE"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.Gotham
statusLabel.BackgroundTransparency = 1
statusLabel.Parent = mainFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 260, 0, 40)
keyBox.Position = UDim2.new(0.5, -130, 0, 185)
keyBox.PlaceholderText = "Enter your key here..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 16
keyBox.Font = Enum.Font.Gotham
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
keyBox.BackgroundTransparency = 0.2
keyBox.BorderSizePixel = 2
keyBox.BorderColor3 = Color3.fromRGB(100, 100, 150)
keyBox.ClearTextOnFocus = false
keyBox.Parent = mainFrame

local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(0, 150, 0, 40)
verifyBtn.Position = UDim2.new(0.25, 0, 0, 245)
verifyBtn.Text = "VERIFY KEY"
verifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
verifyBtn.TextSize = 15
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 50)
verifyBtn.BackgroundTransparency = 0.1
verifyBtn.BorderSizePixel = 0
verifyBtn.Parent = mainFrame

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0, 150, 0, 40)
getKeyBtn.Position = UDim2.new(0.5, 0, 0, 245)
getKeyBtn.Text = "GET KEY"
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.TextSize = 15
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
getKeyBtn.BackgroundTransparency = 0.1
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Parent = mainFrame

local notificationContainer = Instance.new("Frame")
notificationContainer.Size = UDim2.new(1, 0, 0, 40)
notificationContainer.Position = UDim2.new(0, 0, 1, -50)
notificationContainer.BackgroundTransparency = 1
notificationContainer.Parent = mainFrame

local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(1, 0, 1, 0)
notificationLabel.Text = ""
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.TextSize = 14
notificationLabel.Font = Enum.Font.Gotham
notificationLabel.BackgroundTransparency = 1
notificationLabel.Parent = notificationContainer

-- ============================================
-- ФУНКЦИЯ УВЕДОМЛЕНИЯ
-- ============================================
local function showNotification(text, color)
    notificationLabel.Text = text
    notificationLabel.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    notificationLabel.TextTransparency = 1
    for i = 0, 1, 0.1 do
        task.wait(0.03)
        notificationLabel.TextTransparency = 1 - i
    end
    task.wait(2)
    for i = 0, 1, 0.1 do
        task.wait(0.03)
        notificationLabel.TextTransparency = i
    end
    notificationLabel.Text = ""
end

-- ============================================
-- ФУНКЦИЯ ВЕРИФИКАЦИИ
-- ============================================
local function verifyKey(key)
    if key == CORRECT_KEY then
        showNotification("✅ ACCESS GRANTED! Loading Hub...", Color3.fromRGB(0, 255, 0))
        lockIcon.Text = "🔓"
        lockIcon.TextColor3 = Color3.fromRGB(0, 255, 100)
        statusLabel.Text = "✅ VERIFIED SUCCESSFULLY"
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        keyBox.Text = ""
        keyBox.PlaceholderText = "Already verified"
        keyBox.TextColor3 = Color3.fromRGB(100, 255, 100)
        keyBox.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
        verifyBtn.Text = "✅ VERIFIED"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        task.wait(1)
        screenGui:Destroy()
        
        -- Загружаем основной хаб с проверкой
        print("[ETERNITY] Loading Hub...")
        local hubScript = getScript(HUB_SCRIPT_URL)
        if hubScript then
            local success, err = pcall(function()
                loadstring(hubScript)()
            end)
            if not success then
                warn("[ETERNITY] Error loading hub: " .. tostring(err))
                showNotification("⚠️ Error loading hub", Color3.fromRGB(255, 0, 0))
            else
                print("[ETERNITY] Hub loaded successfully!")
            end
        else
            showNotification("⚠️ Failed to load hub script", Color3.fromRGB(255, 0, 0))
        end
        return true
    else
        showNotification("❌ INVALID KEY! Try again", Color3.fromRGB(255, 0, 0))
        keyBox.Text = ""
        keyBox.PlaceholderText = "Wrong key, try again..."
        keyBox.TextColor3 = Color3.fromRGB(255, 100, 100)
        keyBox.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
        task.wait(0.5)
        keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        keyBox.PlaceholderText = "Enter your key here..."
        return false
    end
end

verifyBtn.MouseButton1Click:Connect(function()
    local inputKey = keyBox.Text
    if inputKey == "" then
        showNotification("⚠️ Please enter a key!", Color3.fromRGB(255, 200, 0))
        return
    end
    verifyKey(inputKey)
end)

keyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local inputKey = keyBox.Text
        if inputKey ~= "" then
            verifyKey(inputKey)
        end
    end
end)

getKeyBtn.MouseButton1Click:Connect(function()
    local success = pcall(function()
        if setclipboard then
            setclipboard(LINK_URL)
        else
            local clipboardFrame = Instance.new("Frame")
            clipboardFrame.Size = UDim2.new(0, 1, 0, 1)
            clipboardFrame.Position = UDim2.new(0, -100, 0, -100)
            clipboardFrame.BackgroundTransparency = 1
            clipboardFrame.Parent = screenGui
            
            local clipboardBox = Instance.new("TextBox")
            clipboardBox.Size = UDim2.new(1, 0, 1, 0)
            clipboardBox.Text = LINK_URL
            clipboardBox.BackgroundTransparency = 1
            clipboardBox.Parent = clipboardFrame
            
            clipboardBox:CaptureFocus()
            clipboardBox:SelectAll()
        end
    end)
    if success then
        showNotification("✅ LINK COPIED!", Color3.fromRGB(0, 255, 0))
    else
        showNotification("⚠️ Copy manually: " .. LINK_URL, Color3.fromRGB(255, 200, 0))
    end
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        mainFrame.Visible = not mainFrame.Visible
        background.Visible = mainFrame.Visible
    end
    if input.KeyCode == Enum.KeyCode.Escape then
        screenGui:Destroy()
    end
end)

-- ============================================
-- АНИМАЦИЯ ПОЯВЛЕНИЯ
-- ============================================
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -220)
background.BackgroundTransparency = 1
for i = 0, 1, 0.05 do
    task.wait(0.02)
    background.BackgroundTransparency = 0.75 - (i * 0.75)
    mainFrame.Position = UDim2.new(0.5, -210, 0.5, -190 + (i * -25))
end

print("[ETERNITY] Key System Loaded!")
