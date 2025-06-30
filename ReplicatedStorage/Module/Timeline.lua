-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJBmFzc2VydAxzZXRtZXRhdGFibGUERGF0YQRTZXFpEEN1bXVsYXRpdmVTZXFBZ2UDbmV3BlVwZGF0ZRBHZXRUb3RhbExpZmVzcGFuB19faW5kZXgABAUBAQAAABu7AQADUgIAAKQBAQAAAABAnwECAf8CAwAAAAAA+wMAAJ49AgMDAAAApAEDAAAAIECfAQMCMAABxgQAAACMAgEAMAIBIwUAAACMAgAAMAIBQQYAAAATAwAAEwIDAIwDAACMBAAAnwIDAYIBAgAHAwEEAAAAQAMCBAAAIEADAwMEAwUAJwYBGAAAAAAAAQAAAAAAAAABAAEAAAEAAAEAAAAAASgAAAAADwIAAAAARE0CAEEAAAAATQMAxgEAAABNBAAjAgAAABwFAwBgBQMABAAAAKkFAQCCBQIAUgcEABwFAwCMBgEAqAUYAIcIAwcTCQgBtwEVAAIAAABgBBEABwAAAHgMBwOHCwMMEwoLAIwLAQB4DgcDhw0DDhMMDQGfCgMBEwoIAIwLAACMDAAAnwoDATAHACMCAAAAMAIAQQAAAABDAgIJiwXo/00EACMCAAAAhwUDBBMGBQEmAgIGQwcCBn0HCgABAAAAEwcFAIwIAQBSCQYAnwcDAZUEBAMwBAAjAgAAAKkHAQCCBwIAJggBAuwHCAYNBwcABAAAAA0HBQADAAAAEwgFAFIJBwAmCgECnwgDAakIAACCCAIABQMFAwMDBAIAAAAAAADwPwIAAAAAAAAAAAAxBwEYAAABAAEAAQAAAQACAAAAAQEBAAMAAgAAAAAAAAABAAAAAQABAALzDwABAQEBAAABAAAAAQEAAQACAAEAAAABAAAAAgAyAAAAAAgBAAAAAA6MAQAAjAQBAE0FAMYAAAAAHAIFAIwDAQCoAgYATQcAxgAAAACHBgcEEwUGAUMBAQWLAvr/ggECAAEDAwBXCAEYAAEAAAAAAAEAAAAA/wNYAAAAAAIAAAECABCjAAAA/wADAAAAAAAwAABuAAAAAMABAQASAAAAMAEA7wIAAADAAQMAMAEAJgQAAADAAQUAMAEAfgYAAACCAAIABwMJBgADBgYBAwcGAgMIAwABAgEAARgAJAABAAEAAAAKAAAmAAAIAQAAAAADau7fWo2wZOtYKrXO6HW5NWeaZVf0xYHBT8+YUOkxFPLhdzG8a8rO1w==

-- Decompiled by Krnl

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
	-- upvalues: (copy) v_u_1
	assert(p2)
	local v3 = v_u_1
	local v4 = setmetatable({}, v3)
	v4.Data = p2
	v4.Seqi = 1
	v4.CumulativeSeqAge = 0
	p2[1][1](0, 0)
	return v4
end
function v_u_1.Update(p5, p6)
	local v7 = p5.CumulativeSeqAge
	local v8 = p5.Data
	local v9 = p5.Seqi
	if #v8 < v9 then
		return true
	end
	for v10 = v9, #v8 do
		local v11 = v8[v10]
		local v12 = v11[2]
		if p6 < v7 then
			break
		end
		if v9 < v10 then
			v8[v10 - 1][1](1, v8[v10 - 1][2])
			v11[1](0, 0)
			p5.Seqi = v10
			p5.CumulativeSeqAge = v7
		end
		v7 = v7 + v12
	end
	local v13 = p5.Seqi
	local v14 = v8[v13]
	local v15 = v14[2]
	local v16 = v7 - v15
	if v16 + v15 <= p6 then
		v14[1](1, v15)
		p5.Seqi = v13 + 1
		return true
	else
		local v17 = (p6 - v16) / v15
		if v17 ~= 0 and v17 ~= 1 then
			v14[1](v17, p6 - v16)
		end
		return false
	end
end
function v_u_1.GetTotalLifespan(p18)
	local v19 = 0
	for v20 = 1, #p18.Data do
		v19 = v19 + p18.Data[v20][2]
	end
	return v19
end
return v_u_1
