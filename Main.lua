-- [[ YEW AUTO PREMIUM - STABLE ENGLISH VERSION ]]

local KEY_SECRET = "YEW-PRO-8829" -- Direct matching to avoid decoding errors
local DISCORD_LINK = "https://discord.gg/kfeMqHhaR"
local EXPIRE_STAMP = 1774227600 -- 1 Hour Limit

-- 1. Anti-Cheat Time Check
local function GetTime()
    local s, r = pcall(function() return game:HttpGet("http://worldtimeapi.org/api/timezone/Etc/UTC") end)
    if s and r then return game:GetService("HttpService"):JSONDecode(r).unixtime end
    return os.time()
end

-- 2. Forced Kick Function
local function ForceKick(msg)
    game.Players.LocalPlayer:Kick("\n[YEW AUTO AUTH]\n" .. msg .. "\nJoin Discord: " .. DISCORD_LINK)
end

-- 3. Initial Security Checks
if GetTime() > EXPIRE_STAMP then
    ForceKick("Expired! This key was only for 1 hour.")
    return
end

-- 4. Mandatory Discord Join (First Run Only)
if not isfile("yew_v2.txt") then
    if setclipboard then setclipboard(DISCORD_LINK) end
    writefile("yew_v2.txt", "verified")
    ForceKick("First-time setup! Discord link copied.\nJoin Discord to get the Key, then come back.")
    return
end

-- 5. Create English Auth UI
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 280, 0, 190)
Main.Position = UDim2.new(0.5, -140, 0.5, -95)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Text = "YEW AUTO - AUTHENTICATION"
Title.Size = UDim2.new(1, 0, 0, 45)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

local Input = Instance.new("TextBox", Main)
Input.PlaceholderText = "Enter Key Here..."
Input.Position = UDim2.new(0.1, 0, 0.35, 0)
Input.Size = UDim2.new(0.8, 0, 0, 35)
Input.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.Text = ""

local Btn = Instance.new("TextButton", Main)
Btn.Text = "VERIFY KEY"
Btn.Position = UDim2.new(0.1, 0, 0.65, 0)
Btn.Size = UDim2.new(0.8, 0, 0, 35)
Btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- 6. Verification & Load
Btn.MouseButton1Click:Connect(function()
    -- Clean the input (remove spaces/newlines)
    local clean_input = Input.Text:gsub("%s+", "") 
    
    if clean_input == KEY_SECRET then
        Btn.Text = "LOADING SCRIPT..."
        Btn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        
        -- Background time monitor
        task.spawn(function()
            while task.wait(30) do
                if GetTime() > EXPIRE_STAMP then
                    ForceKick("1-hour trial finished!")
                    break
                end
            end
        end)
        
        task.wait(1)
        ScreenGui:Destroy()
        
        -- The Loader
        loadstring(game:HttpGet("https://wings.ac/loader"))()
    else
        Btn.Text = "WRONG KEY! CHECK DISCORD"
        Btn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        Btn.Text = "VERIFY KEY"
        Btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    end
end)
