-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTAAEsBXNwbGl0A1J1bgROYW1lB0FsaWFzZXMLRGVzY3JpcHRpb24FR3JvdXAEQXJncwRwaWNrLFBpY2tzIGEgdmFsdWUgb3V0IG9mIGEgY29tbWEtc2VwYXJhdGVkIGxpc3QuC0RlZmF1bHRVdGlsBFR5cGUHaW50ZWdlcg1JbmRleCB0byBwaWNrJlRoZSBpbmRleCBvZiB0aGUgaXRlbSB5b3Ugd2FudCB0byBwaWNrBnN0cmluZwNDU1YYVGhlIGNvbW1hLXNlcGFyYXRlZCBsaXN0AAIIAwAAAAAHbwcBALwFAuMCAAAAnwUDAocEBQGQAwQAggMCAAMDAQMCAwMAEwQBGAAAAAAAAAAUAAAAAAUAAAECAC2jAAAA4gAGAG8BBwAwAQC6AAAAAP8BAAAAAAAAMAEAJwEAAABvAQgAMAEA4gIAAABvAQkAMAEAxAMAAAD/AQAAAgAAAOICCwBvAwwAMAMCEQoAAABvAw0AMAMCugAAAABvAw4AMAMC4gIAAADiAwsAbwQPADAEAxEKAAAAbwQQADAEA7oAAAAAbwQRADAEA+ICAAAAxQECAwEAAAAwAQDbBAAAAMABEgAwAQAWBQAAAIIAAgATAwUDBgMHAwgDCQMEBQYAAQIDBAUDCgMLAwwDDQUDCgACAw4DDwMQAxEDEgMTBgABAAEAARgAAAEAAAEAAAABAAABAAABAAEBAAABAAABAAACAQAAAQAAAQAAAAD3AA0AAAABAAAAAAFPT3gvz4hHg32LErtjeJkug5C8IKuNuSOtbwSPebLYPni56P2b07xB

-- Decompiled by Krnl

local v3 = {
	["Name"] = "pick",
	["Aliases"] = {},
	["Description"] = "Picks a value out of a comma-separated list.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "integer",
			["Name"] = "Index to pick",
			["Description"] = "The index of the item you want to pick"
		},
		{
			["Type"] = "string",
			["Name"] = "CSV",
			["Description"] = "The comma-separated list"
		}
	},
	["Run"] = function(_, p1, p2)
		return p2:split(",")[p1] or ""
	end
}
return v3
