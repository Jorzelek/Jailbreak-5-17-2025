-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMBmlwYWlycwlmcm9tQXJyYXkFZXJyb3IoYGZpcnN0YCBoYXMgbm9uemVybyBsZW5ndGgsIGlzIGl0IGEgc2V0Pylgc2Vjb25kYCBoYXMgbm9uemVybyBsZW5ndGgsIGlzIGl0IGEgc2V0PwVwYWlycwhzdWJ0cmFjdAlpbnRlcnNlY3QFdW5pb24Nc3ltbWV0cmljRGlmZiZgc2V0YCBoYXMgbm9uemVybyBsZW5ndGgsIGlzIGl0IGEgc2V0Pwd0b0FycmF5AAcIAQAAAAAM/wEAAAAAAACkAgEAAAAAQFIDAACfAgIEUQICAKkHAQBqBwEGbgL9/wIAAICCAQIAAgMBBAAAAEAAAwIBGAAAAQAAAAABAP8AAwQAAAAACQIAAAAAHBwCAAANAgUAAAAAAKQCAgAAABBAbwMDAJ8CAgEcAgEADQIFAAAAAACkAgIAAAAQQG8DBACfAgIB/wIAAAAAAACkAwYAAABQQFIEAACfAwIEFwMEAIcIAQYrCAIAqQgBAGoIAgZuA/v/AQAAAIICAgAHAgAAAAAAAAAAAwMEAAAQQAMEAwUDBgQAAFBAAAsHARgAAAABAAAAAgAAAQAAAAIAAQAAAAABAAEA/gAFDAAAAAAJAgAAAAAcHAIAAA0CBQAAAAAApAICAAAAEEBvAwMAnwICARwCAQANAgUAAAAAAKQCAgAAABBAbwMEAJ8CAgH/AgAAAAAAAKQDBgAAAFBAUgQAAJ8DAgQXAwQAhwgBBg4IAgCpCAEAaggCBm4D+/8BAAAAggICAAcCAAAAAAAAAAADAwQAABBAAwQDBQMGBAAAUEAAGggBGAAAAAEAAAACAAABAAAAAgABAAAAAAEAAQD+AAUbAAAAAAkCAAAAACMcAgAADQIFAAAAAACkAgIAAAAQQG8DAwCfAgIBHAIBAA0CBQAAAAAApAICAAAAEEBvAwQAnwICAf8CAAAAAAAApAMGAAAAUEBSBAAAnwMCBBcDAgCpCAEAaggCBm4D/f8BAAAApAMGAAAAUEBSBAEAnwMCBBcDAgCpCAEAaggCBm4D/f8BAAAAggICAAcCAAAAAAAAAAADAwQAABBAAwQDBQMGBAAAUEAAKQkBGAAAAAEAAAACAAABAAAAAgABAAAAAAEA/wADAAAAAAEA/wADKgAAAAAHAgEAAAAfHAIAAA0CBQAAAAAApAICAAAAEEBvAwMAnwICARwCAQANAgUAAAAAAKQCAgAAABBAbwMEAJ8CAgH7AwAATQIDmAUAAAD7BAAATQME2QYAAABSBAAAUgUBAJ8DAwL7BQAATQQF2QYAAABSBQEAUgYAAJ8EAwCfAgAAggIAAAcCAAAAAAAAAAADAwQAABBAAwQDBQMJAwcAOQoBGAAAAAEAAAACAAABAAAAAgAAAAAAAAAAAAAAAAAAAAA6AAAAAAkBAAAAABQcAQAADQEFAAAAAACkAQIAAAAQQG8CAwCfAQIB/wEAAAAAAACkAgUAAABAQFIDAACfAgIEFwIDABwIAQCVBwgGagUBB24C/P8BAAAAggECAAcCAAAAAAAAAAADAwQAABBAAwsDBgQAAEBAAgAAAAAAAPA/AEIMARgAAAABAAAAAgABAAAAAAEAAP8AA0MAAAAAAgAAAQIAF6MAAAD/AAQAAAAAAMABAAAwAQAFAQAAAMABAgAwAQDZAwAAAMABBAAwAQAOBQAAAMABBgAwAQCYBwAAAMABCAASAAAAMAEA4AkAAADAAQoAMAEAGQsAAACCAAIADAYAAwIGAQMHBgIDCAYDAwkGBAMKBgUDDAYAAQIDBAUBAAEYAAEAAQAACAAADwAADwAAEAAAAAkAAAoBAAAAAAbwcMVRSM3kbcK0r8WnCuxw83/blEdz1kXSA5b1YSEVWtlmyUnretjm

-- Decompiled by Krnl

local v_u_22 = {
	["fromArray"] = function(p1)
		local v2 = {}
		for _, v3 in ipairs(p1) do
			v2[v3] = true
		end
		return v2
	end,
	["subtract"] = function(p4, p5)
		if #p4 ~= 0 then
			error("`first` has nonzero length, is it a set?")
		end
		if #p5 ~= 0 then
			error("`second` has nonzero length, is it a set?")
		end
		local v6 = {}
		for v7 in pairs(p4) do
			if not p5[v7] then
				v6[v7] = true
			end
		end
		return v6
	end,
	["intersect"] = function(p8, p9)
		if #p8 ~= 0 then
			error("`first` has nonzero length, is it a set?")
		end
		if #p9 ~= 0 then
			error("`second` has nonzero length, is it a set?")
		end
		local v10 = {}
		for v11 in pairs(p8) do
			if p9[v11] then
				v10[v11] = true
			end
		end
		return v10
	end,
	["union"] = function(p12, p13)
		if #p12 ~= 0 then
			error("`first` has nonzero length, is it a set?")
		end
		if #p13 ~= 0 then
			error("`second` has nonzero length, is it a set?")
		end
		local v14 = {}
		for v15 in pairs(p12) do
			v14[v15] = true
		end
		for v16 in pairs(p13) do
			v14[v16] = true
		end
		return v14
	end,
	["symmetricDiff"] = function(p17, p18)
		-- upvalues: (copy) v_u_22
		if #p17 ~= 0 then
			error("`first` has nonzero length, is it a set?")
		end
		if #p18 ~= 0 then
			error("`second` has nonzero length, is it a set?")
		end
		return v_u_22.union(v_u_22.subtract(p17, p18), v_u_22.subtract(p18, p17))
	end,
	["toArray"] = function(p19)
		if #p19 ~= 0 then
			error("`set` has nonzero length, is it a set?")
		end
		local v20 = {}
		for v21 in pairs(p19) do
			v20[#v20 + 1] = v21
		end
		return v20
	end
}
return v_u_22
