-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMHBU1vZGVsDkZpbmRGaXJzdENoaWxkB1dpbmRvd3MISW50ZXJpb3IOU2Vjb25kSW50ZXJpb3IEVHlwZQdDaGFzc2lzAAIHAQAAAAAiTQEAOwAAAAArAQIAqQIAAIICAgBvBAAAvAIBAwEAAACfAgMCKwICAKkDAACCAwIAqQMBAG8GAgC8BAIDAQAAAJ8EAwJSAwQAbwYDALwEAgMBAAAAnwQDAisEBABvBgQAvAQCAwEAAACfBAMCTQUAEQUAAADwBQMABgAAgCsEAQCpAwAAggMCAAcDAQMCAwMDBAMFAwYDBwACAAEYAAABAQACAAAAAQEAAwEAAAAAAgAAAAAAAAAAAQAAAAABAwMAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAABAAEAAAAAAdztujrR8amD7inQrrUnGkIcecohOSpfy2QSOq9suBuHciY183EJFXc=

-- Decompiled by Krnl

return function(p1)
	local v2 = p1.Model
	if not v2 then
		return false
	end
	local v3 = v2:FindFirstChild("Model")
	if not v3 then
		return false
	end
	local v4 = v3:FindFirstChild("Windows")
	local v5 = v3:FindFirstChild("Interior") or v3:FindFirstChild("SecondInterior")
	if p1.Type == "Chassis" and not v5 then
		v4 = false
	end
	return v4
end
