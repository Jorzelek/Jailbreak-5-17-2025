-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBl9mcm9udA5GaW5kRmlyc3RDaGlsZAVWYWx1ZQVfYmFjawV0YWJsZQZpbnNlcnQGaXBhaXJzBFNpemUBWgZDRnJhbWUKTG9va1ZlY3RvcgtsaXN0U2VnbWVudAtsZW5ndGhDYWNoZQt0b3RhbExlbmd0aA5kaXJlY3Rpb25DYWNoZQtjb21wdXRlUmFpbBBjYWxjdWxhdGVTZWdtZW50CFBvc2l0aW9uEWNhbGN1bGF0ZVBvc2l0aW9uAAQSAgAAAACAAf8CAgAAAAAAqQMBAGoDAgCpAwEAagMCAf8DAAACAAAAUgQAAFIFAQDFAwQDAQAAAG8HAAC8BQEDAQAAAJ8FAwJNBAXsAgAAAG8IAwC8BgEDAQAAAJ8GAwJNBQbsAgAAAPEAAgAEAAAAqQYAAakGAQAOBgIAUgcFACsHAQBSBwQAhwgCBysIDACpCAEAaggCB540AwUHAAAAUgkDAFIKBwCkCAYAABRAgJ8IAwFSAAEAUgEHAEgA3v//BAAAAAAAAIwFAACkBggAAABwQFIHAwCfBgIEUQYMAE0MCi8JAAAATQsMewoAAABDBQULnjQEBQsAAABSDQQAUg4LAKQMBgAAFECAnwwDAW4G8/8CAACA/wYAAAAAAACMCQEAHAcDAIwIAQCoBywAhwoDCXgPCQuVDg8LHA8DAM8NDg+VDA0LhwsDDG8PAAC8DQoDAQAAAJ8NAwJNDA3sAgAAAG8QAwC8DgoDAQAAAJ8OAwJNDQ7sAgAAAMYOAACaCwYADAAAAE0PCoUMAAAATQ4PaA0AAABlAAkAmgsHAA0AAABNEAqFDAAAAE0PEGgNAAAAOQ4PAGUAAQBvDg4AnjQGBQ4AAABSEAYAUhEOAKQPBgAAFECAnw8DAYsH1P/iBxMAMAMHvQ8AAAAwBAdtEAAAADAFB+YRAAAAMAYH0hIAAACCBwIAFAMBAwIDAwMEAwUDBgQAFECAAwcEAABwQAMIAwkCAAAAAAAA8D8DCgMLBwAAAAAAAIA/AAAAAAAAAAADDAMNAw4DDwUEDxAREgAGEAEYAAABAAEAAgAAAAAAAgAAAAAAAQAAAAAAAQAAAAEAAAABAAMAAQAAAAAAAAEB9RoAAQEAAAAAAQAAAAEBAAAAAAAA/QAFAAEAAAABAQAAAAAAAgAAAAAAAQAAAAAAAgEAAQAAAAABAAEAAAAAAAQCAAAAAAAA7xYBAAEAAQABAAAIAAAAAAgCAAAAABZNAgDmAAAAAM8BAQKMBAEATQUAvQEAAAAcAgUAjAMBAKgCDABNBwBtAgAAAIcGBwQmBQEGjAYAAGAFBAAGAAAAUgYEAFIHAQCCBgMAUgEFAIsC9P+CAAEAAwMOAwwDDQBMEQEYAAAAAQAAAAAAAQAAAAEAAAEAAAL7B00AAAAADQMAAAAAEk0EAL0AAAAAhwMEAU0FAzsBAAAATQgA0gIAAACHBwgBTQwDLwQAAABNCwx7BQAAADkKCwBbCQoDQwgJAgkGBwhDBAUGggQCAAYDDAMSAw8CAAAAAAAA4D8DCAMJAFYTARgAAAABAAAAAAAAAAAAAAAAAABXAAAAAAIAAAECAA2jAAAA/wADAAAAAADAAQAAMAEA1wEAAADAAQIAMAEACgMAAADAAQQAMAEApAUAAACCAAIABgYAAxAGAQMRBgIDEwMAAQIBAAEYAAQAAQAARgAACgAABQEAAAAAA44dMEAsQbwVvNla1MR35czmaoGPqWJd2lR27y2rx6pIgEgvfJ9/lDI=

-- Decompiled by Krnl

return {
	["computeRail"] = function(p1, p2)
		local v3 = {
			[p1] = true,
			[p2] = true
		}
		local v4 = { p1, p2 }
		while true do
			local v5 = p2:FindFirstChild("_front").Value
			local v6 = p2:FindFirstChild("_back").Value
			if p1 == v5 then
				v5 = v6 or v5
			end
			if v3[v5] then
				local v7 = 0
				local v8 = {}
				for _, v9 in ipairs(v4) do
					local v10 = v9.Size.Z
					v7 = v7 + v10
					table.insert(v8, v10)
				end
				local v11 = {}
				for v12 = 1, #v4 do
					local v13 = v4[v12]
					local v14 = v4[(v12 - 1 + 1) % #v4 + 1]
					local v15 = v13:FindFirstChild("_front").Value
					local v16 = v13:FindFirstChild("_back").Value
					local v17
					if v14 == v15 then
						v17 = v13.CFrame.LookVector
					else
						v17 = v14 ~= v16 and Vector3.new(0, 1, 0) or -v13.CFrame.LookVector
					end
					table.insert(v11, v17)
				end
				return {
					["listSegment"] = v4,
					["lengthCache"] = v8,
					["totalLength"] = v7,
					["directionCache"] = v11
				}
			end
			v3[v5] = true
			table.insert(v4, v5)
			p1 = p2
			p2 = v5
		end
	end,
	["calculateSegment"] = function(p18, p19)
		local v20 = p19 % p18.totalLength
		for v21 = 1, #p18.listSegment do
			local v22 = v20 - p18.lengthCache[v21]
			if v22 < 0 then
				return v21, v20
			end
			v20 = v22
		end
	end,
	["calculatePosition"] = function(p23, p24, p25)
		local v26 = p23.listSegment[p24]
		return v26.Position + p23.directionCache[p24] * (-v26.Size.Z * 0.5 + p25)
	end
}
