-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMVEFNUQVRVU19BVFRSX05BTUUMR2V0QXR0cmlidXRlCWdldFN0YXR1cxNvYmogbXVzdCBub3QgYmUgbmlsBmFzc2VydAZ0eXBlb2YGbnVtYmVyFnZhbHVlIG11c3QgYmUgYSBudW1iZXIMU2V0QXR0cmlidXRlCXNldFN0YXR1cxlHZXRBdHRyaWJ1dGVDaGFuZ2VkU2lnbmFsFmdldFN0YXR1c0NoYW5nZWRTaWduYWwbRElTQUJMRV9BVVRPX09QRU5fQVRUUl9OQU1FEmdldERpc2FibGVBdXRvT3BlbhJzZXREaXNhYmxlQXV0b09wZW4EZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUHUm9iYmVyeQ1Sb2JiZXJ5Q29uc3RzAAYFAQEAAAAH+wQAAE0DBOIAAAAAvAEAEgEAAACfAQMAggEAAAIDAQMCAAYDARgAAAAAAAAABwAAAAAGAgEAAAcEAAAFAg8CIUcAAgAAAACAqQMAAakDAQCBAQMEAAAAAG8EAACkAgIAAAAQQJ8CAwG7LAEDUgUBAKQEBAAAADBAnwQCAvAEAgAFAAAAqQMAAakDAQCBAQMEBgAAAG8EBgCkAgIAAAAQQJ8CAwH7BQAATQQF4gcAAABSBQEAvAIALggAAACfAgQBggABAAkDBAMFBAAAEEADBgQAADBAAwcDCAMBAwkACQoBGAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAABAAAAAAAAAQoAAAAABQEBAAAAB/sEAABNAwTiAAAAALwBABYBAAAAnwEDAIIBAAACAwEDCwAODAEYAAAAAAAAAA8AAAAABgEBAAAAC/sFAABNBAWrAAAAALwCABIBAAAAnwIDAioCAgABAAAAqQEAAakBAQCCAQIAAgMNAwIAEQ4BGAAAAAAAAAAAAAAAEgAAAAAGAgEAAAAJ+wUAAE0EBasAAAAAUgUBALwCAC4BAAAAnwIEAakCAQCCAgIAAgMNAwkAFA8BGAAAAAAAAAABABUAAAAABAAAAQIAJaMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0DAAQGAAAATQIDWAcAAACfAQIC/wIEAAAAAADAAwgAEgABADADAv0JAAAAwAMKABIAAQAwAwLxCwAAAMADDAASAAEAMAMC2Q0AAADAAw4AEgABADADAqEPAAAAwAMQABIAAQAwAwKVEQAAAIICAgASAxAEAAAAQAMRAxIDEwQAAEBAAxQDFQYAAwMGAQMKBgIDDAYDAw4GBAMPBQABAgMEAQABGAABAAAAAAABAAAAAAAAAgABAAAAAwAAAAUAAAADAAAAAwAAAAQBAAAAAAVJL1UsLWIrl3vrP7ja5hmiE1jGziJq0LF6DY7i6PKSLNe4brpI1+BV

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Robbery.RobberyConsts)
return {
	["getStatus"] = function(p3)
		-- upvalues: (copy) v_u_2
		return p3:GetAttribute(v_u_2.STATUS_ATTR_NAME)
	end,
	["setStatus"] = function(p4, p5)
		-- upvalues: (copy) v_u_2
		local v6 = p4 ~= nil
		assert(v6, "obj must not be nil")
		local v7 = typeof(p5) == "number"
		assert(v7, "value must be a number")
		p4:SetAttribute(v_u_2.STATUS_ATTR_NAME, p5)
	end,
	["getStatusChangedSignal"] = function(p8)
		-- upvalues: (copy) v_u_2
		return p8:GetAttributeChangedSignal(v_u_2.STATUS_ATTR_NAME)
	end,
	["getDisableAutoOpen"] = function(p9)
		-- upvalues: (copy) v_u_2
		return p9:GetAttribute(v_u_2.DISABLE_AUTO_OPEN_ATTR_NAME) == true
	end,
	["setDisableAutoOpen"] = function(p10, p11)
		-- upvalues: (copy) v_u_2
		p10:SetAttribute(v_u_2.DISABLE_AUTO_OPEN_ATTR_NAME, p11)
		return true
	end
}
