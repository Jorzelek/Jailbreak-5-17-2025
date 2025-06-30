-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwJnbzFUZWxlcG9ydCBhIHBsYXllciBvciBzZXQgb2YgcGxheWVycyB0byBhIGxvY2F0aW9uDERlZmF1bHRBZG1pbgRUeXBlDGdhbWVMb2NhdGlvbgtEZXN0aW5hdGlvbhtUaGUgbG9jYXRpb24gdG8gdGVsZXBvcnQgdG8IT3B0aW9uYWwHcGxheWVycwRGcm9tF1RoZSBwbGF5ZXJzIHRvIHRlbGVwb3J0AAEFAAABAgApowAAAOIABABvAQUAMAEAugAAAABvAQYAMAEA4gEAAABvAQcAMAEAxAIAAAD/AQAAAgAAAOICCQBvAwoAMAMCEQgAAABvAwsAMAMCugAAAABvAwwAMAMC4gEAAADiAw4AbwQPADAEAxEIAAAAbwQQADAEA7oAAAAAbwQRADAEA+IBAAAAqQQBADAEA3ENAAAAxQECAwEAAAAwAQDbAwAAAIIAAgASAwEDAgMDAwQFBAABAgMDBQMGAwcDCAUDCAABAwkDCgMLAwwFBAgAAQ0DDQMOAw8AAQABGAABAQAAAQAAAQAAAQABAQAAAQAAAQAAAgEAAAEAAAEAAAEAAAAA9gAAAQAAAAAAEUnSqamnoBUjjbg9wLC9nRYeF9pIk+eIfH86Ekh4EvBY0b4qU8uDFg==

-- Decompiled by Krnl

local v1 = {
	["Name"] = "go",
	["Description"] = "Teleport a player or set of players to a location",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "gameLocation",
			["Name"] = "Destination",
			["Description"] = "The location to teleport to"
		},
		{
			["Type"] = "players",
			["Name"] = "From",
			["Description"] = "The players to teleport",
			["Optional"] = true
		}
	}
}
return v1
