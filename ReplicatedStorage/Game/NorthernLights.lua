-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMVBHRpY2sMX3RhcmdldENvbG9yBl9jb2xvcgZDb2xvcjMHZnJvbUhTVgRtYXRoBnJhbmRvbQRsZXJwBmlwYWlycwtHZXRDaGlsZHJlbgVEZWNhbAl3b3Jrc3BhY2UJU2t5TGlnaHRzDkZpbmRGaXJzdENoaWxkCUhlYXJ0YmVhdAdDb25uZWN0BGluaXQEZ2FtZQpSdW5TZXJ2aWNlCkdldFNlcnZpY2UDbmV3AAMIAAMAAAA1pAABAAAAAECfAAEC+wIAACYBAAKMAgUAYAITAAEAAADeAAAA+wEBAPsDAQBNAgP7AgAAADACAdADAAAA+wEBAKQCBgAAFECApAMJAAAgcICfAwECjAQBAG8FCgCfAgQCMAIB+wIAAAD7AgEATQEC0AMAAAD7BAEATQME+wIAAAD7BgAAJgUABj4EBQu8AQG/DAAAAJ8BBAKkAg4AAADQQPsDAgC8AwNoDwAAAJ8DAgCfAgAEUQIEAE0HBqAQAAAAMAEHmgQAAABuAvv/AgAAgIIAAQARAwEEAAAAQAMCAwMDBAMFBAAUQIADBgMHBAAgcIACAAAAAAAA+D8CAAAAAAAAFEADCAMJBAAA0EADCgMLAAsAARgAAAACAAAAAAEBAAAAAAABAAAAAAAAAAAAAAIAAAAAAAAAAAAAAAEAAAAAAAAAAQAAAP8AAwwAAAAABQACAAAAFKQAAQAAAABAbwICALwAAAMDAAAAnwADAg4ADACMAQAA+wMAAE0CA/0EAAAA2QQAABIBAf8SAgEAEgAAALwCAscFAAAAnwIDAcEBAACCAAEABgMMBAAAAEADDQMOAw8DEAEABxEBGAAAAAAAAAEBAQAAAAAAAAAAAAAOCAAAAAAGAAABAgAaowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAv8BAwAAAAAAxgIAADACAdAEAAAApAIHAAAYUICMAwEAjAQBAIwFAQCfAgQCMAIB+wgAAADAAgkAEgAAABIAAQAwAgETCgAAAIIBAgALAxIEAAAAQAMTAxQDAwMEAxUEABhQgAMCBgEDEQEBAQABGAABAAAAAAACAAEAAAEAAAAAAAAAAQAAAAATAQAAAAACIZUSeXyld1QTUXjt7jwvIQmIEo49qDQx+U45l8Imagzmn5DhECiT+Q==

-- Decompiled by Krnl

local v_u_1 = game:GetService("RunService")
local v_u_7 = {
	["_color"] = nil,
	["_targetColor"] = Color3.new(1, 1, 1),
	["init"] = function()
		-- upvalues: (copy) v_u_1, (copy) v_u_7
		local v_u_2 = workspace:FindFirstChild("SkyLights")
		if v_u_2 then
			local v_u_3 = 0
			v_u_1.Heartbeat:Connect(function()
				-- upvalues: (ref) v_u_3, (ref) v_u_7, (copy) v_u_2
				local v4 = tick()
				if v4 - v_u_3 > 5 then
					v_u_3 = v4
					v_u_7._color = v_u_7._targetColor
					v_u_7._targetColor = Color3.fromHSV(math.random(), 1, 1.5)
				end
				local v5 = v_u_7._color:lerp(v_u_7._targetColor, (v4 - v_u_3) / 5)
				for _, v6 in ipairs(v_u_2:GetChildren()) do
					v6.Decal.Color3 = v5
				end
			end)
		end
	end
}
return v_u_7
