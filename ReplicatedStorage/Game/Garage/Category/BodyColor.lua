-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMFBU1vZGVsBEJvZHkORmluZEZpcnN0Q2hpbGQETWFrZQVTbG9vcAACBgEAAAAAEU0BADsAAAAAKwEBAIIAAQBvBAEAqQUBALwCAQMCAAAAnwIEAisCBgBNAwCtAwAAAPADAgAEAAAAqQIAAakCAQCCAgIABQMBAwIDAwMEAwUAAgABGAAAAQECAAAAAAAAAAAAAAAAAwAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAEAAQAAAAABrqCmmJLByVqcZMwMsytZouhVglzjvxWvczz9W/ApQrSGMaNDBDpI5Q==

-- Decompiled by Krnl

return function(p1)
	local v2 = p1.Model
	if v2 then
		return v2:FindFirstChild("Body", true) or p1.Make == "Sloop"
	end
end
