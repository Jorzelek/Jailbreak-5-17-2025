-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRG0dldFRyYW5zbGF0b3JGb3JQbGF5ZXJBc3luYwVwY2FsbAR3YXJuBnVucGFjawtGb3JtYXRCeUtleRpObyB2YWxpZCB0cmFuc2xhdGlvbiBmb3I6IARnYW1lB1BsYXllcnMKR2V0U2VydmljZQtMb2NhbFBsYXllchNMb2NhbGl6YXRpb25TZXJ2aWNlBHRhc2sFc3Bhd24VR2FtZUxvY2FsaXphdGlvblRhYmxlDlJvYmxveExvY2FsZUlkDUdldFRyYW5zbGF0b3IFZW4tdXMABwMAAwAAAAf7AAEA+wICALwAAEcAAAAAnwADAt4AAACCAAEAAQMBAAwAARgAAAAAAAABDQAAAAAEAAMAAAAQpAABAAAAAEDZAQAAEgIAABICAQASAgIAnwACAw4AAQCCAAEApAIDAAAAIEBSAwEAnwICAcYCAADeAgAAggABAAQDAgQAAABAAwMEAAAgQAEACwABGAAAAAAAAAADAAMAAAABAAIMAAAAAAUABAAAAAz7AAEA+wICAPsEAwC7NQQCpAMBAAAAAECfAwIAvAAAmwIAAACfAAAC3gAAAIIAAQADAwQEAAAAQAMFAB0AARgAAAAAAAAAAAAAAAEeAAAAAAUABAAAAAz7AAEA+wICAPsEAwC7NQQCpAMBAAAAAECfAwIAvAAAmwIAAACfAAAC3gAAAIIAAQADAwQEAAAAQAMFACEAARgAAAAAAAAAAAAAAAEiAAAAAAUABAAAAAz7AAEA+wICAPsEAwC7NQQCpAMBAAAAAECfAwIAvAAAmwIAAACfAAAC3gAAAIIAAQADAwQEAAAAQAMFACYAARgAAAAAAAAAAAAAAAEnAAAAAAkCAwEAAC2jAgAA/wIAAAAAAADdAwAAxQIDAAEAAADGAwAApAQBAAAAAEDZBQAAEgED/xICAAASAAEAEgACAJ8EAgIrBAkApAUBAAAAAEDZBgEAEgED/xICAQASAAEAEgACAJ8FAgJSBAUAKwQJAKQFAQAAAABA2QYCABIBA/8SAgIAEgABABIAAgCfBQICUgQFACsEBwBSAwEApAUDAAAAIEBvBwQAUggBAHMGBwifBQIBwQMAAIIDAgAFAwIEAAAAQAMDBAAAIEADBgMCAwQaBQEYAAEAAAAAAQEAAAAAAAAAAwEAAAAAAAAAAAQBAAAAAAAAAAAEAQEAAAAAAAIAGgAAAAAIAAABAgAvowAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAk0BADEEAAAApAIBAAAAAEBvBAUAvAICFgMAAACfAgMCxgMAAA4BBwCkBAgAABxggNkFAAASAQP/EgACABIAAQCfBAIBTQQC9AkAAABNBgKLCgAAALwEBBkLAAAAnwQDAk0FAvQJAAAAbwcMALwFBRkLAAAAnwUDAv8GAQAAAAAA2QcBABIBA/8SAAQAEgAFADAHBpsNAAAAwQMAAIIGAgAOAwcEAAAAQAMIAwkDCgMLAwwDDQQAHGCAAw4DDwMQAxEDBQIBBQEAARgABQAAAAAAAQABAAAAAAABAQEAAAAAAAAMAAAAAAAAAQAAAAAAAQABAAAAAAAWAAEAAAAABtLonDStbR9o4Cz2oBEaXU4WszZ5bOMZzPwUD70b6o/Ka58HJGCCxyo=

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = game:GetService("LocalizationService")
local v_u_3 = nil
if v_u_1 then
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_2, (copy) v_u_1
		local v4, v5 = pcall(function()
			-- upvalues: (ref) v_u_3, (ref) v_u_2, (ref) v_u_1
			v_u_3 = v_u_2:GetTranslatorForPlayerAsync(v_u_1)
		end)
		if not v4 then
			warn(v5)
			v_u_3 = nil
		end
	end)
end
local v_u_6 = v_u_2.GameLocalizationTable:GetTranslator(v_u_2.RobloxLocaleId)
local v_u_7 = v_u_2.GameLocalizationTable:GetTranslator("en-us")
return {
	["FormatByKey"] = function(_, p_u_8, ...)
		-- upvalues: (ref) v_u_3, (copy) v_u_6, (copy) v_u_7
		local v_u_9 = { ... }
		local v_u_10 = nil
		local v11
		if pcall(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_3, (copy) p_u_8, (copy) v_u_9
			local v12 = v_u_9
			v_u_10 = v_u_3:FormatByKey(p_u_8, unpack(v12))
		end) or pcall(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_6, (copy) p_u_8, (copy) v_u_9
			local v13 = v_u_9
			v_u_10 = v_u_6:FormatByKey(p_u_8, unpack(v13))
		end) or pcall(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_7, (copy) p_u_8, (copy) v_u_9
			local v14 = v_u_9
			v_u_10 = v_u_7:FormatByKey(p_u_8, unpack(v14))
		end) then
			v11 = v_u_10
		else
			v_u_10 = p_u_8
			warn("No valid translation for: " .. p_u_8)
			v11 = v_u_10
		end
		return v11
	end
}
