
unpack(arg)

local ROOT_DIR = "../"
local SRC_DIR = ROOT_DIR.."base/src"

local COMMITS = {
	[1] = "deps",
	[2] = "base",
	[3] = "robo",
	[4] = "qshooter",
}

local verDef = "MY_ENGINE_VERSION_STRING"
local tagDef = "MY_ENGINE_TAG_STRING"

local arg1 = arg[1]

os.execute("echo Action="..tostring(arg1))

local function readTags(subStr)
	local tag = {}
	local file = io.open (SRC_DIR.."/MyVersion.h", "r")
	if file~=nil then    
		for line in file:lines() do
			local idx = string.find(line, subStr)
			if idx ~= nil then
				local revStr = string.sub(line, idx + string.len(subStr), string.len(line))
				for w in string.gfind(line, "%d+") do
					tag[table.getn(tag)+1] = tonumber(w)
				end
			end
		end
		file:close()
	end
	return tag
end

local function getNextTag(tag)
	local tagNext = {}
	if table.getn(tag) >=3 then
		for k, v in pairs(tag) do
			tagNext[k] = v
		end
		tagNext[3] = tagNext[3] + 1
		if tagNext[3] > 999999 then
			tagNext[3] = 0
			tagNext[2] = tagNext[2] + 1
		end
		if tagNext[2] > 99 then
			tagNext[2] = 0
			tagNext[1] = tagNext[1] + 1
		end
	end
	return tagNext
end

local function getTagStr(tag)
        local tagStr = ""
	if table.getn(tag) >=3 then
		tagStr = tostring(tag[1]).."."..tostring(tag[2]).."."..tostring(tag[3])
	end
	return tagStr
end

os.execute("git -C "..ROOT_DIR.."base checkout ./src/MyVersion.h")

os.execute("echo Reading current tag...")

local ver = readTags(verDef)
local tag = readTags(tagDef)

if table.getn(tag) < 3 and table.getn(ver) >= 3 then
	tag = {}
	for k, v in pairs(ver) do
		tag[k] = v
	end
end

local verNext = getNextTag(ver)
local tagNext = getNextTag(tag)

if table.getn(ver) >=3 then
	os.execute("echo Current ver: '"..getTagStr(ver).."'")
		os.execute("echo Next    ver: '"..getTagStr(verNext).."'")
end

if table.getn(tag) >=3 then
	os.execute("echo Current tag: '"..getTagStr(tag).."'")
		os.execute("echo Next    tag: '"..getTagStr(tagNext).."'")
end

local function writeMyVer(verStr, tagStr)
	local fileOut = io.open (SRC_DIR.."/MyVersion.h", "w")
	if fileOut ~= nil then
		fileOut:write(string.format("#define "..verDef.." \""..verStr.."\"\n"))
		fileOut:write(string.format("#define "..tagDef.." \""..tagStr.."\"\n"))
		fileOut:close()
	end
end

if arg[1] == "tagNext" then

	local tagStr = arg[2]
	local verStr = getTagStr(verNext)

	if tagStr == nil then
		tagStr = verStr
	end

	if tagStr ~= nil then
		local msgStr = "Tagging to "..tagStr

		os.execute("echo Tagging...")
		os.execute("echo Tag="..tagStr)

		writeMyVer(verStr, tagStr)

		for key, value in pairs(COMMITS) do
			os.execute("echo Work on "..value..":")
			os.execute("git -C "..ROOT_DIR..value.." add *")
			os.execute("git -C "..ROOT_DIR..value.." commit -m \""..msgStr.."\"")
        		os.execute("git -C "..ROOT_DIR..value.." tag -a "..tagStr.." -m \""..msgStr.."\"")
		end
	else
		os.execute("echo Error: Need to specify tag")
	end

elseif arg[1] == "verNext" then

	local msgStr = arg[2]

	if msgStr ~= nil then

		local tagStr = getTagStr(tag)
		local verStr = getTagStr(verNext)

		os.execute("echo Commiting...")
		os.execute("echo Message="..msgStr)

		writeMyVer(verStr, tagStr)

		for key, value in pairs(COMMITS) do
			os.execute("echo Work on "..value..":")
			os.execute("git -C "..ROOT_DIR..value.." add *")
			os.execute("git -C "..ROOT_DIR..value.." commit -m \""..msgStr.."\"")
		end
	else
		os.execute("echo Error: Need to specify commit message")
	end

elseif arg[1] == "commitAll" then

	local msgStr = arg[2]

	if msgStr ~= nil then

		os.execute("echo Commiting...")
		os.execute("echo Message="..msgStr)

		for key, value in pairs(COMMITS) do
			os.execute("echo Work on "..value..":")
			os.execute("git -C "..ROOT_DIR..value.." add *")
			os.execute("git -C "..ROOT_DIR..value.." commit -m \""..msgStr.."\"")
		end
	else
		os.execute("echo Error: Need to specify commit message")
	end

elseif arg[1] == "addAll" then

	for key, value in pairs(COMMITS) do
		os.execute("echo -------------"..value..":----------------")
		os.execute("git -C "..ROOT_DIR..value.." add *")
	end

elseif arg[1] == "statusAll" then

	for key, value in pairs(COMMITS) do
		os.execute("echo -------------"..value..":----------------")
		os.execute("git -C "..ROOT_DIR..value.." status")
	end
elseif arg[1] == "diffAll" then

	for key, value in pairs(COMMITS) do
		local diffName = ROOT_DIR..value..".diff"
		os.execute("git -C "..ROOT_DIR..value.." diff > "..diffName)
	end
elseif arg[1] == "showtagAll" then

	for key, value in pairs(COMMITS) do
		os.execute("echo -------------"..value..":----------------")
		os.execute("git -C "..ROOT_DIR..value.." tag --column=auto --sort=version:refname")
	end
elseif arg[1] == "pullAll" then

	for key, value in pairs(COMMITS) do
		os.execute("echo -------------"..value..":----------------")
		os.execute("git -C "..ROOT_DIR..value.." pull")
	end
elseif arg[1] == "pushAll" then

	for key, value in pairs(COMMITS) do
		os.execute("echo -------------"..value..":----------------")
		os.execute("git config --global push.followTags true")
		os.execute("git -C "..ROOT_DIR..value.." push")
	end
else
	os.execute("echo Error: Unknown action!")
end
