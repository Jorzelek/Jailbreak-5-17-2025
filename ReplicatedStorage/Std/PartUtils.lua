-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQC3NldFByb3BlcnR5CEFuY2hvcmVkC3NldEFuY2hvcmVkCkNhbkNvbGxpZGUNc2V0Q2FuQ29sbGlkZQhDYW5RdWVyeQtzZXRDYW5RdWVyeQhDYW5Ub3VjaAtzZXRDYW5Ub3VjaAxtaXNzaW5nIHJvb3QGYXNzZXJ0CEJhc2VQYXJ0A0lzQQZpcGFpcnMOR2V0RGVzY2VuZGFudHMXc2V0UHJvcGVydHlXaXRoUm9sbGJhY2sACAYCAQAABwQAAAUCBwEI+wMAAE0CA9AAAAAAUgMAAG8EAQBSBQEAnwIEAIICAAACAwEDAgAFAwEYAAAAAAAAAAAGAAAAAAYCAQAABwQAAAUCBwEI+wMAAE0CA9AAAAAAUgMAAG8EAQBSBQEAnwIEAIICAAACAwEDBAAIBQEYAAAAAAAAAAAJAAAAAAYCAQAABwQAAAUCBwEI+wMAAE0CA9AAAAAAUgMAAG8EAQBSBQEAnwIEAIICAAACAwEDBgALBwEYAAAAAAAAAAAMAAAAAAYCAQAABwQAAAUCBwEI+wMAAE0CA9AAAAAAUgMAAG8EAQBSBQEAnwIEAIICAAACAwEDCAAOCQEYAAAAAAAAAAAPAAAAAAsDAAAACAUAAAUDBwMPIEcAAgAAAACAqQQAAakEAQCBAQQEAAAAAG8FAACkAwIAAAAQQJ8DAwFvBQMAvAMA/gQAAACfAwMCDgMBAGoCAAGkAwYAAABQQLwEAEcHAAAAnwQCAJ8DAARRAwYAbwoDALwIB/4EAAAAnwgDAg4IAQBqAgcBbgP5/wIAAICCAAEACAMKAwsEAAAQQAMMAw0DDgQAAFBAAw8AEQEBGAAAAAAAAAAAAAABAAAAAAECAAAAAAAAAQAAAAAB/gAFEgAAAAAHAAMAAAAQ+wAAAMYBAADGAgAAZAAJAPsFAQCaBAUABQAAAPsFAgDGBgAAagYDBWUAAgD7BQIAagQDBW4A9v8CAAAAggABAAAAKwABGAAAAAABAAABAAAAAgD8AAcsAAAAAAwDAQAACAUAAAUDBwMPKv8DAAAAAAAAbwYAALwEAP4BAAAAnwQDAg4ECACHBQABRwUDAAAAAID7BAAAZQABAIcEAAFqBAMAagIAAaQEAwAAACBAvAUARwQAAACfBQIAnwQABFEEDQBvCwAAvAkI/gEAAACfCQMCDgkIAIcKCAFHCgMAAAAAgPsJAABlAAEAhwkIAWoJAwhqAggBbgTy/wIAAIDZBAAAEgADABICAAASAAEAggQCAAUDDAMNAw4EAAAgQAMPAQUdEAEYAAABAAAAAAEAAAAAAAEBAgAAAAAAAAEAAAAAAQAAAAAAAQH8AAcAAAAAHgAAAAADAAABAgAdowAAAP8ABAAAAAAAwAEAABIAAAAwAQAfAQAAAMABAgASAAAAMAEAFgMAAADAAQQAEgAAADABANkFAAAAwAEGABIAAAAwAQBVBwAAAMABCAAwAQDQCQAAAP8BAAAAAAAAwAIKABIAAQAwAgDoCwAAAIIAAgAMBgADAwYBAwUGAgMHBgMDCQYEAwEGBgMQBgABAgMEBgEAARgAAQADAAAAAwAAAAMAAAADAAAAAwAACwABAAAAGQEAAAAAB60nFCR7Hjo8n+N+sJs+Evw76Gq8xCrOkOxwD39ClYxHiFKRGpXnVN8=

-- Decompiled by Krnl

local v_u_14 = {
	["setAnchored"] = function(p1, p2)
		-- upvalues: (copy) v_u_14
		return v_u_14.setProperty(p1, "Anchored", p2)
	end,
	["setCanCollide"] = function(p3, p4)
		-- upvalues: (copy) v_u_14
		return v_u_14.setProperty(p3, "CanCollide", p4)
	end,
	["setCanQuery"] = function(p5, p6)
		-- upvalues: (copy) v_u_14
		return v_u_14.setProperty(p5, "CanQuery", p6)
	end,
	["setCanTouch"] = function(p7, p8)
		-- upvalues: (copy) v_u_14
		return v_u_14.setProperty(p7, "CanTouch", p8)
	end,
	["setProperty"] = function(p9, p10, p11)
		local v12 = p9 ~= nil
		assert(v12, "missing root")
		if p9:IsA("BasePart") then
			p9[p10] = p11
		end
		for _, v13 in ipairs(p9:GetDescendants()) do
			if v13:IsA("BasePart") then
				v13[p10] = p11
			end
		end
	end
}
local v_u_15 = {}
function v_u_14.setPropertyWithRollback(p16, p_u_17, p18)
	-- upvalues: (copy) v_u_15
	local v_u_19 = {}
	if p16:IsA("BasePart") then
		local v20
		if p16[p_u_17] == nil then
			v20 = v_u_15
		else
			v20 = p16[p_u_17]
		end
		v_u_19[p16] = v20
		p16[p_u_17] = p18
	end
	for _, v21 in ipairs(p16:GetDescendants()) do
		if v21:IsA("BasePart") then
			local v22
			if v21[p_u_17] == nil then
				v22 = v_u_15
			else
				v22 = v21[p_u_17]
			end
			v_u_19[v21] = v22
			v21[p_u_17] = p18
		end
	end
	return function()
		-- upvalues: (copy) v_u_19, (ref) v_u_15, (copy) p_u_17
		for v23, v24 in v_u_19 do
			if v24 == v_u_15 then
				v23[p_u_17] = nil
			else
				v23[p_u_17] = v24
			end
		end
	end
end
return v_u_14
