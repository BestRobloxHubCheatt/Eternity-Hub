-- ============================================
-- SAN DIEGO BORDER ROLEPLAY SCRIPT
-- ============================================
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

if not player or not Camera then return end

-- ============================================
-- НАСТРОЙКИ
-- ============================================
local settings = {
    esp = false,
    aimbot = false,
    silentAim = false,
    showHealth = true,
    showName = true,
    maxDistance = 1000,
    aimSmoothness = 5,
    aimFov = 100,
}

-- ============================================
-- СОЗДАНИЕ GUI
-- ============================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SanDiegoScript"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 400)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Заголовок
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 55)
header.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
header.BackgroundTransparency = 0.2
header.BorderSizePixel = 0
header.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.Text = "🌴 SAN DIEGO SCRIPT"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 12)
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
-- КАТЕГОРИИ
-- ============================================
local categoryContainer = Instance.new("Frame")
categoryContainer.Size = UDim2.new(1, -10, 1, -70)
categoryContainer.Position = UDim2.new(0, 5, 0, 65)
categoryContainer.BackgroundTransparency = 1
categoryContainer.Parent = mainFrame

local function createCategory(parent, name, icon, y)
    local catFrame = Instance.new("Frame")
    catFrame.Size = UDim2.new(1, -10, 0, 45)
    catFrame.Position = UDim2.new(0, 5, 0, y)
    catFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    catFrame.BackgroundTransparency = 0.3
    catFrame.BorderSizePixel = 0
    catFrame.Parent = parent
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 1, 0)
    title.Position = UDim2.new(0, 10, 0, 0)
    title.Text = icon .. " " .. name
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 16
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.BackgroundTransparency = 1
    title.Parent = catFrame
    
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 60, 0, 25)
    toggleBtn.Position = UDim2.new(1, -70, 0, 10)
    toggleBtn.Text = "▶"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.TextSize = 16
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    toggleBtn.BackgroundTransparency = 0.2
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Parent = catFrame
    
    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, 0, 0, 0)
    content.Position = UDim2.new(0, 0, 0, 45)
    content.BackgroundTransparency = 1
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.ScrollBarThickness = 3
    content.Visible = false
    content.Parent = catFrame
    
    local isOpen = false
    
    toggleBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        toggleBtn.Text = isOpen and "▼" or "▶"
        content.Visible = isOpen
        
        if isOpen then
            content.Size = UDim2.new(1, 0, 0, 150)
            catFrame.Size = UDim2.new(1, -10, 0, 200)
        else
            content.Size = UDim2.new(1, 0, 0, 0)
            catFrame.Size = UDim2.new(1, -10, 0, 45)
        end
    end)
    
    return catFrame, content
end

-- ============================================
-- MAIN CATEGORY
-- ============================================
local mainCat, mainContent = createCategory(categoryContainer, "MAIN", "🏠", 0)

local mainBtn = Instance.new("TextButton")
mainBtn.Size = UDim2.new(1, -10, 0, 30)
mainBtn.Position = UDim2.new(0, 5, 0, 5)
mainBtn.Text = "💀 Aimbot"
mainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
mainBtn.TextSize = 13
mainBtn.TextXAlignment = Enum.TextXAlignment.Left
mainBtn.Font = Enum.Font.Gotham
mainBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
mainBtn.BackgroundTransparency = 0.2
mainBtn.BorderSizePixel = 0
mainBtn.Parent = mainContent

mainBtn.MouseButton1Click:Connect(function()
    settings.aimbot = not settings.aimbot
    mainBtn.Text = (settings.aimbot and "✅ " or "❌ ") .. "Aimbot"
    print("[SanDiego] Aimbot: " .. tostring(settings.aimbot))
end)

