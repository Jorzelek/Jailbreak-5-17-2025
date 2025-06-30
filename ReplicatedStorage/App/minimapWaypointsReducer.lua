-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMXCHBvc2l0aW9uBHBhcnQYbWlzc2luZyBwb3NpdGlvbiBvciBwYXJ0BmFzc2VydAhwcmlvcml0eRBtaXNzaW5nIHByaW9yaXR5BG5hbWUMbWlzc2luZyBuYW1lBXRhYmxlBWNsb25lBnJlbW92ZQdtaW5EaXN0B21lc3NhZ2UGaW5zZXJ0C2FkZFdheXBvaW50FHJlbW92ZVdheXBvaW50QnlOYW1lFXJlbW92ZVdheXBvaW50Q3VycmVudARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVSb2R1eA1jcmVhdGVSZWR1Y2VyAAQKAgAAAAByqQMBAE0EAdsAAAAARwQHAAAAAIBNBAEkAQAAAEcEAgAAAACAqQMAAakDAQCBAQMEAgAAAG8EAgCkAgQAAAAwQJ8CAwFNBAHtBQAAAEcEAgAAAACAqQMAAakDAQCBAQMEBgAAAG8EBgCkAgQAAAAwQJ8CAwFNBAFaBwAAAEcEAgAAAACAqQMAAakDAQCBAQMECAAAAG8ECACkAgQAAAAwQJ8CAwGkAgsAACiQgFIDAACfAgICHAUCAIwDAQCMBP//qAMOAIcHAgVNBgdaBwAAAE0HAVoHAAAAmgYHAAcAAACkBg0AADCQgFIHAgBSCAUAnwYDAWUAAQCLA/L/xgAAABwEAgCVAwQOjAYBABwEAgCMBQEAqAQKAIcIAgZNBwjtBQAAAE0IAe0FAAAAYAgDAAcAAABSAwYAZQABAIsE9v/iBxEATQgB2wAAAAAwCAfbAAAAAE0IASQBAAAAMAgHJAEAAABNCAHtBQAAADAIB+0FAAAATQgBWgcAAAAwCAdaBwAAAE0JAasPAAAAkAgJEjAIB6sPAAAATQgBmBAAAAAwCAeYEAAAADQ0AgUDBwAAUgUCAFIGAwCkBBQAAEyQgJ8EBAGCAgIAFQMBAwIDAwMEBAAAMEADBQMGAwcDCAMJAwoEACiQgAMLBAAwkIACAAAAAAAA8D8DDAMNBQYAAQUHDxACAAAAAAAASEADDgQATJCAAAgPARgAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAEAAAACAAAAAQAAAAAAAAEAAAAAAf0GAQABAAAAAQAAAAAAAAIB/AcBAAAAAQAAAAEAAAABAAAAAQAAAAABAAAAAAAAAPoAAAgJAAAAAAkCAAAAACNNBAFaAAAAAEcEAgAAAACAqQMAAakDAQCBAQMEAQAAAG8EAQCkAgMAAAAgQJ8CAwGkAgYAABRAgFIDAACfAgICHAUCAIwDAQCMBP//qAMOAIcHAgVNBgdaAAAAAE0HAVoAAAAAmgYHAAcAAACkBggAABxAgFIHAgBSCAUAnwYDAYICAgCLA/L/ggICAAkDBwMIAwQEAAAgQAMJAwoEABRAgAMLBAAcQIAAJxABGAAAAAAAAAAAAAAAAAEAAAABAAAAAQAAAAAAAAEAAAAAAf0GKAAAAAAFAQAAAAAOpAECAAAEAIBSAgAAnwECAhwCAQCMAwAAYAMGAAIAAACkAgQAAAwAgFIDAQAcBAEAnwIDAYIBAgAFAwkDCgQABACAAwsEAAwAgAAzEQEYAAAAAAEAAAABAAAAAAI0AAAAAAYAAAECAByjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgCnBgAAAJ8BAgJNAgHWBwAAAP8DAAAAAAAA4gQLAMAFDAAwBQT2CAAAAMAFDQAwBQTACQAAAMAFDgAwBQQhCgAAAJ8CAwCCAgAADwMSBAAAAEADEwMUAxUEAABAQAMWAxcDDwMQAxEFAwgJCgYABgEGAgMAAQIBAAEYAAEAAAAAAAEAAAAABAAAAAABAAAfAAAMAADUAAEAAAAAA4yZCs/y1MtGvl1gW+sp6U1MgvYowpgbRQC6QEe2CRt/6lhQXp3MQeE=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["addWaypoint"] = function(p2, p3)
		local v4 = p3.position ~= nil and true or p3.part ~= nil
		assert(v4, "missing position or part")
		local v5 = p3.priority ~= nil
		assert(v5, "missing priority")
		local v6 = p3.name ~= nil
		assert(v6, "missing name")
		local v7 = table.clone(p2)
		for v8 = #v7, 1, -1 do
			if v7[v8].name == p3.name then
				table.remove(v7, v8)
				break
			end
		end
		local v9 = #v7 + 1
		for v10 = 1, #v7 do
			if v7[v10].priority > p3.priority then
				v9 = v10
				break
			end
		end
		local v11 = {
			["position"] = p3.position,
			["part"] = p3.part,
			["priority"] = p3.priority,
			["name"] = p3.name,
			["minDist"] = p3.minDist or 48,
			["message"] = p3.message
		}
		table.insert(v7, v9, v11)
		return v7
	end,
	["removeWaypointByName"] = function(p12, p13)
		local v14 = p13.name ~= nil
		assert(v14, "missing name")
		local v15 = table.clone(p12)
		for v16 = #v15, 1, -1 do
			if v15[v16].name == p13.name then
				table.remove(v15, v16)
				return v15
			end
		end
		return v15
	end,
	["removeWaypointCurrent"] = function(p17)
		local v18 = table.clone(p17)
		if #v18 > 0 then
			table.remove(v18, #v18)
		end
		return v18
	end
})
