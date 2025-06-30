-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMNFHZlcnRpY2FsUGFkZGluZ1JhdGlvBW1lcmdlDHBhZGRpbmdSYXRpbwthc3BlY3RSYXRpbwRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQRFelVpCkRpY3Rpb25hcnkNU2Nyb2xsaW5nR3JpZAVSb2FjdA1jcmVhdGVFbGVtZW50AAIJAQMAAAAUTQEAxgAAAADGAgAAMAIAxgAAAAD7AgAA+wMBAPsFAgBNBAUfAQAAAFIFAADiBgMATQgAiQQAAAAJBwEIMAcGKAIAAACfBAMAnwIAAIICAAAFAwEDAgMDBQECAwQACAABGAAAAQAAAQEBAAAAAAEAAAAA//4ACQAAAAAGAAABAgAhowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBBQAAAEBATQMALQYAAABNAgOpBwAAAJ8BAgKkAgUAAABAQE0EAC0GAAAATQMEVggAAACfAgICpAMFAAAAQEBNBAAhCQAAAJ8DAgJNBAPKCgAAAMAFCwASAAQAEgACABIAAQCCBQIADAMFBAAAAEADBgMHAwgEAABAQAMJAwoDCwMMAw0GAAEAAQABGAABAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAQACAAAAAAEAAAAAAXudJ8SAswHGSVlNUNUQ0EG/1ovnOhS1jZlEzteKnhX4bEdkm2GqLFU=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.EzUi.Dictionary)
local v_u_3 = require(v1.EzUi.ScrollingGrid)
local v_u_4 = require(v1.Roact).createElement
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	local v6 = p5.verticalPaddingRatio
	p5.verticalPaddingRatio = nil
	return v_u_4(v_u_3, v_u_2.merge(p5, {
		["paddingRatio"] = v6 * p5.aspectRatio
	}))
end
