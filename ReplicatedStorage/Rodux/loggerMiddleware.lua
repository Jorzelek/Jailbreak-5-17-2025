-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMKDm91dHB1dEZ1bmN0aW9uKkFjdGlvbiBkaXNwYXRjaGVkOiAlcwpTdGF0ZSBjaGFuZ2VkIHRvOiAlcwhnZXRTdGF0ZQZmb3JtYXQKbWlkZGxld2FyZQdyZXF1aXJlBnNjcmlwdAZQYXJlbnQLcHJldHR5UHJpbnQFcHJpbnQAAwkBBAAABwAAAQMDEAIV+wEAAFICAACfAQIC+wMBAE0CA4MAAAAAbwMBAPsFAgBSBgAAnwUCAvsGAgD7BwMAvAcHFgIAAACfBwIAnwYAALwDA40DAAAAnwMAAJ8CAAGCAQIABAMBAwIDAwMEAAsAARgAAAACAAABAAAAAAAAAAAAAAAA/wQMAAAAAAMCAgAAAAbZAgAAEgAAABICAAASAgEAEgABAIICAgAAAQAKBQEYAAAAAAAACwAAAAAEAAABAgAVowAAAKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAooFAAAAnwACAuIBBwCkAgkAAACAQDACAYMGAAAAwAIKABIAAQASAAAAMAIBbgsAAACCAQIADAMGBAAAAEADBwQAACBAAwgDCQMBBQEGAwoEAACAQAYBAwUBAQEAARgABAAAAAAAAAAAAQEAAAADAAAAAAwBAAAAAAKMBCTobe5F6r7ATnw9UwaEhr8e8SaYW8xBcDWZZOKbRZT57v7XIjm2

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.prettyPrint)
local v_u_6 = {
	["outputFunction"] = print,
	["middleware"] = function(p_u_2, p_u_3)
		-- upvalues: (copy) v_u_6, (copy) v_u_1
		return function(p4)
			-- upvalues: (copy) p_u_2, (ref) v_u_6, (ref) v_u_1, (copy) p_u_3
			local v5 = p_u_2(p4)
			v_u_6.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(v_u_1(p4), v_u_1(p_u_3:getState())))
			return v5
		end
	end
}
return v_u_6
