-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncwdhaXJEcm9wDlNlbmQgYWlyRHJvcHMhDERlZmF1bHRBZG1pbgRUeXBlCE9wdGlvbmFsEWFpckRyb3BEaWZmaWN1bHR5CmRpZmZpY3VsdHkjRGlmZmljdWx0eSBvZiBhaXJkcm9wcyB0byBzZW5kIG91dC4HaW50ZWdlcgZhbW91bnQfTnVtYmVyIG9mIGFpcmRyb3BzIHRvIHNlbmQgb3V0LgABBQAAAQIALKMAAADiAAQAbwEFADABALoAAAAAbwEGADABAOIBAAAAbwEHADABAMQCAAAA/wEAAAIAAADiAgoAbwMLADADAhEIAAAAbwMMADADAroAAAAAbwMNADADAuIBAAAAqQMAADADAnEJAAAA4gMKAG8EDgAwBAMRCAAAAG8EDwAwBAO6AAAAAG8EEAAwBAPiAQAAAKkEAQAwBANxCQAAAMUBAgMBAAAAMAEA2wMAAACCAAIAEQMBAwIDAwMEBQQAAQIDAwUDBgMHAwgDCQUECAABCQMKAwsDDAMNAw4DDwABAAEYAAEBAAABAAABAAABAAEBAAABAAABAAABAAACAQAAAQAAAQAAAQAAAAD1AAABAAAAAABTzOG4U0U4vmEIiyyjL9XV4TS30GH10QAMJUl31MSQtRKpxz9q1YqP

-- Decompiled by Krnl

local v1 = {
	["Name"] = "airDrop",
	["Description"] = "Send airDrops!",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "airDropDifficulty",
			["Name"] = "difficulty",
			["Description"] = "Difficulty of airdrops to send out.",
			["Optional"] = false
		},
		{
			["Type"] = "integer",
			["Name"] = "amount",
			["Description"] = "Number of airdrops to send out.",
			["Optional"] = true
		}
	}
}
return v1
