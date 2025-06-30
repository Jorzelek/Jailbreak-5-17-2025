-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMVBE5hbWUIdG9zdHJpbmc3W3dhaXRGb3JDaGlsZF0gVGltZW91dDogbm8gY2hpbGQgb2YgYCVzYCB3aXRoIG5hbWUgYCVzYAZmb3JtYXQKQ2hpbGRBZGRlZAdDb25uZWN0CEdpdmVUYXNrBWRlbGF5B2FuZFRoZW4LR2l2ZVByb21pc2UHRGVzdHJveQ5GaW5kRmlyc3RDaGlsZAdyZXNvbHZlA25ldwdmaW5hbGx5DHdhaXRGb3JDaGlsZAdyZXF1aXJlBnNjcmlwdAZQYXJlbnQHUHJvbWlzZQRNYWlkAAYEAQIAAAANTQEAugAAAAD7AwAAuz8DAqQCAgAAABBAnwICApoBBAACAAAA+wEBAFICAACfAQIBggABAAMDAQMCBAAAEEAADwABGAAAAAAAAAAAAAEAAAIQAAAAAAUAAwAABwAAAQMBBgIL+wAAAG8BAAD7BAEATQMEugEAAAD7BAIAvAEBjQIAAACfAQQAnwAAAYIAAQADAwMDAQMEABUAARgAAAAAAAAAAAAAARYAAAAABwIFAAAAIPsCAAD7BQEATQQFawAAAADZBgAAEgICABIAAAC8BATHAQAAAJ8EAwC8AgL9AgAAAJ8CAAH7AgMADgIQAPsCAAD7BQQATQQFvgMAAAD7BQMAnwQCAtkGAQASAAEAEgIBABICAgC8BAS1BAAAAJ8EAwC8AgLpBQAAAJ8CAAGCAAEABgMFAwYDBwMIAwkDCgIAAQ4AARgAAAAAAAAAAAAAAAAABQABAAAAAAAAAAAAAAAAAAAABA8AAAAAAgABAAAABfsAAAC8AABQAAAAAJ8AAgGCAAEAAQMLABoAARgAAAAAARsAAAAACAMCAAAAH1IFAQC8AwADAAAAAJ8DAwIOAwYA+wUAAE0EBR0BAAAAUgUDAJ8EAgCCBAAA+wQBAE0DBO8CAAAAnwMBAvsFAABNBAXvAgAAANkFAAASAAMAEgAAABIAAQASAAIAEgIAAJ8EAgLZBwEAEgADALwFBEIDAAAAnwUDAYIEAgAEAwwDDQMOAw8CAgMFEAEYAAAAAAEBAAAAAAAEAAAAAQAAAAAAAAAAAAwAAAAAAwcAAAAABQAAAQIAF6MAAACkAAEAAAAAQKQDAwAAACBATQIDJAQAAABNAQJyBQAAAJ8AAgKkAQEAAAAAQKQEAwAAACBATQMEJAQAAABNAgN2BgAAAJ8BAgLAAgcAEgAAABIAAQCCAgIACAMRBAAAAEADEgQAACBAAxMDFAMVBgQBBAEAARgAAQAAAAAAAAAAAQAAAAAAAAAAAgAAGgEAAAAABfRsQOSxEW0ExqgqcDT9b7sQw5pbfmobBtW/8cG0xITLpjkkwrbUWCs=

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Promise)
local v_u_2 = require(script.Parent.Maid)
return function(p_u_3, p_u_4, p_u_5)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v6 = p_u_3:FindFirstChild(p_u_4)
	if v6 then
		return v_u_1.resolve(v6)
	end
	local v_u_7 = v_u_2.new()
	local v12 = v_u_1.new(function(p_u_8, p_u_9)
		-- upvalues: (copy) v_u_7, (copy) p_u_3, (copy) p_u_4, (copy) p_u_5, (ref) v_u_1
		v_u_7:GiveTask(p_u_3.ChildAdded:Connect(function(p10)
			-- upvalues: (ref) p_u_4, (copy) p_u_8
			local v11 = p_u_4
			if p10.Name == tostring(v11) then
				p_u_8(p10)
			end
		end))
		if p_u_5 then
			v_u_7:GivePromise(v_u_1.delay(p_u_5):andThen(function()
				-- upvalues: (copy) p_u_9, (ref) p_u_3, (ref) p_u_4
				p_u_9(("[waitForChild] Timeout: no child of `%s` with name `%s`"):format(p_u_3.Name, p_u_4))
			end))
		end
	end)
	v12:finally(function()
		-- upvalues: (copy) v_u_7
		v_u_7:Destroy()
	end)
	return v12
end
