-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRBHRpY2sIT25VcGRhdGUFRXZlbnQKRGlzY29ubmVjdApPbkNvbXBsZXRlDHNldG1ldGF0YWJsZQhEdXJhdGlvbgZhc3NlcnQIT25DYW5jZWwJSGVhcnRiZWF0B0Nvbm5lY3QDbmV3B0Rlc3Ryb3kEZ2FtZQpSdW5TZXJ2aWNlCkdldFNlcnZpY2UHX19pbmRleAAECQEDAAAAMKQBAQAAAABAnwEBAvsDAAAmAgED+wQBANQEAgACAAAAqQMAAakDAQAOAwEA+wIBAPsFAgBNBAXOAgAAAA4EDAD7BQEA7AQCBfEEAgAEAAAAjAQBAPsGAgBNBQbOAgAAAFIGAABSBwIAUggEAJ8FBAEOAxIA+wUCAE0EBTYDAAAAvAQEGgQAAACfBAIB+wQCAMYFAAAwBQQ2AwAAAPsFAgBNBAWzBQAAAA4EBAD7BQIATQQFswUAAACfBAEBggABAAYDAQQAAABAAwIDAwMEAwUAEQABGAAAAAEAAQAAAAABAQIAAAABAAEAAQIAAAAAAAACAQAAAAAAAQAAAAEAAAABAAAAAxIAAAAABwECAAAALP8CAwAAAAAA+wMAAJ49AgMDAAAApAEBAAAAAECfAQMCTQMA5QIAAAC7AQMCpAIEAAAAMECfAgIBTQIA5QIAAABNAwDOBQAAADADAc4FAAAATQMAswYAAAAwAwGzBgAAAE0DAMwHAAAAMAMBzAcAAACkAwkAAACAQJ8DAQL7BQEATQQF/QoAAADZBgAAEgADABIAAgASAAEAvAQExwsAAACfBAMCMAQBNgwAAACCAQIADQMGBAAAAEADBwMIBAAAMEADAgMFAwkDAQQAAIBAAwoDCwMDAQAGDAEYAAAAAAAAAAABAAAAAAABAAMAAAABAAAAAQAAAAIAAAEAAAAAAAAAAAAAABYHAAAAAAMBAAAAABVNAQA2AAAAACsBAgCpAQAAggECAE0BADYAAAAAvAEBGgEAAACfAQIBxgEAADABADYAAAAATQEAzAIAAAAOAQMATQEAzAIAAACfAQEBqQEBAIIBAgADAwMDBAMJACkNARgAAAABAAMAAAAAAQAAAQAAAQAAAgArAAAAAAMAAAECABSjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMC/wEDAAAAAAAwAQFuBAAAAMACBQASAAEAEgAAADACAe8GAAAAwAIHADACAVAIAAAAggECAAkDDgQAAABAAw8DEAMRBgEDDAYCAw0CAQIBAAEYAAEAAAAAAAIAAQABAAAAACMAAA4BAAAAAAMpwPPdo8woXRsEmUnKXPYeFgcIw4gvcJvNGG72ZdSXdaoErJtqIe6c

-- Decompiled by Krnl

local v_u_1 = game:GetService("RunService")
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v4 = v_u_2
	local v_u_5 = setmetatable({}, v4)
	local v6 = p3.Duration
	assert(v6)
	local v_u_7 = p3.Duration
	v_u_5.OnUpdate = p3.OnUpdate
	v_u_5.OnComplete = p3.OnComplete
	v_u_5.OnCancel = p3.OnCancel
	local v_u_8 = tick()
	v_u_5.Event = v_u_1.Heartbeat:Connect(function(p9)
		-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_5
		local v10 = tick() - v_u_8
		local v11 = v_u_7 <= v10
		if v11 then
			v10 = v_u_7
		end
		if v_u_5.OnUpdate then
			local v12 = v10 / v_u_7
			local v13 = v12 ~= v12 and 1 or v12
			v_u_5.OnUpdate(p9, v10, v13)
		end
		if v11 then
			v_u_5.Event:Disconnect()
			v_u_5.Event = nil
			if v_u_5.OnComplete then
				v_u_5.OnComplete()
			end
		end
	end)
	return v_u_5
end
function v_u_2.Destroy(p14)
	if not p14.Event then
		return false
	end
	p14.Event:Disconnect()
	p14.Event = nil
	if p14.OnCancel then
		p14.OnCancel()
	end
	return true
end
return v_u_2
