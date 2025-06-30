-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBG1hdGgGcmFuZG9tCHRvc3RyaW5nA1J1bgROYW1lB0FsaWFzZXMLRGVzY3JpcHRpb24FR3JvdXAEQXJncwRyYW5kK1JldHVybnMgYSByYW5kb20gbnVtYmVyIGJldHdlZW4gbWluIGFuZCBtYXgLRGVmYXVsdFV0aWwEVHlwZQdpbnRlZ2VyDEZpcnN0IG51bWJlcpYBSWYgc2Vjb25kIG51bWJlciBpcyBuaWwsIHJhbmRvbSBudW1iZXIgaXMgYmV0d2VlbiAxIGFuZCB0aGlzIHZhbHVlLiBJZiBzZWNvbmQgbnVtYmVyIGlzIHByb3ZpZGVkLCBudW1iZXIgaXMgYmV0d2VlbiB0aGlzIG51bWJlciBhbmQgdGhlIHNlY29uZCBudW1iZXIuCE9wdGlvbmFsDVNlY29uZCBudW1iZXIQVGhlIHVwcGVyIGJvdW5kLgACBwMAAAAAEA4CBgCkBAIAAAQAgFIFAQBSBgIAnwQDAisEBACkBAIAAAQAgFIFAQCfBAICuz8EAqQDBAAAADBAnwMCAoIDAgAFAwEDAgQABACAAwMEAAAwQAAUBAEYAAAAAAAAAAAAAAAAAAAAABUAAAAABQAAAQIAMKMAAADiAAYAbwEHADABALoAAAAA/wEAAAAAAAAwAQAnAQAAAG8BCAAwAQDiAgAAAG8BCQAwAQDEAwAAAP8BAAACAAAA4gILAG8DDAAwAwIRCgAAAG8DDQAwAwK6AAAAAG8DDgAwAwLiAgAAAOIDEABvBAwAMAQDEQoAAABvBBEAMAQDugAAAABvBBIAMAQD4gIAAACpBAEAMAQDcQ8AAADFAQIDAQAAADABANsEAAAAwAETADABABYFAAAAggACABQDBQMGAwcDCAMJAwQFBgABAgMEBQMKAwsDDAMNBQMKAAIDDgMPAxADEQUECgACDwMSAxMGAAEAAQABGAAAAQAAAQAAAAEAAAEAAAEAAQEAAAEAAAEAAAIBAAABAAABAAABAAAAAPYADgAAAAEAAAAAAcdPtxxybWJJ9YvdiCZQ1585blIWNvo+FlolItw09esB2CEeEWml4cU=

-- Decompiled by Krnl

local v4 = {
	["Name"] = "rand",
	["Aliases"] = {},
	["Description"] = "Returns a random number between min and max",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "integer",
			["Name"] = "First number",
			["Description"] = "If second number is nil, random number is between 1 and this value. If second number is provided, number is between this number and the second number."
		},
		{
			["Type"] = "integer",
			["Name"] = "Second number",
			["Description"] = "The upper bound.",
			["Optional"] = true
		}
	},
	["Run"] = function(_, p1, p2)
		local v3 = p2 and math.random(p1, p2) or math.random(p1)
		return tostring(v3)
	end
}
return v4
