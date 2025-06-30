-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(script.Parent.InventoryItemSystem)
local v_u_3 = require(v1.Std.waitForChild)
local v_u_4 = require(v1.Std.Promise)
local v_u_5 = require(v1.Std.Maid)
local v_u_6 = require(v1.Std.RxInstanceUtils)
local v_u_7 = require(v1.Std.Binder.BinderUtils)
local v_u_8 = require(script.Parent.InventoryConsts)
local v_u_9 = require(script.Parent.InventoryBinder)
return {
	["init"] = function()
		-- upvalues: (copy) v_u_9, (copy) v_u_2
		v_u_9:Start()
		v_u_2.init()
	end,
	["getFor"] = function(p10)
		-- upvalues: (copy) v_u_8, (copy) v_u_9
		local v11 = p10:FindFirstChild(v_u_8.CURRENT_INVENTORY_VALUE_NAME)
		if v11 then
			if v11.Value then
				return v_u_9:Get(v11.Value)
			end
		end
	end,
	["promiseFor"] = function(p12)
		-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9
		return v_u_3(p12, v_u_8.CURRENT_INVENTORY_VALUE_NAME):andThen(function(p_u_13)
			-- upvalues: (ref) v_u_5, (ref) v_u_4, (ref) v_u_6, (ref) v_u_7, (ref) v_u_9
			local v_u_14 = v_u_5.new()
			local v18 = v_u_4.new(function(p_u_15, p_u_16)
				-- upvalues: (copy) v_u_14, (ref) v_u_6, (copy) p_u_13, (ref) v_u_7, (ref) v_u_9
				v_u_14:GiveTask(v_u_6.observeProperty(p_u_13, "Value", function(p17)
					-- upvalues: (copy) p_u_15, (ref) v_u_7, (ref) v_u_9, (copy) p_u_16
					if p17 then
						p_u_15(v_u_7.promiseBoundClass(v_u_9, p17))
					else
						p_u_16()
					end
				end))
			end)
			v18:finally(function()
				-- upvalues: (copy) v_u_14
				v_u_14:Destroy()
			end)
			return v18
		end)
	end
}
