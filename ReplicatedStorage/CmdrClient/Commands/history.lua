-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUCkRpc3BhdGNoZXIKR2V0SGlzdG9yeQAJQ2xpZW50UnVuBE5hbWUHQWxpYXNlcwhBdXRvRXhlYwtEZXNjcmlwdGlvbgVHcm91cARBcmdzB2hpc3RvcnlXYWxpYXMgIiF8RGlzcGxheXMgcHJldmlvdXMgY29tbWFuZCBmcm9tIGhpc3RvcnkuIiBydW4gJHtoaXN0b3J5ICQxe251bWJlcnxMaW5lIE51bWJlcn19hgFhbGlhcyAiXnxSdW5zIHRoZSBwcmV2aW91cyBjb21tYW5kLCByZXBsYWNpbmcgYWxsIG9jY3VycmVuY2VzIG9mIEEgd2l0aCBCLiIgcnVuICR7cnVuIHJlcGxhY2UgJHtoaXN0b3J5IC0xfSAkMXtzdHJpbmd8QX0gJDJ7c3RyaW5nfEJ9fShhbGlhcyAiISF8UmVydW5zIHRoZSBsYXN0IGNvbW1hbmQuIiAhIC0xKERpc3BsYXlzIHByZXZpb3VzIGNvbW1hbmRzIGZyb20gaGlzdG9yeS4LRGVmYXVsdFV0aWwEVHlwZQdpbnRlZ2VyC0xpbmUgTnVtYmVyNENvbW1hbmQgbGluZSBudW1iZXIgKGNhbiBiZSBuZWdhdGl2ZSB0byBnbyBmcm9tIGVuZCkAAgUCAAAAAA1NAgAKAAAAALwCAowBAAAAnwICAowDAAB9AQMAAwAAABwDAgBDAQMBhwQCAZADBAKCAwIAAwMBAwIDAwATBAEYAAAAAAACAAABAAMAABQAAAAABQAAAQIALKMAAADiAAcAbwEIADABALoAAAAA/wEAAAAAAAAwAQAnAQAAAP8BAAADAAAAbwIJAG8DCgBvBAsAxQECBAEAAAAwAQB9AgAAAG8BDAAwAQDiAwAAAG8BDQAwAQDEBAAAAP8BAAABAAAA4gIPAG8DEAAwAwIRDgAAAG8DEQAwAwK6AAAAAG8DEgAwAwLiAwAAAMUBAgIBAAAAMAEA2wUAAADAARMAMAEAMwYAAACCAAIAFAMFAwYDBwMIAwkDCgMEBQcAAQIDBAUGAwsDDAMNAw4DDwMQAxEFAw4AAwMSAxMDFAYAAQABAAEYAAABAAABAAAAAQABAQEAAP0ABQAAAQAAAQABAQAAAQAAAQAAAAD8AAgAAAABAAAAAAE6B59Y//VWQgjD9cy+u9qDtClHU6mOZd3Y4r/aT4p9FaMp2rH6vPEX

-- Decompiled by Krnl

local v4 = {
	["Name"] = "history",
	["Aliases"] = {},
	["AutoExec"] = { "alias \"!|Displays previous command from history.\" run ${history $1{number|Line Number}}", "alias \"^|Runs the previous command, replacing all occurrences of A with B.\" run ${run replace ${history -1} $1{string|A} $2{string|B}}", "alias \"!!|Reruns the last command.\" ! -1" },
	["Description"] = "Displays previous commands from history.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "integer",
			["Name"] = "Line Number",
			["Description"] = "Command line number (can be negative to go from end)"
		}
	},
	["ClientRun"] = function(p1, p2)
		local v3 = p1.Dispatcher:GetHistory()
		if p2 <= 0 then
			p2 = #v3 + p2
		end
		return v3[p2] or ""
	end
}
return v4
