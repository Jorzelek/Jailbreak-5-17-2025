-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMHBWVycm9yM0luaXRpYWwgZ3Vlc3NlcyBoYXZlIHRoZSBzYW1lIHNpZ24sIGludmFsaWQgYSBhbmQgYgRtYXRoA2FicxhyZWd1bGFGYWxzaVdpdGhFbmRwb2ludHMyQ291bGQgbm90IGZpbmQgdmFsaWQgZW5kcG9pbnRzIHdpdGggb3Bwb3NpdGUgc2lnbnMLcmVndWxhRmFsc2kAAxEFAAAAAFKQAwMAkAQEAcYFAADGBgAAjAcAAFIIAABSCQEAnwgCAlIJAABSCgIAnwkCAg0IAgACAACAggECAA0JAgACAACAggICAFILAABSDAEAnwsCAlIMAABSDQIAnwwCAgkKCwyMCwAAYAsFAAoAAACkCgQAAAAwQG8LBQCfCgIBjAwBAFIKBACMCwEAqAouAAkOCAIJDwkBJg0ODyYOCAnsBg0OJg4CAbsCDgKkDQgAABxggJ8NAgJDEAIBuwIQAqQPCAAAHGCAnw8CAgkOAw+3DR0ADgAAAFINAABSDgYAnw0CAlIFDQAJDQUJjA4AAGAOCAANAAAAUgIGAFIJBQANBwIACQAAgD4ICAqMB///ZQAMAAkNCAWMDgAAYA4KAA0AAABSAQYAUggFAA0HAgALAACAPgkJCowHAQBlAAEAggYCAIsK0v+CBgIADAIWVueerwPSPAIAAAAAAECPQAIAAAAAAAAAAAMBBAAAMEADAgMDAwQEABxggAIAAAAAAADwvwIAAAAAAAAAQAIAAAAAAADwPwAFBQEYAAECAAEBAAABAAABAAECAAECAAAAAAAAAAAAAQAAAAIAAAABAAAAAAEAAAAAAAAAAAAAAAADAAAAAQAAAAEBAQABAgABAAAAAQEBAAECAALrGAYAAAAADAMBAAAAL4wDAACMBAEAjAcBAIwFFACMBgEAqAURAFIJAABSCgMAnwkCAlIKAABSCwQAnwoCAgkICQqMCQAA1AgIAAkAAAANAwMAAAAAgIwD//9lAAIAWwQEAVsDAwGLBe//UgYAAFIHAwCfBgICUgcAAFIIBACfBwICCQUGB4wGAABgBgUABQAAAKQFAwAAACBAbwYEAJ8FAgH7BgAATQUG0gUAAABSBgAAUgcDAFIIBABSCQEAUgoCAJ8FBgCCBQAABgIAAAAAAAAAAAIAAAAAAAAAQAMBBAAAIEADBgMFADAHARgAAQEAAAABAAAAAAAAAAAAAwABAAIB+AsAAAAAAAAAAAABAAAAAgAAAAAAAAAAADEAAAAAAgAAAQIAC6MAAAD/AAIAAAAAAMABAAAwAQDSAQAAAMABAgASAAAAMAEAggMAAACCAAIABAYAAwUGAQMHAgABAQABGAABAAMAACsAAAATAQAAAAACEW600OqF748jqt5E8GCTy3m9OZRUAQdRXIdQi1BzXXGO9w+Dn8jmKA==

-- Decompiled by Krnl

local v_u_21 = {
	["regulaFalsiWithEndpoints"] = function(p1, p2, p3, p4, p5)
		local v6 = p4 or 1e-15
		local v7 = p5 or 1000
		local v8 = nil
		local v9 = 0
		local v10 = p1(p2)
		local v11 = p1(p3)
		if v10 == 0 then
			return p2
		end
		if v11 == 0 then
			return p3
		end
		if p1(p2) * p1(p3) > 0 then
			error("Initial guesses have the same sign, invalid a and b")
		end
		for _ = 1, v7 do
			v8 = (v10 * p3 - v11 * p2) / (v10 - v11)
			local v12 = p3 - p2
			local v13 = math.abs(v12)
			local v14 = p3 + p2
			if v13 < v6 * math.abs(v14) then
				break
			end
			local v15 = p1(v8)
			if v15 * v11 > 0 then
				if v9 == -1 then
					v10 = v10 / 2
				end
				v11 = v15
				p3 = v8
				v9 = -1
			else
				if v10 * v15 <= 0 then
					break
				end
				if v9 == 1 then
					v11 = v11 / 2
				end
				p2 = v8
				v10 = v15
				v9 = 1
			end
		end
		return v8
	end,
	["regulaFalsi"] = function(p16, p17, p18)
		-- upvalues: (copy) v_u_21
		local v19 = 0
		local v20 = 1
		for _ = 1, 20 do
			if p16(v19) * p16(v20) <= 0 then
				break
			end
			if v19 == 0 then
				v19 = -1
			else
				v20 = v20 * 2
				v19 = v19 * 2
			end
		end
		if p16(v19) * p16(v20) > 0 then
			error("Could not find valid endpoints with opposite signs")
		end
		return v_u_21.regulaFalsiWithEndpoints(p16, v19, v20, p17, p18)
	end
}
return v_u_21
