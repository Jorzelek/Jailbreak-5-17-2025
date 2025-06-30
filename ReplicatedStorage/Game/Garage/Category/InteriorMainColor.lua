-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMFBU1vZGVsCEludGVyaW9yDkZpbmRGaXJzdENoaWxkBE1ha2UFU2xvb3AAAgYBAAAAABFNAQA7AAAAACsBAQCCAAEAbwQBAKkFAQC8AgEDAgAAAJ8CBAIrAgYATQMArQMAAADwAwIABAAAAKkCAAGpAgEAggICAAUDAQMCAwMDBAMFAAIAARgAAAEBAgAAAAAAAAAAAAAAAAMAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAABAAEAAAAAAUj5JY+lIvudej1PG1M/gRcKofm45ijsJfH2+c4+Y+FL4WVCNrRXglo=

-- Decompiled by Krnl

return function(p1)
	local v2 = p1.Model
	if v2 then
		return v2:FindFirstChild("Interior", true) or p1.Make == "Sloop"
	end
end
