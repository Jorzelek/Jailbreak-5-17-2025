-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMhFUdldExvY2FsVmVoaWNsZVBhY2tldARNYWtlBFR5cGUFTW9kZWwETm9uZQtHZXRJbnN0YW5jZQJvcwVjbG9jawZDRnJhbWUGQW5nbGVzBG1hdGgDY29zA3NpbgNuZXcLQm91bmRpbmdCb3gEU2l6ZQlNYWduaXR1ZGUGVXBkYXRlBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlB1ZlaGljbGUMVmVoaWNsZVV0aWxzBUNvbG9yBnNjcmlwdAZQYXJlbnQLV2luZG93Q29sb3IER2FtZQZHYXJhZ2UJQ3VzdG9taXplFmdldERlZmF1bHRWZWhpY2xlTW9kZWwFSXRlbXMAAwcBAwAAACL7AgAATQEChwAAAACfAQEC+wIBAE0DAa0BAAAATQQBEQIAAACfAgMC4gMEADACAzsDAAAATQQBrQEAAAAwBAOtAQAAAE0EARECAAAAMAQDEQIAAABNBAA/BQAAAA4EBQD7BAIAxgUAAFIGAwCfBAMBggICAPsEAgBSBQAAUgYDAJ8EAwGCAgIABgMBAwIDAwMEBQMDAQIDBQAIBgEYAAAAAAEAAAAAAAEAAAAAAAAAAAAAAQAAAQAAAAACAAAAAgkAAAAADgIAAAAAL6QCAgAABACAnwIBAj4DAgMhBAMEpAcHAAAYUICMCAAAbwoIALsJBANSDQQApAwMAAAsoICfDAICWwsMCUMJCguMCgAAnwcEAqQIBwAAGFCAuxgDA1IMAwCkCxAAADyggJ8LAgJbCgsOeAkKDYwKAACMCwAAnwgEAgkGBwikBxIAAERQgIwIAACMCQAATQ0BbxQAAABNDA0vFQAAAE0LDKoWAAAAWwoLE58HBAIJBQYHMAUAhQUAAACCAAEAFwMHAwgEAAQAgAIAAAAAAAAAQAIYLURU+yEZQAMJAwoEABhQgALSITN/fNkCQAKamZmZmZm5PwMLAwwEACyggAIzMzMzMzPTPwIAAAAAAADQPwMNBAA8oIADDgQARFCAAjMzMzMzM+M/Aw8DEAMRABQSARgAAAABAQEAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAP4AAxUAAAAACQAAAQIAOKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAI0GAAAATQIDbQcAAACfAQICpAIFAAAAQECkBQoAAACQQE0EBSQLAAAATQMEpAgAAACfAgICpAMFAAAAQEBNBwC9DQAAAE0GBygOAAAATQUGOw8AAABNBAWDDAAAAJ8DAgKkBAUAAABAQE0GAL0NAAAATQUGdhAAAACfBAICwAURABIAAQASAAQAEgADAMAGEgBNBwI4EwAAAOIIFgAwBwg4EwAAADAFCFEUAAAAMAYIJhUAAACCCAIAFwMTBAAAAEADFAMVAxYEAABAQAMXAxgDGQMaBAAAkEADGwMcAx0DHgMfAyAGAAYBAyEDBgMSBQMTFBUCAAEBAAEYAAEAAAAAAAEAAAAAAAABAAAAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAACAAAADAgAAQEAAQABAAABAAAAAAKdlw6Qk0u/gK9TZARwRyFT2xvCF2xHLN6t9ayWE2qJgFKdR9y4cZr8

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Vehicle.VehicleUtils)
local v3 = require(script.Parent.Color)
local v_u_4 = require(v1.Game.Garage.Customize.WindowColor)
local v_u_5 = require(v1.Game.getDefaultVehicleModel)
return {
	["Items"] = v3.Items,
	["GetInstance"] = function(p6)
		-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
		local v7 = v_u_2.GetLocalVehiclePacket()
		local v8 = v_u_5(v7.Make, v7.Type)
		local v9 = {
			["Model"] = v8,
			["Make"] = v7.Make,
			["Type"] = v7.Type
		}
		if p6.None then
			v_u_4(nil, v9)
			return v8
		else
			v_u_4(p6, v9)
			return v8
		end
	end,
	["Update"] = function(p10, p11)
		local v12 = os.clock() / 2
		local v13 = v12 % 6.283185307179586
		p10.CFrame = CFrame.Angles(0, 2.356194490192345 + math.cos(v13) * 0.1, 0) * CFrame.Angles(math.sin(v12) * 0.25 - 0.3, 0, 0) * CFrame.new(0, 0, p11.BoundingBox.Size.Magnitude * 0.6)
	end
}
