-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMHFHZlcnRpY2FsUGFkZGluZ1JhdGlvC2FzcGVjdFJhdGlvC3Jvd3NQZXJQYWdlC2dldFJvd1JhdGlvCmNvbHNQZXJSb3cLZ2V0Q29sUmF0aW8JZ2V0U2NhbGVYAAQJAQAAAAAUTQIAxgAAAABNAwCJAQAAAAkBAgNNBwCJAQAAAE0IAA8DAAAACQYHCNgFAgbYBgIBJgQFBk0HAA8DAAAACQYBB9gFAgYmAwQF2AICA4ICAgAEAwEDAgIAAAAAAADwPwMDAAMEARgAAAAAAAEAAAAAAAAAAAAAAAAAAAQAAAAACAIBAAAAGE0DAMYAAAAATQQAiQEAAAAJAgMEUgMBACsDBQD7BAAATQMEdgIAAABSBAAAnwMCAlIBAwBNBgDTAwAAAOwFAQbsBgECJgQFBuwGAQJNBwDTAwAAAOwFBgcmAwQFggMCAAQDAQMCAwQDBQAHBgEYAAAAAAABAAAAAAAAAAEAAAAAAAAAAAAACAAAAAAHAQAAAAAQTQIAxgAAAABNAwCJAQAAAAkBAgNNBQDTAwAAANgEAgXYBQIBJgMEBdgFAgFNBgDTAwAAAOwEBQYmAgMEggICAAQDAQMCAgAAAAAAAPA/AwUADAcBGAAAAAAAAgAAAAAAAAAAAAANAAAAAAIAAAECAA6jAAAA/wADAAAAAADAAQAAMAEAdgEAAADAAQIAEgAAADABAFIDAAAAwAEEADABAFsFAAAAggACAAYGAAMEBgEDBgYCAwcDAAECAQABGAABAAEAAAQAAAAFAAAFAQAAAAADNG3ocEevU5QGqYLkh38KBDYLX6OpmCQ5s4CIn4Gw8sQS3ZBI6Yg6fA==

-- Decompiled by Krnl

local v_u_9 = {
	["getRowRatio"] = function(p1)
		local v2 = p1.verticalPaddingRatio * p1.aspectRatio
		return 1 / (1 / (p1.aspectRatio * p1.rowsPerPage) - 1 / v2 - 1 / (v2 * p1.rowsPerPage))
	end,
	["getColRatio"] = function(p3, p4)
		-- upvalues: (copy) v_u_9
		local v5 = p3.verticalPaddingRatio * p3.aspectRatio
		local v6 = p4 or v_u_9.getRowRatio(p3)
		return v6 / p3.colsPerRow - v6 / v5 - v6 / v5 / p3.colsPerRow
	end,
	["getScaleX"] = function(p7)
		local v8 = p7.verticalPaddingRatio * p7.aspectRatio
		return 1 / p7.colsPerRow - 1 / v8 - 1 / v8 / p7.colsPerRow
	end
}
return v_u_9
