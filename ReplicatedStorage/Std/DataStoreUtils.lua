-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("HttpService")
local v2 = {}
local function v_u_6(p3)
	-- upvalues: (copy) v_u_6
	for v4, v5 in p3 do
		if typeof(v4) == "string" then
			if #v4 >= 1000 then
				warn("Key is too long")
				return false
			end
			if not utf8.len(v4) then
				warn("Key is not valid utf8")
				return false
			end
		else
			if typeof(v4) ~= "number" then
				warn("Key is not a string or number")
				return false
			end
			if v4 ~= v4 then
				warn("Key is NaN")
				return false
			end
		end
		if typeof(v5) == "table" then
			if not v_u_6(v5) then
				warn((("SubTable at %* was not safe"):format((tostring(v4)))))
				return false
			end
		elseif typeof(v5) ~= "number" then
			if typeof(v5) == "string" then
				if #v5 >= 4000000 then
					warn("Value is too long")
					return false
				end
				if not utf8.len(v5) then
					warn("Value is not valid utf8")
					return false
				end
			elseif typeof(v5) ~= "boolean" then
				warn("Value is not a table, number, or string")
				return false
			end
		end
	end
	return true
end
function v2.isTableSafe(p_u_7, p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	if typeof(p_u_7) == "table" then
		local v_u_9 = nil
		local v10, v11 = pcall(function()
			-- upvalues: (ref) v_u_1, (copy) p_u_7, (ref) v_u_9
			v_u_9 = #v_u_1:JSONEncode(p_u_7)
		end)
		if v10 then
			if (not (p8 and p8.maxTotalLength) and 4194304 or p8.maxTotalLength) <= v_u_9 then
				return false
			else
				return v_u_6(p_u_7)
			end
		else
			warn("Failed to encode to JSON: " .. tostring(v11))
			return false
		end
	else
		return false
	end
end
function v2.isStringSafe(p12)
	if typeof(p12) == "string" then
		if utf8.len(p12) == nil then
			return false
		else
			return #p12 <= 1000000
		end
	else
		return false
	end
end
return v2
