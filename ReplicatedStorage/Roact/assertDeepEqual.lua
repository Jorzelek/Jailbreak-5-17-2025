-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSBnR5cGVvZih7MX0gaXMgb2YgdHlwZSAlcywgYnV0IHsyfSBpcyBvZiB0eXBlICVzBmZvcm1hdAV0YWJsZQVwYWlycwN7MX0HezF9WyVzXQh0b3N0cmluZwRnc3ViA3syfQd7Mn1bJXNdCnsxfSB+PSB7Mn0JZGVlcEVxdWFsBWZpcnN0BnNlY29uZB5WYWx1ZXMgd2VyZSBub3QgZGVlcC1lcXVhbC4KJXMFZXJyb3IPYXNzZXJ0RGVlcEVxdWFsAAMRAgEAABcAAAUDAhcCAw05AgMNRgIDDWQCAw1xAoUBuywAA1IDAACkAgEAAAAAQJ8CAgK7LAEDUgQBAKQDAQAAAABAnwMCAvECEgADAAAAbwICALssAANSBQAApAQBAAAAAECfBAICuywBA1IGAQCkBQEAAAAAQJ8FAgK8AgKNAwAAAJ8CBAKpAwAAUgQCAIIDAwC7LAADUgMAAKQCAQAAAABAnwICAvACWwAEAACA/wIAAAAAAACkAwYAAABQQFIEAACfAwIEFwMkAKkIAQBqCAIG+wgAAFIJBwCHCgEGnwgDAysIHQBvDAcAbw0IALs/BgNSEAYApA8KAAAAkECfDwICvA0NjQMAAACfDQMAvAoJzAsAAACfCgACbwwMAG8NDQC7PwYDUhAGAKQPCgAAAJBAnw8CArwNDY0DAAAAnw0DALwKCswLAAAAnwoAAqkLAABSDAoAggsDAG4D2/8CAAAApAMGAAAAUEBSBAEAnwMCBBcDJACHCAIGKwgiAPsIAABSCQcAhwoABp8IAwMrCB0AbwwHAG8NCAC7PwYDUhAGAKQPCgAAAJBAnw8CArwNDY0DAAAAnw0DALwKCcwLAAAAnwoAAm8MDABvDQ0Auz8GA1IQBgCkDwoAAACQQJ8PAgK8DQ2NAwAAAJ8NAwC8CgrMCwAAAJ8KAAKpCwAAUgwKAIILAwBuA9v/AgAAAKkDAQCCAwIAmgADAAEAAACpAgEAggICAKkCAABvAw4AggIDAA8DAQQAAABAAwIDAwMEAwUEAABQQAMGAwcDCAQAAJBAAwkDCgMLAwwACQ0BGAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAQAAAwAAAAAAAAEAAgAAAAABAAIAAAABAgAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAACAAD3AA0AAAAAAQABAAAAAgIAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAgAA9wAOAAMAAQAEAAAKAAAAAAkCAQAABwAAAQMFEQIa+wIAAFIDAABSBAEAnwIDAysCFABvBgAAbwcBALwEA8wCAAAAnwQEAm8GAwBvBwQAvAQEzAIAAACfBAQCbwUFAFIHBAC8BQWNBgAAAJ8FAwKkBggAAABwQFIHBQCMCAIAnwYDAYIAAQAJAwYDDgMJAwoDDwMQAwMDEQQAAHBAADgSARgAAAAAAgEAAAAAAAAAAAACAAAAAAIAAAAAAjkAAAAAAgAAAQIABqMAAADAAAAAEgAAAMABAQASAAAAggECAAIGAAYBAgABAQABGAAIAC8ADAEAAAAAAnBpnlsL4ySRQq30z76K/38ZKqh1KTk4POuZG4OAVuNrKOohJOsYQ10=

-- Decompiled by Krnl

local function v_u_12(p1, p2)
	-- upvalues: (copy) v_u_12
	if typeof(p1) == typeof(p2) then
		if typeof(p1) == "table" then
			local v3 = {}
			for v4, v5 in pairs(p1) do
				v3[v4] = true
				local v6, v7 = v_u_12(v5, p2[v4])
				if not v6 then
					return false, v7:gsub("{1}", ("{1}[%s]"):format((tostring(v4)))):gsub("{2}", ("{2}[%s]"):format((tostring(v4))))
				end
			end
			for v8, v9 in pairs(p2) do
				if not v3[v8] then
					local v10, v11 = v_u_12(v9, p1[v8])
					if not v10 then
						return false, v11:gsub("{1}", ("{1}[%s]"):format((tostring(v8)))):gsub("{2}", ("{2}[%s]"):format((tostring(v8))))
					end
				end
			end
			return true
		elseif p1 == p2 then
			return true
		else
			return false, "{1} ~= {2}"
		end
	else
		return false, ("{1} is of type %s, but {2} is of type %s"):format(typeof(p1), (typeof(p2)))
	end
end
return function(p13, p14)
	-- upvalues: (copy) v_u_12
	local v15, v16 = v_u_12(p13, p14)
	if not v15 then
		local v17 = ("Values were not deep-equal.\n%s"):format((v16:gsub("{1}", "first"):gsub("{2}", "second")))
		error(v17, 2)
	end
end
