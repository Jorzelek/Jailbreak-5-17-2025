-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMWBENtZHIIUmVnaXN0cnkEVXRpbBBNYWtlQWxpYXNDb21tYW5kFVJlZ2lzdGVyQ29tbWFuZE9iamVjdBBDcmVhdGVkIGFsaWFzICVxBmZvcm1hdAlDbGllbnRSdW4ETmFtZQdBbGlhc2VzC0Rlc2NyaXB0aW9uBUdyb3VwBEFyZ3MFYWxpYXNDQ3JlYXRlcyBhIG5ldywgc2luZ2xlIGNvbW1hbmQgb3V0IG9mIGEgY29tbWFuZCBhbmQgZ2l2ZW4gYXJndW1lbnRzLgtEZWZhdWx0VXRpbARUeXBlBnN0cmluZwpBbGlhcyBuYW1lOFRoZSBrZXkgb3IgaW5wdXQgdHlwZSB5b3UnZCBsaWtlIHRvIGJpbmQgdGhlIGNvbW1hbmQgdG8uDkNvbW1hbmQgc3RyaW5nblRoZSBjb21tYW5kIHRleHQgeW91IHdhbnQgdG8gcnVuLiBTZXBhcmF0ZSBtdWx0aXBsZSBjb21tYW5kcyB3aXRoICImJiIuIEFjY2VwdCBhcmd1bWVudHMgd2l0aCAkMSwgJDIsICQzLCBldGMuAAIIAwAAAAcAAAEDAxMCF00EAJ4AAAAATQMEsQEAAABNBwCeAAAAAE0GB54CAAAATQUGLQMAAABSBgEAUgcCAJ8FAwKpBgEAvAMDyQQAAACfAwQBbwMFAFIFAQC8AwONBgAAAJ8DAwCCAwAABwMBAwIDAwMEAwUDBgMHABMIARgAAAAAAQAAAAAAAAAAAf4AAAUAAAAAABQAAAAABQAAAQIALaMAAADiAAYAbwEHADABALoAAAAA/wEAAAAAAAAwAQAnAQAAAG8BCAAwAQDiAgAAAG8BCQAwAQDEAwAAAP8BAAACAAAA4gILAG8DDAAwAwIRCgAAAG8DDQAwAwK6AAAAAG8DDgAwAwLiAgAAAOIDCwBvBAwAMAQDEQoAAABvBA8AMAQDugAAAABvBBAAMAQD4gIAAADFAQIDAQAAADABANsEAAAAwAERADABADMFAAAAggACABIDCQMKAwsDDAMNAwgFBgABAgMEBQMOAw8DEAMRBQMKAAIDEgMTAxQDFQMWBgABAAEAARgAAAEAAAEAAAABAAABAAABAAEBAAABAAABAAACAQAAAQAAAQAAAAD3AA0AAAABAAAAAAEAqE+qe51zpjJsJT7ig5S1uZVPGFM/d9yKrF7wajfPMO67AS3TskcQ

-- Decompiled by Krnl

local v4 = {
	["Name"] = "alias",
	["Aliases"] = {},
	["Description"] = "Creates a new, single command out of a command and given arguments.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Alias name",
			["Description"] = "The key or input type you\'d like to bind the command to."
		},
		{
			["Type"] = "string",
			["Name"] = "Command string",
			["Description"] = "The command text you want to run. Separate multiple commands with \"&&\". Accept arguments with $1, $2, $3, etc."
		}
	},
	["ClientRun"] = function(p1, p2, p3)
		p1.Cmdr.Registry:RegisterCommandObject(p1.Cmdr.Util.MakeAliasCommand(p2, p3), true)
		return ("Created alias %q"):format(p2)
	end
}
return v4
