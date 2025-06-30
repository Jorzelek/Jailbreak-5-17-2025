-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBXZhbHVlJmlzUmVhZGllZFVwIGNhbm5vdCBiZSBuaWw7IHRyeSBib29sZWFuBmFzc2VydA5zZXRJc1JlYWRpZWRVcARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAIFAgAAAAAPTQQBzAAAAABHBAIAAAAAgKkDAAGpAwEAgQEDBAEAAABvBAEApAIDAAAAIECfAgMBTQIBzAAAAACCAgIABAMBAwIDAwQAACBAAAYEARgAAAAAAAAAAAAAAAABAAAHAAAAAAYAAAECABWjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAKkDAADiBAkAwAUKADAFBNwIAAAAnwIDAIICAAALAwUEAAAAQAMGAwcDCAQAAEBAAwkDCgMEBQEIBgABAAEAARgAAQAAAAAAAQAAAAACAAAAAQAA/wABAAAAAAFUCSp+80fNNWbNQOrfgyjsRG30si39UUojxcwAGD5i9kh5O0wA2a17

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(false, {
	["setIsReadiedUp"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "isReadiedUp cannot be nil; try boolean")
		return p2.value
	end
})
