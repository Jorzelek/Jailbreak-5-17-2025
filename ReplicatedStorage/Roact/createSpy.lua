-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.assertDeepEqual)
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	local v_u_13 = {
		["callCount"] = 0,
		["values"] = {},
		["valuesLength"] = 0,
		["value"] = function(...)
			-- upvalues: (copy) v_u_13, (copy) p_u_2
			v_u_13.callCount = v_u_13.callCount + 1
			v_u_13.values = { ... }
			v_u_13.valuesLength = select("#", ...)
			if p_u_2 == nil then
				return nil
			else
				return p_u_2(...)
			end
		end,
		["assertCalledWith"] = function(_, ...)
			-- upvalues: (copy) v_u_13
			local v3 = select("#", ...)
			if v_u_13.valuesLength ~= v3 then
				error(("Expected %d arguments, but was called with %d arguments"):format(v_u_13.valuesLength, v3), 2)
			end
			for v4 = 1, v3 do
				local v5 = select(v4, ...) == v_u_13.values[v4]
				assert(v5, "value differs")
			end
		end,
		["assertCalledWithDeepEqual"] = function(_, ...)
			-- upvalues: (copy) v_u_13, (ref) v_u_1
			local v6 = select("#", ...)
			if v_u_13.valuesLength ~= v6 then
				error(("Expected %d arguments, but was called with %d arguments"):format(v_u_13.valuesLength, v6), 2)
			end
			for v7 = 1, v6 do
				local v8 = select(v7, ...)
				v_u_1(v_u_13.values[v7], v8)
			end
		end,
		["captureValues"] = function(_, ...)
			-- upvalues: (copy) v_u_13
			local v9 = select("#", ...)
			local v10 = v_u_13.valuesLength == v9
			assert(v10, "length of expected values differs from stored values")
			local v11 = {}
			for v12 = 1, v9 do
				v11[select(v12, ...)] = v_u_13.values[v12]
			end
			return v11
		end
	}
	setmetatable(v_u_13, {
		["__index"] = function(_, p14)
			error(("%q is not a valid member of spy"):format(p14))
		end
	})
	return v_u_13
end
