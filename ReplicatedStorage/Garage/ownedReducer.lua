-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQCGNhdGVnb3J5EG1pc3NpbmcgY2F0ZWdvcnkGYXNzZXJ0BG5hbWUMbWlzc2luZyBuYW1lBXBhaXJzFHNldENhdGVnb3J5SXRlbU93bmVkBW93bmVkE21pc3Npbmcgb3duZWQgdGFibGULc2V0T3duZWRSYXcEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgADCAIAAAAAM00EAWsAAAAARwQCAAAAAICpAwABqQMBAIEBAwQBAAAAbwQBAKQCAwAAACBAnwIDAU0EAVoEAAAARwQCAAAAAICpAwABqQMBAIEBAwQFAAAAbwQFAKQCAwAAACBAnwIDAf8CAAAAAAAApAMHAAAAYEBSBAAAnwMCBBcDAQBqBwIGbgP+/wIAAABNBAFrAAAAAIcDAgQrAwUATQMBawAAAAD/BAAAAAAAAGoEAgNNBAFrAAAAAIcDAgRNBAFaBAAAAKkFAQBqBQMEggICAAgDAQMCAwMEAAAgQAMEAwUDBgQAAGBAAAYHARgAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAACAAEAAAAAAf8AAwAAAAEAAAAAAgAAAAAAAAEHAAAAAAUCAAAAAA9NBAHkAAAAAEcEAgAAAACAqQMAAakDAQCBAQMEAQAAAG8EAQCkAgMAAAAgQJ8CAwFNAgHkAAAAAIICAgAEAwgDCQMDBAAAIEAAFAoBGAAAAAAAAAAAAAAAAAEAABUAAAAABgAAAQIAGaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAA/wMAAAAAAADiBAoAwAULADAFBDgIAAAAwAUMADAFBBgJAAAAnwIDAIICAAANAwsEAAAAQAMMAw0DDgQAAEBAAw8DEAMHAwoFAggJBgAGAQIAAQEAARgAAQAAAAAAAQAAAAACAAAAAAEAAA4AAPEAAQAAAAACj0EAprtj6E+9hWoy36id6eslcnd+H98upq5KFErjHV/7xO8CsaBF8Q==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["setCategoryItemOwned"] = function(p2, p3)
		local v4 = p3.category ~= nil
		assert(v4, "missing category")
		local v5 = p3.name ~= nil
		assert(v5, "missing name")
		local v6 = {}
		for v7, v8 in pairs(p2) do
			v6[v7] = v8
		end
		if not v6[p3.category] then
			v6[p3.category] = {}
		end
		v6[p3.category][p3.name] = true
		return v6
	end,
	["setOwnedRaw"] = function(_, p9)
		local v10 = p9.owned ~= nil
		assert(v10, "missing owned table")
		return p9.owned
	end
})
