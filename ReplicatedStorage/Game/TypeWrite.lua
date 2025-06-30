-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMBHRpY2sKRGlzY29ubmVjdAR1dGY4BGNoYXIJY29kZXBvaW50A2xlbgAJSGVhcnRiZWF0B0Nvbm5lY3QEZ2FtZQpSdW5TZXJ2aWNlCkdldFNlcnZpY2UAAwoABgAAABykAAEAAAAAQJ8AAQL7AgAAJgEAAvsDAQDsAgEDjAMBAGADBgACAAAAjAIBAPsDAgC8AwMaAgAAAJ8DAgH7AwMApAQFAAAQMICkBQcAABgwgPsGBACMBwEA+wkFAAkIAgmfBQQAnwQAAJ8DAAGCAAEACAMBBAAAAEADAgMDAwQEABAwgAMFBAAYMIAACwABGAAAAAEAAQABAAABAQAAAAMAAAAAAAAAAAAAAAEMAAAAAAoDAQAAAB2QAgIApAMCAAAAEECfAwECpAQFAAAQMIBSBQAAnwQCAuwFBAJSBgEAbwcGAJ8GAgHGBgAA+wgAAE0HCP0HAAAA2QkAABIAAwASAAUAEgEG/xIAAQASAAAAEgAEALwHB8cIAAAAnwcDAlIGBwDBBgAAggYCAAkCAAAAAAAAOUADAQQAABBAAwMDBgQAEDCAAwcDCAMJAQAEAAEYAAEAAAEAAAABAQAAAQEAAAAAAAAAAAAAAAAACwAFAAAAAAMAAAECAAqjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCwAEEABIAAACCAQIABQMKBAAAAEADCwMMBgEBAQEAARgAAQAAAAAAAgAAAQAAAAACRQy1jQSk7BF3yN8Z2K7yed9d4kjskeYIPYfU3esa5st+l4JUde9i9g==

-- Decompiled by Krnl

local v_u_1 = game:GetService("RunService")
return function(p_u_2, p_u_3, p4)
	-- upvalues: (copy) v_u_1
	local v_u_5 = tick()
	local v_u_6 = utf8.len(p_u_2)
	local v_u_7 = v_u_6 / (p4 or 25)
	p_u_3("")
	local v_u_8 = nil
	v_u_8 = v_u_1.Heartbeat:Connect(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_7, (ref) v_u_8, (copy) p_u_3, (copy) p_u_2, (copy) v_u_6
		local v9 = (tick() - v_u_5) / v_u_7
		if v9 > 1 then
			v_u_8:Disconnect()
			v9 = 1
		end
		p_u_3(utf8.char(utf8.codepoint(p_u_2, 1, v9 * v_u_6)))
	end)
	return v_u_8
end
