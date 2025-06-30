-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQDFNlZ21lbnRzQnlJZAlTZWdtZW50SWQGTGVuZ3RoDFNlZ21lbnRzTmV4dAJJZAtCcmFuY2hJbmRleBBDYWxjdWxhdGVTZWdtZW50FkNhbGN1bGF0ZURpc3RhbmNlQWhlYWQCQ0YHVmVjdG9yMwNuZXcBcBFDYWxjdWxhdGVQb3NpdGlvbgVTcGVlZAZPZmZzZXQJTW92ZVRyYWluAAUGAgAAAAAnTQMA4AAAAABNBABTAQAAAIcCAwRNAwKtAgAAAGABBAADAAAAUgMCAFIEAQCCAwMATQMCrQIAAAB9AxEAAQAAAE0EAOsDAAAATQUClAQAAACHAwQFDgMOAE0EAq0CAAAAJgEBBE0FAkoFAAAAhwQDBU0FAOAAAAAAhwIFBGUAAwBSAwIAUgQBAIIDAwBIAOj/UgMCAFIEAQCCAwMABgMBAwIDAwMEAwUDBgACBwEYAAAAAAABAAAAAQAAAwAAAAEAAAAAAQMAAAEAAAEAAAACAAD2DQAAAwAAAAARBQAAAABFmgEDAAMAAAAmBQQCggUCAFIFAQBNBwDgAAAAAIcGBwVNCAatAQAAACYHCAKMCgEAjAgDAIwJAQCoCBQATQwA6wIAAACHCwwFKwsCAKkMAACCDAIATQwGSgMAAACHBQsMTQwA4AAAAACHBgwFmgUDAAMAAABDDAcEggwCAE0MBq0BAAAAQwcHDIsI7P9SCAMATQoA4AAAAACHCQoITQsJrQEAAAAmCgsEjA0BAIwLAwCMDAEAqAsVAE0PAOsCAAAAhw4PCCsOAgCpDwAAgg8CAE0PCUoDAAAAhwgOD00PAOAAAAAAhwkPCJoIBAABAAAAORAKACYPEAKCDwIATQ8JrQEAAABDCgoPiwvr/6kLAACCCwIABAMBAwMDBAMGABYIARgAAAIAAgEAAAEAAAEAAAABAAABAQACAAABAAABAAIAAgAA9Q4BAAABAAABAAAAAQAAAQEAAgAAAQAAAQACAAACAAD1DQAXAAAAAAwCAQAABwAAAQgGEQEY+wIAAFIDAABSBAEAnwIDAw4CEQBNBAJgAAAAAIwHAACMCAAATQsCrQIAAABbCgsBJgkKA0w2AAKkBgUAABAwgJ8GBAIJBQQGTQcEkQYAAAAmBgQHggUDAKkEAACCBAIABwMJAgAAAAAAAOA/AwMDCgMLBAAQMIADDAA+DQEYAAAAAAEBAAEAAAAAAAAAAAAAAAAAAAIAPwAAAAAHAgEAAAARTQIALAAAAABNBABwAQAAAAkFAQJDAwQF+wQAAFIFAABSBgMAnwQDA00GBJQCAAAAMAYAUwMAAAAwBQBwAQAAAIIAAQAEAw4DDwMFAwIARhABGAAAAQAAAAIAAAABAAAAAQAKRwAAAAAFAAABAgARowAAAMAAAADAAQEAwAICABIAAADAAwMAEgAAAOIECAAwAATqBAAAADACBIQFAAAAMAEEZgYAAAAwAwR4BwAAAIIEAgAJBgAGAQYCBgMDBwMNAwgDEAUEBAUGBwQAAQIDAQABGAABFCgACAARAQABAAEAAQAAAQAAAAAEn7XH+qP/E0itca1uJkOPfOj3sKYCI4TR51fqiumUBiXJXvnI4GgmGw==

-- Decompiled by Krnl

local function v_u_6(p1, p2)
	local v3 = p1.SegmentsById[p1.SegmentId]
	if p2 < v3.Length then
		return v3, p2
	end
	while v3.Length <= p2 do
		local v4 = p1.SegmentsNext[v3.Id]
		if not v4 then
			return v3, p2
		end
		p2 = p2 - v3.Length
		local v5 = v4[v3.BranchIndex]
		v3 = p1.SegmentsById[v5]
	end
	return v3, p2
end
return {
	["CalculateSegment"] = v_u_6,
	["CalculatePosition"] = function(p7, p8)
		-- upvalues: (copy) v_u_6
		local v9, v10 = v_u_6(p7, p8)
		if not v9 then
			return false
		end
		local v11 = v9.CF
		local v12 = v9.Length * 0.5 - v10
		return v11 * Vector3.new(0, 0, v12), v11 - v11.p
	end,
	["CalculateDistanceAhead"] = function(p13, p14, p15, p16, p17)
		if p14 == p16 then
			return p17 - p15
		end
		local v18 = p13.SegmentsById[p14]
		local v19 = v18.Length - p15
		local v20 = p14
		for _ = 1, 3 do
			local v21 = p13.SegmentsNext[p14]
			if not v21 then
				return false
			end
			p14 = v21[v18.BranchIndex]
			v18 = p13.SegmentsById[p14]
			if p14 == p16 then
				return v19 + p17
			end
			v19 = v19 + v18.Length
		end
		local v22 = p13.SegmentsById[p16]
		local v23 = v22.Length - p17
		for _ = 1, 3 do
			local v24 = p13.SegmentsNext[p16]
			if not v24 then
				return false
			end
			p16 = v24[v22.BranchIndex]
			v22 = p13.SegmentsById[p16]
			if p16 == v20 then
				return -v23 - p15
			end
			v23 = v23 + v22.Length
		end
		return false
	end,
	["MoveTrain"] = function(p25, p26)
		-- upvalues: (copy) v_u_6
		local v27 = p25.Speed
		local v28, v29 = v_u_6(p25, p25.Offset + p26 * v27)
		p25.SegmentId = v28.Id
		p25.Offset = v29
	end
}
