-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdGHF1ZXJ5Q3VycmVudFN0YW5kaW5nSG9tZRRfY3VycmVudFN0YW5kaW5nSG9tZQlvbkVudGVyZWQERmlyZQhvbkV4aXRlZAVTdGFydAVldmVyeQdDb25uZWN0BGluaXQLZ2V0Um9vdFBhcnQIUG9zaXRpb24GaXBhaXJzBkdldEFsbBZJc1BvaW50SW5TdGFuZGluZ1ByaXNtBGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlC0xvY2FsUGxheWVyEVJlcGxpY2F0ZWRTdG9yYWdlB3JlcXVpcmUDU3RkCEludGVydmFsC1BsYXllclV0aWxzBEdhbWUGU2lnbmFsCkhvbWVCaW5kZXIGc2NyaXB0BlBhcmVudANuZXcABAUAAQAAACD7AQAATQABXAAAAACfAAEC+wIAAE0BAusBAAAA8QEXAAAAAAD7AgAATQEC6wEAAAD7AgAAMAAC6wEAAAAOAAgA+wMAAE0CAwICAAAAUgQAALwCAt0DAAAAnwIDAYIAAQD7AwAATQIDTwQAAABSBAEAvAIC3QMAAACfAgMBggABAAUDAQMCAwMDBAMFABMAARgAAAAAAQAAAAABAAABAAABAQAAAAAAAAACAAAAAAAAAxQAAAAAAwADAAAAD/sAAAC8AAAcAAAAAJ8AAgH7AQEATQABxAEAAABvAQIAnwACAsACAwASAgIAvAAAxwQAAACfAAMBggABAAUDBgMHAgAAAAAAANA/BgADCAEADwkBGAAAAAADAAAAAAAAAAAADBAAAAAACgADAAAAGvsBAABNAAEbAAAAAPsBAQCfAAICKwABAIIAAQBNAQA7AQAAAKQCAwAAACBA+wMCALwDA9AEAAAAnwMCAJ8CAARRAgYAUgkBALwHBuUFAAAAnwcDAg4HAQCCBgIAbgL5/wIAAICCAAEABgMKAwsDDAQAACBAAw0DDgAhAQEYAAAAAAABAQIAAQAAAAAAAAABAAAAAAH+AAUiAAAAAAoAAAECAEmjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCTQEAMQQAAACkAgEAAAAAQG8EBQC8AgIWAwAAAJ8CAwKkAwcAAABgQE0FAqEIAAAATQQFrAkAAACfAwICpAQHAAAAYEBNBgK9CwAAAE0FBqYKAAAAnwQCAqQFBwAAAGBATQcCoQgAAABNBgcfDAAAAJ8FAgKkBgcAAABgQKQJDwAAAOBATQgJJBAAAABNBwg1DQAAAJ8GAgL/BwQAAAAAAMYIAAAwCAfrEQAAAE0IBe8SAAAAnwgBAjAIBwITAAAATQgF7xIAAACfCAECMAgHTxQAAADACBUAEgAGABIAAwASAAcAMAgHExYAAADACBcAEgAEABIAAQASAAYAMAgHXBgAAACCBwIAGQMPBAAAAEADEAMRAxIDEwMUBAAAYEADFQMWAxcDGAMZAxoDGwQAAOBAAxwDAgMdAwMDBQYBAwkGAgMBAgECAQABGAABAAAAAAABAAEAAAAAAAEAAAAAAAABAAAAAAAAAQAAAAAAAAIAAAAAAAAAAAIAAQAAAQAAAAABAAAAAAEAAAAAABIAAAAAAAwBAAAAAANQoQZsC+C0W2JlbPgW2WHRrgkGFjBo4qvjIjo+UJwC5DMTzz/A1Ath

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Std.Interval)
local v_u_4 = require(v2.Game.PlayerUtils)
local v5 = require(v2.Std.Signal)
local v_u_6 = require(script.Parent.HomeBinder)
local v_u_12 = {
	["_currentStandingHome"] = nil,
	["onEntered"] = v5.new(),
	["onExited"] = v5.new(),
	["init"] = function()
		-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_12
		v_u_6:Start()
		v_u_3.every(0.25):Connect(function()
			-- upvalues: (ref) v_u_12
			local v7 = v_u_12.queryCurrentStandingHome()
			if v_u_12._currentStandingHome ~= v7 then
				local v8 = v_u_12._currentStandingHome
				v_u_12._currentStandingHome = v7
				if v7 then
					v_u_12.onEntered:Fire(v7)
					return
				end
				v_u_12.onExited:Fire(v8)
			end
		end)
	end,
	["queryCurrentStandingHome"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_6
		local v9 = v_u_4.getRootPart(v_u_1)
		if v9 then
			local v10 = v9.Position
			for _, v11 in ipairs(v_u_6:GetAll()) do
				if v11:IsPointInStandingPrism(v10) then
					return v11
				end
			end
		end
	end
}
return v_u_12
