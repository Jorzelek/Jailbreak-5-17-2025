-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMAm9zBWNsb2NrCkRpc2Nvbm5lY3QTTWF4VmlzaWJsZUdyYXBoZW1lcwRUZXh0BHV0ZjgDbGVuCUhlYXJ0YmVhdAdDb25uZWN0BGdhbWUKUnVuU2VydmljZQpHZXRTZXJ2aWNlAAMGAAYAAAAapAACAAAEAICfAAEC+wIAACYBAAL7AwEA7AIBA4wDAQBgAwYAAgAAAIwCAQD7AwIAvAMDGgMAAACfAwIB+wQDAAkDAgT7BAQAMAMEvQQAAAD7BAUADgQDAPsEBQBSBQMAnwQCAYIAAQAFAwEDAgQABACAAwMDBAAUAAEYAAAAAQABAAEAAAEBAAAAAgABAAABAAEAAAIVAAAAAAsEAQAACQYAAAUEAw+ChR+QAgIAMAAB9QEAAACMBAAAMAQBvQIAAACkBAUAABAwgJ8EAQKkBQgAABxggFIGAACfBQIC7AYFAsYHAAD7CQAATQgJ/QkAAADZCgAAEgAEABIABgASAQf/EgAFABIAAQASAAMAvAgIxwoAAACfCAMCUgcIAMEHAACCBwIACwIAAAAAAAA5QAMFAwQDAQMCBAAQMIADBgMHBAAcYIADCAMJAQAEAAEYAAIAAQAABwAAAQAAAAECAQAAAAAAAAAAAAAAAAAOAAUAAAAAAwAAAQIACqMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwLAAQQAEgAAAIIBAgAFAwoEAAAAQAMLAwwGAQEBAQABGAABAAAAAAACAAABAAAAAAJClwOqIVG5eHBTaT7mr8dqEMRH6QoVt3cXAi63gjkCzWGKnditDvM9

-- Decompiled by Krnl

local v_u_1 = game:GetService("RunService")
return function(p2, p_u_3, p4, p_u_5)
	-- upvalues: (copy) v_u_1
	p_u_3.Text = p2
	p_u_3.MaxVisibleGraphemes = 0
	local v_u_6 = os.clock()
	local v_u_7 = utf8.len(p2)
	local v_u_8 = v_u_7 / (p4 or 25)
	local v_u_9 = nil
	v_u_9 = v_u_1.Heartbeat:Connect(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_8, (ref) v_u_9, (copy) v_u_7, (copy) p_u_3, (copy) p_u_5
		local v10 = (os.clock() - v_u_6) / v_u_8
		if v10 > 1 then
			v_u_9:Disconnect()
			v10 = 1
		end
		local v11 = v10 * v_u_7
		p_u_3.MaxVisibleGraphemes = v11
		if p_u_5 then
			p_u_5(v11)
		end
	end)
	return v_u_9
end
