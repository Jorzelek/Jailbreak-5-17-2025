-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdDkdldEJvdW5kaW5nQm94AV8Cb3MFY2xvY2sGQ0ZyYW1lA25ldwZBbmdsZXMEbWF0aANzaW4JTWFnbml0dWRlD2dldFVwZGF0ZUNhbWVyYQhSZXNvdXJjZQhIb21lSXRlbQ5GaW5kRmlyc3RDaGlsZAVlcnJvchxObyBIb21lSXRlbSBleGlzdHMgYnkgbmFtZTogBUNsb25lDkdldERlc2NlbmRhbnRzEkx1YVNvdXJjZUNvbnRhaW5lcgNJc0EHRGVzdHJveQtQcmltYXJ5UGFydA1Ub09iamVjdFNwYWNlB0ludmVyc2UUU2V0UHJpbWFyeVBhcnRDRnJhbWUIZ2V0TW9kZWwEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlAAQLAgIAAAA2KwEBAIIAAQD7AgAA8QEIAAIAAAC8AgGVAAAAAJ8CAgMYAgB+AQAAAN4DAQDeAQAApAIEAAAMIICfAgECpAYHAAAYUICMBwAAjAgAAIwJAACfBgQCpAcJAAAgUICMCAAAIQkCCowKAACfBwQCCQUGB6QGCQAAIFCAWwoCDbsYCgKkCRAAADzggJ8JAgJbCAkMeAcIC4wIAACMCQAAnwYEAgkEBQakBQcAABhQgIwGAACMBwAA+woBAE0JCqoSAAAAWwgJEZ8FBAIJAwQFMAMAhQUAAACCAAEAEwMBAwIDAwMEBAAMIIADBQMGBAAYUIADBwQAIFCAAhgtRFT7IRlAApqZmZmZmdk/AjMzMzMzM9M/AgAAAAAAAOA/AwgDCQQAPOCAApqZmZmZmek/AwoACAABGAABAgAAAQAAAAAAAQIAAAEAAAAAAAEAAAAAAAABAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAIAAQkAAAAAAwAAAAAAB8YAAADGAQAA2QIAABIBAP8SAQH/wQAAAIICAgAAAQAFCwEYAAEBAAAAAAYAAAAACgEBAAAANPsDAABNAgNiAAAAAE0BAukBAAAAUgMAALwBAQMCAAAAnwEDAisBBgCkAgQAAAAwQG8EBQBSBQAAcwMEBZ8CAgG8AgE6BgAAAJ8CAgJSAQIAvAIBRwcAAACfAgIEZAIIAG8JCAC8Bwb+CQAAAJ8HAwIOBwMAvAcGUAoAAACfBwIBbgL3/wIAAAC8AgGVCwAAAJ8CAgJNBAGbDAAAAE0DBIUNAAAAUgUCALwDA0YOAAAAnwMDArwGA9oPAAAAnwYCALwEAWYQAAAAnwQAAYIBAgARAwwDDQMOAw8EAAAwQAMQAxEDEgMTAxQDFQMBAxYDBQMXAxgDGQAZGgEYAAAAAAAAAAAAAQEAAAAAAAIAAAABAAAAAQAAAAABAAD+AAYAAAEAAAAAAAAAAQAAAAAAAhoAAAAAAwAAAQIAEaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwL/AQIAAAAAAMACBAAwAgFsBQAAAMACBgASAAAAMAIBIgcAAACCAQIACAMbBAAAAEADHAMdBgEDCwYCAxoCAQIBAAEYAAEAAAAAAAIAAQAAFAAAABIBAAAAAAP7szMwdG74rMl3WaQP668OZuSI5nQ49cQIzwfQKxthX5p6OrlbyQok

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
return {
	["getUpdateCamera"] = function()
		local v_u_2 = nil
		local v_u_3 = nil
		return function(p4, p5)
			-- upvalues: (ref) v_u_2, (ref) v_u_3
			if p5 then
				if p5 ~= v_u_2 then
					local v6, v7 = p5:GetBoundingBox()
					_ = v6
					v_u_3 = v7
					v_u_2 = p5
				end
				local v8 = os.clock()
				local v9 = CFrame.new(0, 0, 0) * CFrame.Angles(0, v8 % 6.283185307179586, 0)
				local v10 = CFrame.Angles
				local v11 = v8 * 0.5
				p4.CFrame = v9 * v10(math.sin(v11) * 0.3 - 0.4, 0, 0) * CFrame.new(0, 0, v_u_3.Magnitude * 0.8)
			end
		end
	end,
	["getModel"] = function(p12)
		-- upvalues: (copy) v_u_1
		local v13 = v_u_1.Resource.HomeItem:FindFirstChild(p12)
		if not v13 then
			error("No HomeItem exists by name: " .. p12)
		end
		local v14 = v13:Clone()
		for _, v15 in v14:GetDescendants() do
			if v15:IsA("LuaSourceContainer") then
				v15:Destroy()
			end
		end
		local v16 = v14:GetBoundingBox()
		v14:SetPrimaryPartCFrame(v14.PrimaryPart.CFrame:ToObjectSpace(v16):Inverse())
		return v14
	end
}
