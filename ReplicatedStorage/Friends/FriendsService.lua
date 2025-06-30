-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMeDW1vbml0b3JQbGF5ZXILTG9jYWxQbGF5ZXIEaW5pdA11cGRhdGVGcmllbmRzBWV2ZXJ5FkZSSUVORF9VUERBVEVfSU5URVJWQUwHQ29ubmVjdAR0YXNrBXNwYXduBWVycm9yLU5vdCBtZWFudCB0byB1cGRhdGUgZnJpZW5kcyBmb3Igb3RoZXIgcGxheWVycwZVc2VySWQPR2V0RnJpZW5kc0FzeW5jDkdldEN1cnJlbnRQYWdlAklkCklzRmluaXNoZWQWQWR2YW5jZVRvTmV4dFBhZ2VBc3luYwxfY2FjaGVkTG9jYWwEd2FybglObyBwbGF5ZXIQZ2V0SXNGcmllbmRzV2l0aARnYW1lB1BsYXllcnMKR2V0U2VydmljZRFSZXBsaWNhdGVkU3RvcmFnZQdyZXF1aXJlB0ZyaWVuZHMNRnJpZW5kc0NvbnN0cwNTdGQISW50ZXJ2YWwABgMAAgAAAAj7AQAATQABswAAAAD7AgEATQECMQEAAACfAAIBggABAAIDAQMCAAkDARgAAAAAAAAAAQoAAAAAAgACAAAABvsBAABNAAEDAAAAAPsBAQCfAAIBggABAAEDBAAOAAEYAAAAAAABDwAAAAAEAQMAAAAV+wIAAE0BAsQAAAAA+wMBAE0CAywBAAAAnwECAtkDAAASAgIAEgAAALwBAccCAAAAnwEDAaQBBQAAEDCA+wMCAE0CAwMGAAAAUgMAAJ8BAwGCAAEABwMFAwYDBwMIAwkEABAwgAMEAQEMAQEYAAAAAAAAAAAAAAAAAAQAAAAAAAABDgAAAAAKAQIAAAAw+wIAAE0BAjEAAAAA8QAGAAEAAACkAQIAAAAQQG8CAwCfAQIBggABAP8BAAAAAAAA+wIAAE0EAOYEAAAAvAICwwUAAACfAgMCvAMCtQYAAACfAwIEZAMEAE0IB5QHAAAAqQkBAGoJAQhuA/v/AgAAAE0DAqEIAAAAKwMEALwDAjcJAAAAnwMCAUgA7//7BAEATQMEpQoAAABNBADmBAAAAGoBAwT7BQEATQQFpQoAAABNBQDmBAAAAIcDBAWCAwIACwMCAwoEAAAQQAMLAwwDDQMOAw8DEAMRAxIAFAQBGAAAAAAAAQAAAAECAAEAAAAAAAIAAAABAAAA/wADAAADAAD5CQAAAAAAAQAAAAAAABUAAAAABwIBAAAAHysABgCkAgEAAAAAQG8DAgCfAgIBqQIAAIICAgD7BAAATQMEpQMAAABNBADmBAAAAIcCAwQrAgUA+wMAAE0CAwMFAAAAUgMAAJ8CAgH7BgAATQUGpQMAAABNBgDmBAAAAIcEBQaHAwQBKgMCAAEAAACpAgABqQIBAIICAgAGAxMEAAAAQAMUAxIDDAMEACcVARgAAQAAAAEABQAAAAAAAAEAAAAAAgAAAAAAAAAAAAAAKQAAAAAGAAABAgA2owAAAKQAAQAAAABAbwICALwAABYDAAAAnwADAqQBAQAAAABAbwMEALwBARYDAAAAnwEDAqQCBgAAAFBATQQBGAcAAABNAwQoCAAAAJ8CAgKkAwYAAABQQE0FAaEJAAAATQQFrAoAAACfAwIC/wQEAAAAAAD/BQAAAAAAADAFBKULAAAAwAUMABIABAASAAAAMAUEEw0AAADABQ4AEgADABIAAgASAAQAMAUEsw8AAADABRAAEgAAABIABAAwBQQDEQAAAMAFEgASAAQAMAUESxMAAACCBAIAFAMWBAAAAEADFwMYAxkDGgQAAFBAAxsDHAMdAx4DEgYAAwMGAgMBBgMDBAYEAxUEAAIDBAEAARgAAQAAAAAAAQAAAAAAAQAAAAAAAAEAAAAAAAABAAIAAAABAAAAAAMAAAAAAAgAAAAAEwAAAA8BAAAAAAXOk9uBNcKQ9/xXsRU3sn0XwgQ2lXngT+q4pWyJhBJ1m1NdEKhA8mTz

-- Decompiled by Krnl

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Friends.FriendsConsts)
local v_u_4 = require(v2.Std.Interval)
local v_u_12 = {
	["_cachedLocal"] = {},
	["init"] = function()
		-- upvalues: (copy) v_u_12, (copy) v_u_1
		v_u_12.monitorPlayer(v_u_1.LocalPlayer)
	end,
	["monitorPlayer"] = function(p_u_5)
		-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_12
		v_u_4.every(v_u_3.FRIEND_UPDATE_INTERVAL):Connect(function()
			-- upvalues: (ref) v_u_12, (copy) p_u_5
			v_u_12.updateFriends(p_u_5)
		end)
		task.spawn(v_u_12.updateFriends, p_u_5)
	end,
	["updateFriends"] = function(p6)
		-- upvalues: (copy) v_u_1, (copy) v_u_12
		if p6 == v_u_1.LocalPlayer then
			local v7 = v_u_1:GetFriendsAsync(p6.UserId)
			local v8 = {}
			while true do
				for _, v9 in v7:GetCurrentPage() do
					v8[v9.Id] = true
				end
				if v7.IsFinished then
					v_u_12._cachedLocal[p6.UserId] = v8
					return v_u_12._cachedLocal[p6.UserId]
				end
				v7:AdvanceToNextPageAsync()
			end
		else
			error("Not meant to update friends for other players")
			return
		end
	end,
	["getIsFriendsWith"] = function(p10, p11)
		-- upvalues: (copy) v_u_12
		if p10 then
			if not v_u_12._cachedLocal[p10.UserId] then
				v_u_12.updateFriends(p10)
			end
			return v_u_12._cachedLocal[p10.UserId][p11] == true
		else
			warn("No player")
			return false
		end
	end
}
return v_u_12
