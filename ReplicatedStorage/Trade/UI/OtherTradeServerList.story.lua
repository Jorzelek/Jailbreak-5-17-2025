-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Clan.ClanConsts)
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(script.Parent.OtherTradeServerList)
	local v_u_7 = require(v_u_1.PersistentCrew.persistentCrewStore)
	local v_u_8 = require(v_u_1.Trade.Test.OtherTradeServerUIData)
	function v5.init(p9)
		-- upvalues: (copy) v_u_8
		p9.aspectRatio = 1.5
		p9.otherTradeServerInfo = v_u_8.otherTradeServerInfo
	end
	function v5.render(p10)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_7, (copy) v_u_6
		local v11 = v_u_2.createElement
		local v12 = v_u_3.StoreProvider
		local v13 = {
			["store"] = v_u_7
		}
		local v14 = {}
		local v15 = v_u_2.createElement
		local v16 = {
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v18 = {
			["x"] = v_u_2.createElement(v_u_6, {
				["otherTradeServerInfo"] = p10.otherTradeServerInfo,
				["onJoinOtherTradeServer"] = function(p17)
					print("CLICK.. join server id", p17)
				end,
				["aspectRatio"] = p10.aspectRatio,
				["visible"] = true,
				["size"] = UDim2.fromScale(1, 1),
				["position"] = UDim2.fromScale(0.5, 0.5)
			}),
			["Aspect"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = p10.aspectRatio
			})
		}
		__set_list(v14, 1, {v15("Frame", v16, v18)})
		return v11(v12, v13, v14)
	end
	local v_u_19 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_19
		v_u_2.unmount(v_u_19)
	end
end
