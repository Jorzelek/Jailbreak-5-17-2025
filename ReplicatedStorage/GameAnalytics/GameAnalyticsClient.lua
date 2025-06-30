-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMaC0dldEZ1bGxOYW1lBXBjYWxsEkdhbWVBbmFseXRpY3NFcnJvcgpGaXJlU2VydmVyEklzVGVuRm9vdEludGVyZmFjZQdDb25zb2xlDFRvdWNoRW5hYmxlZAxNb3VzZUVuYWJsZWQGTW9iaWxlB0Rlc2t0b3ALZ2V0UGxhdGZvcm0HcmVxdWlyZQZzY3JpcHQGUGFyZW50DUdhbWVBbmFseXRpY3MGUG9zdGllBUVycm9yB0Nvbm5lY3QLc2V0Q2FsbGJhY2sKaW5pdENsaWVudARnYW1lCkd1aVNlcnZpY2UKR2V0U2VydmljZRBVc2VySW5wdXRTZXJ2aWNlEVJlcGxpY2F0ZWRTdG9yYWdlDVNjcmlwdENvbnRleHQABQIAAgAAAAb7AAEAvAAAsgAAAACfAAIC3gAAAIIAAQABAwEAGAABGAAAAAAAARkAAAAACwMBAAAAFysCAQCCAAEAxgMAAKQEAQAAAABA2QUAABIBA/8SAAIAnwQCAysEAgDBAwAAggABAPsHAABNBgdaAgAAAFIIAABSCQEAUgoDALwGBmsDAAAAnwYFAcEDAACCAAEABAMCBAAAAEADAwMEAQASAAEYAAEDAQAAAAAAAwEAAwAAAAAAAAAAAQATAAAAAAIAAgAAABP7AAAAvAAAbAAAAACfAAICDgACAG8AAQCCAAIA+wEBAE0AAX8CAAAADgAGAPsBAQBNAAFQAwAAACsAAgBvAAQAggACAG8ABQCCAAIABgMFAwYDBwMIAwkDCgAjCwEYAAAAAAABAAEAAAAAAAAAAQACACQAAAAABQAEAAAAHKQAAQAAAABApAQDAAAAIEBNAwQkBAAAAE0CAx0FAAAATQECdQYAAACfAAIC+wIAAE0BAt4HAAAAwAMIABICAQC8AQHHCQAAAJ8BAwHAAQoAEgICABICAwBNAgBfCwAAAG8DDABSBAEAnwIDAYIAAQANAwwEAAAAQAMNBAAAIEADDgMPAxADEQYBAxIGAgMTAwsCAQIPFAEYAAAAAAAAAAAAAAACAAAAAAAAABEAAAsAAAAAARAAAAAABwAAAQIAI6MAAAD/AAEAAAAAAKQBAQAAAABAbwMCALwBARYDAAAAnwEDAqQCAQAAAABAbwQEALwCAhYDAAAAnwIDAqQDAQAAAABAbwUFALwDAxYDAAAAnwMDAqQEAQAAAABAbwYGALwEBBYDAAAAnwQDAsAFBwASAAQAEgADABIAAQASAAIAMAUAKggAAACCAAIACQMVBAAAAEADFgMXAxgDGQMaBgMDFAEDAQABGAAAAAIAAAAAAAEAAAAAAAEAAAAAAAEAAAAAAAkAAAAAAAAiAQAAAAAEQRejssW/qj1z08kmJ2TXVETs43GEpr5gpnElEKKb0kIQ1IXW0dhFFg==

-- Decompiled by Krnl

local v1 = {}
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("ScriptContext")
function v1.initClient()
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v6 = require(script.Parent.GameAnalytics.Postie)
	v_u_5.Error:Connect(function(p7, p8, p_u_9)
		-- upvalues: (ref) v_u_4
		if p_u_9 then
			local v_u_10 = nil
			local v11, _ = pcall(function()
				-- upvalues: (ref) v_u_10, (copy) p_u_9
				v_u_10 = p_u_9:GetFullName()
			end)
			if v11 then
				v_u_4.GameAnalyticsError:FireServer(p7, p8, v_u_10)
			end
		else
			return
		end
	end)
	local function v12()
		-- upvalues: (ref) v_u_2, (ref) v_u_3
		return v_u_2:IsTenFootInterface() and "Console" or (v_u_3.TouchEnabled and not v_u_3.MouseEnabled and "Mobile" or "Desktop")
	end
	v6.setCallback("getPlatform", v12)
end
return v1
