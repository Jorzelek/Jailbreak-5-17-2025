-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMMBWVycm9yK05vIGNhdGVnb3J5IGZ1bmN0aW9uIGV4aXN0cyBvbiBzZXJ2ZXIgZm9yOiAFQXBwbHkEbmV4dAhBcHBseUFsbAZzY3JpcHQLR2V0Q2hpbGRyZW4ETmFtZQdyZXF1aXJlBlBhcmVudAhDYXRlZ29yeQ5GaW5kRmlyc3RDaGlsZAADCwUBAAAAEfsGAACHBQYBRwUHAAAAAICkBgEAAAAAQG8IAgBSCQEAcwcICZ8GAgFSBgUAUgcAAFIIAgBSCQMAUgoEAJ8GBQCCBgAAAwMBBAAAAEADAgALAwEYAAABAAEAAAAAAAIAAAAAAAAMAAAAAA8DAwAAABmkAwEAAAAAQPsEAADGBQAAFwMQAIcIAAb7CgEAhwkKBg4JBABSCgkAUgsBAJ8KAgIOCggA+wsCAE0KCy8CAAAAUgsIAFIMBgBSDQEAUg4CAJ8KBQFuA+//AQAAAKkDAQCCAwIAAwMEBAAAAEADAwASBQEYAAAAAAABAQACAAAAAAEAAAAAAAAA+wAIABMAAAAACwAAAQAAOKMAAAD/AAIAAAAAAP8BAAAAAAAApAIBAAAAAECkAwMAAAAgQLwDA2gEAAAAnwMCAxcCBwBNBwa6BQAAAKQIBwAAAGBAUgkGAJ8IAgJqCAEHbgL4/wIAAAD/AgAAAAAAAKQEAwAAACBATQMEJAgAAABvBQkAvAMDAwoAAACfAwMCvAMDaAQAAACfAwIEZAMHAE0IB7oFAAAApAkHAAAAYEBSCgcAnwkCAmoJAghuA/j/AgAAAMADCwASAAEAMAMALwwAAADAAw0AEgABABIAAgASAAAAMAMAag4AAACCAAIADwMEBAAAAEADBgQAACBAAwcDCAMJBAAAYEADCgMLAwwGAAMDBgEDBQIAAQEAARgAAQABAAEAAAAAAAAAAQAAAAAAAP8AAwABAAAAAAAAAAAAAAABAAAAAAAA/wADAAAABwAAAAAACwEAAAAAAimsyoxcttMOG2igGIQGl7iKHjmsktx+Jvxpk3OwN/SNGhKDvzElLGs=

-- Decompiled by Krnl

local v1 = next
local v2, v3 = script:GetChildren()
local v_u_4 = {}
local v_u_5 = {}
for _, v6 in v1, v2, v3 do
	v_u_4[v6.Name] = require(v6)
end
local v_u_7 = {}
for _, v8 in script.Parent:FindFirstChild("Category"):GetChildren() do
	v_u_7[v8.Name] = require(v8)
end
function v_u_5.Apply(p9, p10, p11, p12, p13)
	-- upvalues: (copy) v_u_4
	local v14 = v_u_4[p10]
	if v14 == nil then
		error("No category function exists on server for: " .. p10)
	end
	return v14(p9, p11, p12, p13)
end
function v_u_5.ApplyAll(p15, p16, p17)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5
	for v18 in next, v_u_4 do
		local v19 = p15[v18]
		local v20 = v_u_7[v18]
		if not v20 or v20(p16) then
			v_u_5.Apply(v19, v18, p16, p17)
		end
	end
	return true
end
return v_u_5
