-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMoBU1vZGVsB0NsYXNzaWMHU3BvaWxlchJEZWZhdWx0UmVmbGVjdGFuY2UPRGVmYXVsdE1hdGVyaWFsBEVudW0ITWF0ZXJpYWwNU21vb3RoUGxhc3RpYwhSZXNvdXJjZQ5GaW5kRmlyc3RDaGlsZAtSZWZsZWN0YW5jZQtTcG9pbGVyUGFydARQYXJ0BE5hbWUFV2hpdGUKR3VpdGFyUmlmZgZpcGFpcnMLR2V0Q2hpbGRyZW4FVHJhaWwDSXNBDUNvbG9yU2VxdWVuY2UDbmV3BUNvbG9yEFZlaGljbGVDb2xvclBhcnQGSGFzVGFnBkFkZFRhZxFpc0h5cGVyQ2hyb21lTmFtZR9IWVBFUkNIUk9NRV9OQU1FX0FUVFJJQlVURV9OQU1FDFNldEF0dHJpYnV0ZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQVQYWludARHYW1lBkdhcmFnZRFDb2xsZWN0aW9uU2VydmljZQtIeXBlckNocm9tZRFIeXBlckNocm9tZUNvbnN0cxBIeXBlckNocm9tZVV0aWxzAAIPAwUAAABzTQMBOwAAAABNBQKCAgAAAJAEBQHiBQUAjAYAADAGBcADAAAApAYJAAgcYMAwBgXABAAAAA4EEQD7CAAATQcIYgoAAABNBgeCAgAAAFIIBAC8BgYDCwAAAJ8GAwJNBwZiDAAAADAHBcADAAAATQcGLQcAAAAwBwXABAAAAG8IDQC8BgMDCwAAAJ8GAwIOBk4ARwAKAAAAAAD7CAEATQcIRA4AAABSCAYATQkAug8AAABSCgUAnwcEAWUABwD7CAEATQcIRA4AAABSCAYAbwkQAFIKBQCfBwQB8AQWABEAAICkBxMAAAAgQbwIBmgUAAAAnwgCAJ8HAARRBwwAbw4VALwMC/4WAAAAnwwDAg4MBwCkDBkAAGBwgU0NBqQaAAAAnwwCAjAMC6QaAAAAbgfz/wIAAID7BwIAUgkGAG8KGwC8BwfeHAAAAJ8HBAIrBwYA+wcCAFIJBgBvChsAvAcHRR0AAACfBwQBDgAQAPsIAwBNBwiGHgAAAE0IALoPAAAAnwcCAg4HCQD7CgQATQkK/h8AAABNCgC6DwAAALwHBi4gAAAAnwcEAYIAAQD7CgQATQkK/h8AAADGCgAAvAcGLiAAAACfBwQBggABACEDAQMCAwMDBAMFBQIDBAMGAwcDCAQIHGDAAwkDCgMLAwwDDQMOAw8DEAMRBAAAIEEDEgMTAxQDFQMWBABgcIEDFwMYAxkDGgMbAxwDHQAIAAEYAAABAAABAQAAAQAAAAMBAAAAAAAAAAABAAAAAQAAAAIAAAABAQABAAAAAAAAAAACAAAAAAAAAwABAAAAAAAAAQAAAAABAAAAAAAA/gAHAAAAAAAAAQAAAAAAAgAAAAAAAAABAAAAAAAAAAACAAAAAAAAAwkAAAAABwAAAQIAK6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0EAL0HAAAATQMEKAgAAABNAgNRBgAAAJ8BAgKkAgEAAAAAQG8ECQC8AgIWAwAAAJ8CAwKkAwUAAABAQE0FAKMKAAAATQQFxgsAAACfAwICpAQFAAAAQEBNBgCjCgAAAE0FBrMMAAAAnwQCAsAFDQASAAAAEgABABIAAgASAAQAEgADAIIFAgAOAx4EAAAAQAMfAyADIQQAAEBAAyIDIwMkAyUDJgMnAygGAAEAAQABGAABAAAAAAABAAAAAAAAAAABAAAAAAABAAAAAAAAAQAAAAAAAAIAAAAAAAABAAAAAAELo6ASaIzmWDlnyoY3MZvnu8bMavPWCKWpyxBX0oYD5lUqwbgGXjcP

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Game.Garage.Paint)
local v_u_3 = game:GetService("CollectionService")
local v_u_4 = require(v_u_1.HyperChrome.HyperChromeConsts)
local v_u_5 = require(v_u_1.HyperChrome.HyperChromeUtils)
return function(p6, p7, p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v9 = p7.Model
	local v10 = p8.Spoiler or "Classic"
	local v11 = {
		["DefaultReflectance"] = 0,
		["DefaultMaterial"] = Enum.Material.SmoothPlastic
	}
	if v10 then
		local v12 = v_u_1.Resource.Spoiler:FindFirstChild(v10)
		v11.DefaultReflectance = v12.Reflectance
		v11.DefaultMaterial = v12.Material
	end
	local v13 = v9:FindFirstChild("SpoilerPart")
	if v13 then
		if p6 == nil then
			v_u_2.Part(v13, "White", v11)
		else
			v_u_2.Part(v13, p6.Name, v11)
		end
		if v10 == "GuitarRiff" then
			for _, v14 in ipairs(v13:GetChildren()) do
				if v14:IsA("Trail") then
					v14.Color = ColorSequence.new(v13.Color)
				end
			end
		end
		if not v_u_3:HasTag(v13, "VehicleColorPart") then
			v_u_3:AddTag(v13, "VehicleColorPart")
		end
		if p6 and v_u_5.isHyperChromeName(p6.Name) then
			v13:SetAttribute(v_u_4.HYPERCHROME_NAME_ATTRIBUTE_NAME, p6.Name)
			return
		end
		v13:SetAttribute(v_u_4.HYPERCHROME_NAME_ATTRIBUTE_NAME, nil)
	end
end
