-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMbEEF0dGVtcHRCdXlSZW1vdGUORmluZEZpcnN0Q2hpbGQKRmlyZVNlcnZlcgZhY3Rpb24DbmV3BFBhcnQETmFtZQVOb1JheQVUaW1lZAREaXN0CENhbGxiYWNrA0J1eQNBZGQIR2l2ZVRhc2sMQ29tbWVyY2VOb2RlBVN0YXJ0BGluaXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUGTW9kdWxlAlVJDENpcmNsZUFjdGlvbgNTdGQGQmluZGVyBE1haWQABAUCAQAAAAsOAQkA+wIAAG8EAAC8AgIDAQAAAJ8CAwIOAgMAvAMCawIAAACfAwIBggABAAMDAQMCAwMADAQBGAABAAAAAAEBAAADDQAAAAAJAQIAAAAh+wIAAE0BAu8AAAAAnwEBAtkCAAASAAAA4gMHADAAA0QBAAAAbwQIADAEA7oCAAAAqQQBADAEA7YDAAAAqQQAADAEA3EEAAAAjAQMADAEA+MFAAAAMAIDRgYAAAD7BwEATQYHXwkAAABSBwMAUggAAJ8GAwC8BAH9CgAAAJ8EAAGCAQIACwMFAwYDBwMIAwkDCgMLBQYBAgMEBQYDDAMNAw4BAAkAARgAAAAAAgAJAQABAAABAAABAAABAAABAAIAAAAAAAAAAAEKAAAAAAMAAwAAAAz7AQAATQAB7wAAAABvAQEAwAICABICAQASAgIAnwADArwAABwDAAAAnwACAYIAAQAEAwUDDwYBAxABAQgRARgAAAAAAAAAABYAAAEJAAAAAAcAAAECACejAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwBABgAAAE0CA1wHAAAAnwECAk0CAd0IAAAApAMFAAAAQEBNBQChCQAAAE0EBX8KAAAAnwMCAqQEBQAAAEBATQYAoQkAAABNBQZ2CwAAAJ8EAgL/BQEAAAAAAMAGDAASAAMAEgAEABIAAgAwBgUTDQAAAIIFAgAOAxIEAAAAQAMTAxQDFQQAAEBAAxYDFwMYAxkDGgMbBgIDEQECAQABGAAAAAAAAAABAAAAAAAAAQACAAAAAAAAAQAAAAAAAAEAAQAAAAAAGQEAAAAAAys1AljGZuUfGfFozJ6ZdXinvCleASMr9X+QMe4FAmIn3lPAlNHqL2A=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Module.UI).CircleAction
local v_u_3 = require(v1.Std.Binder)
local v_u_4 = require(v1.Std.Maid)
return {
	["init"] = function()
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
		v_u_3.new("CommerceNode", function(p_u_5)
			-- upvalues: (ref) v_u_4, (ref) v_u_2
			local v6 = v_u_4.new()
			v6:GiveTask(v_u_2.Add({
				["Part"] = p_u_5,
				["Name"] = "Buy",
				["NoRay"] = true,
				["Timed"] = false,
				["Dist"] = 12,
				["Callback"] = function(_, p7)
					-- upvalues: (copy) p_u_5
					local v8 = p7 and p_u_5:FindFirstChild("AttemptBuyRemote")
					if v8 then
						v8:FireServer()
					end
				end
			}, p_u_5))
			return v6
		end):Start()
	end
}
