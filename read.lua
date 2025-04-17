-- Create GUI elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "DecryptionGUI"

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame
TextBox.Size = UDim2.new(1, -20, 0.7, 0)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14
TextBox.TextWrapped = true
TextBox.Text = "Decrypted script will appear here"
TextBox.ClearTextOnFocus = false

local CopyButton = Instance.new("TextButton")
CopyButton.Parent = Frame
CopyButton.Size = UDim2.new(0, 100, 0, 40)
CopyButton.Position = UDim2.new(0.5, -50, 0.8, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
CopyButton.Text = "Copy Script"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 16

-- Step 1: Hook loadstring to capture the decrypted script
local original_loadstring = loadstring
loadstring = function(source, ...)
    print("Decrypted Code:\n", source)  -- Log the decrypted code
    TextBox.Text = source  -- Display the decrypted code in the TextBox
    return original_loadstring(source, ...)  -- Execute the decrypted code
end

-- Step 2: Fetch and decrypt the script
local obfuscated_url = "https://raw.githubusercontent.com/Basicallyy/Basicallyy/main/Min_XT_V2_.lua"
local obfuscated_script = game:HttpGet(obfuscated_url)  -- Get the obfuscated script
loadstring(obfuscated_script)()  -- Run the obfuscated script to decrypt it

-- Step 3: Define the "Copy to Clipboard" button functionality
CopyButton.MouseButton1Click:Connect(function()
    setclipboard(TextBox.Text)  -- Copy the decrypted script to the clipboard
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Script Copied",
        Text = "The script has been copied to your clipboard!",
        Duration = 2
    })
end)

