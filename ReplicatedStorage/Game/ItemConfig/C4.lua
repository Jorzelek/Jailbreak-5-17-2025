-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMmBGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlCFJlc291cmNlCFNldHRpbmdzA0hpcAVSYWlzZQ5MZWZ0RWxib3dBbmdsZQ9SaWdodEVsYm93QW5nbGURTGVmdFdyaXN0Um90YXRpb24SUmlnaHRXcmlzdFJvdGF0aW9uB1NwcmluZ3MKSXRlbU9mZnNldAxJdGVtUm90YXRpb24MTmVja1JvdGF0aW9uB1ZlY3RvcjMDbmV3BkNGcmFtZQZNb3Rpb24SZXhwbG9zaW9uX2xhcmdlXzAyFmd1bl9waXN0b2xfZHJ5X2ZpcmVfMDEFU291bmQHTWFnU2l6ZQtBbW1vQ3VycmVudAhGaXJlQXV0bwhGaXJlRnJlcQpSZWxvYWRUaW1lCkNvbnN1bWFibGUFUHJpY2UTRG9Ob3RGaWxsT25QdXJjaGFzZQZJbWFnZXMCQzQHSW1hZ2VJZA1Tb3J0T3JkZXJQYWdlEUN1c3RvbVNob290UmVtb3RlEkN1c3RvbURhbWFnZVJlbW90ZQlFcXVpcFRpbWUAAQcAAAECAHijAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwBiBgAAAE0CA8oHAAAAnwECAv8CBQAAAAAA4gMOAOIEEADiBRQAbwYVADAGBYARAAAAbwYWADAGBeUSAAAATDYAAqQGGQAAYHCBnwYBAjAGBY0TAAAAMAUEmA8AAAAwBAO9CAAAAOIEEADiBRQAbwYaADAGBYARAAAAbwYbADAGBeUSAAAAbwYcADAGBY0TAAAAMAUEmA8AAAAwBAP0CQAAAIwEAAAwBAPSCgAAAIwEAAAwBAOgCwAAAKQEHgAAYNCBnwQBAjAEA4UMAAAApAQeAABg0IGfBAECMAQDDg0AAAAwAwKXHwAAAOIDIgBvBCMAMAQD4iAAAABvBCQAMAQD5iEAAAAwAwJuJQAAAIwDCgAwAwL3JgAAAIwDAAAwAwK5JwAAAKkDAAAwAwJNKAAAAIwDCgAwAwJAKQAAAG8DKgAwAwK8KwAAAKkDAQAwAwJ5LAAAAIwDAAAwAwIkLQAAAKkDAQAwAwJfLgAAAE0EAeMvAAAATQMEVjAAAAAwAwKWMQAAAIwD/v8wAwLoMgAAAKkDAQAwAwIyMwAAAKkDAQAwAwJ2NAAAAIwDAAAwAwLXNQAAAIICAgA2AwEEAAAAQAMCAwMDBAQAAEBAAwUDBgMHAwgDCQMKAwsDDAUGCAkKCwwNAw0FAQ8DDgMPAxAFAxESEwdmZqY/AADAPwAAwL8AAAAABwAAAAAAAAAAAAAAAAAAAAADEQMSBABgcIEHZmamP5qZmT8AAMC/AAAAAAfNzMy+AAAAAAAAAAAAAAAAB83MzD4AAAAAAAAAAAAAAAADEwQAYNCBAxQDFQMWBQIgIQIAAOAtuG3gQQIAAIBUjuXfQQMXAxgDGQMaAxsCmpmZmZmZuT8DHAMdAx4DHwMgAyEDIgMjAyQDJQMmAAEAARgAAQAAAAAAAQAAAAAAAAEAAQEBAQAAAQAAAQAAAAAA/QD/AAcBAQAAAQAAAQAA/QD/AAgAAAEAAAIAAAAAAQAAAADsABYBAAABAAD+AAQAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAEAAAAAAAEAAAEAAAEAAAEAAAIBAAAAAAAnHTeExzVG7xXZXRD4VBgapPvZWGvx5KlaeNoPaL3vbdSOP92CtLed

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Resource.Settings)
local v3 = {}
local v4 = {}
local v5 = {
	["Springs"] = {
		["ItemOffset"] = Vector3.new(1.3, 1.5, -1.5),
		["ItemRotation"] = Vector3.new(0, 0, 0),
		["NeckRotation"] = Vector3.new()
	}
}
v4.Hip = v5
local v6 = {
	["Springs"] = {
		["ItemOffset"] = Vector3.new(1.3, 1.2, -1.5),
		["ItemRotation"] = Vector3.new(-0.4, 0, 0),
		["NeckRotation"] = Vector3.new(0.4, 0, 0)
	}
}
v4.Raise = v6
v4.LeftElbowAngle = 0
v4.RightElbowAngle = 0
v4.LeftWristRotation = CFrame.new()
v4.RightWristRotation = CFrame.new()
v3.Motion = v4
v3.Sound = {
	["explosion_large_02"] = 2205008239,
	["gun_pistol_dry_fire_01"] = 2140551506
}
v3.MagSize = 10
v3.AmmoCurrent = 0
v3.FireAuto = false
v3.FireFreq = 10
v3.ReloadTime = 0.1
v3.Consumable = true
v3.Price = 0
v3.DoNotFillOnPurchase = true
v3.ImageId = v2.Images.C4
v3.SortOrderPage = -2
v3.CustomShootRemote = true
v3.CustomDamageRemote = true
v3.EquipTime = 0
return v3
