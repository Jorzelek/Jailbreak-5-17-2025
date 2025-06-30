-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Std.Signal)
local v_u_4 = require(v2.Std.waitForChild)
local v_u_5 = require(script.Parent.LevelConsts)
local v_u_10 = {
	["init"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_10
		for _, v6 in ipairs(v_u_1:GetPlayers()) do
			v_u_10.connectPlayer(v6)
		end
		v_u_1.PlayerAdded:Connect(v_u_10.connectPlayer)
	end,
	["connectPlayer"] = function(p_u_7)
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_10
		v_u_4(p_u_7, v_u_5.LEVEL_VALUE_NAME):andThen(function(p_u_8)
			-- upvalues: (ref) v_u_10, (copy) p_u_7
			if v_u_10._onLevelChangedSignal then
				v_u_10._onLevelChangedSignal:Fire(p_u_7, p_u_8.Value)
			end
			p_u_8:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: (ref) v_u_10, (ref) p_u_7, (copy) p_u_8
				if v_u_10._onLevelChangedSignal then
					v_u_10._onLevelChangedSignal:Fire(p_u_7, p_u_8.Value)
				end
			end)
		end):catch(warn)
		v_u_4(p_u_7, v_u_5.EXP_VALUE_NAME):andThen(function(p_u_9)
			-- upvalues: (ref) v_u_10, (copy) p_u_7
			if v_u_10._onExpChangedSignal then
				v_u_10._onExpChangedSignal:Fire(p_u_7, p_u_9.Value)
			end
			p_u_9:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: (ref) v_u_10, (ref) p_u_7, (copy) p_u_9
				if v_u_10._onExpChangedSignal then
					v_u_10._onExpChangedSignal:Fire(p_u_7, p_u_9.Value)
				end
			end)
		end):catch(warn)
	end,
	["getOnLevelChangedSignal"] = function()
		-- upvalues: (copy) v_u_10, (copy) v_u_3
		if v_u_10._onLevelChangedSignal then
			return v_u_10._onLevelChangedSignal
		end
		v_u_10._onLevelChangedSignal = v_u_3.new()
		return v_u_10._onLevelChangedSignal
	end,
	["getOnExpChangedSignal"] = function()
		-- upvalues: (copy) v_u_10, (copy) v_u_3
		if v_u_10._onExpChangedSignal then
			return v_u_10._onExpChangedSignal
		end
		v_u_10._onExpChangedSignal = v_u_3.new()
		return v_u_10._onExpChangedSignal
	end
}
return v_u_10
