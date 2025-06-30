-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQASMGc2VsZWN0BEZpcmUEZmlyZQZ1bnBhY2sFZXJyb3IMY29ubmVjdChuaWwpBUV2ZW50B2Nvbm5lY3QEd2FpdEpNaXNzaW5nIGFyZyBkYXRhLCBsaWtlbHkgZHVlIHRvIDpUd2VlblNpemUvUG9zaXRpb24gY29ycnVwdGluZyB0aHJlYWRyZWZzLgZhc3NlcnQHRGVzdHJveQhJbnN0YW5jZQNuZXcNQmluZGFibGVFdmVudAAHBAEDAQAAE6MBAAD/AQAAAAAAAN0CAADFAQIAAQAAAN4BAABvAgAAuzkCA6QBAgAAABBA3QMAAJ8BAALeAQEA+wECALwBAd0DAAAAnwECAYIAAQAEAwEDAgQAABBAAwMAJwQBGAABAAAAAAABAAAAAAAAAQAAAAEnAAAAAAUAAwAAAAr7AAAA+wIBAIwDAQD7BAIATDUAAqQBAQAAAABAnwEEAJ8AAAGCAAEAAgMFBAAAAEAAMQABGAAAAAAAAAAAAAEyAAAAAAUCAwAAABErAQUApAIBAAAAAEBvAwIAjAQCAJ8CAwH7AwAATQIDNgMAAADZBAAAEgABABICAQASAgIAvAIC5wQAAACfAgMAggIAAAUDBgQAAABAAwcDCAMJAQEtCQEYAAEAAAAAAgAAAAAAAAAAAAAuAAAAAAUBAwAAABX7AgAATQECNgAAAAC8AQGXAQAAAJ8BAgH7AgEAgQECBAIAAABvAwIApAEEAAAAMECfAQMB+wIBAIwDAQD7BAIATDUAAqQBBgAAAFBAnwEEAIIBAAAHAwgDCgMLAwwEAAAwQAMFBAAAUEAANgoBGAAAAAAAAAEAAAAAAAABAAAAAAAAADcAAAAAAwEDAAAAC/sBAAC8AQFQAAAAAJ8BAgHGAQAA3gEBAMYBAADeAQIAxgEAAN4BAACCAAEAAQMNADwNARgAAAAAAQABAAEAAT0AAAAABQAAAAAAIv8AAwAAAAAApAECAAAEAIBvAgMAnwECAsYCAADGAwAA2QQAABIBAv8SAQP/EgEB/zAEAL0EAAAA2QQBABIBAf8SAQL/EgED/zAEAOcFAAAA2QQCABIBAf8SAQL/EgED/zAEAJcGAAAA2QQDABIBAf8SAQL/EgED/zAEAFAHAAAAwQEAAIIAAgAIAw4DDwQABACAAxADBAMJAwoDDQQAAgMEHw8BGAAAAgAAAAIBAgAAAAAABgAAAAAACQAAAAAABgAAAAAABwAgAAAAAAIAAAECAAejAAAA/wABAAAAAADAAQAAMAEA7wEAAACCAAIAAgYFAw8BBQEAARgAHAACAAAnAQAAAAAGkQ2jZVRVzkCjycnxC0wDoueZcHxzDg0oWdtqCkxG7jB4sM9BS85ZHw==

-- Decompiled by Krnl

return {
	["new"] = function()
		local v1 = {}
		local v_u_2 = Instance.new("BindableEvent")
		local v_u_3 = nil
		local v_u_4 = nil
		function v1.fire(_, ...)
			-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_2
			v_u_3 = { ... }
			v_u_4 = select("#", ...)
			v_u_2:Fire()
		end
		function v1.connect(_, p_u_5)
			-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_4
			if not p_u_5 then
				error("connect(nil)", 2)
			end
			return v_u_2.Event:connect(function()
				-- upvalues: (copy) p_u_5, (ref) v_u_3, (ref) v_u_4
				local v6 = v_u_3
				local v7 = v_u_4
				p_u_5(unpack(v6, 1, v7))
			end)
		end
		function v1.wait(_)
			-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_4
			v_u_2.Event:wait()
			local v8 = v_u_3
			assert(v8, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			local v9 = v_u_3
			local v10 = v_u_4
			return unpack(v9, 1, v10)
		end
		function v1.Destroy(_)
			-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_4
			v_u_2:Destroy()
			v_u_3 = nil
			v_u_4 = nil
			v_u_2 = nil
		end
		return v1
	end
}
