-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPBF9tYXAFZXJyb3IgRW51bSBkb2VzIG5vdCBjb250YWluIGl0ZW06IGAlc2AGZm9ybWF0B19faW5kZXgGX2FycmF5DEdldEVudW1JdGVtcxBHZXRWYWx1ZUZyb21FbnVtEENhbm5vdCBpdGVyIGVudW0EbmV4dAZfX2l0ZXIFdGFibGUGZnJlZXplCGlzZnJvemVuDHNldG1ldGF0YWJsZQAGBgIBAAAHAAABAwMSAhf7AwAAhwIDAQ4CAwD7AwAAhwIDAYICAgBNAwAIAAAAAIcCAwEOAgQATQMACAAAAACHAgMBggICAKQCAgAAABBAbwMDAFIFAQC8AwONBAAAAJ8DAwCfAgABggABAAUDAQMCBAAAEEADAwMEAAYFARgAAAABAAABAAAAAQAAAAIAAAAAAAAAAgcAAAAAAgEAAAAAA00BAMQAAAAAggECAAEDBgAPBwEYAAAAEAAAAAAEAgAAAAAETQMAxAAAAACHAgMBggICAAEDBgASCAEYAAAAABMAAAAAAwEAAAAACaQBAQAAAABAbwICAJ8BAgGkAQQAAAAwQE0CAAgFAAAAggEDAAYDAgQAAABAAwkDCgQAADBAAwEAFQsBGAAAAAAFAAAAABYAAAAACAEBAAAALf8BAgAAAAAAMAABxAAAAAD/AgAAAAAAADACAQgBAAAAUgIAAMYDAADGBAAAZAIDAE0HAQgBAAAAagUHBm4C/P8CAAAApAIEAAAMIIBNAwEIAQAAAJ8CAgGkAgYAABQggE0DAcQAAAAAnwICAisCBQCkAgQAAAwggE0DAcQAAAAAnwICAfsEAACePQEEBAAAAFIDAQCkAggAAABwQJ8CAwGkAgQAAAwggFIDAQCfAgIBggECAAkDBgMBAwwDDQQADCCAAw4EABQggAMPBAAAcEAAHQABGAAAAQABAAAAAQAAAAEAAP8AAwAAAAABAAAAAAABAAAAAAIAAAAAAAABAAAAAR4AAAAAAgAAAQIAE6MAAAD/AAMAAAAAAMABAAASAAAAMAEAbgEAAADAAQIAMAEAFgMAAADAAQQAMAEAywUAAADAAQYAMAEATAcAAADAAQgAEgAAAIIBAgAJBgADBQYBAwcGAgMIBgMDCwYEBQABAgMEAQABGAAEAAEAAAAJAAADAAADAAAIAAABAAAAAAVT+ATEUKV+fGE8blBWV8E9yRlkHKOICDpB4bno0fIzbhrcR/Ziq8na

-- Decompiled by Krnl

local v_u_7 = {
	["__index"] = function(p1, p2)
		-- upvalues: (copy) v_u_7
		if v_u_7[p2] then
			return v_u_7[p2]
		end
		if p1._map[p2] then
			return p1._map[p2]
		end
		error(("Enum does not contain item: `%s`"):format(p2))
	end,
	["GetEnumItems"] = function(p3)
		return p3._array
	end,
	["GetValueFromEnum"] = function(p4, p5)
		return p4._array[p5]
	end,
	["__iter"] = function(p6)
		error("Cannot iter enum")
		return next, p6._map
	end
}
return function(p8)
	-- upvalues: (copy) v_u_7
	local v9 = {
		["_array"] = p8,
		["_map"] = {}
	}
	for v10, v11 in p8 do
		v9._map[v11] = v10
	end
	table.freeze(v9._map)
	if not table.isfrozen(v9._array) then
		table.freeze(v9._array)
	end
	local v12 = v_u_7
	setmetatable(v9, v12)
	table.freeze(v9)
	return v9
end
