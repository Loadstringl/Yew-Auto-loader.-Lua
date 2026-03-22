-- [[ YEW AUTO PREMIUM - DUAL LOADER VERSION ]]
local KEY_SECRET = "YEW-PRO-8829" 
local ARGON_KEY = "ZKlFacQufYoGDofUOVKufFOLDtJwgCtW"
local DISCORD_LINK = "https://discord.gg/kfeMqHhaR"

-- [基础功能保持不变]
local function GetTime()
    local s, r = pcall(function() return game:HttpGet("http://worldtimeapi.org/api/timezone/Etc/UTC") end)
    if s and r then return game:GetService("HttpService"):JSONDecode(r).unixtime end
    return os.time()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 300, 0, 220)
Main.Position = UDim2.new(0.5, -150, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Main)
Title.Text = "YEW AUTO - SELECT SCRIPT"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

-- 验证输入框
local Input = Instance.new("TextBox", Main)
Input.PlaceholderText = "Enter YEW Key..."
Input.Position = UDim2.new(0.1, 0, 0.25, 0)
Input.Size = UDim2.new(0.8, 0, 0, 35)
Input.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.Text = ""

-- 按钮1：加载 Wings
local BtnWings = Instance.new("TextButton", Main)
BtnWings.Text = "LOAD WINGS HUB"
BtnWings.Position = UDim2.new(0.1, 0, 0.5, 0)
BtnWings.Size = UDim2.new(0.8, 0, 0, 35)
BtnWings.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
BtnWings.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnWings.Visible = false -- 验证前隐藏

-- 按钮2：加载 Argon
local BtnArgon = Instance.new("TextButton", Main)
BtnArgon.Text = "LOAD ARGON HUB"
BtnArgon.Position = UDim2.new(0.1, 0, 0.75, 0)
BtnArgon.Size = UDim2.new(0.8, 0, 0, 35)
BtnArgon.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
BtnArgon.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnArgon.Visible = false -- 验证前隐藏

-- 验证主按钮
local VerifyBtn = Instance.new("TextButton", Main)
VerifyBtn.Text = "VERIFY YEW KEY"
VerifyBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 45)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 逻辑处理
VerifyBtn.MouseButton1Click:Connect(function()
    if Input.Text:gsub("%s+", "") == KEY_SECRET then
        VerifyBtn.Visible = false
        Input.Visible = false
        Title.Text = "CHOOSE YOUR SCRIPT"
        BtnWings.Visible = true
        BtnArgon.Visible = true
    else
        VerifyBtn.Text = "WRONG KEY!"
        task.wait(1)
        VerifyBtn.Text = "VERIFY YEW KEY"
    end
end)

BtnWings.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://wings.ac/loader"))()
end)

BtnArgon.MouseButton1Click:Connect(function()
    _G.Key = ARGON_KEY
    _G.ArgonKey = ARGON_KEY
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AgentX771/ArgonHubX/main/Loader.lua"))()
end)
