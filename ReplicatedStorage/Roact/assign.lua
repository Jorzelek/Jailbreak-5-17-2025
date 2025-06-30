-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMIASMGc2VsZWN0BXBhaXJzBmFzc2lnbgdyZXF1aXJlBnNjcmlwdAZQYXJlbnQETm9uZQACCwEBAQAAI6MBAACMAwEAbwUAALs5BQOkBAIAAAAQQN0GAACfBAACUgEEAIwCAQCoARcAuzkDBKQEAgAAABBAUgUDAN0GAACfBAACRwQPAAAAAACkBQQAAAAwQFIGBACfBQIEFwUHAPsKAACaCQQACgAAAMYKAABqCgAIZQABAGoJAAhuBfj/AgAAAIsB6f+CAAIABQMBAwIEAAAQQAMDBAAAMEAACQQBGAABAAAAAAAAAAAAAQAAAAAAAgABAAAAAAEAAAEAAAL8APwOCQAAAAAEAAABAgANowAAAKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAj8FAAAAnwACAsABBgASAAAAggECAAcDBQQAAABAAwYEAAAgQAMHAwgGAAEAAQABGAAAAAAAAAAAAAAIABIBAAAAAAF4hZXAimpnkkpB/1SdhY87kU40rp+IgAUos4AIdWYdFaV8kOZOoumR

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.None)
return function(p2, ...)
	-- upvalues: (copy) v_u_1
	for v3 = 1, select("#", ...) do
		local v4 = select(v3, ...)
		if v4 ~= nil then
			for v5, v6 in pairs(v4) do
				if v6 == v_u_1 then
					p2[v5] = nil
				else
					p2[v5] = v6
				end
			end
		end
	end
	return p2
end
