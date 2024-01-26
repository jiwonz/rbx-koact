local fs = require("@lune/fs")
local roblox = require("@lune/roblox")

local initModule = roblox.Instance.new("ModuleScript")
initModule.Name = "koact"

local function bundle(path,folder)
	local thereisSourceCode = false
	for _, entryName in fs.readDir(path) do
		local file = path.."/"..entryName
		if fs.isFile(file) then
			local names = entryName:split(".")
			if names[2] == "lua" then
				local source = fs.readFile(file)
				if names[1] == "init" then
					if folder then
						folder.Source = source
					else
						initModule.Source = source
					end
				else
					thereisSourceCode = true
					local module = roblox.Instance.new("ModuleScript")
					module.Name = names[1]
					module.Source = source
					if folder then
						module.Parent = folder
					else
						module.Parent = initModule
					end
				end
			end
		elseif fs.isDir(file) then
			local folder = roblox.Instance.new(fs.isFile(file.."/".."init.lua") and "ModuleScript" or "Folder")
			folder.Name = entryName
			bundle(file,folder)
		end
	end
	if folder then
		if thereisSourceCode then
			folder.Parent = initModule
		else
			folder:Destroy()
			folder = nil
		end
	end
end

bundle("src")

local modelFile = roblox.serializeModel({initModule})
if not fs.isDir("build") then
	fs.writeDir("build")
end
fs.writeFile("build/koact.rbxm", modelFile)
