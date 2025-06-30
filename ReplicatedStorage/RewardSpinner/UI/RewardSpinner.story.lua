-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
local v_u_4 = require(v_u_1.RewardSpinner.EnumRarity)
return function(p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
	local v6 = v_u_2.Component:extend("App")
	local v_u_7 = require(script.Parent.RewardSpinner)
	local v_u_8 = require(v_u_1.App.store)
	local v_u_9 = {}
	local v_u_10 = 0
	for _ = 1, 80 do
		local v11 = {
			["Type"] = "Cash",
			["Amount"] = math.random() > 0.5 and 1000 or 0,
			["RarityId"] = v_u_4.Epic
		}
		table.insert(v_u_9, v11)
	end
	function v6.init(_)
		-- upvalues: (copy) v_u_8, (copy) v_u_9, (ref) v_u_10
		local v12 = v_u_8
		local v13 = {
			["type"] = "setRewardSpinnerConfig",
			["items"] = v_u_9,
			["duration"] = 5,
			["winIndex"] = 77
		}
		local v14 = v_u_10
		v13.extraText = "Spin num: " .. tostring(v14)
		v12:dispatch(v13)
	end
	function v6.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_8, (copy) v_u_7, (ref) v_u_10, (copy) v_u_9
		local v15 = v_u_2.createElement
		local v16 = v_u_3.StoreProvider
		local v17 = {
			["store"] = v_u_8
		}
		local v18 = {}
		local v22 = {
			["onFinished"] = function()
				-- upvalues: (ref) v_u_10, (ref) v_u_8, (ref) v_u_9
				v_u_10 = v_u_10 + 1
				local v19 = v_u_8
				local v20 = {
					["type"] = "setRewardSpinnerConfig",
					["items"] = v_u_9,
					["duration"] = 5,
					["winIndex"] = 77
				}
				local v21 = v_u_10
				v20.extraText = "Spin num: " .. tostring(v21)
				v19:dispatch(v20)
			end
		}
		__set_list(v18, 1, {v_u_2.createElement(v_u_7, v22)})
		return v15(v16, v17, v18)
	end
	function v6.willUnmount(_) end
	local v_u_23 = v_u_2.mount(v_u_2.createElement(v6), p5)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_23
		v_u_2.unmount(v_u_23)
	end
end
