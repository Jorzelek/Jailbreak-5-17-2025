-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBXZhbHVlJ21lbWJlcnMgY2Fubm90IGJlIG5pbDsgdHJ5IGJsYW5rIHRhYmxlPwZhc3NlcnQKc2V0TWVtYmVycwRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAIFAgAAAAAPTQQBzAAAAABHBAIAAAAAgKkDAAGpAwEAgQEDBAEAAABvBAEApAIDAAAAIECfAgMBTQIBzAAAAACCAgIABAMBAwIDAwQAACBAAAYEARgAAAAAAAAAAAAAAAABAAAHAAAAAAYAAAECABajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAP8DAAAAAAAA4gQJAMAFCgAwBQRdCAAAAJ8CAwCCAgAACwMFBAAAAEADBgMHAwgEAABAQAMJAwoDBAUBCAYAAQABAAEYAAEAAAAAAAEAAAAAAgAAAAABAAD/AAEAAAAAAVJZym8Bhug1YJ2g+5BpZoMdi5tehBhw03/CwgbNJxDTQGQxXs1wNPY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["setMembers"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "members cannot be nil; try blank table?")
		return p2.value
	end
})
