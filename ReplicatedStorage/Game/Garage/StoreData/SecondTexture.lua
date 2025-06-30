-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYFUdldExvY2FsVmVoaWNsZVBhY2tldARUeXBlBE1ha2UHQ2hhc3NpcwZDYW1hcm8FTW9kZWwETm9uZQtHZXRJbnN0YW5jZQRnYW1lEVJlcGxpY2F0ZWRTdG9yYWdlCkdldFNlcnZpY2UHcmVxdWlyZQdWZWhpY2xlDFZlaGljbGVVdGlscw1TZWNvbmRUZXh0dXJlBEdhbWUGR2FyYWdlCUN1c3RvbWl6ZRZnZXREZWZhdWx0VmVoaWNsZU1vZGVsBnNjcmlwdAZQYXJlbnQHVGV4dHVyZQV0YWJsZQVjbG9uZQACBwEDAAAAK/sCAABNAQKHAAAAAJ8BAQIrAQgA4gIDAG8DBAAwAwIRAQAAAG8DBQAwAwKtAgAAAFIBAgD7AgEATQMBrQIAAABNBAERAQAAAJ8CAwLiAwcAMAIDOwYAAABNBAGtAgAAADAEA60CAAAATQQBEQEAAAAwBAMRAQAAAE0EAD8IAAAADgQFAPsEAgDGBQAAUgYDAJ8EAwGCAgIA+wQCAFIFAABSBgMAnwQDAYICAgAJAwEDAgMDBQIBAgMEAwUDBgUDBgIBAwcACAgBGAAAAAADAQEAAAEAAAADAAAAAAABAAAAAAAAAAAAAAEAAAEAAAAAAgAAAAIJAAAAAAgAAAECADSjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwCNBgAAAE0CA20HAAAAnwECAqQCBQAAAEBATQYAvQkAAABNBQYoCgAAAE0EBTsLAAAATQME1ggAAACfAgICpAMFAAAAQEBNBQC9CQAAAE0EBXYMAAAAnwMCAqQEBQAAAEBApAcOAAAA0EBNBgckDwAAAE0FBk8QAAAAnwQCAsAFEQASAAEAEgADABIAAgCkBhQAAEwggVIHBACfBgICMAUGURUAAACCBgIAFgMJBAAAAEADCgMLAwwEAABAQAMNAw4DDwMQAxEDEgMTAxQEAADQQAMVAxYGAAMXAxgEAEwggQMIAQABAAEYAAEAAAAAAAEAAAAAAAABAAAAAAAAAAAAAAEAAAAAAAABAAAAAAAAAAACAAAAFAAAAAEAAQEAAAAAAUTPIiNzmcMedgtIt/79yv25ZtvnUwHiA9KpX6Hw4GtgJ3+E+WCl3tE=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Vehicle.VehicleUtils)
local v_u_3 = require(v1.Game.Garage.Customize.SecondTexture)
local v_u_4 = require(v1.Game.getDefaultVehicleModel)
local v5 = require(script.Parent.Texture)
local v6 = table.clone(v5)
function v6.GetInstance(p7)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v8 = v_u_2.GetLocalVehiclePacket()
	if not v8 then
		v8 = {
			["Type"] = "Chassis",
			["Make"] = "Camaro"
		}
	end
	local v9 = v_u_4(v8.Make, v8.Type)
	local v10 = {
		["Model"] = v9,
		["Make"] = v8.Make,
		["Type"] = v8.Type
	}
	if p7.None then
		v_u_3(nil, v10)
		return v9
	else
		v_u_3(p7, v10)
		return v9
	end
end
return v6
