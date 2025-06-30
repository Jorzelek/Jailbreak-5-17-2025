-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKCmluUGh5c2ljYWwYbWlzc2luZyBpblBoeXNpY2FsIHZhbHVlBmFzc2VydA1zZXRJblBoeXNpY2FsBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVJvZHV4DWNyZWF0ZVJlZHVjZXIAAgUCAAAAAA9NBAFEAAAAAEcEAgAAAACAqQMAAakDAQCBAQMEAQAAAG8EAQCkAgMAAAAgQJ8CAwFNAgFEAAAAAIICAgAEAwEDAgMDBAAAIEAABgQBGAAAAAAAAAAAAAAAAAEAAAcAAAAABgAAAQIAFaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAAqQMAAOIECQDABQoAMAUEWwgAAACfAgMAggIAAAsDBQQAAABAAwYDBwMIBAAAQEADCQMKAwQFAQgGAAEAAQABGAABAAAAAAABAAAAAAIAAAABAAD/AAEAAAAAAfXM8BjDTfj9xwiajCXxgzTDw8X4qs6bvj3VX+PHlNeA3UA7vq2GIqY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(false, {
	["setInPhysical"] = function(_, p2)
		local v3 = p2.inPhysical ~= nil
		assert(v3, "missing inPhysical value")
		return p2.inPhysical
	end
})
