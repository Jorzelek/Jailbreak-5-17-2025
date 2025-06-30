-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSBG5vb3AMVXNlUGFyZW50S2V5Am9mB0VsZW1lbnQGdHlwZW9mB2Jvb2xlYW4FdGFibGUFcGFpcnMFZXJyb3IQSW52YWxpZCBlbGVtZW50cw9pdGVyYXRlRWxlbWVudHMPZ2V0RWxlbWVudEJ5S2V5B3JlcXVpcmUGc2NyaXB0BlBhcmVudARUeXBlBlN5bWJvbAVuYW1lZAAFAQAAAAAAAsYAAACCAAIAAAAEAQEYAAAFAAAAAAIAAwAAAAv7AAAADgACAMYAAACCAAIAqQABAN4AAAD7AQEATQABzQAAAAD7AQIAggADAAEDAgAvAAEYAAABAAIAAQAAAAAwAAAAAAUBAwAAACn7AgAATQECvAAAAABSAgAAnwECAvsDAABNAgOXAQAAAJoBCQACAAAAqQIAANkDAAASAQL/EgIBABIAAADBAgAAggMCAMECAAC7LAADUgMAAKQCAwAAACBAnwICAkcAAwAAAAAA8AIDAAQAAID7AwIAggMCAPACBgAFAACApAMHAAAAYEBSBAAAnwMCAIIDAACkAwkAAACAQG8ECgCfAwIBggABAAsDAwMEAwUEAAAgQAMGAwcDCAQAAGBAAwkEAACAQAMKAQEoCwEYAAAAAAADAAAAAAECAAAAAAAACgAAAAACAAAAAQADAAEAAAAAAwAAAAEpAAAAAAUCAgAAACtHAAgAAAAAALssAANSAwAApAIBAAAAAECfAgIC8AIDAAIAAIDGAgAAggICAPsDAABNAgO8AwAAAFIDAACfAgIC+wQAAE0DBJcEAAAAmgIJAAMAAAD7AwEATQIDzQUAAACaAQIAAgAAAIIAAgDGAgAAggICALssAANSAwAApAIBAAAAAECfAgIC8AIDAAYAAICHAgABggICAKQCCAAAAHBAbwMJAJ8CAgGCAAEACgMFBAAAAEADBgMDAwQDAgMHAwkEAABwQAMKAE8MARgAAAAAAAAAAAABAAMAAAAAAAAAAAABAAAAAAEDAAMAAAAAAAABAAMAAAABUAAAAAAGAAABAgAoowAAAKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAhEFAAAAnwACAqQBAQAAAABApAQDAAAAIEBNAwQkBAAAAE0CA5MGAAAAnwECAsACBwD/AwMAAAAAAE0EAVEIAAAAbwUJAJ8EAgIwBAPNCQAAAMAECgASAAAAEgADABIAAgAwBANSCwAAAMAEDAASAAAAEgADADAEA2gNAAAAggMCAA4DDQQAAABAAw4EAAAgQAMPAxADEQYAAxIDAgYCAwsGAwMMAwACAwEAARgAAAAAAAAAAAAAAQAAAAAAAAAAAgQACQAAAAAAFwAAAAAAJwAAAAAUAQAAAAAE2JmXTMcN14HqXf3Yt9dKUYFryNY4VBA8iueLKHruaUSYrZMGUrZ1tg==

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Type)
local function v_u_2()
	return nil
end
local v_u_8 = {
	["UseParentKey"] = require(script.Parent.Symbol).named("UseParentKey"),
	["iterateElements"] = function(p_u_3)
		-- upvalues: (copy) v_u_1, (copy) v_u_8, (copy) v_u_2
		if v_u_1.of(p_u_3) == v_u_1.Element then
			local v_u_4 = false
			return function()
				-- upvalues: (ref) v_u_4, (ref) v_u_8, (copy) p_u_3
				if v_u_4 then
					return nil
				end
				v_u_4 = true
				return v_u_8.UseParentKey, p_u_3
			end
		end
		local v5 = typeof(p_u_3)
		if p_u_3 == nil or v5 == "boolean" then
			return v_u_2
		end
		if v5 == "table" then
			return pairs(p_u_3)
		end
		error("Invalid elements")
	end,
	["getElementByKey"] = function(p6, p7)
		-- upvalues: (copy) v_u_1, (copy) v_u_8
		if p6 == nil or typeof(p6) == "boolean" then
			return nil
		elseif v_u_1.of(p6) == v_u_1.Element then
			if p7 == v_u_8.UseParentKey then
				return p6
			else
				return nil
			end
		else
			if typeof(p6) == "table" then
				return p6[p7]
			end
			error("Invalid elements")
			return
		end
	end
}
return v_u_8
