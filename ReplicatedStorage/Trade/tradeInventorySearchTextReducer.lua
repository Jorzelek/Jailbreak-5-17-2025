-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLBXZhbHVlDW1pc3NpbmcgdmFsdWUGYXNzZXJ0G3NldFRyYWRlSW52ZW50b3J5U2VhcmNoVGV4dARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAACBQIAAAAAD00EAcwAAAAARwQCAAAAAICpAwABqQMBAIEBAwQBAAAAbwQBAKQCAwAAACBAnwIDAU0CAcwAAAAAggICAAQDAQMCAwMEAAAgQAAGBAEYAAAAAAAAAAAAAAAAAQAABwAAAAAGAAABAgAVowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIApwYAAACfAQICTQIB1gcAAABvAwgA4gQKAMAFCwAwBQRBCQAAAJ8CAwCCAgAADAMFBAAAAEADBgMHAwgEAABAQAMJAwoDCwMEBQEJBgABAAEAARgAAQAAAAAAAQAAAAACAAAAAQAA/wABAAAAAAGrU4sbDWwwD5mX4Y/iYu/e8HQACh5pVBBuI1KXGN6yvxR/6FwbddzM

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer("", {
	["setTradeInventorySearchText"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "missing value")
		return p2.value
	end
})
