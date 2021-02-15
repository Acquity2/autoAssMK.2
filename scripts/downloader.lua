local component = require("component")


if not component.isAvailable("internet") then
	io.stderr:write("This application requires an internet card")
	return
end

local inter2 = component.internet
if not inter2.isHttpEnabled() then
	io.stderr:write("Internet connections are currently disabled in game config")
	return
end

local internet = require("internet")


local FileList = {
	{FileName = "chipDatabase.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/chipDatabase.lua	"},
	{FileName = "compare.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/compare.lua"},
	{FileName = "getInputItemList.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/getInputItemList.lua"},
	{FileName = "readFlash.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/readFlash.lua"},
	{FileName = "getTableDiff.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/getTableDiff.lua"},
	{FileName = "tool_setup.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/tool_setup.lua"},
	{FileName = "fluid.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/fluid.lua"},
	{FileName = "transferItem.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/transferItem.lua"},
	{FileName = "main.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/main.lua"},
	{FileName = "tool_trigger.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/tool_trigger.lua"},
	{FileName = "fluidDatabase.lua", Url = "https://gitee.com/acquity2/autoAssMK.2/raw/main/scripts/fluidDatabase.lua"},
	--{FileName = "", Url = ""}
}




function download(FileName,Location,Url)

	local arpmUrl = Url
	local additionalHeaders = {
		--["User-Agent"] = "ARPM/dropper" -- Gitlab returns HTTP 403 when default user agent is used (e.g. Java/1.8.0_131)
	}
	local saveFile = Location..FileName
	print("Downloading to " .. saveFile)
	local content = ""
	local response = internet.request(arpmUrl, nil, additionalHeaders)
	for chunk in response do
		content = content .. chunk
	end

	local handle = io.open(saveFile, "w")
	handle:write(content)
	handle:close()
	print(FileName.."Download complete")

end

for k,v in pairs(FileList) do
	local _Location = "/home/autoAssMK2/"
	local _FileNmae = v.FileName
	local _Url = v.Url
	download(_FileNmae,_Location,_Url)
end