-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Std.Promise)
local v3 = require(v_u_1.Std.Signal)
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v_u_1.CmdrExt.CmdrGuiUtils)
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = false
local v_u_9 = v3.new()
local v_u_14 = {
	["init"] = function()
		-- upvalues: (ref) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_14
		v_u_6 = v_u_5.frame(v_u_4.LocalPlayer)
		local v10 = Instance.new("ObjectValue")
		v10.Name = "CmdrFrameValue"
		v10.Value = v_u_6
		v10.Parent = v_u_4.LocalPlayer
		local v11 = Instance.new("ScreenGui")
		v11.ResetOnSpawn = false
		v11.DisplayOrder = 1000
		v11.Parent = v_u_4.LocalPlayer.PlayerGui
		v_u_5.autocomplete(v11)
		task.spawn(v_u_14._load, v11)
	end,
	["_load"] = function(p12)
		-- upvalues: (copy) v_u_4, (ref) v_u_7, (copy) v_u_1, (copy) v_u_9, (ref) v_u_8
		local v13 = Instance.new("ObjectValue")
		v13.Name = "CmdrAutocompleteGuiValue"
		v13.Value = p12
		v13.Parent = v_u_4.LocalPlayer
		v_u_7 = require(v_u_1:WaitForChild("CmdrClient"))
		v_u_7:SetActivationKeys({})
		v_u_7:SetHideOnLostFocus(false)
		v_u_7:SetPlaceName("jb")
		v_u_9:Fire()
		v_u_8 = true
	end,
	["promiseCmdr"] = function()
		-- upvalues: (ref) v_u_8, (copy) v_u_2, (ref) v_u_7, (ref) v_u_6, (copy) v_u_9
		if v_u_8 then
			return v_u_2.resolve(v_u_7, v_u_6)
		else
			return v_u_2.fromEvent(v_u_9):andThen(function()
				-- upvalues: (ref) v_u_7, (ref) v_u_6
				return v_u_7, v_u_6
			end)
		end
	end,
	["mount"] = function() end
}
return v_u_14
