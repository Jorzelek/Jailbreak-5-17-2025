-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUCVNBRkVfREFUQQpSZXdhcmREYXRhBXBjYWxsBHdhcm4GZXhwZWN0AnRvBWVxdWFsAml0CWFsbCBleGlzdAdyZXF1aXJlBnNjcmlwdAZQYXJlbnQLU2FmZXNDb25zdHMNUmV3YXJkU3Bpbm5lchpnZXRJdGVtUHJvcHNGcm9tUmV3YXJkRGF0YQhkZXNjcmliZQpzYWZlIGl0ZW1zBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQAFAgACAAAABPsAAAD7AQEAnwACAYIAAQAAAA8AARgAAAABEAAAAAAQAAIAAAAojAAAAPsEAABNAQQdAAAAAMYCAADGAwAAZAEUAE0GBfYBAAAAUgcGAMYIAADGCQAAZAcMAKQMAwAAACBA2Q0AABICAQASAAsAnwwCAysMBQCkDgUAAABAQFIPDQCfDgIBlQAABm4H8/8CAAAAbgHr/wIAAACkAwgAAABwQFIEAACfAwICTQIDkgkAAABNAQJ7CgAAAIwCAACfAQIBggABAAsDAQMCAwMEAAAgQAMEBAAAQEACAAAAAAAA8D8DBQQAAHBAAwYDBwEACQABGAABAAAAAAABAAIAAAABAAAAAAADAQAAAAH6AP0ADQAAAAAAAAAAAAEKAAAAAAMAAgAAAAikAAEAAAAAQG8BAgDZAgAAEgIAABICAQCfAAMBggABAAMDCAQAAABAAwkBAQgAARgAAAAAAAAAEQkAAAAABQABAAAAGaQAAQAAAABApAMDAAAAIEBNAgMkBAAAAE0BAnMFAAAAnwACAqQBAQAAAABA+wQAAE0DBLcGAAAATQID5wcAAACfAQICpAIJAAAAgEBvAwoA2QQAABIAAAASAAEAnwIDAYIAAQALAwoEAAAAQAMLBAAAIEADDAMNAw4DDwMQBAAAgEADEQECBAABGAAAAAAAAAAAAAEAAAAAAAAAAgAAAAAAABMFAAAAAAMAAAECAAqjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCwAEEABIAAACCAQIABQMSBAAAAEADEwMUBgMBAwEAARgAAQAAAAAAAgAAAQAAAAAETWVQ9CzBpT5/oTpgmzvlPjbNvnlaT/JLBtvVDK1srxmyu0gUm6R5zQ==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
return function()
	-- upvalues: (copy) v_u_1
	local v_u_2 = require(script.Parent.SafesConsts)
	local v_u_3 = require(v_u_1.RewardSpinner.getItemPropsFromRewardData)
	describe("safe items", function()
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		it("all exist", function()
			-- upvalues: (ref) v_u_2, (ref) v_u_3
			local v4 = 0
			for _, v5 in v_u_2.SAFE_DATA do
				for _, v_u_6 in v5.RewardData do
					local v7, v8 = pcall(function()
						-- upvalues: (ref) v_u_3, (copy) v_u_6
						v_u_3(v_u_6)
					end)
					if not v7 then
						warn(v8)
						v4 = v4 + 1
					end
				end
			end
			expect(v4).to.equal(0)
		end)
	end)
end