local mainBtn2 = mainBtn:Clone()
mainBtn2.Position = UDim2.new(0, 5, 0, 40)
mainBtn2.Text = "🔇 Silent Aim"
mainBtn2.Parent = mainContent
mainBtn2.MouseButton1Click:Connect(function()
    settings.silentAim = not settings.silentAim
    mainBtn2.Text = (settings.silentAim and "✅ " or "❌ ") .. "Silent Aim"
    print("[SanDiego] Silent Aim: " .. tostring(settings.silentAim))
end)

mainContent.CanvasSize = UDim2.new(0, 0, 0, 80)

-- ============================================
-- ESP CATEGORY
-- ============================================
local espCat, espContent = createCategory(categoryContainer, "ESP", "👁️", 55)

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(1, -10, 0, 30)
espBtn.Position = UDim2.new(0, 5, 0, 5)
espBtn.Text = "❌ ESP"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextSize = 13
espBtn.TextXAlignment = Enum.TextXAlignment.Left
espBtn.Font = Enum.Font.Gotham
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
espBtn.BackgroundTransparency = 0.2
espBtn.BorderSizePixel = 0
espBtn.Parent = espContent

espBtn.MouseButton1Click:Connect(function()
    settings.esp = not settings.esp
    espBtn.Text = (settings.esp and "✅ " or "❌ ") .. "ESP"
    print("[SanDiego] ESP: " .. tostring(settings.esp))
end)

local espBtn2 = espBtn:Clone()
espBtn2.Position = UDim2.new(0, 5, 0, 40)
espBtn2.Text = "❤️ Health"
espBtn2.Parent = espContent
espBtn2.MouseButton1Click:Connect(function()
    settings.showHealth = not settings.showHealth
    espBtn2.Text = (settings.showHealth and "✅ " or "❌ ") .. "Health"
    print("[SanDiego] Health: " .. tostring(settings.showHealth))
end)

local espBtn3 = espBtn:Clone()
espBtn3.Position = UDim2.new(0, 5, 0, 75)
espBtn3.Text = "🏷️ Names"
espBtn3.Parent = espContent
espBtn3.MouseButton1Click:Connect(function()
    settings.showName = not settings.showName
    espBtn3.Text = (settings.showName and "✅ " or "❌ ") .. "Names"
    print("[SanDiego] Names: " .. tostring(settings.showName))
end)

espContent.CanvasSize = UDim2.new(0, 0, 0, 115)

-- ============================================
-- SETTINGS CATEGORY
-- ============================================
local setCat, setContent = createCategory(categoryContainer, "SETTINGS", "⚙️", 110)

local setBtn = Instance.new("TextButton")
setBtn.Size = UDim2.new(1, -10, 0, 30)
setBtn.Position = UDim2.new(0, 5, 0, 5)
setBtn.Text = "🎯 FOV: " .. tostring(settings.aimFov)
setBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
setBtn.TextSize = 13
setBtn.TextXAlignment = Enum.TextXAlignment.Left
setBtn.Font = Enum.Font.Gotham
setBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
setBtn.BackgroundTransparency = 0.2
setBtn.BorderSizePixel = 0
setBtn.Parent = setContent

setBtn.MouseButton1Click:Connect(function()
    settings.aimFov = (settings.aimFov + 10) % 360
    if settings.aimFov < 10 then settings.aimFov = 10 end
    setBtn.Text = "🎯 FOV: " .. tostring(settings.aimFov)
end)

local setBtn2 = setBtn:Clone()
setBtn2.Position = UDim2.new(0, 5, 0, 40)
setBtn2.Text = "📏 Distance: " .. tostring(settings.maxDistance)
setBtn2.Parent = setContent
setBtn2.MouseButton1Click:Connect(function()
    settings.maxDistance = settings.maxDistance + 100
    if settings.maxDistance > 5000 then settings.maxDistance = 100 end
    setBtn2.Text = "📏 Distance: " .. tostring(settings.maxDistance)
end)

setContent.CanvasSize = UDim2.new(0, 0, 0, 80)

-- ============================================
-- FARM CATEGORY
-- ============================================
local farmCat, farmContent = createCategory(categoryContainer, "FARM", "🌾", 165)

