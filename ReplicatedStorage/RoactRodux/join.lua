-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMEASMGc2VsZWN0BXBhaXJzBGpvaW4AAgoAAAEAAB+jAAAA/wAAAAAAAACMAwEAbwUAALs5BQOkBAIAAAAQQN0GAACfBAACUgEEAIwCAQCoAREAuzkDBKQEAgAAABBAUgUDAN0GAACfBAACRwQJAAAAAACkBQQAAAAwQFIGBACfBQIEFwUBAGoJAAhuBf7/AgAAAIsB7/+CAAIABQMBAwIEAAAQQAMDBAAAMEAAAQQBGAABAAIAAAAAAAAAAAABAAAAAAABAAEAAAAAAf8A/QkBAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgABAAEAARgAAA8BAAAAAAEclq2MBHpyhS5SxxiP9JSdR+gnG+IYYyMd4dj68GWZsOj2+TcIZS53

-- Decompiled by Krnl

return function(...)
	local v1 = {}
	for v2 = 1, select("#", ...) do
		local v3 = select(v2, ...)
		if v3 ~= nil then
			for v4, v5 in pairs(v3) do
				v1[v4] = v5
			end
		end
	end
	return v1
end
