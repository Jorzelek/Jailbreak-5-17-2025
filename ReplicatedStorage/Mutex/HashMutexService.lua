-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMIA25ldw9nZXRGb3JOYW1lc3BhY2UEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFTXV0ZXgJSGFzaE11dGV4AAIDAQIAAAAN+wIAAIcBAgAOAQMA+wIAAIcBAgCCAQIA+wIBAE0BAu8AAAAAnwEBAvsCAABqAQIAggECAAEDAQAGAgEYAAAAAQAAAgAAAAEAAQcAAAAABQAAAQIAGKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAJwGAAAATQIDlAcAAACfAQIC/wIAAAAAAAD/AwEAAAAAAMAECAASAAIAEgABADAEA7gJAAAAggMCAAoDAwQAAABAAwQDBQMGBAAAQEADBwMIBgADAgEAAQABGAAAAAAAAAABAAAAAAAAAgABAAEAAAAACAEAAAAAAVRufVg7dGXdZqoXzL7eKr6hDA1GFROUEpoeAbn70bCBoLb6C1zl0S0=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Mutex.HashMutex)
local v_u_3 = {}
return {
	["getForNamespace"] = function(p4)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		if v_u_3[p4] then
			return v_u_3[p4]
		end
		local v5 = v_u_2.new()
		v_u_3[p4] = v5
		return v5
	end
}
