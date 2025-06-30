-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwp2ZWhpY2xlQmFuM0JhbiBvciB1bmJhbiB0aGUgdXNhZ2Ugb2YgYSBwYXJ0aWN1bGFyIHZlaGljbGUgbWFrZQJPcARUeXBlDHZlaGljbGVNYWtlcwVtYWtlcyFUaGUgdmVoaWNsZSBtYWtlcyB0byBiYW4gb3IgdW5iYW4HYm9vbGVhbgdlbmFibGVkGnRydWUgKGJhbikgLyBmYWxzZSAodW5iYW4pAAEFAAABAgAmowAAAOIABABvAQUAMAEAugAAAABvAQYAMAEA4gEAAABvAQcAMAEAxAIAAAD/AQAAAgAAAOICCQBvAwoAMAMCEQgAAABvAwsAMAMCugAAAABvAwwAMAMC4gEAAADiAwkAbwQNADAEAxEIAAAAbwQOADAEA7oAAAAAbwQPADAEA+IBAAAAxQECAwEAAAAwAQDbAwAAAIIAAgAQAwEDAgMDAwQFBAABAgMDBQMGAwcDCAUDCAABAwkDCgMLAwwDDQMOAAEAARgAAQEAAAEAAAEAAAEAAQEAAAEAAAEAAAIBAAABAAABAAAAAPcAAAEAAAAAAIYykg6heVZqtPb4mrAr3s7OrvaimDVcfWIlfd9rMQ41nziDAOKTEF0=

-- Decompiled by Krnl

local v1 = {
	["Name"] = "vehicleBan",
	["Description"] = "Ban or unban the usage of a particular vehicle make",
	["Group"] = "Op",
	["Args"] = {
		{
			["Type"] = "vehicleMakes",
			["Name"] = "makes",
			["Description"] = "The vehicle makes to ban or unban"
		},
		{
			["Type"] = "boolean",
			["Name"] = "enabled",
			["Description"] = "true (ban) / false (unban)"
		}
	}
}
return v1
