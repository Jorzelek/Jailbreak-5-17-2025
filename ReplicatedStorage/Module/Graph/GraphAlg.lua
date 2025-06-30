-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_29 = {
	["dfs"] = function(p_u_1, p2, p_u_3, p4)
		local v5 = p_u_1 ~= nil
		assert(v5, "missing Graph G")
		local v6 = p2 ~= nil
		assert(v6, "missing start vertex v")
		local v7 = typeof(p_u_3) == "nil" and true or typeof(p_u_3) == "function"
		assert(v7, "invalid condition")
		local v_u_8 = p4 or p_u_1.GetNeighbors
		local v_u_9 = {}
		local function v_u_12(p10)
			-- upvalues: (copy) v_u_9, (ref) v_u_8, (copy) p_u_1, (copy) p_u_3, (copy) v_u_12
			v_u_9[p10] = true
			for _, v11 in ipairs(v_u_8(p_u_1, p10)) do
				if not v_u_9[v11] and (p_u_3 == nil or p_u_3(v11)) then
					v_u_12(v11)
				end
			end
		end
		v_u_12(p2)
		return v_u_9
	end,
	["bfsSearch"] = function(p13, p14, p15)
		local v16 = {}
		table.insert(v16, p14)
		local v17 = {
			[p14] = true
		}
		while #v16 > 0 do
			local v18 = table.remove(v16)
			if p15(v18) then
				return v18
			end
			for _, v19 in ipairs(p13:GetNeighbors(v18)) do
				if not v17[v19] then
					v17[v19] = true
					table.insert(v16, v19)
				end
			end
		end
	end,
	["weaklyConnectedComponents"] = function(p20)
		-- upvalues: (copy) v_u_29
		local v21 = p20 ~= nil
		assert(v21, "missing Graph G")
		local v22 = {}
		local v23 = {}
		for _, v24 in ipairs(p20.ListNode) do
			if not v22[v24] then
				v22[v24] = true
				local v25 = v_u_29.dfs(p20, v24, nil, p20.GetUndirectedNeighbors)
				local v26 = getmetatable(p20).new()
				for v27 in pairs(v25) do
					v22[v27] = true
					v26:AddNode(v27)
					for v28 in pairs(p20.MapNodeNode[v27]) do
						if v25[v28] then
							v26:AddEdge(v27, v28)
						end
					end
				end
				table.insert(v23, v26)
			end
		end
		return v23
	end
}
return v_u_29
