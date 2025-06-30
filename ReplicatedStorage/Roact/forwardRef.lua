-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPCnR5cGVDaGVja3MGdHlwZW9mCGZ1bmN0aW9uIEV4cGVjdGVkIGFyZyAjMSB0byBiZSBhIGZ1bmN0aW9uBmFzc2VydApmb3J3YXJkUmVmB3JlcXVpcmUGc2NyaXB0BlBhcmVudAZhc3NpZ24ETm9uZQtQcm9wTWFya2VycwNSZWYMR2xvYmFsQ29uZmlnA2dldAADBgEEAAAADfsCAACHAQAC+wIBAP8DAAAAAAAAUgQAAPsFAgCfAgQC+wMDAFIEAgBSBQEAnwMDAIIDAAAAABQAARgAAAEAAAAAAAIAAAAAFQAAAAAFAQQAAAAZ+wIAAE0BAkIAAAAADgEPALssAANSBAAApAMCAAAAEECfAwIC8AMCAAMAAACpAgABqQIBAIEBAgQEAAAAbwMEAKQBBgAAAFBAnwEDAdkBAAASAgEAEgICABICAwASAAAAggECAAcDAQMCBAAAEEADAwMEAwUEAABQQAEADwYBGAAAAAABAAAAAAAAAAAAAAAAAAADAAAAAAAQAAAAAAgAAAECADOjAAAApAABAAAAAECkAwMAAAAgQE0CAyQEAAAATQEC4wUAAACfAAICpAEBAAAAAECkBAMAAAAgQE0DBCQEAAAATQIDPwYAAACfAQICpAIBAAAAAECkBgMAAAAgQE0FBiQEAAAATQQF1AcAAABNAwTdCAAAAJ8CAgKkBAEAAAAAQKQHAwAAACBATQYHJAQAAABNBQaMCQAAAJ8EAgJNAwRfCgAAAJ8DAQL/BAEAAAAAAGoBBALABQsAEgADABIAAgASAAAAEgAEAIIFAgAMAwcEAAAAQAMIBAAAIEADCQMKAwsDDAMNAw4DDwYBAQEBAAEYAAAAAAAAAAAAAAEAAAAAAAAAAAEAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAgABBwAAAAANAQAAAAACbgyW3EIQX+JcyPxIWFYK/vixV9tjw0/brLqiW5Z1OJLwYA0YEcQ9kw==

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.assign)
local v2 = require(script.Parent.None)
local v_u_3 = require(script.Parent.PropMarkers.Ref)
local v_u_4 = require(script.Parent.GlobalConfig).get()
local v_u_5 = {
	[v_u_3] = v2
}
return function(p_u_6)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_1, (copy) v_u_5
	if v_u_4.typeChecks then
		local v7 = typeof(p_u_6) == "function"
		assert(v7, "Expected arg #1 to be a function")
	end
	return function(p8)
		-- upvalues: (ref) v_u_3, (ref) v_u_1, (ref) v_u_5, (copy) p_u_6
		local v9 = p8[v_u_3]
		return p_u_6(v_u_1({}, p8, v_u_5), v9)
	end
end
