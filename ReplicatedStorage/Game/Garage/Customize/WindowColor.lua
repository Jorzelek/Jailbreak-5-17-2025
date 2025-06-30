-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Game.Garage.Paint)
local v_u_3 = require(v1.Game.Garage.PaintUtils)
return function(p4, p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = p5.Model
	local _ = p5.Type
	local v7 = p5.Make
	if p4 then
		local v8 = p4.Name
		local v9 = {}
		for _, v10 in ipairs(v6:GetDescendants()) do
			if v10.Name == "Windows" then
				table.insert(v9, v10)
			end
		end
		for _, v11 in ipairs(v9) do
			local v12 = v_u_3.GetDefaultVehiclePart(v11)
			local v13 = {
				["DefaultReflectance"] = v12.Reflectance,
				["DefaultMaterial"] = v12.Material
			}
			if v7 == "Concept" then
				v13.OverrideMaterial = Enum.Material.ForceField
			end
			v_u_2.Part(v11, v8, v13)
			if v7 == "Heli" or (v7 == "BlackHawk" or v7 == "LittleBird") then
				local v14 = v11.Color
				local v15 = Color3.new
				local v16 = v14.r * 1.4
				local v17 = math.clamp(v16, 0, 1)
				local v18 = v14.g * 1.4
				local v19 = math.clamp(v18, 0, 1)
				local v20 = v14.b * 1.4
				v11.Color = v15(v17, v19, (math.clamp(v20, 0, 1)))
			end
		end
		local v21 = v6:FindFirstChild("Preset")
		if v21 then
			local v22 = v21:FindFirstChild("DoorLeft")
			local v23 = v22 and v22:FindFirstChild("Window")
			if v23 then
				local v24 = v_u_2.Part
				local v25 = v_u_3.GetDefaultVehiclePart(v23)
				v24(v23, v8, {
					["DefaultReflectance"] = v25.Reflectance,
					["DefaultMaterial"] = v25.Material
				})
			end
			local v26 = v21:FindFirstChild("DoorRight")
			local v27 = v26 and v26:FindFirstChild("Window")
			if v27 then
				local v28 = v_u_2.Part
				local v29 = v_u_3.GetDefaultVehiclePart(v27)
				v28(v27, v8, {
					["DefaultReflectance"] = v29.Reflectance,
					["DefaultMaterial"] = v29.Material
				})
			end
		end
	end
end
