-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMjD1NlY29uZFdhbGxDb2xvcg5GaW5kRmlyc3RDaGlsZAR3YXJuEE1pc3Npbmcgc3ViTW9kZWwLR2V0Q2hpbGRyZW4IQmFzZVBhcnQDSXNBBE5vbmUNT3JpZ2luYWxDb2xvcgxHZXRBdHRyaWJ1dGUFQ29sb3IITWF0ZXJpYWwPRGVmYXVsdE1hdGVyaWFsBFBhcnQETmFtZRRObyBwYXJ0cyB0byBhcHBseSB0bwZhc3NlcnQFYXBwbHkEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUGc2NyaXB0BlBhcmVudAlXYWxsQ29sb3IER2FtZQZHYXJhZ2UFUGFpbnQSRGVmYXVsdFJlZmxlY3RhbmNlEkRpc2FibGVSZWZsZWN0YW5jZQRFbnVtDVNtb290aFBsYXN0aWMLZ2V0SW5zdGFuY2UMdXBkYXRlQ2FtZXJhCGdldEl0ZW1zAAINAgIAAAcEAAAFAg8HO28EAAC8AgEDAQAAAJ8CAwIrAgUApAMDAAAAIEBvBAQAnwMCAYIAAQCMAwAAvAQCaAUAAACfBAIEZAQeAG8LBgC8CQj+BwAAAJ8JAwIOCRkAlQMDCA4AAwBNCQA/CQAAAA4JBwBvCwoAvAkIEgsAAACfCQMCMAkIpAwAAABlAA0A+wkAAE0KCC0NAAAAMAoJwA4AAAD7CgEATQkKRA8AAABSCggATQsAuhAAAAD7DAAAnwkEAW4E4f8CAAAAjAYAALcGAgADAAAAqQUAAakFAQCBAQUEEQAAAG8GEQCkBBMAAAAgQZ8EAwGCAAEAFAMBAwIDAwQAACBAAwQDBQMGAwcCAAAAAAAA8D8DCAMJAwoDCwMMAw0DDgMPAxADEQQAACBBABASARgAAAAAAQEAAAABAgEAAAABAAAAAAMBAAAAAQAAAAAAAAIAAAAAAQAAAAAAAAD3AAwAAAAAAAAAAAAAAREAAAAABgAAAQIAOKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQKQEBwAAAGBATQMEJAgAAABNAgOlCQAAAJ8BAgKkAgUAAABAQE0FAL0KAAAATQQFKAsAAABNAwRRDAAAAJ8CAgL/AwMAAAAAAOIEEACMBQAAMAUEwA0AAACkBRQAE0gQwTAFBMAOAAAAqQUBADAFBBkPAAAATQUBMRUAAAAwBQMxFQAAAE0FAREWAAAAMAUDERYAAABNBQGGFwAAADAFA4YXAAAAwAUYABIABAASAAIAMAUDzxkAAACCAwIAGgMTBAAAAEADFAMVAxYEAABAQAMXBAAAYEADGAMZAxoDGwMcAx0DDQMeBQMNDg8DHwMMAyAEE0gQwQMhAyIDIwYAAxIBAAEAARgAAQAAAAAAAQAAAAAAAAAAAQAAAAAAAAAAAQACAQAAAQAAAAEAAAMAAAABAAAAAQAAAAEAAAAAFQEAAAAAARj6h9rB+qlaKj7tTqQq5mbg+XmTiLrj5Sa4NZa7fNW0ZLVsu8qftIs=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.WallColor)
local v_u_3 = require(v1.Game.Garage.Paint)
local v4 = {}
local v_u_5 = {
	["DefaultReflectance"] = 0,
	["DefaultMaterial"] = Enum.Material.SmoothPlastic,
	["DisableReflectance"] = true
}
v4.getInstance = v2.getInstance
v4.updateCamera = v2.updateCamera
v4.getItems = v2.getItems
function v4.apply(p6, p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_3
	local v8 = p7:FindFirstChild("SecondWallColor")
	if v8 then
		local v9 = 0
		for _, v10 in v8:GetChildren() do
			if v10:IsA("BasePart") then
				v9 = v9 + 1
				if p6 and not p6.None then
					v_u_5.DefaultMaterial = v10.Material
					v_u_3.Part(v10, p6.Name, v_u_5)
				else
					v10.Color = v10:GetAttribute("OriginalColor")
				end
			end
		end
		local v11 = v9 > 0
		assert(v11, "No parts to apply to")
	else
		warn("Missing subModel")
	end
end
return v4
