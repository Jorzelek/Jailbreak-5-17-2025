-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLA2tleQV2YWx1ZQV0YWJsZQVjbG9uZQ9zZXRTYXZlZFNldHRpbmcEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgACBQIAAAAAEk0DAUoAAAAAhwIAA00DAcwBAAAAmgICAAMAAACCAAIApAIEAAAMIIBSAwAAnwICAk0DAUoAAAAATQQBzAEAAABqBAIDggICAAUDAQMCAwMDBAQADCCAAAcFARgAAAAAAAAAAQIAAAABAAAAAAEJAAAAAAYAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAP8DAAAAAAAA4gQJAMAFCgAwBQRlCAAAAJ8CAwCCAgAACwMGBAAAAEADBwMIAwkEAABAQAMKAwsDBQUBCAYAAQABAAEYAAEAAAAAAAIAAAAAAgAAAAABAAD/AAEAAAAAAc4oZOePQpsF/OwOc16uiKW+g0zX4VCFGlm2RGLNYzOsAE46iyGRpcY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["setSavedSetting"] = function(p2, p3)
		if p2[p3.key] == p3.value then
			return p2
		end
		local v4 = table.clone(p2)
		v4[p3.key] = p3.value
		return v4
	end
})