local farmBtn = Instance.new("TextButton")
farmBtn.Size = UDim2.new(1, -10, 0, 30)
farmBtn.Position = UDim2.new(0, 5, 0, 5)
farmBtn.Text = "🤖 Auto Farm"
farmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
farmBtn.TextSize = 13
farmBtn.TextXAlignment = Enum.TextXAlignment.Left
farmBtn.Font = Enum.Font.Gotham
farmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
farmBtn.BackgroundTransparency = 0.2
farmBtn.BorderSizePixel = 0
farmBtn.Parent = farmContent

farmBtn.MouseButton1Click:Connect(function()
    print("[SanDiego] Auto Farm toggled")
    farmBtn.Text = "✅ Auto Farm"
end)

local farmBtn2 = farmBtn:Clone()
farmBtn2.Position = UDim2.new(0, 5, 0, 40)
farmBtn2.Text = "💰 Auto Sell"
farmBtn2.Parent = farmContent
farmBtn2.MouseButton1Click:Connect(function()
    print("[SanDiego] Auto Sell toggled")
    farmBtn2.Text = "✅ Auto Sell"
end)

farmContent.CanvasSize = UDim2.new(0, 0, 0, 80)

-- ============================================
-- ESP ЛОГИКА (упрощённая)
-- ============================================
local espObjects = {}

local function clearESP()
    for _, v in ipairs(espObjects) do
        pcall(v.Destroy, v)
    end
    espObjects = {}
end

local function createESP()
    clearESP()
    if not settings.esp then return end
    
    local Players = game:GetService("Players")
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local root = plr.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    local box = Instance.new("Frame")
                    box.Size = UDim2.new(0, 40, 0, 70)
                    box.Position = UDim2.new(0, pos.X - 20, 0, pos.Y - 35)
                    box.BackgroundTransparency = 0.8
                    box.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                    box.BorderSizePixel = 2
                    box.BorderColor3 = Color3.fromRGB(0, 255, 0)
                    box.Parent = screenGui
                    table.insert(espObjects, box)
                    
                    if settings.showName then
                        local name = Instance.new("TextLabel")
                        name.Size = UDim2.new(1, 0, 0, 15)
                        name.Position = UDim2.new(0, 0, 1, 2)
                        name.Text = plr.Name
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        name.TextSize = 11
                        name.TextScaled = true
                        name.Font = Enum.Font.GothamBold
                        name.BackgroundTransparency = 1
                        name.Parent = box
                        table.insert(espObjects, name)
                    end
                end
            end
        end
    end
end

-- ============================================
-- АИМБОТ ЛОГИКА (упрощённая)
-- ============================================
local function aimbot()
    if not settings.aimbot then return end
    
    local closest = nil
    local minDist = math.huge
    
    local Players = game:GetService("Players")
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head then
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local centerX = Camera.ViewportSize.X / 2
                    local centerY = Camera.ViewportSize.Y / 2
                    local dist = math.sqrt((pos.X - centerX)^2 + (pos.Y - centerY)^2)
                    
                    if dist < minDist and dist < settings.aimFov then
                        minDist = dist
                        closest = head
                    end
                end
            end
        end
    end
    
    if closest then
        local targetPos = Camera:WorldToViewportPoint(closest.Position)
        local mouse = player:GetMouse()
        mousemoverel(targetPos.X - mouse.X, targetPos.Y - mouse.Y)
    end
end

-- ============================================
-- ОСНОВНОЙ ЦИКЛ
-- ============================================
RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    createESP()
    aimbot()
end)

-- ============================================
-- ГОРЯЧАЯ КЛАВИША
-- ============================================
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- ============================================
-- АНИМАЦИЯ ПОЯВЛЕНИЯ
-- ============================================
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -230)
for i = 0, 1, 0.05 do
    task.wait(0.02)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200 + (i * -25))
end

print("[SanDiego] Script loaded!")
print("[SanDiego] Right Shift to toggle menu")
