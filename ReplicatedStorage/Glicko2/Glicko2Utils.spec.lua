-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Glicko2.Glicko2Utils)
return function()
	-- upvalues: (copy) v_u_2
	describe("checkSingleBattle", function()
		-- upvalues: (ref) v_u_2
		it("single battle rating should be correct", function()
			-- upvalues: (ref) v_u_2
			local v3, v4, v5 = v_u_2.calculateNewRatingData(1500, 350, 0.06, { 1500 }, { 350 }, { 1 })
			local v6 = v3 - 1662.31
			local v7 = math.abs(v6) <= 0.01
			local v8 = v4 - 290.319
			if math.abs(v8) > 0.01 then
				v7 = false
			end
			local v9 = v5 - 0.05999968
			if math.abs(v9) > 0.01 then
				v7 = false
			end
			if not v7 then
				print(v3, v4, v5)
			end
			expect(v7).to.equal(true)
		end)
	end)
	describe("checkMultipleBattles", function()
		-- upvalues: (ref) v_u_2
		it("single battle rating should be correct", function()
			-- upvalues: (ref) v_u_2
			local v10, v11, v12 = v_u_2.calculateNewRatingData(1500, 200, 0.06, { 1400, 1550, 1700 }, { 30, 100, 300 }, { 1, 0, 0 })
			local v13 = v10 - 1464.06
			local v14 = math.abs(v13) <= 0.01
			local v15 = v11 - 151.52
			if math.abs(v15) > 0.01 then
				v14 = false
			end
			local v16 = v12 - 0.05999
			if math.abs(v16) > 0.01 then
				v14 = false
			end
			if not v14 then
				print(v10, v11, v12)
			end
			expect(v14).to.equal(true)
		end)
	end)
end
