local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.Name = "ZenXHubMM2"
ScreenGui.ResetOnSpawn = false
local MainFrame = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Adding corner rounding
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Adding drop shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = MainFrame
Shadow.ZIndex = -1

-- Creating title bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleUICorner = Instance.new("UICorner")
TitleUICorner.CornerRadius = UDim.new(0, 10)
TitleUICorner.Parent = TitleBar

-- Title text
local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.8, 0, 1, 0)
TitleText.Position = UDim2.new(0.1, 0, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "ZenXhub MM2"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 20
TitleText.Font = Enum.Font.GothamBold
TitleText.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = TitleBar

local CloseUICorner = Instance.new("UICorner")
CloseUICorner.CornerRadius = UDim.new(0, 5)
CloseUICorner.Parent = CloseButton

local LanguageText = Instance.new("TextLabel")
LanguageText.Size = UDim2.new(0.9, 0, 0, 30)
LanguageText.Position = UDim2.new(0.05, 0, 0.25, 0)
LanguageText.BackgroundTransparency = 1
LanguageText.Text = "Выберите язык / Select language"
LanguageText.TextColor3 = Color3.fromRGB(255, 255, 255)
LanguageText.TextSize = 16
LanguageText.Font = Enum.Font.Gotham
LanguageText.Parent = MainFrame

local EnglishButton = Instance.new("TextButton")
EnglishButton.Size = UDim2.new(0.4, 0, 0, 50)
EnglishButton.Position = UDim2.new(0.05, 0, 0.45, 0) -- Lowered from 0.35 to 0.45
EnglishButton.BackgroundColor3 = Color3.fromRGB(50, 50, 150)
EnglishButton.Text = "🇺🇸 English"
EnglishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishButton.TextSize = 18
EnglishButton.Font = Enum.Font.Gotham
EnglishButton.Parent = MainFrame

local EnglishButtonUICorner = Instance.new("UICorner")
EnglishButtonUICorner.CornerRadius = UDim.new(0, 8)
EnglishButtonUICorner.Parent = EnglishButton

local RussianButton = Instance.new("TextButton")
RussianButton.Size = UDim2.new(0.4, 0, 0, 50)
RussianButton.Position = UDim2.new(0.55, 0, 0.45, 0) -- Lowered from 0.35 to 0.45
RussianButton.BackgroundColor3 = Color3.fromRGB(0, 102, 204) -- Changed color to a blue shade
RussianButton.Text = "🇷🇺 Русский"
RussianButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RussianButton.TextSize = 18
RussianButton.Font = Enum.Font.Gotham
RussianButton.Parent = MainFrame

local RussianButtonUICorner = Instance.new("UICorner")
RussianButtonUICorner.CornerRadius = UDim.new(0, 8)
RussianButtonUICorner.Parent = RussianButton

local Dragging, DragInput, DragStart, StartPos

local function Update(Input)
    local Delta = Input.Position - DragStart
    MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
end

TitleBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = Input.Position
        StartPos = MainFrame.Position

        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
        DragInput = Input
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and Input == DragInput then
        Update(Input)
    end
end)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
EnglishButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/bla3de/ncjv/refs/heads/main/kgjcnv'))()
    ScreenGui:Destroy()
end)

RussianButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/bla3de/ccc/refs/heads/main/jfjvhc'))()
    ScreenGui:Destroy()
end)
local function AddHoverEffect(Button)
    local OriginalColor = Button.BackgroundColor3
    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = OriginalColor:Lerp(Color3.fromRGB(255, 255, 255), 0.1)
    end)
    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = OriginalColor
    end)
end
AddHoverEffect(EnglishButton)
AddHoverEffect(RussianButton)
AddHoverEffect(CloseButton)
