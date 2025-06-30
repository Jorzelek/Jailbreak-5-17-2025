-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_4 = v_u_1.MakeSequenceType({
	["Prefixes"] = "# hexColor3 ! brickColor3",
	["ValidateEach"] = function(p2, p3)
		if p2 == nil then
			return false, ("Invalid or missing number at position %d in Color3 type."):format(p3)
		elseif p2 < 0 or p2 > 255 then
			return false, ("Number out of acceptable range 0-255 at position %d in Color3 type."):format(p3)
		elseif p2 % 1 == 0 then
			return true
		else
			return false, ("Number is not an integer at position %d in Color3 type."):format(p3)
		end
	end,
	["TransformEach"] = tonumber,
	["Constructor"] = Color3.fromRGB,
	["Length"] = 3
})
local function v_u_6(p5)
	if #p5 == 1 then
		p5 = p5 .. p5
	end
	return tonumber(p5, 16)
end
local v_u_15 = {
	["Transform"] = function(p7)
		-- upvalues: (copy) v_u_1, (copy) v_u_6
		local v8, v9, v10 = p7:match("^#?(%x%x?)(%x%x?)(%x%x?)$")
		return v_u_1.Each(v_u_6, v8, v9, v10)
	end,
	["Validate"] = function(p11, p12, p13)
		local v14
		if p11 == nil or p12 == nil then
			v14 = false
		else
			v14 = p13 ~= nil
		end
		return v14, "Invalid hex color"
	end,
	["Parse"] = function(...)
		return Color3.fromRGB(...)
	end
}
return function(p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_15
	p16:RegisterType("color3", v_u_4)
	p16:RegisterType("color3s", v_u_1.MakeListableType(v_u_4, {
		["Prefixes"] = "# hexColor3s ! brickColor3s"
	}))
	p16:RegisterType("hexColor3", v_u_15)
	p16:RegisterType("hexColor3s", v_u_1.MakeListableType(v_u_15))
end
