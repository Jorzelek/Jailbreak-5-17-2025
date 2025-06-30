-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMCBXBhaXJzD2NvbWJpbmVSZWR1Y2VycwADCwIBAAAAE0cAAwAAAACA/wAAAAAAAAD/AgAAAAAAAKQDAQAAAABA+wQAAJ8DAgQXAwUAUggHAIcJAAZSCgEAnwgDAmoIAgZuA/r/AgAAAIICAgACAwEEAAAAQAAFAAEYAAABAAMAAgAAAAACAAAAAP4ABQcAAAAAAgEAAAAAA9kBAAASAAAAggECAAABAAQCARgAAAAFAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgEBAQEAARgAAxIBAAAAAAL4V1Ka2458OcqTOA7B7XRaNkMJH7OQFmphdwvA7QmN9Xj+/AL0y5bg

-- Decompiled by Krnl

return function(p_u_1)
	return function(p2, p3)
		-- upvalues: (copy) p_u_1
		local v4 = p2 == nil and {} or p2
		local v5 = {}
		for v6, v7 in pairs(p_u_1) do
			v5[v6] = v7(v4[v6], p3)
		end
		return v5
	end
end
