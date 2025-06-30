-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = script:FindFirstAncestor("EzUi")
local v_u_2 = require(v1.Parent.Roact)
local v_u_3 = v_u_2.createElement
local function v_u_5(p4)
	-- upvalues: (copy) v_u_3
	return v_u_3("TextLabel", {
		["BackgroundTransparency"] = 0.5,
		["BackgroundColor3"] = p4.color,
		["Size"] = p4.size,
		["Position"] = p4.position,
		["Text"] = p4.title
	})
end
return function(p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5
	local v7 = require(script.Parent.ScrollingGrid)
	local v8 = {}
	for v9 = 1, 31 do
		local v10 = {
			["title"] = tostring(v9),
			["color"] = Color3.fromHSV(math.random(), 1, 1)
		}
		table.insert(v8, v10)
	end
	local v11 = v_u_2.mount
	local v12 = v_u_3
	local v13 = {
		["BackgroundTransparency"] = 0.5,
		["Size"] = UDim2.new(0.9, 0, 0.9, 0),
		["Position"] = UDim2.new(0.05, 0, 0.05, 0)
	}
	local v14 = {
		["AspectRatio"] = v_u_3("UIAspectRatioConstraint", {
			["AspectRatio"] = 1.5
		})
	}
	local v15 = {
		["aspectRatio"] = 1.5,
		["paddingRatio"] = 128,
		["rowsPerPage"] = 3,
		["colsPerRow"] = 3,
		["component"] = v_u_5,
		["items"] = v8
	}
	v14.Grid = v_u_2.createElement(v7, v15)
	local v_u_16 = v11(v12("Frame", v13, v14), p6)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_16
		v_u_2.unmount(v_u_16)
	end
end
