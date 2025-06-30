-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMkBmlwYWlycwRFbnVtEUh1bWFub2lkU3RhdGVUeXBlDEdldEVudW1JdGVtcwREZWFkBE5vbmUHSnVtcGluZw9TZXRTdGF0ZUVuYWJsZWQSc2V0SHVtYW5vaWRFbmFibGVkCEFuaW1hdG9yFUZpbmRGaXJzdENoaWxkT2ZDbGFzcxlHZXRQbGF5aW5nQW5pbWF0aW9uVHJhY2tzBFN0b3AJc3RvcEFuaW1zCEh1bWFub2lkDkZpbmRGaXJzdENoaWxkGFNFUlZFUl9QT1NJVElPTl9PQkpfTkFNRQVWYWx1ZRhnZXRQb3NpdGlvbkZyb21DaGFyYWN0ZXIKR2V0UGxheWVycwlDaGFyYWN0ZXIYZ2V0QWxsQ2hhcmFjdGVyUG9zaXRpb25zBGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlEVJlcGxpY2F0ZWRTdG9yYWdlB3JlcXVpcmUOSHVtYW5vaWRVbmxvYWQUSHVtYW5vaWRVbmxvYWRDb25zdHMDU3RkBlNwcmluZwZPbkp1bXAKSXNDcmF3bGluZwNuZXcPV2Fsa1NwZWVkU3ByaW5nCElzSnVpY2VkAAULAgAAAAAdpAIBAAAAAECkAwQAAAwggLwDAxYFAAAAnwMCAJ8CAARRAhEApAcHAAYMIMDxBg4ABwAAAKQHCQAIDCDA8QYKAAcAAACkBwsACgwgwPEGBgAHAAAAUgkGAFIKAQC8BwDoDAAAAJ8HBAFuAu7/AgAAgIIAAQANAwEEAAAAQAMCAwMEAAwggAMEAwUEBgwgwAMGBAgMIMADBwQKDCDAAwgACwkBGAAAAAAAAAAAAAIAAAABAAAAAQAAAAIAAAAA+gAJDAAAAAAKAQAAAAYDAAAFAQcSbwMAALwBALgBAAAAnwEDAqQCAwAAACBAvAMBzQQAAACfAwIAnwIABFECBACMCQAAvAcG+gUAAACfBwMBbgL7/wIAAICCAAEABgMKAwsDAQQAACBAAwwDDQAWDgEYAAAAAAEAAAAAAAABAAAA/wADFwAAAAAGAQEAAAATbwMAALwBAAMBAAAAnwEDAisBAgDGAgAAggICAPsFAABNBAU5AgAAALwCAQMBAAAAnwIDAisCAgDGAwAAggMCAE0DAuwDAAAAggMCAAQDDwMQAxEDEgAcEwEYAAAAAAEBAAIAAAAAAAEBAAIAAB0AAAAACQACAAAAFP8AAAAAAAAA+wEAALwBAasAAAAAnwECBGQBCgBNBgVpAQAAAA4GBwD7CAEATQcICQIAAABSCAYAnwcCAg4HAQBqBwAGbgH1/wIAAACCAAIAAwMUAxUDEwAnFgEYAAABAAAAAAEAAQEAAAAAAQH7AAkoAAAAAAoAAAECAD+jAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEBAAAAAEBvAwQAvAEBFgMAAACfAQMCpAIGAAAAUEBNBAEfBwAAAE0DBG8IAAAAnwICAqQDBgAAAFBATQUBoQkAAABNBAUiCgAAAJ8DAgL/BAQAAAAAAMYFAAAwBQSjCwAAAKkFAAAwBQSFDAAAAE0FA+8NAAAAjAYBAIwHAABvCA4AjAkKAJ8FBQIwBQTcDwAAAKkFAAAwBQSUEAAAAMAFEQAwBQQZEgAAAMAFEwAwBQRPFAAAAMAFFQASAAIAMAUECRYAAADABRcAEgAAABIABAAwBQShGAAAAIIEAgAZAxcEAAAAQAMYAxkDGgMbBAAAUEADHAMdAx4DHwMgAyEDIgKamZmZmZnpPwMjAyQGAAMJBgEDDgYCAxMGAwMWBAABAgMBAAEYAAEAAAAAAAEAAAAAAAEAAAAAAAABAAAAAAAAAQABAAABAAABAAAAAAAAAAABAAABAAALAAAGAAAACwAAAAANAQAAAAAEu4hRGXIbvM+JTDuNbtDeQBzAigpNn5NX0v3SSgDdOdMz64VMmE9gGw==

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.HumanoidUnload.HumanoidUnloadConsts)
local v_u_17 = {
	["OnJump"] = nil,
	["IsCrawling"] = false,
	["WalkSpeedSpring"] = require(v2.Std.Spring).new(1, 0, 0.8, 10),
	["IsJuiced"] = false,
	["setHumanoidEnabled"] = function(p4, p5)
		for _, v6 in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
			if v6 ~= Enum.HumanoidStateType.Dead and (v6 ~= Enum.HumanoidStateType.None and v6 ~= Enum.HumanoidStateType.Jumping) then
				p4:SetStateEnabled(v6, p5)
			end
		end
	end,
	["stopAnims"] = function(p7)
		local v8 = p7:FindFirstChildOfClass("Animator")
		for _, v9 in ipairs(v8:GetPlayingAnimationTracks()) do
			v9:Stop(0)
		end
	end,
	["getPositionFromCharacter"] = function(p10)
		-- upvalues: (copy) v_u_3
		local v11 = p10:FindFirstChild("Humanoid")
		if v11 then
			local v12 = v11:FindFirstChild(v_u_3.SERVER_POSITION_OBJ_NAME)
			if v12 then
				return v12.Value
			else
				return nil
			end
		else
			return nil
		end
	end,
	["getAllCharacterPositions"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_17
		local v13 = {}
		for _, v14 in v_u_1:GetPlayers() do
			local v15 = v14.Character
			if v15 then
				local v16 = v_u_17.getPositionFromCharacter(v15)
				if v16 then
					v13[v15] = v16
				end
			end
		end
		return v13
	end
}
return v_u_17
