-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cAhBdXRvRXhlYwRBcmdzCHRlbGVwb3J0AnRwM1RlbGVwb3J0cyBhIHBsYXllciBvciBzZXQgb2YgcGxheWVycyB0byBvbmUgdGFyZ2V0LglNb2RlcmF0b3JvYWxpYXMgImJyaW5nfEJyaW5ncyBhIHBsYXllciBvciBzZXQgb2YgcGxheWVycyB0byB5b3UuIiB0ZWxlcG9ydCAkMXtwbGF5ZXJzfHBsYXllcnN8VGhlIHBsYXllcnMgdG8gYnJpbmd9ICR7bWV9jQFhbGlhcyAidG98VGVsZXBvcnRzIHlvdSB0byBhbm90aGVyIHBsYXllciBvciBsb2NhdGlvbi4iIHRlbGVwb3J0ICR7bWV9ICQxe3BsYXllciBAIHZlY3RvcjN8RGVzdGluYXRpb258VGhlIHBsYXllciBvciBsb2NhdGlvbiB0byB0ZWxlcG9ydCB0b30EVHlwZQdwbGF5ZXJzBEZyb20XVGhlIHBsYXllcnMgdG8gdGVsZXBvcnQQcGxheWVyIEAgdmVjdG9yMwtEZXN0aW5hdGlvbhlUaGUgcGxheWVyIHRvIHRlbGVwb3J0IHRvAAEFAAABAgA1owAAAOIABgBvAQcAMAEAugAAAAD/AQAAAQAAAG8CCADFAQICAQAAADABACcBAAAAbwEJADABAOICAAAAbwEKADABAMQDAAAA/wEAAAIAAABvAgsAbwMMAMUBAgMBAAAAMAEAfQQAAAD/AQAAAgAAAOICDgBvAw8AMAMCEQ0AAABvAxAAMAMCugAAAABvAxEAMAMC4gIAAADiAw4AbwQSADAEAxENAAAAbwQTADAEA7oAAAAAbwQUADAEA+ICAAAAxQECAwEAAAAwAQDbBQAAAIIAAgAVAwEDAgMDAwQDBQMGBQYAAQIDBAUDBwMIAwkDCgMLAwwDDQUDDQACAw4DDwMQAxEDEgMTAAEAARgAAQEAAAEAAAAAAAABAAABAAABAAEBAAD+AAQAAQEAAAEAAAEAAAIBAAABAAABAAAAAPcAAAEAAAAAAGpvWfenfYKcWKszY/D0ktr/ns6NCIi78fAAmO2D7Ew1nJshDCuewwc=

-- Decompiled by Krnl

local v1 = {
	["Name"] = "teleport",
	["Aliases"] = { "tp" },
	["Description"] = "Teleports a player or set of players to one target.",
	["Group"] = "Moderator",
	["AutoExec"] = { "alias \"bring|Brings a player or set of players to you.\" teleport $1{players|players|The players to bring} ${me}", "alias \"to|Teleports you to another player or location.\" teleport ${me} $1{player @ vector3|Destination|The player or location to teleport to}" },
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "From",
			["Description"] = "The players to teleport"
		},
		{
			["Type"] = "player @ vector3",
			["Name"] = "Destination",
			["Description"] = "The player to teleport to"
		}
	}
}
return v1
