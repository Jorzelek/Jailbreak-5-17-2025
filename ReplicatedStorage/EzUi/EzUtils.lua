-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- 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

-- Decompiled by Krnl

local v_u_1 = game:GetService("GamepadService")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = workspace.CurrentCamera
return {
	["rotatedLine"] = function(p5, p6, p7, p8, p9)
		local v10 = (p5 + p7) * 0.5
		local v11 = (p6 + p8) * 0.5
		local v12 = p7 - p5
		local v13 = p8 - p6
		local v14 = v13 * v13 * p9 * p9 + v12 * v12
		local v15 = math.sqrt(v14)
		local v16 = v13 * p9
		return v10, v11, v15, math.atan2(v16, v12)
	end,
	["isSmallScreen"] = function()
		-- upvalues: (copy) v_u_4
		local v17 = v_u_4.ViewportSize.X
		local v18 = v_u_4.ViewportSize.y
		return math.min(v17, v18) <= 500
	end,
	["shouldHaveTouchControls"] = function()
		-- upvalues: (copy) v_u_3
		return v_u_3.TouchEnabled
	end,
	["getViewportSizeChangedSignal"] = function()
		return workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")
	end,
	["selectIfGamepad"] = function(p19)
		-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
		if v_u_2.AutoSelectGuiEnabled then
			v_u_1:EnableGamepadCursor(p19)
		elseif v_u_3:GetLastInputType() == Enum.UserInputType.Gamepad1 then
			v_u_2.SelectedObject = p19
		end
	end,
	["isGuiAncestryVisible"] = function(p20)
		while not p20:IsA("GuiObject") or p20.Visible do
			if p20:IsA("ScreenGui") and not p20.Enabled then
				return false
			end
			p20 = p20.Parent
			if not p20 then
				return true
			end
		end
		return false
	end
}
