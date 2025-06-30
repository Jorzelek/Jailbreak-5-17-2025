-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPBmFzc2VydAR0eXBlBXRhYmxlBWNsb25lCXdvcmtzcGFjZQlNYWduaXR1ZGUKQ2FuQ29sbGlkZQZpbnNlcnQaUmF5SWdub3JlTm9uQ29sbGlkZVNwZWNpYWwhUmF5SWdub3JlTm9uQ29sbGlkZVdpdGhJZ25vcmVMaXN0E1JheUlnbm9yZU5vbkNvbGxpZGUDUmF5A25ldw1GaW5kUGFydE9uUmF5G0ZpbmRQYXJ0T25SYXlXaXRoSWdub3JlTGlzdAAEFAgDAAAAaA4FBQBWCQcAuwEJAqQIAQAAAABAnwgCAQ4EFAC7KAQDUgkEAKQIAwAAACBAnwgCAvAIBwAEAACApAgGAAAUQIBSCQQAnwgCAlIECABlAAkA/wgAAAEAAABSCQQAxQgJAgEAAABSBAgAZQACAP8EAAAAAAAAqQMBAIwIAADGCQAAUgoAADkLAQDGDAAAbw0HAGANQgACAAAAjA0FAH0NBgAIAAAAxg0AAFIOCgBSDwsAUhAMAIINBQD7DQAAUg4AAAkPAQKfDQMCDgMNAPsOAQCkDwkAAACAQFIQDQBSEQQAqRIAAFYTBgCfDgYFUgkOAFIKDwBSCxAAUgwRAGUADAD7DgIApA8JAAAAgEBSEA0AUhEEAKkSAABWEwYAnw4GBVIJDgBSCg8AUgsQAFIMEQAmDwAKTQ4PqgoAAAAOCRMAKwUJACsHAwBNDwnTCwAAACsPBQAOBwUAUg8HAFIQCQCfDwICDg8BAIIJBQCeNAQFCQAAAFIQBABSEQkApA8NAAAwQICfDwMBZQACAFIACgAmAgIOlQgIDkgAvP+CCQUADwMBBAAAAEADAgQAACBAAwMDBAQAFECAAnsUrkfheoQ/AwUEAACAQAMGAwcDCAQAMECAAgAAAAAAAPA/AAYJARgAAQAAAAACAQAAAAAAAAEAAAAAAAIAAAAAAAADAAIDAQAAAAEAAAEAAAEAAAAAAgAAAAECAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAgAAAQEAAgAAAAEAAAACAgAAAAAAAAADAQLmHBAAAAAAEAcBAAAAC/sHAABSCAAAUgkBAFIKAgCpCwEAUgwDAFINBABSDgUAUg8GAJ8HCQCCBwAAAAA/CgEYAAEBAQEBAQEB+ABIAAAAABAHAQAAAAv7BwAAUggAAFIJAQBSCgIAqQsAAFIMAwBSDQQAUg4FAFIPBgCfBwkAggcAAAAAUwsBGAABAQEBAQEBAfgAXAAAAAAHAAABAgAZowAAAKQAAgAABACApAIEAAAAMEBNAQLtBQAAAKQDBAAAADBATQIDRwYAAADAAwcAEgAAABIAAgASAAEAwAQIABIAAwDABQkAEgADAOIGDAAwBQZXCgAAADAEBsgLAAAAggYCAA0DDAMNBAAEAIADBQQAADBAAw4DDwYABgEGAgMLAwoFAgoLAwABAgEAARgAAgABAAAAAQAAAAEAAAA5ABQAFAEAAQAAAQAAAAADnZB+r9DFLbyvVBQ7TN3FZE8zpUcT4Me+QxEDeHHDNTvGHRbz/Lnp6A==

-- Decompiled by Krnl

local v_u_1 = Ray.new
local v_u_2 = workspace.FindPartOnRay
local v_u_3 = workspace.FindPartOnRayWithIgnoreList
local function v_u_20(p4, p5, p6, _, p7, p8, p9, p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	if p8 then
		assert(not p10)
	end
	local v11 = not p7 and {} or (type(p7) ~= "table" and { p7 } or table.clone(p7))
	local v12 = -p5
	local v13 = p4
	local v14 = 0
	local v15 = nil
	local v16 = true
	local v17 = nil
	while p6 > 0.01 do
		if v14 >= 5 then
			return nil, p4, v12, v15
		end
		local v18 = v_u_1(v13, p5 * p6)
		if v16 then
			v17, p4, v12, v15 = v_u_3(workspace, v18, v11, false, not p9)
		else
			v17, p4, v12, v15 = v_u_2(workspace, v18, v11, false, not p9)
		end
		local v19 = (v13 - p4).Magnitude
		if v17 then
			if p8 or not p10 and v17.CanCollide or p10 and p10(v17) then
				return v17, p4, v12, v15
			end
			table.insert(v11, v17)
		else
			p6 = p6 - v19
			v13 = p4
		end
		v14 = v14 + 1
	end
	return v17, p4, v12, v15
end
return {
	["RayIgnoreNonCollide"] = function(p21, p22, p23, p24, p25, p26, p27)
		-- upvalues: (copy) v_u_20
		return v_u_20(p21, p22, p23, false, p24, p25, p26, p27)
	end,
	["RayIgnoreNonCollideWithIgnoreList"] = function(p28, p29, p30, p31, p32, p33, p34)
		-- upvalues: (copy) v_u_20
		return v_u_20(p28, p29, p30, true, p31, p32, p33, p34)
	end
}
