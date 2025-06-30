-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRC2lzTWFpbldvcmxkB3Jlc29sdmUYcHJvbWlzZUdldElzQmF0dGxlU2VydmVyB2FuZFRoZW4dcHJvbWlzZUlzVGVhbVN3aXRjaGluZ0VuYWJsZWQFYXdhaXQWaXNUZWFtU3dpdGNoaW5nRW5hYmxlZARnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQNTdGQHUHJvbWlzZQNBcHAIUnVuVXRpbHMNUHJpdmF0ZVNlcnZlchJQcml2YXRlU2VydmVyVXRpbHMABAIBAAAAAAJWAQAAggECAAAADAABGAAADQAAAAADAAMAAAAU+wEAAE0AAVAAAAAAnwABAisABgD7AQEATQABHQEAAACpAQAAnwACAIIAAAD7AQIATQAB4gIAAACfAAECwAIDALwAALUEAAAAnwADAIIAAAAFAwEDAgMDBgADBAEACAUBGAAAAAAAAQAAAAAAAgAAAAAAAAAACQAAAAADAAEAAAAJ+wEAAE0AAfQAAAAAnwABArwAAA0BAAAAnwACA+cCAAGCAgIAAgMFAwYAEQcBGAAAAAAAAAABABIAAAAABgAAAQIAKaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAKEGAAAATQIDcgcAAACfAQICpAIFAAAAQEBNBADBCAAAAE0DBEIJAAAAnwICAqQDBQAAAEBATQUA1goAAABNBAXOCwAAAJ8DAgL/BAIAAAAAAMAFDAASAAIAEgABABIAAwAwBQT0DQAAAMAFDgASAAQAMAUEQA8AAACCBAIAEAMIBAAAAEADCQMKAwsEAABAQAMMAw0DDgMPAxADEQYBAwUGAgMHAgECAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAACAAEAAAAAAAkAAAAEAQAAAAADp/KW4BFfmpSVNvx0vJjYd9GgG4YIeso+nOhgCFok1RrOHmBr+IU4cQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.Promise)
local v_u_3 = require(v1.App.RunUtils)
local v_u_4 = require(v1.PrivateServer.PrivateServerUtils)
local v_u_8 = {
	["promiseIsTeamSwitchingEnabled"] = function()
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
		if v_u_3.isMainWorld() then
			return v_u_4.promiseGetIsBattleServer():andThen(function(p5)
				return not p5
			end)
		else
			return v_u_2.resolve(false)
		end
	end,
	["isTeamSwitchingEnabled"] = function()
		-- upvalues: (copy) v_u_8
		local v6, v7 = v_u_8.promiseIsTeamSwitchingEnabled():await()
		return v6 and v7
	end
}
return v_u_8
