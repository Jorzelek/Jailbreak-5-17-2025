-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("MarketplaceService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Game.Notification)
local v_u_5 = require(v3.ManifestBinder)
local v_u_6 = require(v3.Std.Maid)
local v_u_7 = require(v3.Module.UI).CircleAction
local function v_u_14(p_u_8, p_u_9)
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_1, (copy) v_u_7
	local v10 = v_u_6.new()
	local function v12(_, p11)
		-- upvalues: (ref) v_u_2, (ref) v_u_1, (copy) p_u_9
		if p11 then
			v_u_2:PromptPurchase(v_u_1.LocalPlayer, p_u_9.assetIdObj.Value, true)
		end
		return true
	end
	local v13 = {
		["Part"] = p_u_8,
		["Timed"] = false,
		["Name"] = ("Buy %s"):format(p_u_9.displayNameObj.Value),
		["Dist"] = 16,
		["Callback"] = v12
	}
	v_u_7.Add(v13, p_u_8)
	v10:GiveTask(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_8
		v_u_7.Remove(p_u_8)
	end)
	return v10
end
return {
	["init"] = function()
		-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
		v_u_5.new("CatalogPurchase", {
			["assetIdObj"] = "AssetId",
			["displayNameObj"] = "DisplayName"
		}, v_u_14):Start()
		v_u_2.PromptPurchaseFinished:Connect(function(p15, _, p16)
			-- upvalues: (ref) v_u_1, (ref) v_u_4
			if p15 == v_u_1.LocalPlayer then
				if p16 then
					v_u_4.new({
						["Text"] = "Go to the Roblox avatar editor to wear this item!"
					})
				end
			else
				return
			end
		end)
	end
}
