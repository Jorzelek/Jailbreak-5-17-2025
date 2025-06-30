-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cAhBdXRvRXhlYwRBcmdzCmdvdG8tcGxhY2UaVGVsZXBvcnQgdG8gYSBSb2Jsb3ggcGxhY2UMRGVmYXVsdEFkbWluhwFhbGlhcyAiZm9sbG93LXBsYXllcnxKb2luIGEgcGxheWVyIGluIGFub3RoZXIgc2VydmVyIiBnb3RvLXBsYWNlICQxe3BsYXllcnN8UGxheWVyc30gJHt7Z2V0LXBsYXllci1wbGFjZS1pbnN0YW5jZSAkMntwbGF5ZXJJZHxUYXJnZXR9fX2TAWFsaWFzICJyZWpvaW58UmVqb2luIHRoaXMgcGxhY2UuIFlvdSBtaWdodCBlbmQgdXAgaW4gYSBkaWZmZXJlbnQgc2VydmVyLiIgZ290by1wbGFjZSAkMXtwbGF5ZXJzfFBsYXllcnN9ICR7Z2V0LXBsYXllci1wbGFjZS1pbnN0YW5jZSAke21lfSBQbGFjZUlkfQRUeXBlB3BsYXllcnMHUGxheWVycyBUaGUgcGxheWVycyB5b3Ugd2FudCB0byB0ZWxlcG9ydAdpbnRlZ2VyCFBsYWNlIElEJFRoZSBQbGFjZSBJRCB5b3Ugd2FudCB0byB0ZWxlcG9ydCB0bwhPcHRpb25hbAZzdHJpbmcFSm9iSWQqVGhlIHNwZWNpZmljIEpvYklkIHlvdSB3YW50IHRvIHRlbGVwb3J0IHRvAAEGAAABAgA/owAAAOIABgBvAQcAMAEAugAAAAD/AQAAAAAAADABACcBAAAAbwEIADABAOICAAAAbwEJADABAMQDAAAA/wEAAAIAAABvAgoAbwMLAMUBAgMBAAAAMAEAfQQAAAD/AQAAAwAAAOICDQBvAw4AMAMCEQwAAABvAw8AMAMCugAAAABvAxAAMAMC4gIAAADiAw0AbwQRADAEAxEMAAAAbwQSADAEA7oAAAAAbwQTADAEA+ICAAAA4gQVAG8FFgAwBQQRDAAAAG8FFwAwBQS6AAAAAG8FGAAwBQTiAgAAAKkFAQAwBQRxFAAAAMUBAgQBAAAAMAEA2wUAAACCAAIAGQMBAwIDAwMEAwUDBgUGAAECAwQFAwcDCAMJAwoDCwMMBQMMAAIDDQMOAw8DEAMRAxIDEwUEDAACFAMUAxUDFgABAAEYAAABAAABAAAAAQAAAQAAAQABAQAA/gAEAAEBAAABAAABAAACAQAAAQAAAQAAAgEAAAEAAAEAAAEAAAAA8QAAAQAAAAAABkZ4ew5jzBU0ghLvwNZqq4H/7gcLVLjI80/WXVtkHt8o+9loOeYaWA==

-- Decompiled by Krnl

local v1 = {
	["Name"] = "goto-place",
	["Aliases"] = {},
	["Description"] = "Teleport to a Roblox place",
	["Group"] = "DefaultAdmin",
	["AutoExec"] = { "alias \"follow-player|Join a player in another server\" goto-place $1{players|Players} ${{get-player-place-instance $2{playerId|Target}}}", "alias \"rejoin|Rejoin this place. You might end up in a different server.\" goto-place $1{players|Players} ${get-player-place-instance ${me} PlaceId}" },
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "Players",
			["Description"] = "The players you want to teleport"
		},
		{
			["Type"] = "integer",
			["Name"] = "Place ID",
			["Description"] = "The Place ID you want to teleport to"
		},
		{
			["Type"] = "string",
			["Name"] = "JobId",
			["Description"] = "The specific JobId you want to teleport to",
			["Optional"] = true
		}
	}
}
return v1
