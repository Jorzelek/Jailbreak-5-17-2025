-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMiBU1vZGVsBmlwYWlycw5HZXREZXNjZW5kYW50cwROYW1lDlNlY29uZEludGVyaW9yBXRhYmxlBmluc2VydARNYWtlBkNoaXJvbg1TdGVlcmluZ1doZWVsDkZpbmRGaXJzdENoaWxkBVdlZGdlCE1hdmVyaWNrBVZlbm9tBUNvYnJhBVNsb29wBlZpc3VhbARGbGFnFUdldERlZmF1bHRWZWhpY2xlUGFydAhNYXRlcmlhbA9EZWZhdWx0TWF0ZXJpYWwLUmVmbGVjdGFuY2USRGVmYXVsdFJlZmxlY3RhbmNlBEVudW0NU21vb3RoUGxhc3RpYwRQYXJ0BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVBhaW50BEdhbWUGR2FyYWdlClBhaW50VXRpbHMAAg8CAwAAAJcBTQIBOwAAAAD/AwAAAAAAAKQEAgAAABBAvAUCRwMAAACfBQIAnwQABFEECwBNCQi6BAAAAPAJCAAFAACAnjQDBQgAAABSCgMAUgsIAKQJCAAAHGCAnwkDAW4E9P8CAACATQQBrQkAAADwBA0ACgAAgFIGAwBNBwI7AAAAAG8JCwC8BwcDDAAAAJ8HAwBMNAACpAUIAAAcYICfBQABZQBEAPAEDQANAACAUgYDAE0HAjsAAAAAbwkLALwHBwMMAAAAnwcDAEw0AAKkBQgAABxggJ8FAAFlADYA8AQNAA4AAIBSBgMATQcCOwAAAABvCQsAvAcHAwwAAACfBwMATDQAAqQFCAAAHGCAnwUAAWUAKADwBA0ADwAAgFIGAwBNBwI7AAAAAG8JCwC8BwcDDAAAAJ8HAwBMNAACpAUIAAAcYICfBQABZQAaAPAEDQAQAACAUgYDAE0HAjsAAAAAbwkLALwHBwMMAAAAnwcDAEw0AAKkBQgAABxggJ8FAAFlAAwA8AQLABEAAIBNCALQEgAAAE0HCKQTAAAAnjQDBAcAAABSBgMApAUIAAAcYICfBQMBpAUCAAAAEEBSBgMAnwUCBFEFIwD7CwAATQoLiBQAAABSCwkAnwoCAg4KCwD7CwEATQwKLRUAAAAwDAvAFgAAAPsLAQBNDApiFwAAADAMC8AYAAAAZQAJAPsLAQCkDBsAGlSQwTAMC8AWAAAA+wsBAIwMAAAwDAvAGAAAAA4ACAD7DAIATQsMRBwAAABSDAkATQ0AugQAAAD7DgEAnwsEAW4F3P8CAACAggABAB0DAQMCBAAAEEADAwMEAwUDBgMHBAAcYIADCAMJAwoDCwMMAw0DDgMPAxADEQMSAxMDFAMVAxYDFwMYAxkEGlSQwQMaAAgAARgAAAIAAQAAAAAAAAEAAAABAAAAAAAA/gAFAAEAAgAAAAAAAAAAAAAAAQABAAAAAAAAAAAAAAABAAEAAAAAAAAAAAAAAAEAAQAAAAAAAAAAAAAAAQABAAAAAAAAAAAAAAABAAEAAAAAAAAAAAACAAAAAAEAAAAAAQEAAAAAAQAAAAAAAgAAAAABAAAAAgEAAAAAAAAA9gANCQAAAAAGAAABAgAgowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQQAvQcAAABNAwQoCAAAAE0CA1EGAAAAnwECAqQCBQAAAEBATQUAvQcAAABNBAUoCAAAAE0DBHkJAAAAnwICAv8DAgAAAAAAwAQKABIAAgASAAMAEgABAIIEAgALAxsEAAAAQAMcAx0DHgQAAEBAAx8DIAMhAyIGAAEAAQABGAABAAAAAAABAAAAAAAAAAABAAAAAAAAAAACAAIAAAAAAQAAAAABkq4W+8qtYoWganxv4w4pvg5giMJv/5AWAlBpnfCYzgH3BFxkAy5gag==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Garage.Paint)
local v_u_3 = require(v1.Game.Garage.PaintUtils)
local v_u_4 = {}
return function(p5, p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v7 = p6.Model
	local v8 = {}
	for _, v9 in ipairs(v7:GetDescendants()) do
		if v9.Name == "SecondInterior" then
			table.insert(v8, v9)
		end
	end
	local v10 = p6.Make
	if v10 == "Chiron" then
		local v11 = v7.Model
		table.insert(v8, v11:FindFirstChild("SteeringWheel"))
	elseif v10 == "Wedge" then
		local v12 = v7.Model
		table.insert(v8, v12:FindFirstChild("SteeringWheel"))
	elseif v10 == "Maverick" then
		local v13 = v7.Model
		table.insert(v8, v13:FindFirstChild("SteeringWheel"))
	elseif v10 == "Venom" then
		local v14 = v7.Model
		table.insert(v8, v14:FindFirstChild("SteeringWheel"))
	elseif v10 == "Cobra" then
		local v15 = v7.Model
		table.insert(v8, v15:FindFirstChild("SteeringWheel"))
	elseif v10 == "Sloop" then
		local v16 = v7.Visual.Flag
		table.insert(v8, v16)
	end
	for _, v17 in ipairs(v8) do
		local v18 = v_u_3.GetDefaultVehiclePart(v17)
		if v18 then
			v_u_4.DefaultMaterial = v18.Material
			v_u_4.DefaultReflectance = v18.Reflectance
		else
			v_u_4.DefaultMaterial = Enum.Material.SmoothPlastic
			v_u_4.DefaultReflectance = 0
		end
		if p5 then
			v_u_2.Part(v17, p5.Name, v_u_4)
		end
	end
end
