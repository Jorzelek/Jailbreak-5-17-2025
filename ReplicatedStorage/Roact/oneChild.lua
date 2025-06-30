-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMEBG5leHQFZXJyb3IwRXhwZWN0ZWQgYXQgbW9zdCBjaGlsZCwgaGFkIG1vcmUgdGhhbiBvbmUgY2hpbGQuCG9uZUNoaWxkAAIHAQAAAAAWKwACAMYBAACCAQIApAEBAAAAAEBSAgAAnwECAysCAgDGAwAAggMCAKQDAQAAAABAUgQAAFIFAQCfAwMCDgMFAKQEAwAAACBAbwUEAIwGAgCfBAMBggICAAUDAQQAAABAAwIEAAAgQAMDAAgEARgAAQADAAAAAgEAAwAAAAACAQAAAAADCQAAAAABAAABAgADowAAAMAAAACCAAIAAQYAAQABAAEYAAcUAQAAAAAB8k3wFXOSdfvAiZqB3lgboyHZnCHj/uTco5jn7MvdCYAhmPe8FFwmZA==

-- Decompiled by Krnl

return function(p1)
	if not p1 then
		return nil
	end
	local v2, v3 = next(p1)
	if not v3 then
		return nil
	end
	if next(p1, v2) then
		error("Expected at most child, had more than one child.", 2)
	end
	return v3
end
