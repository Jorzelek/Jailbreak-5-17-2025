-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v_u_1.Roact)
local v_u_3 = require(v_u_1.RoactRodux)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(v_u_1.App.store)
	local v_u_7 = require(script.Parent.Safes)
	function v5.init(_)
		-- upvalues: (copy) v_u_6
		local v8 = {
			["type"] = "setSafesInventoryItems",
			["itemsOwned"] = {
				{
					["Id"] = "a1",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				},
				{
					["Id"] = "a2",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				},
				{
					["Id"] = "a3",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				},
				{
					["Id"] = "a4",
					["ItemType"] = "Safe",
					["TypeEnum"] = 2
				},
				{
					["Id"] = "a5",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				},
				{
					["Id"] = "a6",
					["ItemType"] = "Safe",
					["TypeEnum"] = 2
				},
				{
					["Id"] = "a7",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				},
				{
					["Id"] = "a8",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				},
				{
					["Id"] = "a9",
					["ItemType"] = "Safe",
					["TypeEnum"] = 1
				}
			}
		}
		v_u_6:dispatch(v8)
		v_u_6:dispatch({
			["type"] = "setSafesOpen",
			["value"] = true
		})
	end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_6, (copy) v_u_7
		local v9 = {
			["store"] = v_u_6
		}
		return v_u_2.createElement(v_u_3.StoreProvider, v9, { v_u_2.createElement(v_u_7, {}) })
	end
	function v5.willUnmount(_) end
	local v_u_10 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_10
		v_u_2.unmount(v_u_10)
	end
end
