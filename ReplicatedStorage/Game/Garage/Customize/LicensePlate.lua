-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMaGEZpbHRlclN0cmluZ0ZvckJyb2FkY2FzdAV1cHBlcgdbXiV3JXNdAARnc3ViA3N1YgVwY2FsbAR3YXJuH0xpY2Vuc2VQbGF0ZSBmaWx0ZXJpbmcgZmFpbGVkOiAGQkFESU1PF0dldEZpbHRlcmVkTGljZW5zZVBsYXRlBFR5cGUETWFrZQVNb2RlbAZEcml2ZXIORmluZEZpcnN0Q2hpbGQFcGxhdGUETmFtZQpTdXJmYWNlR3VpBUZyYW1lCVRleHRMYWJlbARUZXh0BGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlBENoYXQABAQABAAAAAj7AAEA+wICAPsDAwC8AADIAAAAAJ8ABALeAAAAggABAAEDAQAMAAEYAAAAAAAAAAESAAAAAAgCAQAAACS8AgFLAAAAAJ8CAgJSAQIAbwQBAG8FAgC8AgHMAwAAAJ8CBAJSAQIAjAQBAIwFBwC8AgHwBAAAAJ8CBAJSAQIAxgIAAKQDBgAAAFBA2QQAABIBAv8SAgAAEgEB/xIAAACfAwIDKwMGAKQFCAAAAHBAbwYJAFIHBACfBQMBxgIAACsCAQBvAgoAwQEAAIICAgALAwIDAwMEAwUDBgMHBAAAUEADCAQAAHBAAwkDCgEABwsBGAAAAAABAAAAAAABAAAAAAABAQAAAAAAAAAIAQAAAAABBAECAAgAAAAADAIBAAAAIk0CAREAAAAATQMBrQEAAABNBAE7AgAAAE0FAbkDAAAAbwgCALwGBAMEAAAAnwYDAg4GFABvCQUAvAcGAwQAAACfBwMCDgcPAA4ADgAOBQ0A+wgAAFIJBQBNCgC6BgAAAJ8IAwJNCwcnBwAAAE0KC50IAAAATQkKmgkAAAAwCAn1CgAAAIIAAQALAwwDDQMOAw8DEAMRAxIDEwMUAxUDFgAgAAEYAAABAAEAAgABAAAAAQEAAAABAQABAAAAAAEAAAAAAAAABCEAAAAABAAAAQIAEqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwLAAgUAEgABAMADBgASAAIAggMCAAcDFwQAAABAAxgDGQMaBgEGAgIBAgEAARgAAgAAAAAAAQAAAAAAAwAZAAABAAAAAANXXIiEeNjk72WY4hAJq62oxFdd/aLqD+A2+TSGo7o+ND07a6q7k41F

-- Decompiled by Krnl

game:GetService("Players")
local v_u_1 = game:GetService("Chat")
local function v_u_8(p_u_2, p3)
	-- upvalues: (copy) v_u_1
	local v_u_4 = p3:upper():gsub("[^%w%s]", ""):sub(1, 7)
	local v_u_5 = nil
	local v6, v7 = pcall(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_1, (ref) v_u_4, (copy) p_u_2
		v_u_5 = v_u_1:FilterStringForBroadcast(v_u_4, p_u_2)
	end)
	if not v6 then
		warn("LicensePlate filtering failed: ", v7)
		v_u_5 = nil
	end
	return v_u_5 or "BADIMO"
end
return function(p9, p10)
	-- upvalues: (copy) v_u_8
	local _ = p10.Type
	local _ = p10.Make
	local v11 = p10.Model
	local v12 = p10.Driver
	local v13 = v11:FindFirstChild("Model")
	if v13 then
		local v14 = v13:FindFirstChild("plate")
		if v14 and (p9 and v12) then
			local v15 = v_u_8(v12, p9.Name)
			v14.SurfaceGui.Frame.TextLabel.Text = v15
		end
	end
end
