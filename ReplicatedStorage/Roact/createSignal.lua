-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMDGRpc2Nvbm5lY3RlZChMaXN0ZW5lcnMgY2FuIG9ubHkgYmUgZGlzY29ubmVjdGVkIG9uY2UuBmFzc2VydApkaXNjb25uZWN0BnR5cGVvZghmdW5jdGlvbi5DYW4gb25seSBzdWJzY3JpYmUgdG8gc2lnbmFscyB3aXRoIGEgZnVuY3Rpb24uCGNhbGxiYWNrCXN1YnNjcmliZQVwYWlycwRmaXJlDGNyZWF0ZVNpZ25hbAAFBAAEAAAAF/sDAABNAgOXAAAAAFYBAgCBAQEEAQAAAG8CAQCkAAMAAAAgQJ8AAwH7AAAAqQEBADABAJcAAAAA+wABAPsBAgDGAgAAagIAAfsAAwD7AQIAxgIAAGoCAAGCAAEABAMBAwIDAwQAACBAACQEARgAAAAAAAAAAAAAAgAAAAEAAAABAAAAASUAAAAABgIDAAAAJLssAQNSBQEApAQBAAAAAECfBAIC8AQCAAIAAACpAwABqQMBAIEBAwQDAAAAbwQDAKQCBQAAAEBAnwIDAeICCAAwAQKmBgAAAKkDAAAwAwKXBwAAAPsDAAAOAwUA+wQBAIcDBAErAwIA+wMCAGoCAwH7AwEAagIDAdkDAAASAAIAEgIBABIAAQASAgIAggMCAAkDBQQAAABAAwYDBwMDBAAAQEADCAMBBQIGBwEAFAkBGAAAAAAAAAAAAAAAAAAAAAIBAAEAAAUAAAAAAQADAAIAAAAACBUAAAAACAEDAQAAIKMBAACpAQEA3gEAAKQBAQAAAABA+wIBAJ8BAgQXAQkATQYFlwIAAAArBgYA+wcCAIcGBwQrBgMAUgYEAN0HAACfBgABbgH2/wIAAACpAQAA3gEAAKQBAQAAAABA+wICAJ8BAgQXAQMA+wYCAMYHAABqBwYEbgH8/wIAAACCAAEAAwMKBAAAAEADAQAvCwEYAAEAAQAAAAABAAAAAAABAAD+AAYAAgAAAAABAAD/AAMvAAAAAAYAAAAAABT/AAAAAAAAAP8BAAAAAAAAqQIAANkDAAASAQL/EgAAABIAAQDZBAEAEgEC/xIAAAASAAEA4gUCADADBXsAAAAAMAQFvQEAAADBAgAAggUCAAMDCQMLBQIAAQIBAg8MARgAAAEAAQIAAAAbAAAADwEAAQAAABAAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAwEDAQABGAAONQEAAAAABLKO4dgquKnEgEqLTPjuZl3cfHQBO+KQsQrTKQqmGyp047vN/j0+IHY=

-- Decompiled by Krnl

return function()
	local v_u_1 = {}
	local v_u_2 = {}
	local v_u_3 = false
	return {
		["subscribe"] = function(_, p_u_4)
			-- upvalues: (ref) v_u_3, (copy) v_u_1, (copy) v_u_2
			local v5 = typeof(p_u_4) == "function"
			assert(v5, "Can only subscribe to signals with a function.")
			local v_u_6 = {
				["callback"] = p_u_4,
				["disconnected"] = false
			}
			if v_u_3 and not v_u_1[p_u_4] then
				v_u_2[p_u_4] = v_u_6
			end
			v_u_1[p_u_4] = v_u_6
			return function()
				-- upvalues: (copy) v_u_6, (ref) v_u_1, (copy) p_u_4, (ref) v_u_2
				local v7 = not v_u_6.disconnected
				assert(v7, "Listeners can only be disconnected once.")
				v_u_6.disconnected = true
				v_u_1[p_u_4] = nil
				v_u_2[p_u_4] = nil
			end
		end,
		["fire"] = function(_, ...)
			-- upvalues: (ref) v_u_3, (copy) v_u_1, (copy) v_u_2
			v_u_3 = true
			for v8, v9 in pairs(v_u_1) do
				if not (v9.disconnected or v_u_2[v8]) then
					v8(...)
				end
			end
			v_u_3 = false
			for v10, _ in pairs(v_u_2) do
				v_u_2[v10] = nil
			end
		end
	}
end
