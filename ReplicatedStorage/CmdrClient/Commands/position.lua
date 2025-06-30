-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMbCUNoYXJhY3RlchBIdW1hbm9pZFJvb3RQYXJ0DkZpbmRGaXJzdENoaWxkAAhQb3NpdGlvbgh0b3N0cmluZwIlcwRnc3ViCUNsaWVudFJ1bgRnYW1lB1BsYXllcnMKR2V0U2VydmljZQROYW1lB0FsaWFzZXMLRGVzY3JpcHRpb24FR3JvdXAEQXJncwhwb3NpdGlvbgNwb3NeUmV0dXJucyBWZWN0b3IzIHBvc2l0aW9uIG9mIHlvdSBvciBvdGhlciBwbGF5ZXJzLiBFbXB0eSBzdHJpbmcgaXMgdGhlIHBsYXllciBoYXMgbm8gY2hhcmFjdGVyLgxEZWZhdWx0RGVidWcEVHlwZQdEZWZhdWx0BnBsYXllcgZQbGF5ZXJBVGhlIHBsYXllciB0byByZXBvcnQgdGhlIHBvc2l0aW9uIG9mLiBPbWl0IGZvciB5b3VyIG93biBwb3NpdGlvbi4LTG9jYWxQbGF5ZXIAAgcCAAAABwAAAQMDFAIYTQIBaQAAAAAOAgUAbwUBALwDAgMCAAAAnwMDAisDAgBvAwMAggMCAE0FAmYBAAAATQQFOwQAAAC7PwQCpAMGAAAAUECfAwICbwUHAG8GAwC8AwPMCAAAAJ8DBACCAwAACQMBAwIDAwMEAwUDBgQAAFBAAwcDCAARCQEYAAACAAAAAAABAAMAAAAAAAAAAAAAAAAAEgAAAAAFAAABAgAwowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAuIBCgBvAgsAMAIBugQAAAD/AgAAAQAAAG8DDADFAgMCAQAAADACAScFAAAAbwINADACAeIGAAAAbwIOADACAcQHAAAA/wIAAAEAAADiAxEAbwQSADAEAxEPAAAAbwQTADAEA7oEAAAAbwQUADAEA+IGAAAATQQAMRUAAAAwBAM6EAAAAMUCAwIBAAAAMAIB2wgAAADAAhYAMAIBMwkAAACCAQIAFwMKBAAAAEADCwMMAw0DDgMPAxADEQMJBQYEBQYHCAkDEgMTAxQDFQMWAxcFBA8EBhADGAMZAxoDGwYAAQABAAEYAAAAAAAAAAIBAAABAAAAAAAAAQAAAQAAAQABAQAAAQAAAQAAAQAAAAAA+wAJAAAAAQAAAAABHMvl6mOdnEcuD49+4JQ3/dfWyAAGq+KxS87K7C/ej+R4THbNIF6H9w==

-- Decompiled by Krnl

local v4 = {
	["Name"] = "position",
	["Aliases"] = { "pos" },
	["Description"] = "Returns Vector3 position of you or other players. Empty string is the player has no character.",
	["Group"] = "DefaultDebug",
	["Args"] = {
		{
			["Type"] = "player",
			["Name"] = "Player",
			["Description"] = "The player to report the position of. Omit for your own position.",
			["Default"] = game:GetService("Players").LocalPlayer
		}
	},
	["ClientRun"] = function(_, p1)
		local v2 = p1.Character
		if not (v2 and v2:FindFirstChild("HumanoidRootPart")) then
			return ""
		end
		local v3 = v2.HumanoidRootPart.Position
		return tostring(v3):gsub("%s", "")
	end
}
return v4
