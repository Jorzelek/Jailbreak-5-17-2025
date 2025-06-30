-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Std.BaseObject)
local v3 = require(v1.Std.Binder)
local v_u_4 = require(v1.Std.Signal)
local v_u_5 = require(v1.Std.RxInstanceUtils)
require(v1.Std.Maid)
local v_u_6 = {}
v_u_6.__index = v_u_6
setmetatable(v_u_6, v_u_2)
function v_u_6.new(p_u_7)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v_u_8 = v_u_2.new(p_u_7)
	local v9 = v_u_6
	setmetatable(v_u_8, v9)
	v_u_8.Name = p_u_7.Name
	v_u_8._onCharacterChanged = v_u_4.new()
	local function v11()
		-- upvalues: (copy) p_u_7, (copy) v_u_8, (ref) v_u_5
		if p_u_7.Value then
			v_u_8.maid.observeChar = v_u_5.observeProperty(p_u_7.Value, "PrimaryPart", function(p10)
				-- upvalues: (ref) v_u_8, (ref) p_u_7
				task.wait()
				if p10 then
					v_u_8.Character = p_u_7.Value
				else
					v_u_8.Character = nil
				end
				v_u_8._onCharacterChanged:Fire(v_u_8.Character)
			end)
		end
	end
	if p_u_7.Value then
		v_u_8.maid.observeChar = v_u_5.observeProperty(p_u_7.Value, "PrimaryPart", function(p12)
			-- upvalues: (copy) v_u_8, (copy) p_u_7
			task.wait()
			if p12 then
				v_u_8.Character = p_u_7.Value
			else
				v_u_8.Character = nil
			end
			v_u_8._onCharacterChanged:Fire(v_u_8.Character)
		end)
	end
	v_u_8.maid:GiveTask(p_u_7.Changed:Connect(v11))
	return v_u_8
end
function v_u_6.GetAttribute(p13, p14)
	return p13["attr" .. tostring(p14)]
end
function v_u_6.SetAttribute(p15, p16, p17)
	p15["attr" .. tostring(p16)] = p17
end
return v3.new("InventoryItemOwner", v_u_6)
