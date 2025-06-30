-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Game.ItemSkin.ItemSkinIds)
return {
	["getUpdateCamera"] = function()
		local v_u_3 = nil
		local v_u_4 = nil
		return function(p5, p6)
			-- upvalues: (ref) v_u_3, (ref) v_u_4
			if p6 then
				if p6 ~= v_u_3 then
					local v7, v8 = p6:GetBoundingBox()
					_ = v7
					v_u_4 = v8
					v_u_3 = p6
				end
				local v9 = os.clock()
				local v10 = CFrame.new(0, 0, 0) * CFrame.Angles(0, v9 % 6.283185307179586, 0)
				local v11 = CFrame.Angles
				local v12 = v9 * 0.5
				p5.CFrame = v10 * v11(math.sin(v12) * 0.3 - 0.4, 0, 0) * CFrame.new(0, 0, v_u_4.Magnitude * 0.8)
			end
		end
	end,
	["getModel"] = function(p13, p14)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v15 = p14 or "RocketLauncher"
		assert(v15)
		local v16 = v_u_1.Resource.ItemSystem.Models:FindFirstChild(v15):Clone()
		local v17 = v16:GetBoundingBox()
		v16.PrimaryPart = v16:FindFirstChild("Skeleton"):FindFirstChild("BoundingBox")
		v16:SetPrimaryPartCFrame(v16.PrimaryPart.CFrame:ToObjectSpace(v17):Inverse())
		local v18
		if p13 == "None" then
			v18 = nil
		else
			local v19 = v_u_2[p13]
			if not v19 then
				error(("No skin by name of %s exists."):format(p13))
			end
			v18 = v19[v15]
			if not v18 then
				error(("Skin %s has no image id for item: %s"):format(p13, v15))
			end
		end
		for _, v20 in v16:GetDescendants() do
			if v20:IsA("MeshPart") and v20:GetAttribute("ApplyGunTexture") == true then
				v20.TextureID = not v18 and "" or ("rbxassetid://%d"):format(v18)
			end
		end
		return v16
	end
}
