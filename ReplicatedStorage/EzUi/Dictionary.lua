-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMIBE5vbmUBIwZzZWxlY3QFcGFpcnMFbWVyZ2UIbmV3cHJveHkMZ2V0bWV0YXRhYmxlCl9fdG9zdHJpbmcAAwEAAAAAAAJvAAAAggACAAEDAQAHAAEYAAAIAAAAAAsAAQEAACWjAAAA/wAAAAAAAACMAwEAbwUAALs5BQOkBAIAAAAQQN0GAACfBAACUgEEAIwCAQCoARcAuzkDBKQEAgAAABBAUgUDAN0GAACfBAACRwQPAAAAAACkBQQAAAAwQFIGBACfBQIEFwUHAPsKAACaCQQACgAAAMYKAABqCgAIZQABAGoJAAhuBfj/AgAAAIsB6f+CAAIABQMCAwMEAAAQQAMEBAAAMEAACwUBGAABAAIAAAAAAAAAAAABAAAAAAACAAEAAAAAAQAAAQAAAvwA/A4LAAAAAAMAAAECABWjAAAApAABAAAAAECpAQEAnwACArs8AANSAgAApAEDAAAAIECfAQICwAIEADACAQYFAAAAwAEGABIAAADiAgkAMAACPwcAAAAwAQIfCAAAAIICAgAKAwYEAAAAQAMHBAAAIEAGAAMIBgEDAQMFBQIHCAIAAQEAARgABQAAAAEAAAAAAAAABAAUAQABAAABAAAAAAJmQebPXXcEnVSFjFuOS3zFk4xf2PUzGjyoWkBA0zvz8yjac0mSLSme

-- Decompiled by Krnl

local v_u_1 = newproxy(true)
getmetatable(v_u_1).__tostring = function()
	return "None"
end
return {
	["None"] = v_u_1,
	["merge"] = function(...)
		-- upvalues: (copy) v_u_1
		local v2 = {}
		for v3 = 1, select("#", ...) do
			local v4 = select(v3, ...)
			if v4 ~= nil then
				for v5, v6 in pairs(v4) do
					if v6 == v_u_1 then
						v2[v5] = nil
					else
						v2[v5] = v6
					end
				end
			end
		end
		return v2
	end
}
