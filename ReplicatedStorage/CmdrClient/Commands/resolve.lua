-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYC0dldEFyZ3VtZW50CFZhbGlkYXRlBFR5cGUETmFtZQtEZXNjcmlwdGlvbghPcHRpb25hbAhHZXRWYWx1ZRdBcmd1bWVudCBWYWx1ZSBPcGVyYXRvcjJUaGUgdmFsdWUgb3BlcmF0b3IgdG8gcmVzb2x2ZS4gT25lIG9mOiAqICoqIC4gPyA/TgV0YWJsZQZjb25jYXQLUmF3U2VnbWVudHMBLANSdW4HQWxpYXNlcwVHcm91cAhBdXRvRXhlYwRBcmdzB3Jlc29sdmVmUmVzb2x2ZXMgQXJndW1lbnQgVmFsdWUgT3BlcmF0b3JzIGludG8gbGlzdHMuIEUuZy4sIHJlc29sdmUgcGxheWVycyAqIGdpdmVzIHlvdSBhIGxpc3Qgb2YgYWxsIHBsYXllcnMuC0RlZmF1bHRVdGlsM2FsaWFzICJtZXxEaXNwbGF5cyB5b3VyIHVzZXJuYW1lIiByZXNvbHZlIHBsYXllcnMgLgR0eXBlHVRoZSB0eXBlIGZvciB3aGljaCB0byByZXNvbHZlAAMFAQAAAAAejAMBALwBAN4AAAAAnwEDArwBAXYBAAAAnwECAioBAgAAAACAggABAOIBBgCMBAEAvAIA3gAAAACfAgMCvAIC8wcAAACfAgICMAIBEQIAAABvAggAMAIBugMAAABvAgkAMAIB4gQAAACpAgEAMAIBcQUAAACCAQIACgMBAwIDAwMEAwUDBgUEAgMEBQMHAwgDCQAPAAEYAAAAAAAAAAAAAQMBAAAAAAAAAAABAAABAAABAAAAEAAAAAAGAQAAAAALpAECAAAEAICMBQIAvAMA3gMAAACfAwMCTQIDGwQAAABvAwUAnwEDAIIBAAAGAwoDCwQABACAAwEDDAMNAB0OARgAAAAAAAAAAAAAAB4AAAAABAAAAQIAK6MAAADiAAcAbwEIADABALoAAAAA/wEAAAAAAAAwAQAnAQAAAG8BCQAwAQDiAgAAAG8BCgAwAQDEAwAAAP8BAAABAAAAbwILAMUBAgIBAAAAMAEAfQQAAAD/AQAAAgAAAOICDQBvAw4AMAMCEQwAAABvAwwAMAMCugAAAABvAw8AMAMC4gIAAADAAxAAxQECAwEAAAAwAQDbBQAAAMABEQAwAQAWBgAAAIIAAgASAwQDDwMFAxADEQMSAw4FBwABAgMEBQYDEwMUAxUDFgMDBQMMAAIDFwMYBgAGAQIAAQEAARgAAAEAAAEAAAABAAABAAABAAEAAP8AAwABAQAAAQAAAQAAAgAA+gAUAAAAAQAAAAACEtcDwZPMaNggE2lVE5nIQpGHCdzjT+Me+iUVQCucJ/7DKGRX/N37cg==

-- Decompiled by Krnl

local v3 = {
	["Name"] = "resolve",
	["Aliases"] = {},
	["Description"] = "Resolves Argument Value Operators into lists. E.g., resolve players * gives you a list of all players.",
	["Group"] = "DefaultUtil",
	["AutoExec"] = { "alias \"me|Displays your username\" resolve players ." },
	["Args"] = {
		{
			["Type"] = "type",
			["Name"] = "Type",
			["Description"] = "The type for which to resolve"
		},
		function(p1)
			if p1:GetArgument(1):Validate() ~= false then
				return {
					["Type"] = p1:GetArgument(1):GetValue(),
					["Name"] = "Argument Value Operator",
					["Description"] = "The value operator to resolve. One of: * ** . ? ?N",
					["Optional"] = true
				}
			end
		end
	},
	["Run"] = function(p2)
		return table.concat(p2:GetArgument(2).RawSegments, ",")
	end
}
return v3
