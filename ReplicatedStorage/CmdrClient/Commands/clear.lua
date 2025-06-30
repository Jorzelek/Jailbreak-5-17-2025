-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMXC0xvY2FsUGxheWVyDkNtZHJGcmFtZVZhbHVlDFdhaXRGb3JDaGlsZAVWYWx1ZQVwYWlycwtHZXRDaGlsZHJlbgROYW1lBExpbmUHVGV4dEJveANJc0EHRGVzdHJveQAJQ2xpZW50UnVuBGdhbWUHUGxheWVycwpHZXRTZXJ2aWNlB0FsaWFzZXMLRGVzY3JpcHRpb24FR3JvdXAEQXJncwVjbGVhcjhDbGVhciBhbGwgbGluZXMgYWJvdmUgdGhlIGVudHJ5IGxpbmUgb2YgdGhlIENtZHIgd2luZG93LgtEZWZhdWx0VXRpbAACCgABAAAAIfsBAABNAAExAAAAAG8EAQC8AgDTAgAAAJ8CAwJNAQLsAwAAAA4BFQCkAgUAAABAQLwDAWgGAAAAnwMCAJ8CAAQXAgwATQcGugcAAADwBwkACAAAgG8JCQC8Bwb+CgAAAJ8HAwIOBwMAvAcGUAsAAACfBwIBbgLz/wIAAABvAgwAggICAA0DAQMCAwMDBAMFBAAAQEADBgMHAwgDCQMKAwsDDAAJDQEYAAAAAQAAAAAAAgEAAAAAAAABAAAAAAAAAAABAAD+AAYACgAAAAADAAABAgAeowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAuIBCgBvAgsAMAIBugQAAAD/AgAAAAAAADACAScFAAAAbwIMADACAeIGAAAAbwINADACAcQHAAAA/wIAAAAAAAAwAgHbCAAAAMACDgASAAAAMAIBMwkAAACCAQIADwMOBAAAAEADDwMQAwcDEQMSAxMDFAMNBQYEBQYHCAkDFQMWAxcGAAEAAQABGAAAAAAAAAACAQAAAQAAAAEAAAEAAAEAAAABAAAAAAEAAAAAAedIjNkQkY9x1YzmTQCRem5TQS9q3O50hn2FQWwkdiyvdOhY2Tg2Mns=

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
return {
	["Name"] = "clear",
	["Aliases"] = {},
	["Description"] = "Clear all lines above the entry line of the Cmdr window.",
	["Group"] = "DefaultUtil",
	["Args"] = {},
	["ClientRun"] = function()
		-- upvalues: (copy) v_u_1
		local v2 = v_u_1.LocalPlayer:WaitForChild("CmdrFrameValue").Value
		if v2 then
			for _, v3 in pairs(v2:GetChildren()) do
				if v3.Name == "Line" and v3:IsA("TextBox") then
					v3:Destroy()
				end
			end
		end
		return ""
	end
}
