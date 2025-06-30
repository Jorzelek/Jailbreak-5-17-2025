-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.String)
local v_u_3 = require(v1.RewardSpinner.RewardSpinnerConsts)
local v_u_4 = require(v1.Trade.TradeReducerUtils)
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v6 = {}
	if p5.RarityId then
		local v7 = v_u_3.RARITY_ID_TO_RARITY[p5.RarityId]
		if not v7 then
			local v8 = error
			local v9 = p5.RarityId
			v8("Invalid item rarity: " .. tostring(v9))
		end
		v6.rarityIndex = v7.index
		local v10 = #v_u_3.RARITIES
		v6.rarityTitle = v7.name
		v6.bubbleColor = v7.color
		if v7.index == v10 then
			v6.backGlowEnabled = true
		elseif v7.index >= v10 - 2 then
			v6.frontGlowEnabled = true
		end
	end
	if p5.ImageId then
		local v11 = p5.ImageId
		v6.image = "rbxassetid://" .. tostring(v11)
	end
	if p5.Type == "Cash" then
		v6.typeTitle = "Cash"
		v6.title = (p5.Amount > 0 and "+" or "") .. "$" .. v_u_2.comma(p5.Amount)
		return v6
	end
	if p5.Type == "Nitro" then
		v6.typeTitle = "Nitro"
		v6.title = (p5.Amount > 0 and "+" or "") .. v_u_2.comma(p5.Amount)
		return v6
	end
	if p5.Type ~= "HyperChrome" then
		if p5.Type == "UniqueItem" then
			local v12 = v_u_4.buildItemProps(p5)
			if not v12 then
				print(p5)
				error("No item props found for rewardData ^")
			end
			v6.title = v12.title
			v6.typeTitle = v12.categoryTitle
			v6.getInst = v12.getInst
			v6.getInstCompare = v12.getInstCompare
			v6.updateCamera = v12.updateCamera
			v6.image = v12.image
		end
		return v6
	end
	v6.typeTitle = "Color"
	v6.title = "HyperChrome!"
	local v13 = p5.Level
	v6.subTitle = "Level " .. tostring(v13)
	return v6
end
