-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJIyVxICglcykgaXMgbm90IGEgdmFsaWQgbWVtYmVyIG9mICVzCHRvc3RyaW5nBnR5cGVvZgZmb3JtYXQFZXJyb3IHX19pbmRleApfX25ld2luZGV4DHNldG1ldGF0YWJsZQZzdHJpY3QABAcCAQAABwAAAQMCDAIVbwIAALs/AQNSBQEApAQCAAAAEECfBAICuywBA1IGAQCkBQQAAAAwQJ8FAgL7BgAAvAICjQUAAACfAgUCpAMHAAAAYEBSBAIAjAUCAJ8DAwGCAAEACAMBAwIEAAAQQAMDBAAAMEADBAMFBAAAYEAABgYBGAAAAAAAAAAAAAAAAAAAAAIAAAAAAQcAAAAACAMBAAAHAAABAwMMAhVvAwAAuz8BA1IGAQCkBQIAAAAQQJ8FAgK7LAEDUgcBAKQGBAAAADBAnwYCAvsHAAC8AwONBQAAAJ8DBQKkBAcAAABgQFIFAwCMBgIAnwQDAYIAAQAIAwEDAgQAABBAAwMEAAAwQAMEAwUEAABgQAAMBwEYAAAAAAAAAAAAAAAAAAAAAgAAAAABDQAAAAAGAgAAAAAZUgIBACsCBQC7PwADUgMAAKQCAQAAAABAnwICAlIBAgDiBAQA2QUAABIBAf8wBQRuAgAAANkFAQASAQH/MAUEzgMAAACePQAEBAAAAFIDAACkAgYAAABQQJ8CAwLBAQAAggICAAcDAgQAAABAAwYDBwUCAgMDCAQAAFBAAgABAgkBGAAAAAAAAAAAAgEAAAAGAAAAAAAA+QAAAAADAAAAAAEAAAECAAOjAAAAwAAAAIIAAgABBgIBAgEAARgAARIBAAAAAAPcZByZ2JPQHO6gdg1Is6a2vWIJ/AbU2UVR4Ujvl1+0fzuxpKu5G9cA

-- Decompiled by Krnl

return function(p1, p2)
	local v_u_3 = p2 or tostring(p1)
	local v8 = {
		["__index"] = function(_, p4)
			-- upvalues: (ref) v_u_3
			local v5 = ("%q (%s) is not a valid member of %s"):format(tostring(p4), typeof(p4), v_u_3)
			error(v5, 2)
		end,
		["__newindex"] = function(_, p6, _)
			-- upvalues: (ref) v_u_3
			local v7 = ("%q (%s) is not a valid member of %s"):format(tostring(p6), typeof(p6), v_u_3)
			error(v7, 2)
		end
	}
	return setmetatable(p1, v8)
end
