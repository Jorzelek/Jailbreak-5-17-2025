-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMZB3JlcXVpcmUGc2NyaXB0BlBhcmVudBRNYW5zaW9uUm9iYmVyeUNvbnN0cwhJc1BsYXllcgRUZXh0DVBhdXNlRHVyYXRpb24GRXZlbnRzFVRoZXJlIGhlIGlzISBHZXQgaGltIQpJbnRyb0N1cnZlBklzQm9zcwtUVVJOX0FST1VORAtHUkFCX0NBTUVSQS5DRU86IE5vdCBzbyBmYXN0Li4uIHlvdSB0aGluayB5b3UgY2FuIHN0b3AgbWU/JldlIGhhdmUgYmVmb3JlLCBhbmQgd2UnbGwgZG8gaXQgYWdhaW4hakNFTzogSSd2ZSByYWluZWQgbWV0ZW9ycywgdm9sY2FubyBhc2gsIGV2ZW4gYWxpZW5zIG9udG8geW91ciB3b3JsZC4gTm93IHlvdSd2ZSB3YWxrZWQgcmlnaHQgaW50byBteSBoYW5kcyFCV2UnbGwgbmV2ZXIgc3RvcCBmaWdodGluZyBmb3IgSmFpbGJyZWFrLiBQYXN0LCBwcmVzZW50LCBvciBmdXR1cmUhL0NFTzogWW91IG1heSBoYXZlIGRlZmVhdGVkIG15IGFsaWVuIHRha2VvdmVyLi4uPkNFTzogQnV0IHlvdSBmb3Jnb3QgdG8gZGVhbCB3aXRoIG1lISBQcmVwYXJlIHRvIGJlIGVsaW1pbmF0ZWQhB05PV19FTkQABHV0ZjgDbGVuD0NIQVJfUEVSX1NFQ09ORAhEdXJhdGlvbgABDAAAAQAAf6MAAACkAAEAAAAAQKQDAwAAACBATQIDJAQAAABNAQJHBQAAAJ8AAgL/AQAACAAAAOICCgCpAwEAMAMCkAYAAABvAwsAMAMC9QcAAACMAwMAMAMCnQgAAAD/AwAAAQAAAG8EDADFAwQCAQAAADADAloJAAAA4gMQAKkEAQAwBANGDQAAAG8EEQAwBAP1BwAAAIwEAgAwBAOdCAAAAKkEAQAwBAPxDgAAAKkEAQAwBANKDwAAAOIEEgCpBQEAMAUEkAYAAABvBRMAMAUE9QcAAACMBQIAMAUEnQgAAADiBRQAqQYBADAGBUYNAAAAbwYVADAGBfUHAAAAbwYWADAGBZ0IAAAA4gYSAKkHAQAwBwaQBgAAAG8HFwAwBwb1BwAAAG8HFgAwBwadCAAAAOIHFACpCAEAMAgHRg0AAABvCBgAMAgH9QcAAACMCAIAMAgHnQgAAADiCBQAqQkBADAJCEYNAAAAbwkZADAJCPUHAAAAbwkWADAJCJ0IAAAA4gkbAG8KHAAwCgn1BwAAAIwKAAAwCgmdCAAAAKkKAQAwCgltGgAAAMUBAgkBAAAAUgIBAMYDAADGBAAAZAINAE0IBp0IAAAApAofAAB40IFNCwb1BwAAAJ8KAgJNCwAcIAAAAOwJCgtDBwgJMAcG5SEAAABuAvL/AgAAAIIBAgAiAwEEAAAAQAMCBAAAIEADAwMEAwUDBgMHAwgFBAYHCAkDCQMKAwsDDAMNBQUNBwgODwMOBQMGBwgDDwUDDQcIAxACAAAAAAAABEADEQMSAxMDFAUDBwgaAxUDFgMXBAB40IEDGAMZAAEAARgAAQAAAAAAAAAAAQABAQAAAQAAAQAAAQAAAAAAAAIBAAABAAABAAABAAABAAACAQAAAQAAAQAAAgEAAAEAAAEAAAIBAAABAAABAAACAQAAAQAAAQAAAgEAAAEAAAEAAAIBAAABAAACAAAAAAMAAAABAAAAAAAAAAAAAAAA/wADAQAAAAAAZhBlC0uSZrtU1A+fhp4MEEP0xdS3EjKQQVcfnuOtXIL+uN+PZuOwMA==

-- Decompiled by Krnl

local v1 = require(script.Parent.MansionRobberyConsts)
local v2 = {
	{
		["IsPlayer"] = true,
		["Text"] = "There he is! Get him!",
		["PauseDuration"] = 3,
		["Events"] = { "IntroCurve" }
	},
	{
		["IsBoss"] = true,
		["Text"] = "CEO: Not so fast... you think you can stop me?",
		["PauseDuration"] = 2,
		["TURN_AROUND"] = true,
		["GRAB_CAMERA"] = true
	},
	{
		["IsPlayer"] = true,
		["Text"] = "We have before, and we\'ll do it again!",
		["PauseDuration"] = 2
	},
	{
		["IsBoss"] = true,
		["Text"] = "CEO: I\'ve rained meteors, volcano ash, even aliens onto your world. Now you\'ve walked right into my hands!",
		["PauseDuration"] = 2.5
	},
	{
		["IsPlayer"] = true,
		["Text"] = "We\'ll never stop fighting for Jailbreak. Past, present, or future!",
		["PauseDuration"] = 2.5
	},
	{
		["IsBoss"] = true,
		["Text"] = "CEO: You may have defeated my alien takeover...",
		["PauseDuration"] = 2
	},
	{
		["IsBoss"] = true,
		["Text"] = "CEO: But you forgot to deal with me! Prepare to be eliminated!",
		["PauseDuration"] = 2.5
	},
	{
		["Text"] = "",
		["PauseDuration"] = 0,
		["NOW_END"] = true
	}
}
for _, v3 in v2 do
	v3.Duration = v3.PauseDuration + utf8.len(v3.Text) / v1.CHAR_PER_SECOND
end
return v2
