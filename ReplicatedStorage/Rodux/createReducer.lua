-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMBBHR5cGUAAwYCAgAAAA5HAAIAAAAAgPsAAAD7AwEATQQBcQAAAACHAgMEDgIFAFIDAgBSBAAAUgUBAJ8DAwCCAwAAggACAAEDAQACAAEYAAABAwAAAAIBAAAAAAMDAAAAAAMCAAAAAATZAgAAEgAAABIAAQCCAgIAAAEAAQABGAAAAAACAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgEBAQEAARgAAAABAAAAAAJppa1jxz3TzVthx/dhJFCrB2SXFpCFD1K6OeEvD/+IGOuDlnvrtGsG

-- Decompiled by Krnl

return function(p_u_1, p_u_2)
	return function(p3, p4)
		-- upvalues: (copy) p_u_1, (copy) p_u_2
		if p3 == nil then
			p3 = p_u_1
		end
		local v5 = p_u_2[p4.type]
		if v5 then
			return v5(p3, p4)
		else
			return p3
		end
	end
end
