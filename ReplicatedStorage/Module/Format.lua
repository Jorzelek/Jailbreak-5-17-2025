-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdBnN0cmluZwVtYXRjaBVeKFteJWRdKiVkKSglZCopKC4tKSQHcmV2ZXJzZQgoJWQlZCVkKQMlMSwEZ3N1YgVDb21tYQZhc3NlcnQEbWF0aAVmbG9vcgABLQxHZW5lcmFsLkNhc2gDYWJzC0Zvcm1hdEJ5S2V5CEN1cnJlbmN5CSVkIG1pbnV0ZQZmb3JtYXQBcwUgYW5kIAklZCBzZWNvbmQGTWluU2VjBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlDExvY2FsaXphdGlvbgZNb2R1bGUABAwBAAAAABWkAQIAAAQAgFICAABvAwMAnwEDBFIFAQC8CAKbBAAAAJ8IAgJvCgUAbwsGALwICMwHAAAAnwgEArwICJsEAAAAnwgCAlIGCABSBwMAcwQFB4IEAgAIAwEDAgQABACAAwMDBAMFAwYDBwAHCAEYAAAAAAABAAAAAAAAAAAAAAAAAAAACAAAAAALAQIAAAApRwACAAAAAICpAgABqQIBALsBAgKkAQEAAAAAQJ8BAgGVAgACuwwCAqQBBQAAEDCAnwECAlIAAQCMAgAAfQIDAAAAAABvAQYAZQABAG8BBwBSAwEA+wQAAG8GCAD/BwAAAQAAAPsJAQBNCAnECQAAALsCAANSCgAApAkLAAAoMICfCQICnwgCAMUHCAABAAAAvAQEmwwAAACfBAQCcwIDBIICAgANAwkEAAAAQAIAAAAAAADgPwMKAwsEABAwgAMMAw0DDgMIAw8EACgwgAMQAAsRARgAAAAAAAAAAAMAAAAAAAEAAAAAAAEAAAAAAQAAAAAAAAAAAAD/AAAAAAwAAAAACAEAAAALAAACAwUNAgMFJQIvbwEAAD4DAAG7DAMCpAIEAAAMIICfAgICIQMAAYwEAABgBA0AAgAAAFIEAQBvBQUAUgcCALwFBY0GAAAAnwUDAnMBBAUNAgQABwAAAFIEAQBvBQgAcwEEBYwEAABgBAcAAgAAAIwEAABgBAQAAwAAAFIEAQBvBQkAcwEEBYwEAABgBA0AAwAAAFIEAQBvBQoAUgcDALwFBY0GAAAAnwUDAnMBBAUNAwQABwAAAFIEAQBvBQgAcwEEBYIBAgALAwwCAAAAAAAATkADCgMLBAAMIIADEgMTAgAAAAAAAPA/AxQDFQMWABUXARgAAQAAAAABAQAAAQAAAAAAAAEAAQAAAwAAAAAAAQAAAgAAAQAAAAAAAAEAAQAAAxYAAAAABAAAAQIAHKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAEAHAAAATQIDfAYAAACfAQIC/wIDAAAAAADAAwgAMAMCxAkAAADAAwoAEgABABIAAgAwAwIJCwAAAMADDAAwAwIrDQAAAIICAgAOAxgEAAAAQAMZAxoDGwQAAEBAAxwDHQYAAwgGAQMRBgIDFwMAAQIBAAEYAAEAAAAAAAEAAAAAAAACAAIAAAQAAAAACgAAFgEAAAAAA6RWTbIocAYLlpInJjp1xBu0WGviHIf6HZlMkumO/tWgHOTBAoUuqG8=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Module.Localization)
local v_u_16 = {
	["Comma"] = function(p3)
		local v4, v5, v6 = string.match(p3, "^([^%d]*%d)(%d*)(.-)$")
		return v4 .. v5:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. v6
	end,
	["Currency"] = function(p7)
		-- upvalues: (copy) v_u_2, (copy) v_u_16
		local v8 = p7 ~= nil
		assert(v8)
		local v9 = p7 + 0.5
		local v10 = math.floor(v9)
		return (v10 >= 0 and "" or "-") .. v_u_2:FormatByKey("General.Cash", { v_u_16.Comma((math.abs(v10))) })
	end,
	["MinSec"] = function(p11)
		local v12 = ""
		local v13 = p11 / 60
		local v14 = math.floor(v13)
		local v15 = p11 % 60
		if v14 > 0 then
			v12 = v12 .. ("%d minute"):format(v14)
			if v14 ~= 1 then
				v12 = v12 .. "s"
			end
		end
		if v14 > 0 and v15 > 0 then
			v12 = v12 .. " and "
		end
		if v15 > 0 then
			v12 = v12 .. ("%d second"):format(v15)
			if v15 ~= 1 then
				v12 = v12 .. "s"
			end
		end
		return v12
	end
}
return v_u_16
