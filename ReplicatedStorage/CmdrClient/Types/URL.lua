-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMODV5odHRwcz86Ly8uKyQFbWF0Y2goVVJMcyBtdXN0IGJlZ2luIHdpdGggaHR0cDovLyBvciBodHRwczovLwhWYWxpZGF0ZQVQYXJzZQN1cmwMUmVnaXN0ZXJUeXBlBHVybHMQTWFrZUxpc3RhYmxlVHlwZQdyZXF1aXJlBnNjcmlwdAZQYXJlbnQGU2hhcmVkBFV0aWwABAQBAAAAAApvAwAAvAEA5wEAAACfAQMCDgECAKkBAQCCAQIAqQEAAG8CAgCCAQMAAwMBAwIDAwAEBAEYAAAAAAABAAMAAAUAAAAAAQEAAAAAAYIAAgAAAAwFARgADQAAAAAGAQIAAAAPbwMAAPsEAAC8AQDdAQAAAJ8BBAFvAwIA+wUBAE0EBSQDAAAA+wUAAJ8EAgC8AQDdAQAAAJ8BAAGCAAEABAMGAwcDCAMJABEAARgAAAAAAAEAAAAAAAAAAAESAAAAAAYAAAECABmjAAAApAABAAAAAECkBQMAAAAgQE0EBSQEAAAATQMEJAQAAABNAgMSBQAAAE0BAp4GAAAAnwACAuIBCQDAAgoAMAIBdgcAAADAAgsAMAIBmwgAAADAAgwAEgABABIAAACCAgIADQMKBAAAAEADCwQAACBAAwwDDQMOAwQDBQUCBwgGAAYBBgIDAAECAQABGAAAAAAAAAAAAAAAAAAAAgEAAAgAAAUAAAABAAAAAAO603z7tJ7084gXFm8k/g0leN1BtgNNDbmmhAmamvlcZZ8CaooDUSok

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Shared.Util)
local v_u_4 = {
	["Validate"] = function(p2)
		if p2:match("^https?://.+$") then
			return true
		else
			return false, "URLs must begin with http:// or https://"
		end
	end,
	["Parse"] = function(p3)
		return p3
	end
}
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_1
	p5:RegisterType("url", v_u_4)
	p5:RegisterType("urls", v_u_1.MakeListableType(v_u_4))
end
