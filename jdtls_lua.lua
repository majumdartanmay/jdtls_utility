-- Lua script to clone a GitHub repository

-- Specify the repository URL

-- Check if --dev is passed as a command-line argument
-- local isDevMode = false
--
-- for _, argValue in ipairs(arg) do
--     if argValue == "--dev" then
--         isDevMode = true
--         break
--     end
-- end
--
-- print("Dev mode " .. tostring(isDevMode));

local repoURL = "https://github.com/eclipse-jdtls/eclipse.jdt.ls"

-- Specify the destination folder
local destinationFolder = "eclipse.jdt.ls"

-- Construct the Git clone command
local gitCloneCommand = "git clone " .. repoURL .. " " .. destinationFolder

-- Execute the Git clone command
local success, errorMsg, errorCode = os.execute(gitCloneCommand)

-- Check the result of the execution
if success then
    print("Repository cloned successfully.")
else
    print("Error cloning repository:")
    print("Error message:", errorMsg)
    print("Error code:", errorCode)
end

-- Building jdtls from source
local mvnBuildCommand = "cd " .. destinationFolder .. " && mvnw clean verify";
print(mvnBuildCommand)
os.execute(mvnBuildCommand)


