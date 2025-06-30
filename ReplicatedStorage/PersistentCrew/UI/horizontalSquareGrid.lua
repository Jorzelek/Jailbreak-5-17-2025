-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Roact)
local v_u_3 = require(v1.Std.Dictionary)
local v_u_4 = v2.createElement
local v_u_5 = require(v1.EzUi.PaddedContainer)
local function v_u_8(p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v7 = 1 / (1 / p6.aspectRatio + 1 / p6.verticalPaddingRatio / p6.aspectRatio)
	return v_u_4(v_u_5, {
		["component"] = p6.component,
		["props"] = p6.props,
		["aspectRatio"] = v7,
		["verticalPaddingRatio"] = p6.verticalPaddingRatio,
		["size"] = UDim2.fromScale(1 / v7, 1),
		["position"] = UDim2.fromScale(0.5 + (p6.index - 1 - p6.numItems / 2) / v7, 0),
		["paddingTop"] = 0,
		["paddingBottom"] = 0,
		["paddingRight"] = 0.5,
		["paddingLeft"] = 0.5
	})
end
return function(p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_3, (copy) v_u_5
	local v10 = p9.numItems or #p9.items
	local v11 = {}
	for v12 = 1, v10 do
		v11[v12] = v_u_4(v_u_8, {
			["exposePaddedContainerProps"] = true,
			["index"] = v12,
			["numItems"] = v10,
			["component"] = p9.component,
			["props"] = v_u_3.merge(p9.items[v12], p9.itemMetadata)
		})
	end
	return v_u_4(v_u_5, {
		["backgroundTransparency"] = 1,
		["backgroundColor"] = Color3.new(0, 0, 0),
		["aspectRatio"] = p9.aspectRatio,
		["verticalPaddingRatio"] = p9.verticalPaddingRatio,
		["size"] = UDim2.fromScale(1, 1),
		["paddingLeft"] = 0,
		["paddingRight"] = 0
	}, v11)
end
