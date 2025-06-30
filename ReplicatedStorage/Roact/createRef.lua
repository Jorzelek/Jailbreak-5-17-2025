-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRB2N1cnJlbnQIZ2V0VmFsdWUHX19pbmRleAVlcnJvci9DYW5ub3QgYXNzaWduIHRvIHRoZSAnY3VycmVudCcgcHJvcGVydHkgb2YgcmVmcwpfX25ld2luZGV4DFJvYWN0UmVmKCVzKQh0b3N0cmluZwZmb3JtYXQKX190b3N0cmluZwZjcmVhdGUMc2V0bWV0YXRhYmxlCWNyZWF0ZVJlZgdyZXF1aXJlBnNjcmlwdAZQYXJlbnQHQmluZGluZwAFBAIBAAAACvABBgAAAACA+wIAALwCAtMBAAAAnwICAIICAAD7AwAAhwIDAYICAgACAwEDAgAQAwEYAAABAAAAAAIAABEAAAAABgMBAAAACvABBgAAAACApAMCAAAAEEBvBAMAjAUCAJ8DAwH7AwAAagIDAYIAAQAEAwEDBAQAABBAAwUAFwYBGAAAAQAAAAADAAEYAAAAAAYBAQAABwAAAQMBCQINbwEAAPsEAAC8BATTAQAAAJ8EAgBMPwACpAMDAAAAIECfAwACvAEBjQQAAACfAQMAggEAAAUDBwMCAwgEAAAgQAMJAB4KARgAAAAAAAAAAAAAAAAAHwAAAAAHAAEAAAAb+wEAAE0AAXYAAAAAxgEAAJ8AAgP/AgAAAAAAAOIFBADZBgAAEgAAADAGBW4BAAAA2QYBABIAAAAwBgXOAgAAANkGAgASAAAAMAYFBgMAAACePQIEBQAAAFIEAgCkAwYAAABQQJ8DAwGCAgIABwMLAwMDBgMKBQMBAgMDDAQAAFBAAwABAgcNARgAAAAAAAIABQEAAAAHAAAABwAAAAAAAPEAABQIAAAAAAQAAAECAA2jAAAApAABAAAAAECkAwMAAAAgQE0CAyQEAAAATQECqAUAAACfAAICwAEGABIAAACCAQIABwMOBAAAAEADDwQAACBAAxADEQYDAQMBAAEYAAQAAAAAAAAAAAIAHwEAAAAABMlkYZWLAGfI+6ALAfYFduXZt+10h6Y2637bKRLfU+D6nhqYU8F2Iyo=

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Binding)
return function()
	-- upvalues: (copy) v_u_1
	local v_u_2, _ = v_u_1.create(nil)
	local v3 = {}
	setmetatable(v3, {
		["__index"] = function(_, p4)
			-- upvalues: (copy) v_u_2
			if p4 == "current" then
				return v_u_2:getValue()
			else
				return v_u_2[p4]
			end
		end,
		["__newindex"] = function(_, p5, p6)
			-- upvalues: (copy) v_u_2
			if p5 == "current" then
				error("Cannot assign to the \'current\' property of refs", 2)
			end
			v_u_2[p5] = p6
		end,
		["__tostring"] = function(_)
			-- upvalues: (copy) v_u_2
			local v7 = v_u_2
			return ("RoactRef(%s)"):format((tostring(v7:getValue())))
		end
	})
	return v3
end
