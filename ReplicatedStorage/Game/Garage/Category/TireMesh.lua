-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMFBFR5cGUHQ2hhc3NpcwRNYWtlC1RyYWlsYmxhemVyB1ZvbHQ0eDQAAgMBAAAAABGpAQAATQIAEQAAAADwAgwAAQAAgKkBAABNAgCtAgAAAPACBwADAAAATQIArQIAAADwAgIABAAAgKkBAAGpAQEAggECAAUDAQMCAwMDBAMFAAIAARgAAAAAAAAAAAAAAAAAAAAAAAMAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAABAAEAAAAAAeQ+9wIdnIZc1vqdlt1fVifNYKG2IVFZMexsUeZ03z4syBsTsNACliU=

-- Decompiled by Krnl

return function(p1)
	local v2
	if p1.Type == "Chassis" and p1.Make ~= "Trailblazer" then
		v2 = p1.Make ~= "Volt4x4"
	else
		v2 = false
	end
	return v2
end
