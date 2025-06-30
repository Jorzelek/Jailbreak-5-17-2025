-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwtzZXRHYW1lcGFzcxxTZXQgeW91ciBnYW1lcGFzcyBvd25lcnNoaXAhDERlZmF1bHRBZG1pbgRUeXBlCGdhbWVwYXNzEEdhbWVwYXNzIHRvIGdpdmUHYm9vbGVhbgpzaG91bGRHaXZlHVRydWUgaWYgZ2l2ZSwgZmFsc2UgaWYgcmVtb3ZlAAEFAAABAgAmowAAAOIABABvAQUAMAEAugAAAABvAQYAMAEA4gEAAABvAQcAMAEAxAIAAAD/AQAAAgAAAOICCQBvAwoAMAMCEQgAAABvAwoAMAMCugAAAABvAwsAMAMC4gEAAADiAwkAbwQMADAEAxEIAAAAbwQNADAEA7oAAAAAbwQOADAEA+IBAAAAxQECAwEAAAAwAQDbAwAAAIIAAgAPAwEDAgMDAwQFBAABAgMDBQMGAwcDCAUDCAABAwkDCgMLAwwDDQABAAEYAAEBAAABAAABAAABAAEBAAABAAABAAACAQAAAQAAAQAAAAD3AAABAAAAAABnFQCBm9CMWVXRahUSgenlVgaNGKE0WcidqovUd6jbWAIiPhPvnLYd

-- Decompiled by Krnl

local v1 = {
	["Name"] = "setGamepass",
	["Description"] = "Set your gamepass ownership!",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "gamepass",
			["Name"] = "gamepass",
			["Description"] = "Gamepass to give"
		},
		{
			["Type"] = "boolean",
			["Name"] = "shouldGive",
			["Description"] = "True if give, false if remove"
		}
	}
}
return v1
