-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJBHR5cGUFdGFibGUEbmV4dAxnZXRtZXRhdGFibGUMc2V0bWV0YXRhYmxlDVRhYmxlRGVlcENvcHkLVGFibGVDb25jYXQIRGVlcENvcHkGQ29uY2F0AAMLAQEAAAAnuygAA1ICAACkAQEAAAAAQJ8BAgLGAgAA8AEeAAIAAID/AgAAAAAAAKQDBAAAADBAUgQAAMYFAABkAwcA+wgAAFIJBgCfCAIC+wkAAFIKBwCfCQICagkCCG4D+P8CAAAAUgQCAPsFAAC7PAADUgcAAKQGBgAAAFBAnwYCAp8FAgBMPQACpAMIAAAAcECfAwABggICAFICAACCAgIACQMBBAAAAEADAgMDBAAAMEADBAQAAFBAAwUEAABwQAACBgEYAAAAAAABAQABAAEAAAAAAQAAAAAAAP8AAwAAAAAAAAAAAAAAAAICAwAAAAAHAgAAAAAKjAQBABwCAQCMAwEAqAIFABwGAACVBQYAhwYBBGoGAAWLAvv/ggACAAECAAAAAAAA8D8AEAcBGAAAAAABAAAA/wMRAAAAAAMAAAECAAqjAAAAwAAAABIAAADAAQEA4gIEADAAAoUCAAAAMAECOgMAAACCAgIABQYABgEDCAMJBQICAwIAAQEAARgAAQAOBwEAAQAAAQAAAAACu85QN2nf5v+JCjqjNiRs+hWaWSxzL6NO+S0qku6/kPkL9EhP9fFaMQ==

-- Decompiled by Krnl

local function v_u_7(p1)
	-- upvalues: (copy) v_u_7
	if type(p1) ~= "table" then
		return p1
	end
	local v2 = {}
	for v3, v4 in next, p1 do
		v2[v_u_7(v3)] = v_u_7(v4)
	end
	local v5 = v_u_7
	local v6 = getmetatable(p1)
	setmetatable(v2, v5(v6))
	return v2
end
return {
	["DeepCopy"] = v_u_7,
	["Concat"] = function(p8, p9)
		for v10 = 1, #p9 do
			p8[#p8 + 1] = p9[v10]
		end
		return p8
	end
}
