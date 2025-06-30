-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLBXZhbHVlHGFjdGlvbi52YWx1ZSBtdXN0IG5vdCBiZSBuaWwGYXNzZXJ0CnNldFZpc2libGUNdG9nZ2xlVmlzaWJsZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAMFAgAAAAAPTQQBzAAAAABHBAIAAAAAgKkDAAGpAwEAgQEDBAEAAABvBAEApAIDAAAAIECfAgMBTQIBzAAAAACCAgIABAMBAwIDAwQAACBAAAYEARgAAAAAAAAAAAAAAAABAAAHAAAAAAMCAAAAAAJWAgAAggICAAAACgUBGAAACwAAAAAGAAABAgAYowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIApwYAAACfAQICTQIB1gcAAACpAwAA4gQKAMAFCwAwBQSJCAAAAMAFDAAwBQQdCQAAAJ8CAwCCAgAADQMGBAAAAEADBwMIAwkEAABAQAMKAwsDBAMFBQIICQYABgECAAEBAAEYAAEAAAAAAAEAAAAAAgAAAAEAAAQAAPsAAQAAAAAC+gSZWaF3kjjIwPPN0JTXDRtzYQ6EOLcAfwnGPqEuqY1MDPp2M+z2fA==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(false, {
	["setVisible"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "action.value must not be nil")
		return p2.value
	end,
	["toggleVisible"] = function(p4, _)
		return not p4
	end
})
