-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Roact)
local v_u_4 = require(v2.Std.Maid)
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_1
	local v_u_6 = v_u_4.new()
	local v7, v_u_8 = v_u_3.createBinding(123456)
	local v9, v_u_10 = v_u_3.createBinding(878)
	local v11, v_u_12 = v_u_3.createBinding(0.3)
	local v13, v_u_14 = v_u_3.createBinding(0.5)
	v_u_6:GiveTask(v_u_1.Heartbeat:Connect(function()
		-- upvalues: (copy) v_u_10, (copy) v_u_14, (copy) v_u_12, (copy) v_u_8
		local v15 = os.clock() * 2
		local v16 = math.sin(v15) * 0.5 + 0.5
		v_u_10(v16 * 500)
		v_u_14(v16)
		local v17 = os.clock()
		v_u_12(math.cos(v17) * 0.5 + 0.5)
		local v18 = os.clock() * 0.1
		v_u_8((math.cos(v18) * 0.5 + 0.5) * 1000000)
	end))
	local v19 = require(script.Parent.Speedometer)
	local v20 = v_u_3.mount
	local v21 = v_u_3.createElement
	local v22 = {
		["distance"] = v7,
		["speed"] = v9,
		["barRatio"] = v11,
		["accelRatio"] = v13,
		["size"] = UDim2.new(0.5, 0, 0.5, 0),
		["position"] = UDim2.new(0.25, 0, 0.25, 0),
		["color"] = Color3.fromRGB(252, 40, 47),
		["passengers"] = {
			{
				["Name"] = "badcc"
			},
			{
				["Name"] = "asimo3089"
			},
			{
				["Name"] = "TWENTYMOREMINUTES"
			}
		}
	}
	local v_u_23 = v20(v21(v19, v22), p5)
	return function()
		-- upvalues: (ref) v_u_3, (copy) v_u_23, (copy) v_u_6
		v_u_3.unmount(v_u_23)
		v_u_6:DoCleaning()
	end
end
