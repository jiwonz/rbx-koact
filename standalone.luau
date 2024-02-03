local fs = require("@lune/fs")
local roblox = require("@lune/roblox")
local serde = require("@lune/serde")

local wally = serde.decode("toml", fs.readFile("wally.toml"))
local names = wally.package.name:split("/")

local mainModule = roblox.Instance.new("ModuleScript")
mainModule.Name = names[#names]

local function bundle(src,path,folder)
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
						src.Source = source
					end
				else
					local module = roblox.Instance.new("ModuleScript")
					module.Name = names[1]
					module.Source = source
					if folder then
						module.Parent = folder
					else
						module.Parent = src
					end
				end
			end
		elseif fs.isDir(file) then
			local newFolder
			local projectPath = file.."/".."default.project.json"
			if fs.isFile(projectPath) then
				local project = serde.decode("json", fs.readFile(projectPath))
				local srcName = project.tree["$path"]
				file = file.."/"..srcName
				newFolder = roblox.Instance.new(fs.isFile(file.."/".."init.lua") and "ModuleScript" or "Folder")
			else
				newFolder = roblox.Instance.new(fs.isFile(file.."/".."init.lua") and "ModuleScript" or "Folder")
			end
			newFolder.Name = entryName
			if folder then
				newFolder.Parent = folder
			else
				newFolder.Parent = src
			end
			bundle(src,file,newFolder)
		end
	end
end

local project = serde.decode("json", fs.readFile("default.project.json"))
local srcName = project.tree["$path"]
local srcModule = roblox.Instance.new("ModuleScript")
srcModule.Name = "_"..srcName
srcModule.Parent = mainModule
bundle(srcModule,srcName)
local packages = roblox.Instance.new("Folder")
bundle(packages,"Packages")
for _,v in packages:GetChildren() do
	v.Parent = mainModule
end

mainModule.Source = `return require(script.{srcModule.Name})`

local file = roblox.serializeModel({mainModule})
fs.writeFile("standalone.rbxm", file)
