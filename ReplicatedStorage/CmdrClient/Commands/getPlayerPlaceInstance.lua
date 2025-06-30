-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWBFR5cGUETmFtZQtEZXNjcmlwdGlvbgdEZWZhdWx0BENtZHIEVXRpbAxNYWtlRW51bVR5cGUUUGxhY2VJbnN0YW5jZSBGb3JtYXQMUGxhY2VJZEpvYklkB1BsYWNlSWQFSm9iSWQGRm9ybWF0RFdoYXQgZGF0YSB0byByZXR1cm4uIFBsYWNlSWRKb2JJZCByZXR1cm5zIGJvdGggc2VwYXJhdGVkIGJ5IGEgc3BhY2UuB0FsaWFzZXMFR3JvdXAEQXJncxlnZXQtcGxheWVyLXBsYWNlLWluc3RhbmNliQFSZXR1cm5zIHRoZSB0YXJnZXQgcGxheWVyJ3MgUGxhY2UgSUQgYW5kIHRoZSBKb2JJZCBzZXBhcmF0ZWQgYnkgYSBzcGFjZS4gUmV0dXJucyAwIGlmIHRoZSBwbGF5ZXIgaXMgb2ZmbGluZSBvciBzb21ldGhpbmcgZWxzZSBnb2VzIHdyb25nLgxEZWZhdWx0RGVidWcIcGxheWVySWQGUGxheWVyJUdldCB0aGUgcGxhY2UgaW5zdGFuY2Ugb2YgdGhpcyBwbGF5ZXIAAggBAAAAABziAQQATQQAngUAAABNAwSeBgAAAE0CA7IHAAAAbwMIAP8EAAADAAAAbwUJAG8GCgBvBwsAxQQFBAEAAACfAgMCMAIBEQAAAABvAgwAMAIBugEAAABvAg0AMAIB4gIAAABvAgkAMAIBOgMAAACCAQIADgMBAwIDAwMEBQQAAQIDAwUDBgMHAwgDCQMKAwsDDAMNAAwAARgAAQAAAAAAAAAAAAAAAAAAAAABAAABAAABAAAADQAAAAAEAAABAgAhowAAAOIABQBvAQYAMAEAugAAAAD/AQAAAAAAADABACcBAAAAbwEHADABAOICAAAAbwEIADABAMQDAAAA/wEAAAIAAADiAgoAbwMLADADAhEJAAAAbwMMADADAroAAAAAbwMNADADAuICAAAAwAMOAMUBAgMBAAAAMAEA2wQAAACCAAIADwMCAw4DAwMPAxAFBQABAgMEAxEDEgMTAwEFAwkAAgMUAxUDFgYAAQABAAEYAAABAAABAAAAAQAAAQAAAQABAQAAAQAAAQAAAgAA+gAAAQAAAAABEX0n/+klHX4juU1r92coQGLIMYWRh6XElccJ/wpJXfyE64sLQMLdSQ==

-- Decompiled by Krnl

local v2 = {
	["Name"] = "get-player-place-instance",
	["Aliases"] = {},
	["Description"] = "Returns the target player\'s Place ID and the JobId separated by a space. Returns 0 if the player is offline or something else goes wrong.",
	["Group"] = "DefaultDebug",
	["Args"] = {
		{
			["Type"] = "playerId",
			["Name"] = "Player",
			["Description"] = "Get the place instance of this player"
		},
		function(p1)
			return {
				["Type"] = p1.Cmdr.Util.MakeEnumType("PlaceInstance Format", { "PlaceIdJobId", "PlaceId", "JobId" }),
				["Name"] = "Format",
				["Description"] = "What data to return. PlaceIdJobId returns both separated by a space.",
				["Default"] = "PlaceIdJobId"
			}
		end
	}
}
return v2
