-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMPCHdhcm5PbmNld1JvYWN0LnJlaWZ5IGhhcyBiZWVuIHJlbmFtZWQgdG8gUm9hY3QubW91bnQgYW5kIHdpbGwgYmUgcmVtb3ZlZCBpbiBhIGZ1dHVyZSByZWxlYXNlLgpDaGVjayB0aGUgY2FsbCB0byBSb2FjdC5yZWlmeSBhdDoKEG1vdW50VmlydHVhbFRyZWUFcmVpZnl/Um9hY3QudGVhcmRvd24gaGFzIGJlZW4gcmVuYW1lZCB0byBSb2FjdC51bm1vdW50IGFuZCB3aWxsIGJlIHJlbW92ZWQgaW4gYSBmdXR1cmUgcmVsZWFzZS4KQ2hlY2sgdGhlIGNhbGwgdG8gUm9hY3QudGVhcmRvd24gYXQ6ChJ1bm1vdW50VmlydHVhbFRyZWUIdGVhcmRvd26AAVJvYWN0LnJlY29uY2lsZSBoYXMgYmVlbiByZW5hbWVkIHRvIFJvYWN0LnVwZGF0ZSBhbmQgd2lsbCBiZSByZW1vdmVkIGluIGEgZnV0dXJlIHJlbGVhc2UuCkNoZWNrIHRoZSBjYWxsIHRvIFJvYWN0LnJlY29uY2lsZSBhdDoKEXVwZGF0ZVZpcnR1YWxUcmVlCXJlY29uY2lsZRZjcmVhdGVSZWNvbmNpbGVyQ29tcGF0B3JlcXVpcmUGc2NyaXB0BlBhcmVudAdMb2dnaW5nAAUCAAIBAAAMowAAAPsBAABNAAGIAAAAAG8BAQCfAAIB+wEBAE0AAR0CAAAA3QEAAJ8AAACCAAAAAwMBAwIDAwAaBAEYAAEAAAAAAgAAAAAAGgAAAAACAAIBAAAMowAAAPsBAABNAAGIAAAAAG8BAQCfAAIB+wEBAE0AAfICAAAA3QEAAJ8AAACCAAAAAwMBAwUDBgAgBwEYAAEAAAAAAgAAAAAAIAAAAAACAAIBAAAMowAAAPsBAABNAAGIAAAAAG8BAQCfAAIB+wEBAE0AATsCAAAA3QEAAJ8AAACCAAAAAwMBAwgDCQAmCgEYAAEAAAAAAgAAAAAAJgAAAAADAQEAAAAS/wEDAAAAAADZAgAAEgIAABIAAAAwAgGtAAAAANkCAQASAgAAEgAAADACAaIBAAAA2QICABICAAASAAAAMAIBLwIAAACCAQIAAwMEAwcDCgMAAQIXCwEYAAACAAAAAAYAAAAABgAAAAAGGAAAAAAEAAABAgANowAAAKQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAnwFAAAAnwACAsABBgASAAAAggECAAcDDAQAAABAAw0EAAAgQAMOAw8GAwEDAQABGAAFAAAAAAAAAAARABgBAAAAAARk4AbmOryRFFYkbHIx9a3yLFVYpYqnVry0+AqprQEIjaQQB5c2RCF+

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Logging)
return function(p_u_2)
	-- upvalues: (copy) v_u_1
	return {
		["reify"] = function(...)
			-- upvalues: (ref) v_u_1, (copy) p_u_2
			v_u_1.warnOnce("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n")
			return p_u_2.mountVirtualTree(...)
		end,
		["teardown"] = function(...)
			-- upvalues: (ref) v_u_1, (copy) p_u_2
			v_u_1.warnOnce("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n")
			return p_u_2.unmountVirtualTree(...)
		end,
		["reconcile"] = function(...)
			-- upvalues: (ref) v_u_1, (copy) p_u_2
			v_u_1.warnOnce("Roact.reconcile has been renamed to Roact.update and will be removed in a future release.\nCheck the call to Roact.reconcile at:\n")
			return p_u_2.updateVirtualTree(...)
		end
	}
end
