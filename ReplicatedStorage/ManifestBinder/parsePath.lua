-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMHBnN0cmluZwVzcGxpdAEvAAV0YWJsZQZyZW1vdmUJcGFyc2VQYXRoAAIIAQAAAAATpAECAAAEAIBSAgAAbwMDAJ8BAwIcBAEAjAIBAIwD//+oAgkAhwUBBPAFBgAEAACApAUHAAAYUIBSBgEAUgcEAJ8FAwGLAvf/ggECAAgDAQMCBAAEAIADAwMEAwUDBgQAGFCAAAEHARgAAAAAAAEAAAABAAABAAAAAP4FAgAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAAJAQAAAAAB8cBVCQAwCtHDBD+d/LVloJ8/VQaJ3es/Hm/UikqMk9D+oeXMfc3Y6g==

-- Decompiled by Krnl

return function(p1)
	local v2 = string.split(p1, "/")
	for v3 = #v2, 1, -1 do
		if v2[v3] == "" then
			table.remove(v2, v3)
		end
	end
	return v2
end
