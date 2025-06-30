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
	local v_u_6 = require(script.Parent.BattleInvites)
	local v_u_7 = require(v_u_1.PersistentCrew.persistentCrewStore)
	function v5.init(_)
		-- upvalues: (copy) v_u_7
		local v8 = {
			["type"] = "battleInvitesSet",
			["list"] = {
				{
					["clanName"] = "CeilingFanCrew",
					["battleNumPlayersPerTeam"] = 5,
					["clanRating"] = 1500,
					["opposingClanOwnerName"] = "badcc",
					["ranked"] = false
				},
				{
					["clanName"] = "BadBoyz",
					["battleNumPlayersPerTeam"] = 4,
					["clanRating"] = 2000,
					["opposingClanOwnerName"] = "badcc",
					["ranked"] = true
				}
			}
		}
		v_u_7:dispatch(v8)
	end
	function v5.render(_)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_7, (copy) v_u_6
		return v_u_2.createElement(v_u_3.StoreProvider, {
			["store"] = v_u_7
		}, { v_u_2.createElement(v_u_6, {
				["onAccept"] = function(p9)
					print("accept", p9)
				end,
				["onDecline"] = function(p10)
					print("decline", p10)
				end
			}) })
	end
	function v5.willUnmount(_) end
	local v_u_11 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_11
		v_u_2.unmount(v_u_11)
	end
end
