-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("Players")
local v_u_9 = {
	["init"] = function()
		-- upvalues: (copy) v_u_9, (copy) v_u_2
		v_u_9._handlePlayer(v_u_2.LocalPlayer)
	end,
	["_handlePlayer"] = function(p3)
		-- upvalues: (copy) v_u_9
		if p3.Character then
			v_u_9._handleCharacter(p3.Character)
		end
		p3.CharacterAdded:Connect(v_u_9._handleCharacter)
	end,
	["_handleCharacter"] = function(p4)
		-- upvalues: (copy) v_u_9, (copy) v_u_1
		local v5 = p4:WaitForChild("Humanoid"):WaitForChild("Animator")
		local v6 = v5:LoadAnimation(p4:WaitForChild("Animate"):WaitForChild("idle"):WaitForChild("Animation1"))
		v6.Priority = Enum.AnimationPriority.Action
		v6:AdjustSpeed(0)
		v_u_9._idleTrack = v6
		v_u_9._skydiveTrack = v5:LoadAnimation(v_u_1.Resource.Skydive)
		local v7 = v5:LoadAnimation(v_u_1.Resource.RopeGrabAnimation)
		v7.Priority = Enum.AnimationPriority.Action
		v7:AdjustSpeed(0)
		v_u_9._ropeGrabTrack = v7
		local v8 = v5:LoadAnimation(v_u_1.Resource.CarSitAnimation)
		v8:AdjustSpeed(0)
		v_u_9._carSitTrack = v8
	end,
	["getIdleTrack"] = function()
		-- upvalues: (copy) v_u_9
		return v_u_9._idleTrack
	end,
	["getSkydiveTrack"] = function()
		-- upvalues: (copy) v_u_9
		return v_u_9._skydiveTrack
	end,
	["getRopeGrabTrack"] = function()
		-- upvalues: (copy) v_u_9
		return v_u_9._ropeGrabTrack
	end,
	["getCarSitTrack"] = function()
		-- upvalues: (copy) v_u_9
		return v_u_9._carSitTrack
	end
}
return v_u_9
