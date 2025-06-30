-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwVzcGF3bh1TcGF3biB2ZWhpY2xlIG91dCBvZiB0aGluIGFpcgxEZWZhdWx0QWRtaW4EVHlwZQt2ZWhpY2xlTWFrZQRtYWtlIVRoZSBtYWtlIG9mIHRoZSB2ZWhpY2xlIHRvIHNwYXduLghPcHRpb25hbAdwbGF5ZXJzA0ZvcjdUaGUgcGxheWVycyB0byBzcGF3biB2ZWhpY2xlIGF0LCBhbmQgc2VhdCAob3IgeW91cnNlbGYpAAEFAAABAgApowAAAOIABABvAQUAMAEAugAAAABvAQYAMAEA4gEAAABvAQcAMAEAxAIAAAD/AQAAAgAAAOICCQBvAwoAMAMCEQgAAABvAwsAMAMCugAAAABvAwwAMAMC4gEAAADiAw4AbwQPADAEAxEIAAAAbwQQADAEA7oAAAAAbwQRADAEA+IBAAAAqQQBADAEA3ENAAAAxQECAwEAAAAwAQDbAwAAAIIAAgASAwEDAgMDAwQFBAABAgMDBQMGAwcDCAUDCAABAwkDCgMLAwwFBAgAAQ0DDQMOAw8AAQABGAABAQAAAQAAAQAAAQABAQAAAQAAAQAAAgEAAAEAAAEAAAEAAAAA9gAAAQAAAAAAvF0vSjKwtwyOmUXew2a7273+6ClGoyuJF+AbDSLz2+Sl7F5u4N3TSg==

-- Decompiled by Krnl

local v1 = {
	["Name"] = "spawn",
	["Description"] = "Spawn vehicle out of thin air",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "vehicleMake",
			["Name"] = "make",
			["Description"] = "The make of the vehicle to spawn."
		},
		{
			["Type"] = "players",
			["Name"] = "For",
			["Description"] = "The players to spawn vehicle at, and seat (or yourself)",
			["Optional"] = true
		}
	}
}
return v1
