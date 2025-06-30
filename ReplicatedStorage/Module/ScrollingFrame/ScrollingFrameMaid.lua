-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQBVRhc2tzCEdpdmVUYXNrBXBhaXJzBHR5cGUIZnVuY3Rpb24GdHlwZW9mE1JCWFNjcmlwdENvbm5lY3Rpb24KZGlzY29ubmVjdAdEZXN0cm95CkRvQ2xlYW5pbmcHX19pbmRleApfX25ld2luZGV4CUluc3RhbmNlcwxzZXRtZXRhdGFibGUITWFrZU1haWQDbmV3AAYFAgAAAAAITQQARAEAAAAcAwQAlQIDAE0DAEQBAAAAagEDAoICAgACAgAAAAAAAPA/AwEAGAIBGAAAAAABAAABGQAAAAAJAQAAAAAkTQEARAAAAACkAgIAAAAQQFIDAQCfAgIEFwIaALsoBgNSCAYApAcEAAAAMECfBwIC8AcEAAUAAIBSBwYAnwcBAWUADgC7LAYDUggGAKQHBwAAAGBAnwcCAvAHBQAIAACAvAcG+gkAAACfBwIBZQADALwHBlAKAAAAnwcCAcYHAABqBwEFbgLl/wIAAACCAAEACwMBAwMEAAAQQAMEBAAAMEADBQMGBAAAYEADBwMIAwkAHQoBGAAAAQAAAAABAAAAAAAAAQAAAQAAAAAAAAEAAAACAAACAPgACh4AAAAABAIBAAAACvsDAACHAgMBDgIDAPsDAACHAgMBggICAE0DAEQAAAAAhwIDAYICAgABAwEALgsBGAAAAAEAAAIAAAAvAAAAAAYDAAAAACRNAwBEAAAAAEcCGwAAAACAhwUDAbsoBQKkBAIAAAAQQJ8EAgLwBBgAAwAAAIcEAwEOBBUAhwUDAbssBQKkBAUAAABAQJ8EAgLwBAYABgAAgIcEAwG8BAT6BwAAAJ8EAgFlAAkAhwQDAbwEBFAIAAAAnwQCAWUABACHBAMBDgQCAMYEAABqBAABagIDAYIAAQAJAwEDBAQAABBAAwUDBgQAAEBAAwcDCAMJADUMARgAAAEAAgAAAAAAAAAAAQAAAAAAAAEAAAAAAgAAAAADAAIAAgE2AAAAAAMAAQAAABDiAQIA/wIAAAAAAAAwAgFEAAAAAP8CAAAAAAAAMAIB5wEAAAD7AgAAnj0BAwIAAACkAAQAAAAwQJ8AAwKCAAIABQMBAw0FAgABAw4EAAAwQABIDwEYAAAAAAAAAAAAAAAAAAAAAEkAAAAABQAAAQIAHqMAAAD/AAIAAAAAAMYBAADiAgIAwAMDADADAv0AAAAAwAMEADADAlEBAAAATQMCUQEAAAAwAwJQBQAAAOIDCADABAkAEgACADAEA24GAAAAwAQKADAEA84HAAAAwAELABIAAwAwAQBxDAAAADABAO8NAAAAggACAA4DAgMKBQIAAQYABgEDCQMLAwwFAgYHBgIGAwYEAw8DEAUAAQIDBAEAARgAEgACAgEAAAUAAA4AAAACAQAAAAcAABMABQABAAIBAAAAAAXItU9W5KHunfpxJcKb981OayLCHBJuciOU22UiKlRZPl8Kuqthrnwl

-- Decompiled by Krnl

local v1 = {}
local v_u_9 = {
	["GiveTask"] = function(p2, p3)
		local v4 = #p2.Tasks + 1
		p2.Tasks[v4] = p3
		return v4
	end,
	["DoCleaning"] = function(p5)
		local v6 = p5.Tasks
		for v7, v8 in pairs(v6) do
			if type(v8) == "function" then
				v8()
			elseif typeof(v8) == "RBXScriptConnection" then
				v8:disconnect()
			else
				v8:Destroy()
			end
			v6[v7] = nil
		end
	end
}
v_u_9.Destroy = v_u_9.DoCleaning
local v_u_18 = {
	["__index"] = function(p10, p11)
		-- upvalues: (copy) v_u_9
		if v_u_9[p11] then
			return v_u_9[p11]
		else
			return p10.Tasks[p11]
		end
	end,
	["__newindex"] = function(p12, p13, p14)
		local v15 = p12.Tasks
		if p14 == nil then
			local v16 = v15[p13]
			if type(v16) ~= "function" and v15[p13] then
				local v17 = v15[p13]
				if typeof(v17) == "RBXScriptConnection" then
					v15[p13]:disconnect()
				else
					v15[p13]:Destroy()
				end
			end
		elseif v15[p13] then
			p12[p13] = nil
		end
		v15[p13] = p14
	end
}
local function v20()
	-- upvalues: (copy) v_u_18
	local v19 = v_u_18
	return setmetatable({
		["Tasks"] = {},
		["Instances"] = {}
	}, v19)
end
v1.MakeMaid = v20
v1.new = v20
return v1
