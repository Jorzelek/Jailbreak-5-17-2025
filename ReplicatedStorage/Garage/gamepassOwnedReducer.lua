-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRDGdhbWVwYXNzRW51bQZ0eXBlb2YGbnVtYmVyHUluY29ycmVjdCBnYW1lcGFzc0VudW0gcGFzc2VkBmFzc2VydA1nYW1lcGFzc093bmVkB2Jvb2xlYW4kSW5jb3JyZWN0IGdhbWVwYXNzT3duZWQgdmFsdWUgcGFzc2VkBXRhYmxlBWNsb25lEHNldEdhbWVwYXNzT3duZWQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgACBgIAAAAAKk0FAXIAAAAAuywFAqQEAgAAABBAnwQCAvAEAgADAAAAqQMAAakDAQCBAQMEBAAAAG8EBACkAgYAAABQQJ8CAwFNBQEMBwAAALssBQKkBAIAAAAQQJ8EAgLwBAIACAAAAKkDAAGpAwEAgQEDBAkAAABvBAkApAIGAAAAUECfAgMBpAIMAAAsoIBSAwAAnwICAk0DAXIAAAAATQQBDAcAAABqBAIDggICAA0DAQMCBAAAEEADAwMEAwUEAABQQAMGAwcDCAMJAwoEACyggAAGCwEYAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAABAAAAAQAAAAABBwAAAAAGAAABAgAWowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQIApwYAAACfAQICTQIB1gcAAAD/AwAAAAAAAOIECQDABQoAMAUE/ggAAACfAgMAggIAAAsDDAQAAABAAw0DDgMPBAAAQEADEAMRAwsFAQgGAAEAAQABGAABAAAAAAABAAAAAAIAAAAAAQAA/wABAAAAAAHTuKCXutBJteF8ygMimsaVbWVQXUoVscAPlt6r8/BF2uRgygMm0e7c

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer({}, {
	["setGamepassOwned"] = function(p2, p3)
		local v4 = p3.gamepassEnum
		local v5 = typeof(v4) == "number"
		assert(v5, "Incorrect gamepassEnum passed")
		local v6 = p3.gamepassOwned
		local v7 = typeof(v6) == "boolean"
		assert(v7, "Incorrect gamepassOwned value passed")
		local v8 = table.clone(p2)
		v8[p3.gamepassEnum] = p3.gamepassOwned
		return v8
	end
})
