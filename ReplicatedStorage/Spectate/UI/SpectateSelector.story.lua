-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLB3VubW91bnQFbW91bnQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUGc2NyaXB0BlBhcmVudBBTcGVjdGF0ZVNlbGVjdG9yBVJvYWN0DWNyZWF0ZUVsZW1lbnQAAwIAAgAAAAb7AQAATQABEgAAAAD7AQEAnwACAYIAAQABAwEACAABGAAAAAAAAQkAAAAABQEDAAAADvsCAABNAQLkAAAAAPsCAQD7AwIA/wQAAAAAAACfAgMCUgMAAJ8BAwLZAgAAEgIAABIAAQCCAgIAAQMCAQAGAAEYAAAAAAAAAAAAAAEAAAAHAAAAAAUAAAECAByjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQECkBAcAAABgQE0DBCQIAAAATQIDEgkAAACfAQICpAIFAAAAQEBNAwAhCgAAAJ8CAgJNAwLKCwAAAMAEDAASAAIAEgADABIAAQCCBAIADQMDBAAAAEADBAMFAwYEAABAQAMHBAAAYEADCAMJAwoDCwYBAQEBAAEYAAAAAAAAAAEAAAAAAAAAAAEAAAAAAQACAAAAAAEAAAAAAjsmDU1y8hvGCeJn2ZkblIot0VlMhF5uzh58DgqdHW3e+EopmkkD+Co=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.SpectateSelector)
local v_u_3 = require(v1.Roact)
local v_u_4 = v_u_3.createElement
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v_u_6 = v_u_3.mount(v_u_4(v_u_2, {}), p5)
	return function()
		-- upvalues: (ref) v_u_3, (copy) v_u_6
		v_u_3.unmount(v_u_6)
	end
end
