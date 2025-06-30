-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMOBE5hbWULRGVzY3JpcHRpb24FR3JvdXAEQXJncw5naXZlQ29uc3VtYWJsZS5HaXZlIGEgc2V0IG9mIHBsYXllcnMgYW4gaXRlbSAoaWYgdGhleSBvd24gaXQpDERlZmF1bHRBZG1pbgRUeXBlB3BsYXllcnMGcGxheWVyFEEgcGxheWVyIGluIHRoZSBnYW1lCmNvbnN1bWFibGUEaXRlbRpUaGUgaXRlbSB0byBnaXZlIHBsYXllcihzKQABBQAAAQIAJqMAAADiAAQAbwEFADABALoAAAAAbwEGADABAOIBAAAAbwEHADABAMQCAAAA/wEAAAIAAADiAgkAbwMKADADAhEIAAAAbwMLADADAroAAAAAbwMMADADAuIBAAAA4gMJAG8EDQAwBAMRCAAAAG8EDgAwBAO6AAAAAG8EDwAwBAPiAQAAAMUBAgMBAAAAMAEA2wMAAACCAAIAEAMBAwIDAwMEBQQAAQIDAwUDBgMHAwgFAwgAAQMJAwoDCwMMAw0DDgABAAEYAAEBAAABAAABAAABAAEBAAABAAABAAACAQAAAQAAAQAAAAD3AAABAAAAAAD8rdZ4e5J6Fs5pvOzpOlXnG+kG6f3jgGT8C/YJntCdD16yts/xiBiu

-- Decompiled by Krnl

local v1 = {
	["Name"] = "giveConsumable",
	["Description"] = "Give a set of players an item (if they own it)",
	["Group"] = "DefaultAdmin",
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "player",
			["Description"] = "A player in the game"
		},
		{
			["Type"] = "consumable",
			["Name"] = "item",
			["Description"] = "The item to give player(s)"
		}
	}
}
return v1
