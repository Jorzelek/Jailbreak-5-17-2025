-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQEG1pc3NpbmcgcG9zaXRpb24GYXNzZXJ0CU1hZ25pdHVkZRxkaXJlY3Rpb24gaXMgbm90IHVuaXQgbGVuZ3RoFmxlbmd0aCBpcyBub3Qgbm9uIHplcm8WcmFkaXVzIGlzIG5vdCBub24gemVybw1SYXljYXN0UGFyYW1zA25ldxpGaWx0ZXJEZXNjZW5kYW50c0luc3RhbmNlcwl3b3Jrc3BhY2UKU3BoZXJlY2FzdAhJbnN0YW5jZQpDYW5Db2xsaWRlBXRhYmxlBmluc2VydApjb2xsaWRhYmxlAAIPBgAAAAsIAAAFBggCCAKHhWCBAQAFAAAAAFIHAABvCAAApAYCAAAAEECfBgMBTQkCqgQAAAB4CAkDbwkFANQIAgAJAAAAqQcAAakHAQCBAQcEBgAAAG8IBgCkBgIAAAAQQJ8GAwGMCAAAtwgCAAMAAACpBwABqQcBAIEBBwQHAAAAbwgHAKQGAgAAABBAnwYDAYwIAAC3CAIAAQAAAKkHAAGpBwEAgQEHBAgAAABvCAgApAYCAAAAEECfBgMBKwQEAKQGCwAAKJCAnwYBAlIEBgArBAEAggABAE0GBH0MAAAAjAcAAMYIAABvCQUAfQknAAMAAACMCQoAfQckAAkAAACkCQ4AAADQQFILAABSDAEACQ0CA1IOBAC8CQlYDwAAAJ8JBgJSCAkADggYAA4FBQBSCQUATQoI9BAAAACfCQICKwkSACsFBQBNCgj0EAAAAE0JCtMRAAAAKwkMAE0LCPQQAAAAnjQGBAsAAABSCgYApAkUAABMIIGfCQMBMAYEfQwAAACVBwcDSADX/4IIAgAVAwEDAgQAABBAAgAAAAAAAPA/AwMC/Knx0k1iUD8DBAMFAwYDBwMIBAAokIADCQMKBAAA0EADCwMMAw0DDgMPBABMIIEABRABGAAAAAAAAAABAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAQAAAAAAAAAAAAACAQAAAAMBAgACAQEAAAAAAAEAAAAAAAAAAAABAwEAAAAAAAEAAAAACQAAAAAAAAAEAAHrFw0AAAAAAgAAAQIAB6MAAAD/AAEAAAAAAMABAAAwAQCaAQAAAIIAAgACBgADEAEAAQABGAABAAMAADEBAAAAAAECe/REDG3qEzC/ntAmpzvblsqUF8E3xkv3C5jwId5cjsKT61i7F9bp

-- Decompiled by Krnl

return {
	["collidable"] = function(p1, p2, p3, p4, p5, p6)
		assert(p1, "missing position")
		local v7 = p3.Magnitude - 1 <= 0.001
		assert(v7, "direction is not unit length")
		local v8 = p4 > 0
		assert(v8, "length is not non zero")
		local v9 = p2 > 0
		assert(v9, "radius is not non zero")
		local v10 = p5 or RaycastParams.new()
		if not v10 then
			return
		end
		local v11 = v10.FilterDescendantsInstances
		local v12 = 0
		local v13 = nil
		while p4 >= 0.001 and v12 <= 10 do
			v13 = workspace:Spherecast(p1, p2, p3 * p4, v10)
			if not v13 or p6 and p6(v13.Instance) or not p6 and v13.Instance.CanCollide then
				break
			end
			local v14 = v13.Instance
			table.insert(v11, v14)
			v10.FilterDescendantsInstances = v11
			v12 = v12 + 1
		end
		return v13
	end
}
