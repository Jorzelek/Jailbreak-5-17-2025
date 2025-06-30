-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQDURvZXNQbGF5ZXJPd24MRW51bUdhbWVwYXNzBlN0ZXJlbxBIYXNTdGVyb0dhbWVwYXNzDlByb21wdFB1cmNoYXNlCEdhbWVwYXNzG0NoZWNrT3JQcm9tcHRTdGVyZW9HYW1lcGFzcwRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQ5HYW1lcGFzc1N5c3RlbQRHYW1lDUdhbWVwYXNzVXRpbHMIU2V0dGluZ3MIUmVzb3VyY2UAAwQAAgAAAAr7AQAATQABGwAAAAD7AwEATQIDjQEAAABNAQIeAgAAAJ8AAgCCAAAAAwMBAwIDAwAIBAEYAAAAAAAAAAAAAAkAAAAABQADAAAAD/sBAABNAAGCAAAAAJ8AAQIrAAkA+wIBAE0BAmEBAAAA+wQCAE0DBL0CAAAATQIDHgMAAACfAQIBggACAAQDBAMFAwYDAwALBwEYAAAAAAEBAAAAAAAAAAACDAAAAAAGAAABAgAuowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQQAvQcAAABNAwS9CAAAAE0CA44GAAAAnwECAqQCBQAAAEBATQUAvQcAAABNBAW9CAAAAE0DBD4JAAAAnwICAqQDBQAAAEBATQUAYgsAAABNBAXKCgAAAJ8DAgL/BAIAAAAAAMAFDAASAAEAEgACADAFBIINAAAAwAUOABIABAASAAIAEgADADAFBMAPAAAAggQCABADCAQAAABAAwkDCgMLBAAAQEADDAMNAwYDDgMPAxAGAAMEBgEDBwIAAQEAARgAAQAAAAAAAQAAAAAAAAAAAQAAAAAAAAAAAQAAAAAAAAIAAQAAAAADAAAAAAAHAQAAAAAC9wCYNjERb/HFxPKihgcdMg4cY86YuykDvnZxpzFq6myxOUZ0Uk9Fkg==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Gamepass.GamepassSystem)
local v_u_3 = require(v1.Game.Gamepass.GamepassUtils)
local v_u_4 = require(v1.Resource.Settings)
local v_u_6 = {
	["HasSteroGamepass"] = function()
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.DoesPlayerOwn(v_u_3.EnumGamepass.Stereo)
	end,
	["CheckOrPromptStereoGamepass"] = function()
		-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
		local v5 = v_u_6.HasSteroGamepass()
		if not v5 then
			v_u_3.PromptPurchase(v_u_4.Gamepass.Stereo)
		end
		return v5
	end
}
return v_u_6
