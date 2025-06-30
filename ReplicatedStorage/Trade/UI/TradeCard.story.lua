-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Roact)
local v_u_3 = v_u_2.createElement
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(script.Parent.TradeCard)
	function v5.init(_) end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_6
		local v7 = v_u_2.createElement
		local v8 = {
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v9 = {}
		local v10 = v_u_3
		local v11 = v_u_6
		local v12 = {
			["aspectRatio"] = 0.8,
			["season"] = 3,
			["level"] = 5,
			["itemType"] = "VehicleCustomization",
			["title"] = "winter camo",
			["categoryTitle"] = "Texture",
			["info"] = {
				{
					["title"] = "Original Owner",
					["value"] = "badcc"
				},
				{
					["title"] = "Times Traded",
					["value"] = "15"
				},
				{
					["title"] = "Created At",
					["value"] = DateTime.now():FormatLocalTime("ll", "en-us")
				}
			},
			["onCardFlipped"] = function()
				print("flipped!")
			end
		}
		v9.Card = v10(v11, v12)
		v9.AspectRatio = v_u_3("UIAspectRatioConstraint", {
			["AspectRatio"] = 0.8
		})
		return v7("Frame", v8, v9)
	end
	function v5.willUnmount(_) end
	local v_u_13 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_13
		v_u_2.unmount(v_u_13)
	end
end
