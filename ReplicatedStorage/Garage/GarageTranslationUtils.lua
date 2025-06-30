-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKGEdhcmFnZVZlaGljbGUuQ2F0ZWdvcnklcwZmb3JtYXQLRm9ybWF0QnlLZXkQZ2V0Q2F0ZWdvcnlUaXRsZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQxMb2NhbGl6YXRpb24GTW9kdWxlAAIGAQEAAAcAAAEDAwMCCvsBAABvAwAAUgUAALwDA40BAAAAnwMDALwBAZsCAAAAnwEAAIIBAAADAwEDAgMDAAYEARgAAAAAAAAAAAAABwAAAAAEAAABAgAVowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMAQAcAAABNAgN8BgAAAJ8BAgL/AgEAAAAAAMADCAASAAEAMAMCngkAAACCAgIACgMFBAAAAEADBgMHAwgEAABAQAMJAwoGAAMEAQABAAEYAAEAAAAAAAEAAAAAAAACAAEAAAADAQAAAAABzS3ozxu+q2P/6YJbch8lsO/zW1VeUab7vPc6fb0eKbpOahBBV+f74A==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Module.Localization)
return {
	["getCategoryTitle"] = function(p3)
		-- upvalues: (copy) v_u_2
		return v_u_2:FormatByKey(("GarageVehicle.Category%s"):format(p3))
	end
}
