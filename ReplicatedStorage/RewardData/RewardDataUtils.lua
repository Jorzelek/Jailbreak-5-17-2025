-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQEnZhbGlkYXRlUmV3YXJkRGF0YQhSYXJpdHlJZBNBYnNvbHV0ZVByb2JhYmlsaXR5K2FkZEFic29sdXRlUHJvYnNUb1Jld2FyZERhdGFGcm9tUmFyaXR5UHJvYnMaSW52YWxpZCByYXJpdHkgcHJvYmFiaWxpdHkGYXNzZXJ0BWVycm9yGk5vIGl0ZW1zIG9mIHJhcml0eSBleGlzdDogBHdhcm4QSXRlbXMgb2YgcmFyaXR5ICggZXhpc3QgYnV0IHRoYXQgcmFyaXR5IGhhcyAwIHByb2JhYmlsaXR5BG1hdGgDYWJzJEludmFsaWQgdG90YWwgcmFyaXR5IHByb2JhYmlsaXRpZXM6IBtObyBwcm9iYWJpbGl0eSBmb3IgcmFyaXR5OiBAUmFyaXR5IGhhcyAwIHByb2JhYmlsaXR5IGJ1dCBhIHJld2FyZCB3aXRoIGdpdmVuIHJhcml0eSBleGlzdHM6IAADCwIBAAAANPsDAABNAgPIAAAAAFIDAABSBAEAnwIDAf8CAAAAAAAAUgMAAMYEAADGBQAAZAMNAE0JB/MBAAAAhwgCCSsIBABNCAfzAQAAAIwJAABqCQIITQgH8wEAAACHCQIIlQkJAmoJAghuA/L/AgAAAP8DAAAAAAAAUgQBAMYFAADGBgAAZAQFAIcJAgcOCQMAhwoCB+wJCApqCQMHbgT6/wIAAABSBAAAxgUAAMYGAABkBAUATQoI8wEAAACHCQMKMAkISAMAAABuBPr/AgAAAIIAAQAEAwEDAgIAAAAAAADwPwMDAAYEARgAAAAAAAACAAEAAAABAAAAAQAAAAIAAAAA/AAGAAIAAAABAAEAAP4ABgAAAAEAAAEA/gAEBwAAAAAQAgAAAABy/wIAAAAAAABSAwAAxgQAAMYFAABkAw0ATQkH8wAAAACHCAIJKwgEAE0IB/MAAAAAjAkAAGoJAghNCAfzAAAAAIcJAgiVCQkBagkCCG4D8v8CAAAA/wMAAAAAAACMBAAAUgUBAMYGAADGBwAAZAUqAKkLAACMDAAAfQwGAAkAAACMDGQA1AkCAAwAAACpCwABqQsBAIEBCwQCAAAAbwwCAKQKBAAAADBAnwoDAQ0JCQAFAAAAhwoCCCsKBgCkCgcAAABgQG8MCABSDQgAcwsMDZ8KAgGHCgIIDgoJAA0JCAAFAACApAoKAAAAkEBvDAsAUg0IAG8ODABzCwwOnwoCAYcKAggOCgQAhwsCCOwKCQtqCgMIQwQECW4F1f8CAAAAeAYEDbsCBgKkBRAAADzggJ8FAgJvBhEAYAYHAAUAAACkBQcAAABgQG8HEgBSCAQAcwYHCJ8FAgFSBQAAxgYAAMYHAABkBRUATQsJ8wAAAACHCgMLTQsJ8wAAAAArCgcApAwHAAAAYEBvDhMAUg8LAHMNDg+fDAIBZQAIAA0KBwAFAACApAwKAAAAkEBvDhQAUg8LAHMNDg+fDAIBbgXq/wIAAACCAAEAFQMCAgAAAAAAAPA/AwUDBgQAADBAAgAAAAAAAAAAAwcEAABgQAMIAwkEAACQQAMKAwsCAAAAAAAAWUADDAMNBAA84IACLUMc6+I2Gj8DDgMPAxAAHQEBGAAAAQAAAAEAAAABAAAAAgAAAAD8AAYAAgIAAAABAAAAAAAAAAAAAAAAAAABAAAAAQAAAAAAAwAAAAEAAAAAAAADAAEAAAH0ABAAAAAAAAAAAQAAAAAAAwAAAAEAAAEAAQEAAAAAAAABAAEAAAAAAPoACR4AAAAAAgAAAQIAC6MAAAD/AAIAAAAAAMABAAASAAAAMAEAKAEAAADAAQIAMAEAyAMAAACCAAIABAYAAwQGAQMBAgABAQABGAABAAQAAAAXAAAqAQAAAAAC9zAlNUvMo8PF9E+hDRct7AxtTd9py4kNndbiwbtIg0dnGYss+9OsYg==

-- Decompiled by Krnl

local v_u_24 = {
	["addAbsoluteProbsToRewardDataFromRarityProbs"] = function(p1, p2)
		-- upvalues: (copy) v_u_24
		v_u_24.validateRewardData(p1, p2)
		local v3 = {}
		for _, v4 in p1 do
			if not v3[v4.RarityId] then
				v3[v4.RarityId] = 0
			end
			local v5 = v4.RarityId
			v3[v5] = v3[v5] + 1
		end
		local v6 = {}
		for v7, v8 in p2 do
			if v3[v7] then
				v6[v7] = v8 / v3[v7]
			end
		end
		for _, v9 in p1 do
			v9.AbsoluteProbability = v6[v9.RarityId]
		end
	end,
	["validateRewardData"] = function(p10, p11)
		local v12 = {}
		for _, v13 in p10 do
			if not v12[v13.RarityId] then
				v12[v13.RarityId] = 0
			end
			local v14 = v13.RarityId
			v12[v14] = v12[v14] + 1
		end
		local v15 = {}
		local v16 = 0
		for v17, v18 in p11 do
			local v19
			if v18 >= 0 then
				v19 = v18 <= 100
			else
				v19 = false
			end
			assert(v19, "Invalid rarity probability")
			if v18 ~= 0 and not v12[v17] then
				error("No items of rarity exist: " .. v17)
			end
			if v12[v17] and v18 == 0 then
				warn("Items of rarity " .. v17 .. " exist but that rarity has 0 probability")
			end
			if v12[v17] then
				v15[v17] = v18 / v12[v17]
				v16 = v16 + v18
			end
		end
		local v20 = v16 - 100
		if math.abs(v20) > 0.0001 then
			error("Invalid total rarity probabilities: " .. v16)
		end
		for _, v21 in p10 do
			local v22 = v15[v21.RarityId]
			local v23 = v21.RarityId
			if v22 then
				if v22 == 0 then
					warn("Rarity has 0 probability but a reward with given rarity exists: " .. v23)
				end
			else
				error("No probability for rarity: " .. v23)
			end
		end
	end
}
return v_u_24
