-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUCXZhcnNfdXNlZAhHZXRTdG9yZQlDbGllbnRSdW4ETmFtZQdBbGlhc2VzC0Rlc2NyaXB0aW9uBUdyb3VwBEFyZ3MEdmFyPRRTZXRzIGEgc3RvcmVkIHZhbHVlLgtEZWZhdWx0VXRpbARUeXBlCXN0b3JlZEtleQNLZXmpAVRoZSBrZXkgdG8gc2V0LCBzYXZlZCBpbiB5b3VyIHVzZXIgZGF0YSBzdG9yZS4gS2V5cyBwcmVmaXhlZCB3aXRoIC4gYXJlIG5vdCBzYXZlZC4gS2V5cyBwcmVmaXhlZCB3aXRoICQgYXJlIGdhbWUtd2lkZS4gS2V5cyBwcmVmaXhlZCB3aXRoICQuIGFyZSBnYW1lLXdpZGUgYW5kIG5vbi1zYXZlZC4HRGVmYXVsdAZzdHJpbmcFVmFsdWUXVmFsdWUgb3IgdmFsdWVzIHRvIHNldC4AAAIFAgAAAAAHbwQAALwCAFUBAAAAnwIDAqkDAQBqAwIBggABAAIDAQMCABQDARgAAAAAAAABFQAAAAAFAAABAgAwowAAAOIABgBvAQcAMAEAugAAAAD/AQAAAAAAADABACcBAAAAbwEIADABAOICAAAAbwEJADABAMQDAAAA/wEAAAIAAADiAgsAbwMMADADAhEKAAAAbwMNADADAroAAAAAbwMOADADAuICAAAA4gMQAG8EEQAwBAMRCgAAAG8EEgAwBAO6AAAAAG8EEwAwBAPiAgAAAG8EFAAwBAM6DwAAAMUBAgMBAAAAMAEA2wQAAADAARUAMAEAMwUAAACCAAIAFgMEAwUDBgMHAwgDAwUGAAECAwQFAwkDCgMLAwwFAwoAAgMNAw4DDwMQBQQKAAIPAxEDEgMTAxQGAAEAAQABGAAAAQAAAQAAAAEAAAEAAAEAAQEAAAEAAAEAAAIBAAABAAABAAABAAAAAPYADgAAAAEAAAAAAWGtZVeSWw0PU2kPw6A6GjBtaYip6JMvApxsuaIeKvnEQGaqFu9vCv4=

-- Decompiled by Krnl

local v3 = {
	["Name"] = "var=",
	["Aliases"] = {},
	["Description"] = "Sets a stored value.",
	["Group"] = "DefaultUtil",
	["Args"] = {
		{
			["Type"] = "storedKey",
			["Name"] = "Key",
			["Description"] = "The key to set, saved in your user data store. Keys prefixed with . are not saved. Keys prefixed with $ are game-wide. Keys prefixed with $. are game-wide and non-saved."
		},
		{
			["Type"] = "string",
			["Name"] = "Value",
			["Description"] = "Value or values to set.",
			["Default"] = ""
		}
	},
	["ClientRun"] = function(p1, p2)
		p1:GetStore("vars_used")[p2] = true
	end
}
return v3
