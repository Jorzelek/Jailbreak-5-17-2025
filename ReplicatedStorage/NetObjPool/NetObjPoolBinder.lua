-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTA25ldwxzZXRtZXRhdGFibGUGR2V0QWxsCkdldFBvb2xPYmoDb2JqCUdldEFjdGl2ZQVlcnJvch5Ob3RoaW5nIGV4aXN0cyBpbiB0aGlzIHBvb2wuLi4DR2V0BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQdyZXF1aXJlA1N0ZApCYXNlT2JqZWN0BkJpbmRlcgpOZXRPYmpQb29sFE5ldE9ialBvb2xJdGVtQmluZGVyB19faW5kZXgAAwUBAgAAAA37AgAATQEC7wAAAABSAgAAnwECAvsEAQCePQEEBAAAAFIDAQCkAgIAAAAQQJ8CAwGCAQIAAwMBAwIEAAAQQAALAQEYAAAAAAABAAAAAAAAAgwAAAAACQEBAAAAHMYBAAD7AgAAvAIC0AAAAACfAgIEZAIOALwHBkEBAAAAnwcCAk0IABMCAAAAmgcIAAgAAAC8BwZFAwAAAJ8HAgIqBwMAAQAAgFIBBgBlAAIAbgLx/wIAAAArAQQApAIFAAAAQEBvAwYAnwICAYIBAgAHAwMDBAMFAwYDBwQAAEBAAwgAEQkBGAABAAAAAAEAAAAAAAAAAAAAAAEB/QAKAQAAAAISAAAAAAgAAAECADajAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAwChBgAAAE0CA0sHAAAAnwECAqQCBQAAAEBATQQAoQYAAABNAwR/CAAAAJ8CAgKkAwUAAABAQE0FAIwJAAAATQQFmgoAAACfAwIC/wQDAAAAAAAwBARuCwAAAJ49BAUBAAAAUgYEAFIHAQCkBQ0AAADAQJ8FAwHABQ4AEgABABIABAAwBQTvDwAAAMAFEAASAAMAMAUEfxEAAABNBQLvDwAAAG8GCQBSBwQAnwUDAIIFAAASAwoEAAAAQAMLAwwDDQQAAEBAAw4DDwMQAxEDEgMTAwIEAADAQAYAAwEGAQMJAgABAQABGAAAAAAAAAABAAAAAAAAAQAAAAAAAAIAAAAAAAACAAEAAQAAAAAAAAIAAAAABgAAABIAAAAAAAEAAAAAAlEI35qQUHX3Y8y1DrzmBEEqyRsFEWOijmR0nmrOgZNzuVFOMic30rI=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.BaseObject)
local v3 = require(v1.Std.Binder)
local v_u_4 = require(v1.NetObjPool.NetObjPoolItemBinder)
local v_u_5 = {}
v_u_5.__index = v_u_5
setmetatable(v_u_5, v_u_2)
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local v7 = v_u_2.new(p6)
	local v8 = v_u_5
	setmetatable(v7, v8)
	return v7
end
function v_u_5.Get(p9)
	-- upvalues: (copy) v_u_4
	local v10 = nil
	for _, v11 in v_u_4:GetAll() do
		if v11:GetPoolObj() == p9.obj and v11:GetActive() == true then
			v10 = v11
			break
		end
	end
	if not v10 then
		error("Nothing exists in this pool...")
	end
	return v10
end
return v3.new("NetObjPool", v_u_5)
