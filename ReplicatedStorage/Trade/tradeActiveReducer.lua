-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBXZhbHVlDW1pc3NpbmcgdmFsdWUGYXNzZXJ0DnNldFRyYWRlQWN0aXZlBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVJvZHV4DWNyZWF0ZVJlZHVjZXIAAgUCAAAAAA9NBAHMAAAAAEcEAgAAAACAqQMAAakDAQCBAQMEAQAAAG8EAQCkAgMAAAAgQJ8CAwFNAgHMAAAAAIICAgAEAwEDAgMDBAAAIEAABgQBGAAAAAAAAAAAAAAAAAEAAAcAAAAABgAAAQIAFaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAAqQMAAOIECQDABQoAMAUEkAgAAACfAgMAggIAAAsDBQQAAABAAwYDBwMIBAAAQEADCQMKAwQFAQgGAAEAAQABGAABAAAAAAABAAAAAAIAAAABAAD/AAEAAAAAAYQCrt2XQbxCtsbESbOf9bG0BqdXG0Tp72Pc8cAELKMpmkGFuFOCzBw=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(false, {
	["setTradeActive"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "missing value")
		return p2.value
	end
})
