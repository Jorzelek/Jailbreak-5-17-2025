-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUBV9kYXRhBlVzZXJJZApfb2JzZXJ2aW5nGXNldENhY2hlZFBsYXllclBvbGljeUluZm8ZZ2V0Q2FjaGVkUGxheWVyUG9saWN5SW5mbwV0YWJsZQRmaW5kBnJlbW92ZQZpbnNlcnQHcmVzb2x2ZQNuZXcdcHJvbWlzZUNhY2hlZFBsYXllclBvbGljeUluZm8ccmVtb3ZlQ2FjaGVkUGxheWVyUG9saWN5SW5mbwRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNTdGQHUHJvbWlzZQZTaWduYWwABwoCAQAAAB77AwAATQIDjAAAAABNAwDmAQAAAGoBAgP7BAAATQMEOwIAAABNBADmAQAAAIcCAwQOAhAA+wQAAE0DBDsCAAAATQQA5gEAAADGBQAAagUDBFIDAgDGBAAAxgUAAGQDAwBSCAcAUgkBAJ8IAgFuA/z/AgAAAIIAAQADAwEDAgMDAAoEARgAAAAAAAABAAAAAAABAQAAAAAAAAEAAAABAAD/AAQLAAAAAAQBAQAAAAf7AwAATQIDjAAAAABNAwDmAQAAAIcBAgOCAQIAAgMBAwIAFAUBGAAAAAAAAAAVAAAAAAUAAwAAABr7AgAATQECOwAAAAD7AgEAhwABAg4AEwCkAAMAAAgQgPsDAABNAgM7AAAAAPsDAQCHAQID+wICAJ8AAwIOAAkApAEFAAAQEID7BAAATQMEOwAAAAD7BAEAhwIDBFIDAACfAQMBggABAAYDAwMGAwcEAAgQgAMIBAAQEIAAIwABGAAAAAAAAAEAAAAAAAAAAAEBAAAAAAAAAAADJAAAAAAIAwIAAAAh+wQAAE0DBOYAAAAA+wYBAE0FBjsBAAAAhwQFAysEBgD7BQEATQQFOwEAAAD/BQAAAAAAAGoFBANSBAIA2QUAABICAQASAAMAEgAAAJ8EAgIOBAEAggABAPsHAQBNBgc7AQAAAIcFBgOeNAUEAAAAAFIGAACkBAQAAAwggJ8EAwGCAAEABQMCAwMDBgMJBAAMIIABAhwAARgAAAABAAAAAAEAAAAAAAQAAAAAAAAJAgAAAAAAAAAAAAEdAAAAAAQBAgAAABT7AgAATQECpwAAAABSAgAAnwECAg4BBgD7AwEATQIDHQEAAABSAwEAnwICAIICAAD7AwEATQID7wIAAADZAwAAEgAAABICAACfAgIAggIAAAMDBQMKAwsBAxcMARgAAAAAAAEBAAAAAAACAAAAAAAAABgAAAAABAEBAAAACPsCAABNAQKMAAAAAE0CAOYBAAAAxgMAAGoDAQKCAAEAAgMBAwIAMQ0BGAAAAAAAAAABMgAAAAAFAAABAgAxowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAoQYAAABNAgNyBwAAAJ8BAgKkAgUAAABAQE0EAKEGAAAATQMEHwgAAACfAgIC/wMEAAAAAAD/BAAAAAAAADAEA4wJAAAA/wQAAAAAAAAwBAM7CgAAAMAECwASAAMAMAQDswwAAADABA0AEgADADAEA6cOAAAAwAQPABIAAwASAAEAMAQDhRAAAADABBEAEgADADAEAzUSAAAAggMCABMDDgQAAABAAw8DEAMRBAAAQEADEgMTAxQDAQMDBgADBAYBAwUGBAMMBgUDDQQAAQQFAQABGAACAAAAAAABAAAAAAAAAQAAAAAAAAIAAQAAAAEAAAABAAAACgAAAAMAAAAAGgAAAAMBAAAAAAbdbBG8E6WDhu+oeyhpOiFSf4G9Bc96wtpZi37UkDtDONZyDHNDEm8g

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.Promise)
require(v1.Std.Signal)
local v_u_16 = {
	["_data"] = {},
	["_observing"] = {},
	["setCachedPlayerPolicyInfo"] = function(p3, p4)
		-- upvalues: (copy) v_u_16
		v_u_16._data[p3.UserId] = p4
		local v5 = v_u_16._observing[p3.UserId]
		if v5 then
			v_u_16._observing[p3.UserId] = nil
			for _, v6 in v5 do
				v6(p4)
			end
		end
	end,
	["getCachedPlayerPolicyInfo"] = function(p7)
		-- upvalues: (copy) v_u_16
		return v_u_16._data[p7.UserId]
	end,
	["promiseCachedPlayerPolicyInfo"] = function(p_u_8)
		-- upvalues: (copy) v_u_16, (copy) v_u_2
		local v9 = v_u_16.getCachedPlayerPolicyInfo(p_u_8)
		if v9 then
			return v_u_2.resolve(v9)
		else
			return v_u_2.new(function(p_u_10, _, p11)
				-- upvalues: (copy) p_u_8, (ref) v_u_16
				local v_u_12 = p_u_8.UserId
				if not v_u_16._observing[v_u_12] then
					v_u_16._observing[v_u_12] = {}
				end
				if not p11(function()
					-- upvalues: (ref) v_u_16, (copy) v_u_12, (copy) p_u_10
					local v13 = v_u_16._observing[v_u_12] and table.find(v_u_16._observing[v_u_12], p_u_10)
					if v13 then
						table.remove(v_u_16._observing[v_u_12], v13)
					end
				end) then
					local v14 = v_u_16._observing[v_u_12]
					table.insert(v14, p_u_10)
				end
			end)
		end
	end,
	["removeCachedPlayerPolicyInfo"] = function(p15)
		-- upvalues: (copy) v_u_16
		v_u_16._data[p15.UserId] = nil
	end
}
return v_u_16
