-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNBWRlYnVnCXRyYWNlYmFjaxF0cmFjZWJhY2tSZXBvcnRlcgZ0eXBlb2YIZnVuY3Rpb24GeHBjYWxsDl9lcnJvclJlcG9ydGVyEnJlcG9ydFJlZHVjZXJFcnJvcghnZXRTdGF0ZQdtZXNzYWdlC3Rocm93blZhbHVlFUNhdWdodCBlcnJvciBpbiB0aHVuaw90aHVua01pZGRsZXdhcmUABQMBAAAAAAWkAQIAAAQAgFICAACfAQIAggEAAAMDAQMCBAAEAIAABwMBGAAAAAAACAAAAAACAAIAAAAE+wAAAPsBAQCfAAIAggAAAAAADgABGAAAAAAPAAAAAAgBAwAAACe7LAADUgIAAKQBAQAAAABAnwECAvABHQACAACApAEEAAAAMEDZAgAAEgAAABICAAD7AwEAnwEDAysBEwD7BQAATQQFwQUAAABNAwT+BgAAAPsEAAC8BAQWBwAAAJ8EAgJSBQAA4gYKAG8HCwAwBwaYCAAAADACBikJAAAAnwMEAcYDAACCAwIAggICAPsBAgBSAgAAnwECAIIBAAAMAwQEAAAAQAMFAwYEAAAwQAMHAwgDCQMKAwsFAggJAwwBAQwAARgAAAAAAAAAAQAAAAAC/gQCAAAAAAAAAAAAAAEAAAEA/gQAAwMAAAANAAAAAAMCAQAAAAXZAgAAEgABABICAAASAAAAggICAAABAgsNARgAAAAAAAwAAAAAAgAAAQIABaMAAADAAAAAwAEBABIAAACCAQIAAgYABgMCAAMBAAEYAAYEABcBAAAAAAR+ecNljArcc0y9qfHkVzzX/Dn9rJ5zMu2Sj+FKpLXND3fURp4UPxk9

-- Decompiled by Krnl

local function v_u_2(p1)
	return debug.traceback(p1)
end
return function(p_u_3, p_u_4)
	-- upvalues: (copy) v_u_2
	return function(p_u_5)
		-- upvalues: (copy) p_u_4, (ref) v_u_2, (copy) p_u_3
		if typeof(p_u_5) ~= "function" then
			return p_u_3(p_u_5)
		end
		local v6, v7 = xpcall(function()
			-- upvalues: (copy) p_u_5, (ref) p_u_4
			return p_u_5(p_u_4)
		end, v_u_2)
		if v6 then
			return v7
		end
		p_u_4._errorReporter.reportReducerError(p_u_4:getState(), p_u_5, {
			["message"] = "Caught error in thunk",
			["thrownValue"] = v7
		})
		return nil
	end
end
