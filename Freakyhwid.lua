local Players = game:GetService("Players")
local Analytics = game:GetService("RbxAnalyticsService")

repeat task.wait() until Players.LocalPlayer

local function GetHWID()
    local id = nil

    pcall(function()
        if gethwid then
            id = gethwid()
        elseif syn and syn.gethwid then
            id = syn.gethwid()
        elseif fluxus and fluxus.hwid then
            id = fluxus.hwid()
        elseif KRNL_LOADED and Krnl and Krnl.HWID then
            id = Krnl.HWID()
        end
    end)

    if not id or id == "" or id == "Unknown" then
        id = Analytics:GetClientId()
    end

    return tostring(id)
end

local HWID = GetHWID()
print("HWID =", HWID)


local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local TextLabel = Instance.new("TextLabel", Frame)
local Button = Instance.new("TextButton", Frame)

Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Active = true
Frame.Draggable = true

TextLabel.Size = UDim2.new(1, -20, 0, 60)
TextLabel.Position = UDim2.new(0, 10, 0, 10)
TextLabel.Text = "HWID:\n" .. HWID
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16
TextLabel.TextWrapped = true

Button.Size = UDim2.new(0, 120, 0, 35)
Button.Position = UDim2.new(0.5, -60, 1, -45)
Button.Text = "Copy HWID"
Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 16

Button.MouseButton1Click:Connect(function()
    setclipboard(HWID)
    Button.Text = "Copied!"
    task.wait(1)
    Button.Text = "Copy HWID"
end)
