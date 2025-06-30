-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBXZhbHVlDW1pc3NpbmcgdmFsdWUGYXNzZXJ0FXNldFJvYmJlcmllc0NvbXBsZXRlZARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAIFAgAAAAAPTQQBzAAAAABHBAIAAAAAgKkDAAGpAwEAgQEDBAEAAABvBAEApAIDAAAAIECfAgMBTQIBzAAAAACCAgIABAMBAwIDAwQAACBAAAYEARgAAAAAAAAAAAAAAAABAAAHAAAAAAYAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAP8DAAAAAAAA4gQJAMAFCgAwBQRqCAAAAJ8CAwCCAgAACwMFBAAAAEADBgMHAwgEAABAQAMJAwoDBAUBCAYAAQABAAEYAAEAAAAAAAEAAAAAAgAAAAABAAD/AAEAAAAAAbCWd7nDExh5glIdLRac0NrLh595TY5zBfOT2zbiJ3neVESqRp3yyIY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["setRobberiesCompleted"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "missing value")
		return p2.value
	end
})
