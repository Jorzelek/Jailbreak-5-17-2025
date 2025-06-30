-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSBXBhaXJzBGNvcHkLX2V4dGVuc2lvbnMMc2V0bWV0YXRhYmxlA25ldwZleHRlbmQVc3RhcnRFeHBlY3RhdGlvbkNoYWluBnN0cmluZwZmb3JtYXQjQ2Fubm90IHJlYXNzaWduICVxIGluIGV4cGVjdC5leHRlbmQGYXNzZXJ0LkNhbm5vdCBvdmVyd3JpdGUgbWF0Y2hlciAlcTsgaXQgYWxyZWFkeSBleGlzdHMHcmVxdWlyZQZzY3JpcHQGUGFyZW50C0V4cGVjdGF0aW9uGmNoZWNrTWF0Y2hlck5hbWVDb2xsaXNpb25zB19faW5kZXgABQcBAAAAAAv/AQAAAAAAAKQCAQAAAABAUgMAAJ8CAgQXAgEAagYBBW4C/v8CAAAAggECAAIDAQQAAABAAAQCARgAAAIAAAAAAf8ABAUAAAAACgEBAAAAHOIBAQAOAA4ATQMACgAAAAD/BAAAAAAAAKQFAwAAACBAUgYDAJ8FAgQXBQEAagkECG4F/v8CAAAAUgIEACsCAgD/AgAAAAAAADACAQoAAAAA+wQAAJ49AQQEAAAAUgMBAKQCBQAAAEBAnwIDAoICAgAGAwMFAQADAQQAACBAAwQEAABAQAARBQEYDQEAAPIAAgAAAAAB/wAEAAgAAAADAAAAAAAAAAUAAAAABAEBAQAADKMBAAD7AgAATQEC7wAAAADdAgAAnwEAAk0DAAoBAAAAvAEBnAIAAACfAQMAggEAAAMDBQMDAwYAGQcBGAABAAAAAAAAAAAAABkAAAAADAIBAAAAJ6QCAQAAAABAUgMBAJ8CAgQXAh8ATQoACgIAAACHCQoFRwkCAAAAAACpCAABqQgBAKQJBQAAEDCAbwoGAFILBQCfCQMATAEAAqQHCAAAAHBAnwcAAfsIAABSCQUAnwgCAqQJBQAAEDCAbwoJAFILBQCfCQMATAEAAqQHCAAAAHBAnwcAAU0HAAoCAAAAagYHBW4C4P8CAAAAggABAAoDAQQAAABAAwMDCAMJBAAQMIADCgMLBAAAcEADDAAdBgEYAAAAAAABAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAgAA/AAGHgAAAAAFAAABAgAeowAAAKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAv8FAAAAnwACAk0BAOEGAAAAwAIHAP8DAwAAAAAAMAMDbggAAADABAkAEgADADAEA+8KAAAAwAQLABIAAAAwBAOmDAAAAMAEDQASAAEAMAQDnA4AAACCAwIADwMNBAAAAEADDgQAACBAAw8DEAMRBgADEgYBAwUGAgMHBgMDBgQAAQIDAQABGAAAAAAAAAAAAAABAAIKAAEAAgAAAAgAAAAEAAAACQEAAAAABMIDynNK3YN08Meg5weL1KAiZqctWVdtPL0UJi4X1aHZOp8StxVdDpo=

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Expectation)
local v_u_2 = v_u_1.checkMatcherNameCollisions
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4)
	-- upvalues: (copy) v_u_3
	local v5 = {}
	if p4 then
		local v6 = p4._extensions
		v10 = {}
		for v7, v8 in pairs(v6) do
			v10[v7] = v8
		end
		if v10 then
			::l6::
			v5._extensions = v10
			local v9 = v_u_3
			return setmetatable(v5, v9)
		end
	end
	local v10 = {}
	goto l6
end
function v_u_3.startExpectationChain(p11, ...)
	-- upvalues: (copy) v_u_1
	return v_u_1.new(...):extend(p11._extensions)
end
function v_u_3.extend(p12, p13)
	-- upvalues: (copy) v_u_2
	for v14, v15 in pairs(p13) do
		local v16 = p12._extensions[v14] == nil
		local v17 = string.format
		assert(v16, v17("Cannot reassign %q in expect.extend", v14))
		local v18 = v_u_2(v14)
		local v19 = string.format
		assert(v18, v19("Cannot overwrite matcher %q; it already exists", v14))
		p12._extensions[v14] = v15
	end
end
return v_u_3
