-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOA1J1bgROYW1lB0FsaWFzZXMLRGVzY3JpcHRpb24FR3JvdXAEQXJncwRlY2hvAT0dRWNob2VzIHlvdXIgdGV4dCBiYWNrIHRvIHlvdS4LRGVmYXVsdFV0aWwEVHlwZQZzdHJpbmcEVGV4dAlUaGUgdGV4dC4AAgICAAAAAAGCAQIAAAAOAQEYAA8AAAAABAAAAQIAJqMAAADiAAYAbwEHADABALoAAAAA/wEAAAEAAABvAggAxQECAgEAAAAwAQAnAQAAAG8BCQAwAQDiAgAAAG8BCgAwAQDEAwAAAP8BAAABAAAA4gIMAG8DDQAwAwIRCwAAAG8DDgAwAwK6AAAAAG8DDwAwAwLiAgAAAMUBAgIBAAAAMAEA2wQAAADAARAAMAEAFgUAAACCAAIAEQMCAwMDBAMFAwYDAQUGAAECAwQFAwcDCAMJAwoDCwUDCwACAwwDDQMOBgABAAEAARgAAAEAAAEAAAAAAAABAAABAAABAAEBAAABAAABAAAAAPwACAAAAAEAAAAAAUGhjzKN7LRUc2Xlpu2WSS5k6saP9OcGCmdIz4y+G2K3Rd0s//YfJ2w=

-- Decompiled by Krnl

local v2 = {
	["Name"] = "echo",
	["Aliases"] = { "=" },
	["Description"] = "Echoes your text back to you.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Text",
			["Description"] = "The text."
		}
	},
	["Run"] = function(_, p1)
		return p1
	end
}
return v2
