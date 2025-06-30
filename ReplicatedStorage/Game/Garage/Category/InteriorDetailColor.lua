-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMFBU1vZGVsDlNlY29uZEludGVyaW9yDkZpbmRGaXJzdENoaWxkBE1ha2UFU2xvb3AAAgYBAAAAABFNAQA7AAAAACsBAQCCAAEAbwQBAKkFAQC8AgEDAgAAAJ8CBAIrAgYATQMArQMAAADwAwIABAAAAKkCAAGpAgEAggICAAUDAQMCAwMDBAMFAAIAARgAAAEBAgAAAAAAAAAAAAAAAAMAAAAAAQAAAQIAA6MAAADAAAAAggACAAEGAAEAAQABGAABAAEAAAAAAR4G6jTeSpYkLMKAoDslM+dYiBG8WcwhFmkYPpUJ5UMkDxzSxJihDxY=

-- Decompiled by Krnl

return function(p1)
	local v2 = p1.Model
	if v2 then
		return v2:FindFirstChild("SecondInterior", true) or p1.Make == "Sloop"
	end
end
