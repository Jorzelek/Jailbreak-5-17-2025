-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMZBU1vZGVsBE1ha2UFU2VhdHMORmluZEZpcnN0Q2hpbGQFdGFibGUGaW5zZXJ0CUNhcmJvbmFyYQ1TdGVlcmluZ1doZWVsFUdldERlZmF1bHRWZWhpY2xlUGFydAtSZWZsZWN0YW5jZRJEZWZhdWx0UmVmbGVjdGFuY2UITWF0ZXJpYWwPRGVmYXVsdE1hdGVyaWFsBEVudW0HUGxhc3RpYwRQYXJ0BE5hbWUEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUER2FtZQZHYXJhZ2UKUGFpbnRVdGlscwVQYWludAACEAICAAAARU0CATsAAAAATQMBrQEAAAAOAD8A/wQAAAAAAABSBgQATQcCOwAAAABvCQIAvAcHAwMAAACfBwMATDQAAqQFBgAAFECAnwUAAfADCwAHAACATQgCOwAAAABNBwj2CAAAAJ40BAQHAAAAUgYEAKQFBgAAFECAnwUDAVIFBADGBgAAxgcAAGQFIAD7CwAATQoLiAkAAABSCwkAnwoCAv8LAgAAAAAADgoJAE0MCmIKAAAAMAwLwAsAAABNDAotDAAAADAMC8ANAAAAZQAHAG8MDgAwDAvACwAAAKQMEQAQMPDAMAwLwA0AAAD7DQEATQwNRBIAAABSDQkATQ4AuhMAAABSDwsAnwwEAW4F3/8CAAAAggABABQDAQMCAwMDBAMFAwYEABRAgAMHAwgDCQMKAwsDDAMNApqZmZmZmbk/Aw4DDwQQMPDAAxADEQAGAAEYAAABAAIBAAEAAAAAAAAAAAAAAQABAAAAAAAAAAAAAwAAAAEAAAAAAgABAQAAAAEAAAAAAgAAAQAAAAMAAAAAAAAA9AAPBwAAAAAGAAABAgAdowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQQAvQYAAABNAwQoBwAAAE0CA3kIAAAAnwECAqQCBQAAAEBATQUAvQYAAABNBAUoBwAAAE0DBFEJAAAAnwICAsADCgASAAEAEgACAIIDAgALAxIEAAAAQAMTAxQDFQQAAEBAAxYDFwMYAxkGAAEAAQABGAABAAAAAAABAAAAAAAAAAABAAAAAAAAAAACAAAAAQAAAAABsDWsuc2SkbeC8cYtvjBuwYnI+NKAXL1n7mO+BMNWAg3o830AYxjYlQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Garage.PaintUtils)
local v_u_3 = require(v1.Game.Garage.Paint)
return function(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = p5.Model
	local v7 = p5.Make
	if p4 then
		local v8 = {}
		local v9 = v6.Model
		table.insert(v8, v9:FindFirstChild("Seats"))
		if v7 == "Carbonara" then
			local v10 = v6.Model.SteeringWheel
			table.insert(v8, v10)
		end
		for _, v11 in v8 do
			local v12 = v_u_2.GetDefaultVehiclePart(v11)
			local v13 = {}
			if v12 then
				v13.DefaultReflectance = v12.Reflectance
				v13.DefaultMaterial = v12.Material
			else
				v13.DefaultReflectance = 0.1
				v13.DefaultMaterial = Enum.Material.Plastic
			end
			v_u_3.Part(v11, p4.Name, v13)
		end
	end
end
