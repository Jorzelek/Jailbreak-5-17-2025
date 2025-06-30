-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUBENtZHIEVXRpbBBSdW5Db21tYW5kU3RyaW5nCkRpc3BhdGNoZXIDUnVuBE5hbWUHQWxpYXNlcwhBdXRvRXhlYwtEZXNjcmlwdGlvbgVHcm91cARBcmdzA3J1bgE+T2FsaWFzICJkaXNjYXJkfFJ1biBhIGNvbW1hbmQgYW5kIGRpc2NhcmQgdGhlIG91dHB1dC4iIHJlcGxhY2UgJHtydW4gJDF9IC4qIFwiXCI6UnVucyBhIGdpdmVuIGNvbW1hbmQgc3RyaW5nIChyZXBsYWNpbmcgZW1iZWRkZWQgY29tbWFuZHMpLgtEZWZhdWx0VXRpbARUeXBlBnN0cmluZwdDb21tYW5kGVRoZSBjb21tYW5kIHN0cmluZyB0byBydW4AAgUCAAAAAAtNBACeAAAAAE0DBJ4BAAAATQIDgQIAAABNAwAKAwAAAFIEAQCfAgMAggIAAAQDAQMCAwMDBAARBQEYAAAAAAAAAAAAAAASAAAAAAQAAAECAC2jAAAA4gAHAG8BCAAwAQC6AAAAAP8BAAABAAAAbwIJAMUBAgIBAAAAMAEAJwEAAAD/AQAAAQAAAG8CCgDFAQICAQAAADABAH0CAAAAbwELADABAOIDAAAAbwEMADABAMQEAAAA/wEAAAEAAADiAg4AbwMPADADAhENAAAAbwMQADADAroAAAAAbwMRADADAuIDAAAAxQECAgEAAAAwAQDbBQAAAMABEgAwAQAWBgAAAIIAAgATAwYDBwMIAwkDCgMLAwUFBwABAgMEBQYDDAMNAw4DDwMQAxEFAw0AAwMSAxMDFAYAAQABAAEYAAABAAABAAAAAAAAAQABAAD/AAMAAAEAAAEAAQEAAAEAAAEAAAAA/AAIAAAAAQAAAAABN+AyDAwKA9sFJFiYwMVTmp9DS/UoK9Ha5yrpRrXgak2Jd1YnrJwoIA==

-- Decompiled by Krnl

local v3 = {
	["Name"] = "run",
	["Aliases"] = { ">" },
	["AutoExec"] = { "alias \"discard|Run a command and discard the output.\" replace ${run $1} .* \\\"\\\"" },
	["Description"] = "Runs a given command string (replacing embedded commands).",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Command",
			["Description"] = "The command string to run"
		}
	},
	["Run"] = function(p1, p2)
		return p1.Cmdr.Util.RunCommandString(p1.Dispatcher, p2)
	end
}
return v3
