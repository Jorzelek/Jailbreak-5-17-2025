-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLCHBhZ2VOYW1lEW1pc3NpbmcgcGFnZSBOYW1lBmFzc2VydAdzZXRQYWdlBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVJvZHV4DWNyZWF0ZVJlZHVjZXIJQ3VzdG9taXplAAIFAgAAAAAPTQQB6QAAAABHBAIAAAAAgKkDAAGpAwEAgQEDBAEAAABvBAEApAIDAAAAIECfAgMBTQIB6QAAAACCAgIABAMBAwIDAwQAACBAAAYEARgAAAAAAAAAAAAAAAABAAEHAAAAAAYAAAECABWjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAG8DCADiBAoAwAULADAFBDgJAAAAnwIDAIICAAAMAwUEAAAAQAMGAwcDCAQAAEBAAwkDCgMLAwQFAQkGAAEAAQABGAABAAAAAAABAAAAAAIAAAABAAD/AAEAAAAAAYHnjyLBoQqVsyPltgcsINvVGeqkPIQpAIXV3rdIghnsNFbESmOBFlA=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer("Customize", {
	["setPage"] = function(_, p2)
		local v3 = p2.pageName ~= nil
		assert(v3, "missing page Name")
		return p2.pageName
	end
})
