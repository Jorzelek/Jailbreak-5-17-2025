-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPASwFc3BsaXQDUnVuBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cARBcmdzA2xlbixSZXR1cm5zIHRoZSBsZW5ndGggb2YgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdAtEZWZhdWx0VXRpbARUeXBlBnN0cmluZwNDU1YYVGhlIGNvbW1hLXNlcGFyYXRlZCBsaXN0AAIGAgAAAAAGbwUAALwDAeMBAAAAnwMDAhwCAwCCAgIAAgMBAwIADgMBGAAAAAAAAA8AAAAABAAAAQIAI6MAAADiAAYAbwEHADABALoAAAAA/wEAAAAAAAAwAQAnAQAAAG8BCAAwAQDiAgAAAG8BCQAwAQDEAwAAAP8BAAABAAAA4gILAG8DDAAwAwIRCgAAAG8DDQAwAwK6AAAAAG8DDgAwAwLiAgAAAMUBAgIBAAAAMAEA2wQAAADAAQ8AMAEAFgUAAACCAAIAEAMEAwUDBgMHAwgDAwUGAAECAwQFAwkDCgMLAwwFAwoAAgMNAw4DDwYAAQABAAEYAAABAAABAAAAAQAAAQAAAQABAQAAAQAAAQAAAAD8AAgAAAABAAAAAAE1zFTIXeRGaAcIPlyoJvAWDI5zj2vA96kDjcg6DoyR3aix1HZQmG74

-- Decompiled by Krnl

local v2 = {
	["Name"] = "len",
	["Aliases"] = {},
	["Description"] = "Returns the length of a comma-separated list",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "CSV",
			["Description"] = "The comma-separated list"
		}
	},
	["Run"] = function(_, p1)
		return #p1:split(",")
	end
}
return v2
