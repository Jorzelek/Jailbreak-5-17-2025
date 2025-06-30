-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwlpbnZlbnRvcnkJSW52ZW50b3J5CU1vZGVyYXRvcgRUeXBlBnN0cmluZwhVc2VybmFtZQ9QbGF5ZXIgVXNlcm5hbWUIT3B0aW9uYWwGbnVtYmVyCE1heENvdW50CU1heCBpdGVtcwhNaW5Db3VudAlNaW4gaXRlbXMAAQYAAAECADajAAAA4gAEAG8BBQAwAQC6AAAAAG8BBgAwAQDiAQAAAG8BBwAwAQDEAgAAAP8BAAADAAAA4gIJAG8DCgAwAwIRCAAAAG8DCwAwAwK6AAAAAG8DDAAwAwLiAQAAAOIDDgBvBA8AMAQDEQgAAABvBBAAMAQDugAAAABvBBEAMAQD4gEAAACpBAEAMAQDcQ0AAADiBA4AbwUPADAFBBEIAAAAbwUSADAFBLoAAAAAbwUTADAFBOIBAAAAqQUBADAFBHENAAAAxQECBAEAAAAwAQDbAwAAAIIAAgAUAwEDAgMDAwQFBAABAgMDBQMGAwcDCAUDCAABAwkDCgMLAwwFBAgAAQ0DDQMOAw8DEAMRAAEAARgAAQEAAAEAAAEAAAEAAQEAAAEAAAEAAAIBAAABAAABAAABAAACAQAAAQAAAQAAAQAAAADwAAABAAAAAADV/CwBpJw2K+c4RpWIt2A7yVowsKcWV4KJD12tPBZIKR/Jusn7epkR

-- Decompiled by Krnl

local v1 = {
	["Name"] = "inventory",
	["Description"] = "Inventory",
	["Group"] = "Moderator",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Username",
			["Description"] = "Player Username"
		},
		{
			["Type"] = "number",
			["Name"] = "MaxCount",
			["Description"] = "Max items",
			["Optional"] = true
		},
		{
			["Type"] = "number",
			["Name"] = "MinCount",
			["Description"] = "Min items",
			["Optional"] = true
		}
	}
}
return v1
