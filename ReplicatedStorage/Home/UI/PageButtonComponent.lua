-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTCHNlbGVjdGVkD2JhY2tncm91bmRDb2xvcgpicmlnaHRlbkJ5BW1lcmdlDGNvcm5lclJhZGl1cwRVRGltA25ldxNwYWdlQnV0dG9uQ29tcG9uZW50BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBEV6VWkKRGljdGlvbmFyeQNTdGQKQ29sb3JVdGlscwZzY3JpcHQGUGFyZW50D0J1dHRvbkNvbXBvbmVudAACCQEDAAAAH00CAE0AAAAADgIDAE0BAA4BAAAAZQAHAPsCAABNAQKcAgAAAE0CAA4BAAAAbwMDAJ8BAwL7AgEA+wQCAE0DBB8EAAAAUgQAAOIFBgCkBgkAACBwgIwHAQCMCAAAnwYDAjAGBW8FAAAAMAEFDgEAAACfAwMAnwIAAIICAAAKAwEDAgMDAjMzMzMzM9O/AwQDBQUCBQEDBgMHBAAgcIAABwgBGAAAAAEAAAEAAAAAAAABAAAAAAABAAAAAAAAAQD+AAAIAAAAAAcAAAECACOjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwAtBgAAAE0CA6kHAAAAnwECAqQCBQAAAEBATQQAoQgAAABNAwQzCQAAAJ8CAgKkAwUAAABAQKQGCwAAAKBATQUGJAwAAABNBAWjDQAAAJ8DAgLABA4AEgACABIAAwASAAEAggQCAA8DCQQAAABAAwoDCwMMBAAAQEADDQMOAw8DEAMRBAAAoEADEgMTBgABAAEAARgAAQAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAAACAAAACgEAAAAAAQl6CbLiLgEYO75jJmpsHoE6q6Y9B5y/h2ET+/NdpHpRPEhg9Bny6hY=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.EzUi.Dictionary)
local v_u_3 = require(v1.Std.ColorUtils)
local v_u_4 = require(script.Parent.ButtonComponent)
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v6
	if p5.selected then
		v6 = p5.backgroundColor
	else
		v6 = v_u_3.brightenBy(p5.backgroundColor, -0.3)
	end
	return v_u_4(v_u_2.merge(p5, {
		["cornerRadius"] = UDim.new(1, 0),
		["backgroundColor"] = v6
	}))
end
