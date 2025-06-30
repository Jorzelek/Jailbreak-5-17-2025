-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMQBVZhbHVlDHNldElzSnVtcGluZxRzZXRDYW1lcmFTZW5zaXRpdml0eQRnYW1lB1BsYXllcnMKR2V0U2VydmljZQtMb2NhbFBsYXllcg1QbGF5ZXJTY3JpcHRzDFdhaXRGb3JDaGlsZAxQbGF5ZXJNb2R1bGUORmluZEZpcnN0Q2hpbGQNQ29udHJvbE1vZHVsZQpNYW51YWxKdW1wDENhbWVyYU1vZHVsZQtDYW1lcmFJbnB1dBFDYW1lcmFTZW5zaXRpdml0eQADAgEBAAAGAwAABQEBBPsBAAAwAAHsAAAAAIIAAQABAwEACQIBGAAAAAEKAAAAAAIBAQAABgMAAAUBAgT7AQAAMAAB7AAAAACCAAEAAQMBAAwDARgAAAABDQAAAAAIAAABAgAwowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAk0BADEEAAAAbwMFALwBAdMGAAAAnwEDAm8DBwC8AQEDCAAAAJ8BAwJvBAkAvAIBAwgAAACfAgMCbwUKALwDAgMIAAAAnwMDAm8GCwC8BAEDCAAAAJ8EAwJvBwwAvAUEAwgAAACfBQMCbwcNALwFBQMIAAAAnwUDAv8GAgAAAAAAwAcOABIAAwAwBwbZDwAAAMAHEAASAAUAMAcG3hEAAACCBgIAEgMEBAAAAEADBQMGAwcDCAMJAwoDCwMMAw0DDgMPAxAGAAMCBgEDAwIAAQEAARgAAAAAAAAAAQAAAAAAAAAAAAEAAAABAAAAAQAAAAEAAAAAAAAAAgABAAAAAwAAAAMBAAAAAAL7cbcNdJQgUcm13Zmmp9K9Wd7qXaCOIlOZ1i7ECrUWHMcXUOvgOaxp

-- Decompiled by Krnl

local v1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):FindFirstChild("PlayerModule")
local v_u_2 = v1:FindFirstChild("ControlModule"):FindFirstChild("ManualJump")
local v_u_3 = v1:FindFirstChild("CameraModule"):FindFirstChild("CameraInput"):FindFirstChild("CameraSensitivity")
return {
	["setIsJumping"] = function(p4)
		-- upvalues: (copy) v_u_2
		v_u_2.Value = p4
	end,
	["setCameraSensitivity"] = function(p5)
		-- upvalues: (copy) v_u_3
		v_u_3.Value = p5
	end
}
