-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMdDVJvYmJlcnlNYXJrZXIJR2V0VGFnZ2VkBE5hbWUXZ2V0Um9iYmVyeU1hcmtlckZvck5hbWUKbWFya2VyTmFtZQthZGRXYXlwb2ludAVtZXJnZQRwYXJ0BHdhcm4dTm8gcGFydCBmb3VuZCBmb3IgbWFya2VyIG5hbWUEdGFzawR3YWl0A0FwcBhTZXRSb2JiZXJ5V2F5cG9pbnRSZW1vdGUMV2FpdEZvckNoaWxkDU9uQ2xpZW50RXZlbnQHQ29ubmVjdAVzcGF3bgRpbml0BGdhbWURQ29sbGVjdGlvblNlcnZpY2UKR2V0U2VydmljZRFSZXBsaWNhdGVkU3RvcmFnZQdyZXF1aXJlBEV6VWkKRGljdGlvbmFyeQZzY3JpcHQGUGFyZW50Dk1pbmltYXBTZXJ2aWNlAAUIAQEAAAYDAAAFAQMS+wEAAG8DAAC8AQEFAQAAAJ8BAwJSAgEAxgMAAMYEAABkAgUATQcGugIAAACaBwIAAAAAAIIGAgBuAvr/AgAAAMYCAACCAgIAAwMBAwIDAwAIBAEYAAAAAAABAAAAAQAAAAH+AAUACQAAAAAMAQQAAAA3+wIAAJUBAgDeAQAAqQIAAE0EAMABAAAA+wUBAG8HAgC8BQUFAwAAAJ8FAwJSBgUAxgcAAMYIAABkBgYATQsKugQAAACaCwMABAAAAFIDCgBlAAMAbgb5/wIAAADGAwAADgMOAPsFAgBNBAX2BQAAAPsGAwBNBQYfBgAAAFIGAADiBwgAMAMHJAcAAACfBQMAnwQAAakCAQBlAAoApAQKAAAAkEBvBQsATQYAwAEAAACfBAMBpAQOAAA0wICMBQEAnwQCASsCBAD7BAAAmgQCAAEAAABIAM3/ggABAA8CAAAAAAAA8D8DBQMBAwIDAwMGAwcDCAUBBwMJBAAAkEADCgMLAwwEADTAgAAVAAEYDQABAgEA7wAAAAABAAAAAQAAAAEA/gAFDAEAAAAAAAAAAQD/AAMAAgAAAAAAAQAAAAIAAAAAAQkAAAAABQAEAAAAFPsBAABNAAHBAAAAAG8CAQC8AADTAgAAAJ8AAwKMAQAATQIAjAMAAADZBAAAEgEB/xICAQASAgIAEgIDALwCAscEAAAAnwIDAcEBAACCAAEABQMNAw4DDwMQAxEBARIAARgAAAAAAAAAAQEAAAAAAAAAAAARABMAAAAAAgAEAAAACaQAAgAABACAwAEDABICAAASAgEAEgICABICAwCfAAIBggABAAQDCwMSBAAEAIAGAgECERMBGAAAAAAAAAAAFRIAAAAABwAAAQIAKaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQEAAAAAQG8DBAC8AQEWAwAAAJ8BAwKkAgYAAABQQE0EAS0HAAAATQMEqQgAAACfAgICpAMGAAAAUECkBgoAAACQQE0FBiQLAAAATQQFXQwAAACfAwIC/wQBAAAAAADABQ0AEgAAAMAGDgASAAEAEgAAABIAAwASAAIAMAYEEw8AAACCBAIAEAMUBAAAAEADFQMWAxcDGAQAAFBAAxkDGgMbBAAAkEADHAMdBgAGAwMTAgADAQABGAABAAAAAAABAAAAAAABAAAAAAAAAQAAAAAAAAAAAQACAAkAAAAAAAAXAQAAAAAEBh92d8oPik802xzjs7dJs8IP/OboLytC0Zo6tCzQpu/54qyQnnxmoA==

-- Decompiled by Krnl

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v_u_2.EzUi.Dictionary)
local v_u_4 = require(script.Parent.MinimapService)
return {
	["init"] = function()
		-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (ref) v_u_1, (ref) v_u_4, (ref) v_u_3
			local v5 = v_u_2.App:WaitForChild("SetRobberyWaypointRemote")
			local v_u_6 = 0
			v5.OnClientEvent:Connect(function(p7)
				-- upvalues: (ref) v_u_6, (ref) v_u_1, (ref) v_u_4, (ref) v_u_3
				local v8 = v_u_6 + 1
				v_u_6 = v8
				while true do
					local v9 = p7.markerName
					local v10 = false
					for _, v12 in v_u_1:GetTagged("RobberyMarker") do
						if v12.Name == v9 then
							goto l4
						end
					end
					local v12 = nil
					::l4::
					if v12 then
						v_u_4.addWaypoint(v_u_3.merge(p7, {
							["part"] = v12
						}))
						v10 = true
					else
						warn("No part found for marker name", p7.markerName)
						task.wait(1)
					end
					if v10 or v_u_6 ~= v8 then
						return
					end
				end
			end)
		end)
	end
}
