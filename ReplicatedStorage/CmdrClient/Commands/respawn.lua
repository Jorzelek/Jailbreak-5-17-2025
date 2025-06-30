-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNBE5hbWULRGVzY3JpcHRpb24FR3JvdXAIQXV0b0V4ZWMEQXJncwdyZXNwYXduKFJlc3Bhd25zIGEgcGxheWVyIG9yIGEgZ3JvdXAgb2YgcGxheWVycy4MRGVmYXVsdEFkbWlurgFhbGlhcyAicmVmcmVzaHxSZXNwYXducyB0aGUgcGxheWVyIGFuZCByZXR1cm5zIHRoZW0gdG8gdGhlaXIgcHJldmlvdXMgbG9jYXRpb24uIiB2YXI9IC5yZWZyZXNoX3BvcyAke3Bvc2l0aW9uICQxe3BsYXllcnxQbGF5ZXJ9fSAmJiByZXNwYXduICQxICYmIHRwICQxIEAke3t2YXIgLnJlZnJlc2hfcG9zfX0EVHlwZQdwbGF5ZXJzB3RhcmdldHMXVGhlIHBsYXllcnMgdG8gcmVzcGF3bi4AAQQAAAECACOjAAAA4gAFAG8BBgAwAQC6AAAAAG8BBwAwAQDiAQAAAG8BCAAwAQDEAgAAAP8BAAABAAAAbwIJAMUBAgIBAAAAMAEAfQMAAAD/AQAAAQAAAOICCwBvAwwAMAMCEQoAAABvAw0AMAMCugAAAABvAw4AMAMC4gEAAADFAQICAQAAADABANsEAAAAggACAA8DAQMCAwMDBAMFBQUAAQIDBAMGAwcDCAMJAwoFAwoAAQMLAwwDDQABAAEYAAABAAABAAABAAABAAEAAP8AAwABAQAAAQAAAQAAAAD8AAABAAAAAAAnoEeHjMNNChVkLRP5bofRIcd4k1xvmgmanEyDTbQpVoPXi2YUsiCp

-- Decompiled by Krnl

local v1 = {
	["Name"] = "respawn",
	["Description"] = "Respawns a player or a group of players.",
	["Group"] = "DefaultAdmin",
	["AutoExec"] = { "alias \"refresh|Respawns the player and returns them to their previous location.\" var= .refresh_pos ${position $1{player|Player}} && respawn $1 && tp $1 @${{var .refresh_pos}}" },
	["Args"] = {
		{
			["Type"] = "players",
			["Name"] = "targets",
			["Description"] = "The players to respawn."
		}
	}
}
return v1
