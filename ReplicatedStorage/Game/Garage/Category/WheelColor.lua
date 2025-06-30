-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMGBFR5cGUHQ2hhc3NpcwlEdW5lQnVnZ3kKTW90b3JjeWNsZQRNYWtlBFRhbmsAAgMBAAAAABapAQEATQIAEQAAAADwAhEAAQAAAKkBAQBNAgARAAAAAPACDAACAAAAqQEBAE0CABEAAAAA8AIHAAMAAABNAgCtBAAAAPACAgAFAAAAqQEAAakBAQCCAQIABgMBAwIDAwMEAwUDBgACAAEYAAAAAAAAAQAAAAABAAAAAQAAAAAAAAMAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAABAAEAAAAAAT9OgJdzl3g+DYrqA3+P+eowqc0goXoixZjKMjdv7bdmrIhhHRus4v8=

-- Decompiled by Krnl

return function(p1)
	return (p1.Type == "Chassis" or (p1.Type == "DuneBuggy" or p1.Type == "Motorcycle")) and true or p1.Make == "Tank"
end
