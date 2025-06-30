-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLGFJvYWN0SG9zdENoYW5nZUV2ZW50KCVzKQRuYW1lBmZvcm1hdApfX3Rvc3RyaW5nD0hvc3RDaGFuZ2VFdmVudAxzZXRtZXRhdGFibGUHX19pbmRleAdyZXF1aXJlBnNjcmlwdAZQYXJlbnQEVHlwZQADBAEAAAAHAAABAwEDAgdvAQAATQMAWgEAAAC8AQGNAgAAAJ8BAwCCAQAAAwMBAwIDAwATBAEYAAAAAAAAABQAAAAABgIDAAAAE/8CAgAAAAAA+wMAAPsFAABNBAVmAAAAAGoEAgMwAQJaAQAAAPsFAQCePQIEBQAAAFIEAgCkAwMAAAAgQJ8DAwH7AwIAagIDAYICAgAEAwUDAgMGBAAAIEAAGQcBGAAAAQAAAAABAAMAAAAAAAABAAIaAAAAAAcAAAECACCjAAAApAABAAAAAECkBAMAAAAgQE0DBCQEAAAATQIDJAQAAABNAQIRBQAAAJ8AAgL/AQAAAAAAAOICBwDAAwgAMAMCBgYAAADiBQoAwAYLABIAAAASAAIAEgABADAGBW4JAAAAnj0BBAUAAABSBAEApAMNAAAAwECfAwMBggECAA4DCAQAAABAAwkEAAAgQAMKAwsDBAUBBgYAAwcFAQkGAQMGBAAAwEACAAEBAAEYAA0AAAAAAAAAAAAAAgACAQAABQEAAAAAAAAAAP8AAA4BAAAAAAJb/r6urgsplmk61Do60AcQsBfE5AFy+nvEZpjWad8ZEY58ZJZ4pnTg

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Type)
local v_u_2 = {}
local v_u_4 = {
	["__tostring"] = function(p3)
		return ("RoactHostChangeEvent(%s)"):format(p3.name)
	end
}
setmetatable(v_u_2, {
	["__index"] = function(_, p5)
		-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_2
		local v6 = {
			[v_u_1] = v_u_1.HostChangeEvent,
			["name"] = p5
		}
		local v7 = v_u_4
		setmetatable(v6, v7)
		v_u_2[p5] = v6
		return v6
	end
})
return v_u_2
