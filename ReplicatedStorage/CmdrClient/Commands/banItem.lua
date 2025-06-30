-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwdiYW5JdGVtEUJhbi91bmJhbiBhbiBpdGVtAk9wBFR5cGUEdG9vbARpdGVtGlRoZSBpdGVtIHRvIGdpdmUgcGxheWVyKHMpB2Jvb2xlYW4IaXNCYW5uZWQkVHJ1ZSB0byBiYW4gdGhlIGl0ZW0sIGZhbHNlIHRvIHVuYmFuAAEFAAABAgAmowAAAOIABABvAQUAMAEAugAAAABvAQYAMAEA4gEAAABvAQcAMAEAxAIAAAD/AQAAAgAAAOICCQBvAwoAMAMCEQgAAABvAwsAMAMCugAAAABvAwwAMAMC4gEAAADiAwkAbwQNADAEAxEIAAAAbwQOADAEA7oAAAAAbwQPADAEA+IBAAAAxQECAwEAAAAwAQDbAwAAAIIAAgAQAwEDAgMDAwQFBAABAgMDBQMGAwcDCAUDCAABAwkDCgMLAwwDDQMOAAEAARgAAQEAAAEAAAEAAAEAAQEAAAEAAAEAAAIBAAABAAABAAAAAPcAAAEAAAAAAPp5/KCQH8shyL2WNOQBPBAwM3H2a0nm3dJV6njqQTE9G7x5pAUsfBU=

-- Decompiled by Krnl

local v1 = {
	["Name"] = "banItem",
	["Description"] = "Ban/unban an item",
	["Group"] = "Op",
	["Args"] = {
		{
			["Type"] = "tool",
			["Name"] = "item",
			["Description"] = "The item to give player(s)"
		},
		{
			["Type"] = "boolean",
			["Name"] = "isBanned",
			["Description"] = "True to ban the item, false to unban"
		}
	}
}
return v1
