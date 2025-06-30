-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTDVZhdWx0SGFja2VySWQMR2V0QXR0cmlidXRlEUdldFBsYXllckJ5VXNlcklkCWdldEhhY2tlcgZVc2VySWQMU2V0QXR0cmlidXRlCXNldEhhY2tlchlHZXRBdHRyaWJ1dGVDaGFuZ2VkU2lnbmFsFmdldEhhY2tlckNoYW5nZWRTaWduYWwOVmF1bHREaXJlY3Rpb24MZ2V0RGlyZWN0aW9uDHNldERpcmVjdGlvbhlnZXREaXJlY3Rpb25DaGFuZ2VkU2lnbmFsDVZhdWx0RGlzYWJsZWQLZ2V0RGlzYWJsZWQLc2V0RGlzYWJsZWQEZ2FtZQdQbGF5ZXJzCkdldFNlcnZpY2UACQUBAQAAAA1vAwAAvAEAEgEAAACfAQMCDgEGAPsCAABSBAEAvAICYQIAAACfAgMCggICAMYCAACCAgIAAwMBAwIDAwAFBAEYAAAAAAEBAAAAAAECAAYAAAAABwIAAAAACsYCAAAOAQIATQIB5gAAAABvBQEAUgYCALwDAC4CAAAAnwMEAYIAAQADAwUDAQMGAA0HARgAAQEAAgAAAAABDgAAAAAEAQAAAAAFbwMAALwBABYBAAAAnwEDAIIBAAACAwEDCAAUCQEYAAAAAAAVAAAAAAQBAAAAAAVvAwAAvAEAEgEAAACfAQMAggEAAAIDCgMCABcLARgAAAAAABgAAAAABgIAAAAABm8EAABSBQEAvAIALgEAAACfAgQBggABAAIDCgMGABoMARgAAAAAAAEbAAAAAAQBAAAAAAVvAwAAvAEAFgEAAACfAQMAggEAAAIDCgMIAB0NARgAAAAAAB4AAAAABAEAAAAABW8DAAC8AQASAQAAAJ8BAwCCAQAAAgMOAwIAIA8BGAAAAAAAIQAAAAAGAgAAAAAGbwQAAFIFAQC8AgAuAQAAAJ8CBAGCAAEAAgMOAwYAIxABGAAAAAAAASQAAAAAAwAAAQIAI6MAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwL/AQQAAAAAAMACBAASAAAAMAIB+gUAAADAAgYAMAIB7gcAAADAAggAMAIBvgkAAADAAgoAMAIBFgsAAADAAgwAMAIBGg0AAADAAg4AMAIB7A8AAADAAhAAMAIB3REAAADAAhIAMAIBqRMAAACCAQIAFAMRBAAAAEADEgMTBgADBAYBAwcGAgMJBgMDCwYEAwwGBQMNBgYDDwYHAxAIAAECAwQFBgcBAAEYAAEAAAAAAAIAAQAAAAgAAAcAAAMAAAMAAAMAAAMAAAMAAAMBAAAAAAiu1Qhz/W4145wRYudj1AfJr+dioqL2syiDRm3Treyb15iQ9n/4JJf7

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
return {
	["getHacker"] = function(p2)
		-- upvalues: (copy) v_u_1
		local v3 = p2:GetAttribute("VaultHackerId")
		if v3 then
			return v_u_1:GetPlayerByUserId(v3)
		else
			return nil
		end
	end,
	["setHacker"] = function(p4, p5)
		local v6
		if p5 then
			v6 = p5.UserId
		else
			v6 = nil
		end
		p4:SetAttribute("VaultHackerId", v6)
	end,
	["getHackerChangedSignal"] = function(p7)
		return p7:GetAttributeChangedSignal("VaultHackerId")
	end,
	["getDirection"] = function(p8)
		return p8:GetAttribute("VaultDirection")
	end,
	["setDirection"] = function(p9, p10)
		p9:SetAttribute("VaultDirection", p10)
	end,
	["getDirectionChangedSignal"] = function(p11)
		return p11:GetAttributeChangedSignal("VaultDirection")
	end,
	["getDisabled"] = function(p12)
		return p12:GetAttribute("VaultDisabled")
	end,
	["setDisabled"] = function(p13, p14)
		p13:SetAttribute("VaultDisabled", p14)
	end
}
