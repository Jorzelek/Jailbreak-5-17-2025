local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Std.Signal)
local TableUtils = require(ReplicatedStorage.Std.TableUtils)
local ActionButtonService = {}
ActionButtonService.triggerUpdate = Signal.new(),
ActionButtonService.active = {},
ActionButtonService.enabled = true,
function ActionButtonService.add(p_u_4)
	table.insert(ActionButtonService.active, p_u_4)
	ActionButtonService.triggerUpdate:Fire()
	return function()
		local v6 = table.find(ActionButtonService.active, p_u_4)
		if not v6 then
			error("Could not find ActionButton, already removed?")
		end
		table.remove(ActionButtonService.active, v6)
		if p_u_4._pressed then
			p_u_4._pressed = nil
			if p_u_4.onReleased then
				p_u_4.onReleased()
			end
		end
		ActionButtonService.triggerUpdate:Fire()
	end
end,
function ActionButtonService.pushHide()
	-- upvalues: (copy) ActionButtonService
	ActionButtonService.enabled = false
	ActionButtonService.triggerUpdate:Fire()
	return function()
		-- upvalues: (ref) ActionButtonService
		ActionButtonService.enabled = true
		ActionButtonService.triggerUpdate:Fire()
	end
end,
function ActionButtonService.hide()
	-- upvalues: (copy) ActionButtonService
	ActionButtonService.enabled = false
	ActionButtonService.triggerUpdate:Fire()
end,
function ActionButtonService.show()
	-- upvalues: (copy) ActionButtonService
	ActionButtonService.enabled = true
	ActionButtonService.triggerUpdate:Fire()
end,
function ActionButtonService.setButtonPrimary(p7, p8)
	-- upvalues: (copy) ActionButtonService
	p7.primary = p8
	ActionButtonService.triggerUpdate:Fire()
end,
function ActionButtonService.setButtonPriority(p9, p10)
	-- upvalues: (copy) ActionButtonService
	p9.priority = p10
	ActionButtonService.triggerUpdate:Fire()
end,
function ctionButtonService.setButtonEnabled(p11, p12)
	-- upvalues: (copy) ActionButtonService
	p11.disabled = not p12
	if p11._pressed then
		p11._pressed = nil
		if p11.onReleased then
			p11.onReleased()
		end
	end
	ActionButtonService.triggerUpdate:Fire()
end,
function ActionButtonService.getDataInner()
	-- upvalues: (copy) TableUtils, (copy) ActionButtonService
	local v15 = TableUtils.filter(ActionButtonService.active, function(p13)
		local v14 = not p13.disabled
		if v14 then
			v14 = p13.primary
		end
		return v14
	end)
	table.sort(v15, function(p16, p17)
		return (p16.priority or 1) > (p17.priority or 1)
	end)
	return v15
end,
function ActionButtonService.getDataOuter()
	-- upvalues: (copy) TableUtils, (copy) ActionButtonService
	local v20 = TableUtils.filter(ActionButtonService.active, function(p18)
		local v19 = not p18.disabled
		if v19 then
			v19 = not p18.primary
		end
		return v19
	end)
	table.sort(v20, function(p21, p22)
		return (p21.priority or 1) > (p22.priority or 1)
	end)
	return v20
end
return ActionButtonService
