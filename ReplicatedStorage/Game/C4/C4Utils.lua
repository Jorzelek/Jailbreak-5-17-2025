-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Std.Audio)
local v_u_3 = require(script.Parent.C4Consts)
return {
	["getDamageRatio"] = function(p4, p5, p6)
		-- upvalues: (copy) v_u_3
		local v7 = p6 or v_u_3.BLAST_RADIUS
		local v8 = (p5 - p4).Magnitude / v7
		return 1 - math.clamp(v8, 0, 1)
	end,
	["explosionVisual"] = function(p9)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v10 = Instance.new("Part")
		v10.Size = Vector3.new(0.1, 0.1, 0.1)
		v10.CanCollide = false
		v10.Anchored = true
		v10.Transparency = 1
		v10.Position = p9
		v10.Parent = workspace
		game:GetService("Debris"):AddItem(v10, 5)
		local v_u_11 = v_u_1.Resource.ItemSystem.Projectiles.Explosion:Clone()
		v_u_11.Parent = v10
		task.delay(0.03333333333333333, function()
			-- upvalues: (copy) v_u_11
			v_u_11:Emit(4)
		end)
		local v_u_12 = v_u_1.Resource.ItemSystem.Projectiles.Debris:Clone()
		v_u_12.Parent = v10
		task.delay(0.03333333333333333, function()
			-- upvalues: (copy) v_u_12
			v_u_12:Emit(50)
		end)
		local v_u_13 = v_u_1.Resource.ItemSystem.Projectiles.Smoke:Clone()
		v_u_13.Parent = v10
		task.delay(0.03333333333333333, function()
			-- upvalues: (copy) v_u_13
			v_u_13:Emit(3)
		end)
		local v_u_14 = v_u_1.Resource.ItemSystem.Projectiles.LandingSmoke:Clone()
		v_u_14.Enabled = true
		v_u_14.Parent = v10
		task.delay(5 - v_u_14.Lifetime.Max, function()
			-- upvalues: (copy) v_u_14
			v_u_14.Enabled = false
		end)
		v_u_2.ObjectLocal(v10, 2205008239, {
			["Volume"] = 1
		}).EmitterSize = 20
	end
}
