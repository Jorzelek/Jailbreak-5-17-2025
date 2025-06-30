-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKEHRyYWRlY2F0ZWdvcnkuJXMGZm9ybWF0C0Zvcm1hdEJ5S2V5EGdldENhdGVnb3J5VGl0bGUEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUMTG9jYWxpemF0aW9uBk1vZHVsZQACBgEBAAAHAAABAwMDAgr7AQAAbwMAAFIFAAC8AwONAQAAAJ8DAwC8AQGbAgAAAJ8BAACCAQAAAwMBAwIDAwAGBAEYAAAAAAAAAAAAAAcAAAAABAAAAQIAFaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAEAHAAAATQIDfAYAAACfAQIC/wIBAAAAAADAAwgAEgABADADAp4JAAAAggICAAoDBQQAAABAAwYDBwMIBAAAQEADCQMKBgADBAEAAQABGAABAAAAAAABAAAAAAAAAgABAAAAAwEAAAAAAbN4r/QJhJSegbzFYJ/0qZUjPEVL4VyrM987qoCBscPExl+dJ3mqdmw=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Module.Localization)
return {
	["getCategoryTitle"] = function(p3)
		-- upvalues: (copy) v_u_2
		return v_u_2:FormatByKey(("tradecategory.%s"):format(p3))
	end
}
