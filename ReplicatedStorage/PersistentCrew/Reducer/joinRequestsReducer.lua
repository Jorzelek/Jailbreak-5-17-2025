-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKBXZhbHVlLWpvaW4gcmVxdWVzdHMgY2Fubm90IGJlIG5pbDsgdHJ5IGJsYW5rIHRhYmxlPwZhc3NlcnQPc2V0Sm9pblJlcXVlc3RzBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVJvZHV4DWNyZWF0ZVJlZHVjZXIAAgUCAAAAAA9NBAHMAAAAAEcEAgAAAACAqQMAAakDAQCBAQMEAQAAAG8EAQCkAgMAAAAgQJ8CAwFNAgHMAAAAAIICAgAEAwEDAgMDBAAAIEAABgQBGAAAAAAAAAAAAAAAAAEAAAcAAAAABgAAAQIAFqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAA/wMAAAAAAADiBAkAwAUKADAFBC0IAAAAnwIDAIICAAALAwUEAAAAQAMGAwcDCAQAAEBAAwkDCgMEBQEIBgABAAEAARgAAQAAAAAAAQAAAAACAAAAAAEAAP8AAQAAAAABvIsaf0SBR7+OT3DrpleED6T+LJoY4smvfS0h3IhmP2VfBOSM7fpzPA==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["setJoinRequests"] = function(_, p2)
		local v3 = p2.value ~= nil
		assert(v3, "join requests cannot be nil; try blank table?")
		return p2.value
	end
})
