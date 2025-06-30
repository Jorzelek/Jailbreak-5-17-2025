-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMRCFJlc291cmNlEkFwcmlsMjAyMExpdmVFdmVudA5GaW5kRmlyc3RDaGlsZAxXYWl0Rm9yQ2hpbGQEd2FpdAdyZXF1aXJlBEluaXQFcHJpbnQcTG9hZGVkIGFwcmlsIDIwMjAgbGl2ZSBldmVudAVDaGVjawVwY2FsbAR3YXJuBkxhdW5jaAVzcGF3bgRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UABAUAAwAAACL7AQAATQABYgAAAABvAgEAvAAAAwIAAACfAAMCRwAZAAAAAACpAQEA3gEBAG8DAQC8AQDTAwAAAJ8BAwKkAgUAAABAQG8DBgCfAgIBpAMIAAAAcEBSBAEAnwMCAk0CA3MJAAAA+wMCAJ8CAgHGAgAA3gICAKQCCwAAAKBAbwMMAJ8CAgGCAAEADQMBAwIDAwMEAwUEAABAQAKamZmZmZm5PwMGBAAAcEADBwMIBAAAoEADCQAHCgEYAAAAAAAAAAEAAQABAAAAAQAAAAEAAAAAAAAAAQABAAAAAgkAAAAABAACAAAAEvsAAAAqAA8AAAAAgKQAAQAAAABA+wEBAJ8AAgMrAAQApAIDAAAAIEBSAwEAnwICAaQCBQAAAEBAjAMBAJ8CAgFIAO//ggABAAYDCwQAAABAAwwEAAAgQAMFBAAAQEAAEw0BGAAAAAEAAAABAQAAAAIAAAD7BxQAAAAAAwECAAAABt4AAACkAQEAAAAAQPsCAQCfAQIBggABAAIDDgQAAABAABwHARgAAQAAAAEdAAAAAAcAAAECABijAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCxgEAAKkCAADZAwAAEgAAABIBAv8SAQH/2QQBABIBAv8SAAMA2QUCABIBAf8SAAQA4gYFADAFBnMEAAAAwQEAAIIGAgAGAw8EAAAAQAMQAxEDBwUBBAMAAQIBAAEYAAEAAAAAAAICAQAAAAwAAAkAAAQBAAAAAQAAAAAD0prUk3pZ1MrgXr4HXb/1KMJE8tSztUjvNksZamCwzBA99jM9Jm0D3Q==

-- Decompiled by Krnl

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = false
local function v_u_6()
	-- upvalues: (copy) v_u_1, (ref) v_u_3, (ref) v_u_2
	local v4 = v_u_1.Resource:FindFirstChild("April2020LiveEvent")
	if v4 ~= nil then
		v_u_3 = true
		local v5 = v4:WaitForChild("April2020LiveEvent")
		wait(0.1)
		require(v5).Init(v_u_2)
		v_u_2 = nil
		print("Loaded april 2020 live event")
	end
end
local function v_u_9()
	-- upvalues: (ref) v_u_3, (copy) v_u_6
	while v_u_3 == false do
		local v7, v8 = pcall(v_u_6)
		if not v7 then
			warn(v8)
		end
		wait(1)
	end
end
return {
	["Init"] = function(p10)
		-- upvalues: (ref) v_u_2, (copy) v_u_9
		v_u_2 = p10
		spawn(v_u_9)
	end
}
