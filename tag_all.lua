
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

os.execute("echo "..arg[1])

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
		for k, v in tag do
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
	for k, v in ver do
		tag[k] = v
	end
end

if arg[1] == "tagNext" then

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

	if table.getn(tagNext) >= 3 and table.getn(verNext) >= 3 then

		local fileOut = io.open (SRC_DIR.."/MyVersion.h", "w")
		if fileOut ~= nil then
			fileOut:write(string.format("#define "..verDef.." \""..getTagStr(verNext).."\"\n"))
			fileOut:write(string.format("#define "..tagDef.." \""..getTagStr(tagNext).."\"\n"))
			fileOut:close()
		end
	end
elseif arg[1] == "pushAll" then

	os.execute("echo Commiting...")

	for key, value in COMMITS do
		os.execute("echo Work on "..value..":")
		os.execute("git -C "..ROOT_DIR..value.." status")
	end
end
