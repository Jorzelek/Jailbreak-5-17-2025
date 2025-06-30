-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLElJvYWN0SG9zdEV2ZW50KCVzKQRuYW1lBmZvcm1hdApfX3Rvc3RyaW5nCUhvc3RFdmVudAxzZXRtZXRhdGFibGUHX19pbmRleAdyZXF1aXJlBnNjcmlwdAZQYXJlbnQEVHlwZQADBAEAAAAHAAABAwEDAgdvAQAATQMAWgEAAAC8AQGNAgAAAJ8BAwCCAQAAAwMBAwIDAwAVBAEYAAAAAAAAABYAAAAABgIDAAAAE/8CAgAAAAAA+wMAAPsFAABNBAUqAAAAAGoEAgMwAQJaAQAAAPsFAQCePQIEBQAAAFIEAgCkAwMAAAAgQJ8DAwH7AwIAagIDAYICAgAEAwUDAgMGBAAAIEAAGwcBGAAAAQAAAAABAAMAAAAAAAACAAIcAAAAAAcAAAECACCjAAAApAABAAAAAECkBAMAAAAgQE0DBCQEAAAATQIDJAQAAABNAQIRBQAAAJ8AAgL/AQAAAAAAAOICBwDAAwgAMAMCBgYAAADiBQoAwAYLABIAAAASAAIAEgABADAGBW4JAAAAnj0BBAUAAABSBAEApAMNAAAAwECfAwMBggECAA4DCAQAAABAAwkEAAAgQAMKAwsDBAUBBgYAAwcFAQkGAQMGBAAAwEACAAEBAAEYAA8AAAAAAAAAAAAAAgACAQAABQEAAAAAAAAAAP8AAA8BAAAAAAKfdhiNSIPfpK2ychnuCEQBVuhT9NUS9b8A+z1L0K6TvOBuqOrRR4Ar

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Type)
local v_u_2 = {}
local v_u_4 = {
	["__tostring"] = function(p3)
		return ("RoactHostEvent(%s)"):format(p3.name)
	end
}
setmetatable(v_u_2, {
	["__index"] = function(_, p5)
		-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_2
		local v6 = {
			[v_u_1] = v_u_1.HostEvent,
			["name"] = p5
		}
		local v7 = v_u_4
		setmetatable(v6, v7)
		v_u_2[p5] = v6
		return v6
	end
})
return v_u_2
