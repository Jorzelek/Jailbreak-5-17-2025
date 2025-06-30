-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMLCEluc3RhbmNlA25ldwVwY2FsbAdEZXN0cm95GmdldERlZmF1bHRJbnN0YW5jZVByb3BlcnR5B3JlcXVpcmUGc2NyaXB0BlBhcmVudAZTeW1ib2wFbmFtZWQDTmlsAAMDAAIAAAAE+wEAAPsCAQCHAAECggACAAAAJQABGAAAAAAmAAAAAAgCAgAAACn7AwAAhwIDAA4CDQCHAwIB+wQBAJoDBAAEAAAAqQQBAMYFAACCBAMARwMJAAAAAACpBAEAUgUDAIIEAwBlAAQA/wIAAAAAAAD7AwAAagIDAKQDAgAABACAUgQAAJ8DAgKkBAQAAAAwQNkFAAASAAMAEgABAJ8EAgO8BgNQBQAAAJ8GAgEOBAYARwUEAAAAAID7BgEAagYCAYIEAwBqBQIBggQDAAYDAQMCBAAEAIADAwQAADBAAwQBABAFARgAAAIBBAAAAQAAAwABAAAAAwABAAMAAAABAAAAAAAEAAACAQABAAACBBEAAAAABAAAAQIAFKMAAACkAAEAAAAAQKQDAwAAACBATQIDJAQAAABNAQKTBQAAAJ8AAgJNAQBRBgAAAG8CBwCfAQIC/wIAAAAAAADAAwgAEgACABIAAQCCAwIACQMGBAAAAEADBwQAACBAAwgDCQMKAwsGAQEBAQABGAAKAAAAAAAAAAACAAAAAQACAAAmAQAAAAAC7TtsVYAmDK3f/wbB+euER/B3gT2nK86o1gUxrbyR1mU6fQt33vHlgQ==

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Symbol).named("Nil")
local v_u_2 = {}
return function(p3, p_u_4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v5 = v_u_2[p3]
	if v5 then
		local v6 = v5[p_u_4]
		if v6 == v_u_1 then
			return true, nil
		end
		if v6 ~= nil then
			return true, v6
		end
	else
		v5 = {}
		v_u_2[p3] = v5
	end
	local v_u_7 = Instance.new(p3)
	local v8, v9 = pcall(function()
		-- upvalues: (copy) v_u_7, (copy) p_u_4
		return v_u_7[p_u_4]
	end)
	v_u_7:Destroy()
	if v8 then
		if v9 == nil then
			v5[p_u_4] = v_u_1
			return v8, v9
		end
		v5[p_u_4] = v9
	end
	return v8, v9
end
