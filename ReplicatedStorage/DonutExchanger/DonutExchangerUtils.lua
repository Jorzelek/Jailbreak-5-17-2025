-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPCGlzU3R1ZGlvCWdldFRlYW1JZAhFbnVtVGVhbQhQcmlzb25lcgtjYW5JbnRlcmFjdARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNBcHAIUnVuVXRpbHMER2FtZQtQbGF5ZXJVdGlscwhSZXNvdXJjZQhTZXR0aW5ncwACBQEDAAAAF/sCAABNAQLqAAAAAJ8BAQIOAQIAqQEBAIIBAgD7AgEATQECZAEAAABSAgAAnwECAvsEAgBNAwRMAgAAAE0CA54DAAAA8QEDAAIAAACpAgAAggICAKkCAQCCAgIABAMBAwIDAwMEAAgFARgAAAAAAAEAAgAAAAABAAAAAAAAAQACAAkAAAAABgAAAQIAJaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAMEGAAAATQIDQgcAAACfAQICpAIFAAAAQEBNBAC9CAAAAE0DBKYJAAAAnwICAqQDBQAAAEBATQUAYgoAAABNBAXKCwAAAJ8DAgL/BAEAAAAAAMAFDAASAAEAEgACABIAAwAwBQRlDQAAAIIEAgAOAwYEAAAAQAMHAwgDCQQAAEBAAwoDCwMMAw0DDgMPBgADBQEAAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAABAAIAAAAAAAsBAAAAAAFpAFCfMrEXDlvEOguQQHaCvmIipPH1Qkj+HZgEtSB9wbcAUB3A3ldD

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.App.RunUtils)
local v_u_3 = require(v1.Game.PlayerUtils)
local v_u_4 = require(v1.Resource.Settings)
return {
	["canInteract"] = function(p5)
		-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
		return v_u_2.isStudio() and true or v_u_3.getTeamId(p5) == v_u_4.EnumTeam.Prisoner
	end
}
