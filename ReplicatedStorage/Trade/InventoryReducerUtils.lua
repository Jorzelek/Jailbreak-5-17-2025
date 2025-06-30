-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRCml0ZW1zT3duZWQSbWlzc2luZyBpdGVtc093bmVkBmFzc2VydA5idWlsZEl0ZW1Qcm9wcw50aW1lU29ydE1ldHJpYwxwcmltYXJ5SW5kZXgOZ2V0SW5zdENvbXBhcmUGbnVtYmVyBXRhYmxlBmluc2VydA1zZXRJdGVtc093bmVkBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlBVRyYWRlEVRyYWRlUmVkdWNlclV0aWxzAAINAgEAAABGTQQBpQAAAABHBAIAAAAAgKkDAAGpAwEAgQEDBAEAAABvBAEApAIDAAAAIECfAgMB/wIAAAAAAAD/AwAAAAAAAIwGAQBNBwGlAAAAABwEBwCMBQEAqAQgAE0IAaUAAAAAhwcIBvsJAABNCAlaBAAAAFIJBwCfCAICDggWADkJBgAwCQgmBQAAADAGCCIGAAAATQwI+AkAAACHCwMMkAoLCJUJCgdNCgj4CQAAAGoJAwowCQhgCgAAAJ40AgUIAAAAUgsCAFIMCACkCg0AADCwgJ8KAwGLBOD/jAYBABwEAgCMBQEAqAQLAIcHAgZNCQf4CQAAAIcIAwmMCQEAfQgEAAkAAADGCAAAMAgHYAoAAACLBPX/ggICAA4DAQMCAwMEAAAgQAMEAwUDBgIAAAAAAADwPwIAAAAAAAAAAAMHAwgDCQMKBAAwsIAABgsBGAAAAAAAAAAAAAAAAAEAAgABAAAAAAABAAABAAAAAAEBAAABAAEAAAAAAQAAAQACAAAAAAAA9g0AAAABAQAAAAAAAQAA/QYHAAAAAAQAAAECABWjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwC7BgAAAE0CA8UHAAAAnwECAv8CAQAAAAAAwAMIABIAAQAwAwLkCQAAAIICAgAKAwwEAAAAQAMNAw4DDwQAAEBAAxADEQYAAwsBAAEAARgAAQAAAAAAAQAAAAAAAAIAAQAAABsBAAAAAAGROKdnhQ89lKP8zfMvHYBQiVUV8S1u2+c755ScmEhPBIPHcOh7DGzx

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Trade.TradeReducerUtils)
return {
	["setItemsOwned"] = function(_, p3)
		-- upvalues: (copy) v_u_2
		local v4 = p3.itemsOwned ~= nil
		assert(v4, "missing itemsOwned")
		local v5 = {}
		local v6 = {}
		for v7 = 1, #p3.itemsOwned do
			local v8 = p3.itemsOwned[v7]
			local v9 = v_u_2.buildItemProps(v8)
			if v9 then
				v9.timeSortMetric = -v7
				v9.primaryIndex = v7
				local v10 = (v5[v9.getInstCompare] or 0) + 1
				v5[v9.getInstCompare] = v10
				v9.number = v10
				table.insert(v6, v9)
			end
		end
		for v11 = 1, #v6 do
			local v12 = v6[v11]
			if v5[v12.getInstCompare] <= 1 then
				v12.number = nil
			end
		end
		return v6
	end
}
