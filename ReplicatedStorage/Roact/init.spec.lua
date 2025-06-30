-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

return function()
	local v_u_1 = require(script.Parent)
	it("should load with all public APIs", function()
		-- upvalues: (copy) v_u_1
		local v2 = {
			["createElement"] = "function",
			["createFragment"] = "function",
			["createRef"] = "function",
			["forwardRef"] = "function",
			["createBinding"] = "function",
			["joinBindings"] = "function",
			["mount"] = "function",
			["unmount"] = "function",
			["update"] = "function",
			["oneChild"] = "function",
			["setGlobalConfig"] = "function",
			["createContext"] = "function",
			["reify"] = "function",
			["teardown"] = "function",
			["reconcile"] = "function",
			["Component"] = true,
			["PureComponent"] = true,
			["Portal"] = true,
			["Children"] = true,
			["Event"] = true,
			["Change"] = true,
			["Ref"] = true,
			["None"] = true,
			["UNSTABLE"] = true
		}
		expect(v_u_1).to.be.ok()
		for v3, v4 in pairs(v2) do
			local v5
			if typeof(v4) == "string" then
				local v6 = v_u_1[v3]
				v5 = typeof(v6) == v4
			else
				v5 = v_u_1[v3] ~= nil
			end
			if not v5 then
				local v7 = typeof(v4) == "boolean" and "present" or "of type " .. v4
				local v8 = tostring(v3)
				local v9 = v_u_1[v3]
				local v10 = ("Expected public API member %q to be %s, but instead it was of type %s"):format(v8, v7, (typeof(v9)))
				error(v10)
			end
		end
		for v11 in pairs(v_u_1) do
			if v2[v11] == nil then
				local v12 = ("Found unknown public API key %q!"):format((tostring(v11)))
				error(v12)
			end
		end
	end)
end
