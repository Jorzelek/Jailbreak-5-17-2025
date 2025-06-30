-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMeD29uUmVxdWVzdFByb21wdARGaXJlBmFjdGlvbgZSZW1vdmUDbmV3BFBhcnQETmFtZQVUaW1lZAREaXN0CENhbGxiYWNrFU9wZW4gU2VjdXJpdHkgQ2FtZXJhcwNBZGQIR2l2ZVRhc2sFU3RhcnQKQ0NUVlByb21wdARpbml0BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlA1N0ZAZCaW5kZXIETWFpZAZTaWduYWwCVUkGTW9kdWxlDENpcmNsZUFjdGlvbgZzY3JpcHQGUGFyZW50DENhbWVyYUJpbmRlcgAFBAIBAAAACQ4BBgD7AwAATQIDjAAAAAC8AgLdAQAAAJ8CAgGpAgEAggICAAIDAQMCABIDARgAAQAAAAAAAgATAAAAAAIAAgAAAAb7AQAATQABaQAAAAD7AQEAnwACAYIAAQABAwQAIAABGAAAAAAAASEAAAAABwEDAAAAIfsCAABNAQLvAAAAAJ8BAQLAAgEAEgIBAOIDBwAwAANEAgAAAG8ECAAwBAO6AwAAAKkEAAAwBANxBAAAAIwECAAwBAPjBQAAADACA0YGAAAA+wUCAE0EBV8JAAAAUgUDAFIGAACfBAMB2QYBABICAgASAAAAvAQB/QoAAACfBAMBggECAAsDBQYAAwYDBwMIAwkDCgUFAgMEBQYDCwMMAw0CAAEQAAEYAAAAAAEABgEAAQAAAQAAAQAAAQACAAAAAAABAAAAAAAEEQAAAAADAAUAAAAR+wAAALwAABwAAAAAnwACAfsBAQBNAAHvAQAAAG8BAgDAAgMAEgICABICAwASAgQAnwADArwBABwAAAAAnwECAYIAAQAEAw4DBQMPBgIBAg0QARgAAAAAAgAAAAAAAAAAFgAAAQ4AAAAACgAAAQIAPqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAKEGAAAATQIDfwcAAACfAQICpAIFAAAAQEBNBAChBgAAAE0DBHYIAAAAnwICAqQDBQAAAEBATQUAoQYAAABNBAUfCQAAAJ8DAgKkBAUAAABAQE0GAEALAAAATQUGXAoAAACfBAICTQUE3QwAAACkBgUAAABAQKQJDgAAANBATQgJJA8AAABNBwiWEAAAAJ8GAgL/BwIAAAAAAE0IA+8RAAAAnwgBAjAIB4wSAAAAwAgTABIABgASAAEAEgACABIABwASAAUAMAgHExQAAACCBwIAFQMRBAAAAEADEgMTAxQEAABAQAMVAxYDFwMYAxkDGgMbAxwEAADQQAMdAx4DBQMBBgMDEAEDAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAQACAAAAAAAAAAACAAEAAAAAAQAAAAAAAAAbAQAAAAAE4IPUcI1Cx63SR77kD+u3IZX7sD+xVTuwMakbEkxKJUGS0AZOdiy9YQ==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.Binder)
local v_u_3 = require(v1.Std.Maid)
local v4 = require(v1.Std.Signal)
local v_u_5 = require(v1.Module.UI).CircleAction
local v_u_6 = require(script.Parent.CameraBinder)
local v_u_11 = {
	["onRequestPrompt"] = v4.new(),
	["init"] = function()
		-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_3, (copy) v_u_11, (copy) v_u_5
		v_u_6:Start()
		v_u_2.new("CCTVPrompt", function(p_u_7)
			-- upvalues: (ref) v_u_3, (ref) v_u_11, (ref) v_u_5
			local v8 = v_u_3.new()
			local v10 = {
				["Part"] = p_u_7,
				["Name"] = "Open Security Cameras",
				["Timed"] = false,
				["Dist"] = 8,
				["Callback"] = function(_, p9)
					-- upvalues: (ref) v_u_11
					if p9 then
						v_u_11.onRequestPrompt:Fire()
					end
					return true
				end
			}
			v_u_5.Add(v10, p_u_7)
			v8:GiveTask(function()
				-- upvalues: (ref) v_u_5, (copy) p_u_7
				v_u_5.Remove(p_u_7)
			end)
			return v8
		end):Start()
	end
}
return v_u_11
