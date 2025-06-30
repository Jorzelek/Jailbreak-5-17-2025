-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMcBWRlYnVnDHByb2ZpbGViZWdpbgpMaWdodGhvdXNlCEdldFBpdm90BkNGcmFtZQZBbmdsZXMHUGl2b3RUbwpwcm9maWxlZW5kA25ldwtQcmltYXJ5UGFydAROYW1lBkNlbnRlci9MaWdodGhvdXNlTGlnaHQgbXVzdCBoYXZlIENlbnRlciBhcyBQcmltYXJ5UGFydAZhc3NlcnQJSGVhcnRiZWF0B0Nvbm5lY3QIR2l2ZVRhc2sPTGlnaHRob3VzZUxpZ2h0BVN0YXJ0BEluaXQEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlClJ1blNlcnZpY2UHcmVxdWlyZQNTdGQGQmluZGVyBE1haWQABAkBAQAAABikAQIAAAQAgG8CAwCfAQIB+wEAAPsEAAC8BARSBAAAAJ8EAgKkBQcAABhQgIwGAABvCAgACQcIAIwIAACfBQQCCQMEBbwBAcIJAAAAnwEDAaQBCwAAKACAnwEBAYIAAQAMAwEDAgQABACAAwMDBAMFAwYEABhQgAIAAAAAAADgPwMHAwgEACgAgAASAAEYAAAAAAEAAAAAAAAAAAAAAAAAAAABAAABEwAAAAAHAQIAAAAe+wIAAE0BAu8AAAAAnwEBAk0FAJsBAAAATQQFugIAAADwBAIAAwAAAKkDAAGpAwEAgQEDBAQAAABvBAQApAIGAAAAUECfAgMB+wUBAE0EBf0HAAAA2QYAABIAAAC8BATHCAAAAJ8EAwC8AgH9CQAAAJ8CAAGCAQIACgMJAwoDCwMMAw0DDgQAAFBAAw8DEAMRAQAKAAEYAAAAAAMAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAGCwAAAAADAAMAAAAM+wEAAE0AAe8AAAAAbwEBAMACAgASAgEAEgICAJ8AAwK8AQAcAwAAAJ8BAgGCAAEABAMJAxIGAQMTAQEIFAEYAAAAAAAAAAAQAAABCgAAAAAGAAABAgAkowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCBgAAAFBATQQAoQcAAABNAwR/CAAAAJ8CAgKkAwYAAABQQE0FAKEHAAAATQQFdgkAAACfAwIC/wQBAAAAAADABQoAEgACABIAAwASAAEAMAUEcwsAAACCBAIADAMVBAAAAEADFgMXAxgDGQQAAFBAAxoDGwMcBgIDFAECAQABGAABAAAAAAABAAAAAAABAAAAAAAAAQAAAAAAAAIAAQAAAAAAFAEAAAAAA5jxw75pfQw1qjWpKpDt0LkxZHRGkqFgHCZ5nmF0qI7nyCaJJgiLh4c=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Std.Binder)
local v_u_4 = require(v1.Std.Maid)
return {
	["Init"] = function()
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
		v_u_3.new("LighthouseLight", function(p_u_5)
			-- upvalues: (ref) v_u_4, (ref) v_u_2
			local v6 = v_u_4.new()
			local v7 = p_u_5.PrimaryPart.Name == "Center"
			assert(v7, "LighthouseLight must have Center as PrimaryPart")
			v6:GiveTask(v_u_2.Heartbeat:Connect(function(p8)
				-- upvalues: (copy) p_u_5
				debug.profilebegin("Lighthouse")
				p_u_5:PivotTo(p_u_5:GetPivot() * CFrame.Angles(0, 0.5 * p8, 0))
				debug.profileend()
			end))
			return v6
		end):Start()
	end
}
