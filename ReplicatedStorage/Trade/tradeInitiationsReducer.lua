-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQBGxpc3QMbWlzc2luZyBsaXN0BmFzc2VydBN0cmFkZUluaXRpYXRpb25zU2V0BWluZGV4DW1pc3NpbmcgaW5kZXgFdGFibGUFY2xvbmUGcmVtb3ZlHXRyYWRlSW5pdGlhdGlvbnNSZW1vdmVCeUluZGV4BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVJvZHV4DWNyZWF0ZVJlZHVjZXIAAwUCAAAAAA9NBAELAAAAAEcEAgAAAACAqQMAAakDAQCBAQMEAQAAAG8EAQCkAgMAAAAgQJ8CAwFNAgELAAAAAIICAgAEAwEDAgMDBAAAIEAABgQBGAAAAAAAAAAAAAAAAAEAAAcAAAAABgIAAAAAF00EAQIAAAAARwQCAAAAAICpAwABqQMBAIEBAwQBAAAAbwQBAKQCAwAAACBAnwIDAaQCBgAAFECAUgMAAJ8CAgKkAwgAABxAgFIEAgBNBQECAAAAAJ8DAwGCAgIACQMFAwYDAwQAACBAAwcDCAQAFECAAwkEABxAgAAKCgEYAAAAAAAAAAAAAAAAAQAAAAEAAAAAAAELAAAAAAYAAAECABmjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAP8DAAAAAAAA4gQKAMAFCwAwBQRTCAAAAMAFDAAwBQR+CQAAAJ8CAwCCAgAADQMLBAAAAEADDAMNAw4EAABAQAMPAxADBAMKBQIICQYABgECAAEBAAEYAAEAAAAAAAEAAAAAAgAAAAABAAAEAAD7AAEAAAAAAuUTKzhJmIkq19dBrDBeTBo/RMo/ccNpsRL8CkL39OSqCGJjLO7cWUs=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["tradeInitiationsSet"] = function(_, p2)
		local v3 = p2.list ~= nil
		assert(v3, "missing list")
		return p2.list
	end,
	["tradeInitiationsRemoveByIndex"] = function(p4, p5)
		local v6 = p5.index ~= nil
		assert(v6, "missing index")
		local v7 = table.clone(p4)
		table.remove(v7, p5.index)
		return v7
	end
})
