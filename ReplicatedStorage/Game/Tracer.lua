-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.BaseObject)
local v_u_3 = Instance.new("Part")
v_u_3.Name = "TracerRoot"
v_u_3.Anchored = true
v_u_3.CFrame = CFrame.new(0, 0, 0)
v_u_3.CanCollide = false
v_u_3.Transparency = 1
v_u_3.Parent = workspace
local v_u_4 = Instance.new("Folder")
v_u_4.Name = "TracerLines"
v_u_4.Parent = workspace
local v_u_5 = {}
v_u_5.__index = v_u_5
setmetatable(v_u_5, v_u_2)
function v_u_5.new()
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local v6 = v_u_2.new()
	local v7 = v_u_5
	setmetatable(v6, v7)
	v6:_setup()
	v6:SetColor(Color3.fromRGB(255, 235, 141))
	return v6
end
function v_u_5.SetColor(p8, p9)
	p8.lineHandle.Color3 = p9
end
function v_u_5.SetThickness(p10, p11)
	p10.lineHandle.Thickness = p11
end
function v_u_5._setup(p12)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v13 = Instance.new("LineHandleAdornment")
	v13.Adornee = v_u_3
	v13.Transparency = 0.1
	v13.Thickness = 2
	v13.SizeRelativeOffset = Vector3.new(0, 0, 0)
	v13.Length = 0
	v13.CFrame = CFrame.new()
	v13.Parent = v_u_4
	p12.maid:GiveTask(v13)
	p12.lineHandle = v13
end
function v_u_5.Draw(p14, p15, p16)
	p14.lineHandle.Length = (p16 - p15).Magnitude
	p14.lineHandle.CFrame = CFrame.lookAt(p15, p16)
end
return v_u_5
