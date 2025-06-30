-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMODVN0YXJ0UG9zaXRpb24IUG9zaXRpb24OVGFyZ2V0UG9zaXRpb24KTG9va1ZlY3RvcgtUYXJnZXRGb2N1cxNNYWtlQ2luZW1hdGljQ2FtZXJhBHVuaXQPQ29vcmRpbmF0ZUZyYW1lE1N0ZXBDaW5lbWF0aWNDYW1lcmEJd29ya3NwYWNlDUN1cnJlbnRDYW1lcmEGQ0ZyYW1lA25ldwdWZWN0b3IzAAMCAAEAAAAR4gAFAMYBAAAwAQAzAAAAAPsBAAAwAQA7AQAAAMYBAAAwAQCpAgAAAPsBAAAwAQBoAwAAAMYBAAAwAQDnBAAAAIIAAgAGAwEDAgMDAwQDBQUFAAECAwQACAYBGAABAAABAAABAAABAAABAAAACQAAAAALBAMAAAA9TQQBqQAAAAAOBBoATQQBMwEAAAAOBAsATQYBMwEAAAD1BwIDCQUGB00HAakAAAAACQYHA0MEBQYwBAE7AwAAAGUADABNBQE7AwAAAE0JAakAAAAATQoBOwMAAAAmCAkKCQcIAAkGBwNDBAUGMAQBOwMAAABNBAHnBAAAAA4EEQBNBgHnBAAAAE0HATsDAAAAJgUGB00EBScFAAAATQYBaAYAAABNCgFoBgAAACYJBAoJCAkACQcIAkMFBgcwBQFoBgAAAPsEAAD7BgEA+wcCAE0IAWgGAAAAnwYDAk0HATsDAAAAQwUGBzAFBKoHAAAAggABAAgDAwMBAgAAAAAAAPA/AwIDBQMHAwQDCAARCQEYAAAAAQAAAQAAAAAAAAAAAAACAAAAAAAAAAAAAAADAAABAAAAAAAAAQAAAAAAAAAAAAIAAAAAAAAAAAAAARIAAAAACAAAAQIAHaMAAACkAQEAAAAAQE0AAUgCAAAApAEFAAAQMICkAgcAABBggFIFAQCfBQECUgMFAEw2AAFSBAIAnwQBAsYFAADGBgAAwAUIABIABADABgkAEgAAABIAAQASAAQA4gcMADAFB0MKAAAAMAYHNwsAAACCBwIADQMKBAAAAEADCwMMAw0EABAwgAMOBAAQYIAGAAYBAwYDCQUCCgsCAAEBAAEYAAEAAAACAAAAAQAAAAAAAQACAAkAAAAQAQABAAABAAAAAAI66QzwrJl4kwgtZmSNEOVw/Y3Q5ot1svyjmcdn9MOeWfDIqXNPYBt5

-- Decompiled by Krnl

local v_u_1 = workspace.CurrentCamera
local v_u_2 = CFrame.new
local v3 = Vector3.new
v_u_2()
local v_u_4 = v3()
return {
	["MakeCinematicCamera"] = function()
		-- upvalues: (copy) v_u_4
		return {
			["StartPosition"] = nil,
			["Position"] = v_u_4,
			["TargetPosition"] = nil,
			["LookVector"] = v_u_4,
			["TargetFocus"] = nil
		}
	end,
	["StepCinematicCamera"] = function(p5, p6, p7, p8)
		-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_4
		if p6.TargetPosition then
			if p6.StartPosition then
				p6.Position = p6.StartPosition * (1 - p8) + p6.TargetPosition * p8
			else
				p6.Position = p6.Position + (p6.TargetPosition - p6.Position) * p5 * p8
			end
		end
		if p6.TargetFocus then
			local v9 = (p6.TargetFocus - p6.Position).unit
			p6.LookVector = p6.LookVector + (v9 - p6.LookVector) * p5 * p7
		end
		v_u_1.CoordinateFrame = v_u_2(v_u_4, p6.LookVector) + p6.Position
	end
}
