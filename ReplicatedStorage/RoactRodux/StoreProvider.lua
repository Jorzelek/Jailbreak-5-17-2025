-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMTBXN0b3JlTkVycm9yIGluaXRpYWxpemluZyBTdG9yZVByb3ZpZGVyLiBFeHBlY3RlZCBhIGBzdG9yZWAgcHJvcCB0byBiZSBhIFJvZHV4IHN0b3JlLg12YWxpZGF0ZVByb3BzBGluaXQNY3JlYXRlRWxlbWVudAhQcm92aWRlcgV2YWx1ZQhvbmVDaGlsZAVwcm9wcwhDaGlsZHJlbgZyZW5kZXIHcmVxdWlyZQZzY3JpcHQGUGFyZW50BVJvYWN0DFN0b3JlQ29udGV4dAlDb21wb25lbnQNU3RvcmVQcm92aWRlcgZleHRlbmQABAQBAAAAAAlNAQB+AAAAAEcBBAAAAACAqQIAAG8DAQCCAgMAqQIBAIICAgACAwEDAgAHAwEYAAABAAEAAAIACAAAAAADAgAAAAAFTQIBfgAAAAAwAgB+AAAAAIIAAQABAwEADwQBGAAAAAABEAAAAAAJAQIAAAAX+wIAAE0BAsoAAAAA+wMBAE0CA2wBAAAA4gMDAE0EAH4EAAAAMAQDzAIAAAD7BQAATQQFBgUAAABNBgAHBgAAAPsIAABNBwjOBwAAAIcFBgefBAIAnwEAAIIBAAAIAwUDBgMHBQECAwEDCAMJAwoAEwsBGAAAAAAAAAABAAAAAQAAAQAAAAAA//4AFAAAAAAFAAABAgAnowAAAKQAAQAAAABApAQDAAAAIEBNAwQkBAAAAE0CAyQEAAAATQECIQUAAACfAAICpAEBAAAAAECkBAMAAAAgQE0DBCQEAAAATQID8QYAAACfAQICTQIAiAcAAABvBAgAvAICnAkAAACfAgMCwAMKADADAvgLAAAAwAMMADADAhMNAAAAwAMOABIAAAASAAEAMAMCgA8AAACCAgIAEAMMBAAAAEADDQQAACBAAw4DDwMQAxEDEgMTBgADAwYBAwQGAgMLAwABAgEAARgAAAAAAAAAAAAAAAACAAAAAAAAAAACAAAAAAACAAAIAAAEAAAAAAgBAAAAAAPk4x3t/945CdYnd3k35o3cKYcG+XCvqwTO/6aEMFPRCUchPl5v9Fue

-- Decompiled by Krnl

local v_u_1 = require(script.Parent.Parent.Roact)
local v_u_2 = require(script.Parent.StoreContext)
local v3 = v_u_1.Component:extend("StoreProvider")
function v3.validateProps(p4)
	if p4.store == nil then
		return false, "Error initializing StoreProvider. Expected a `store` prop to be a Rodux store."
	else
		return true
	end
end
function v3.init(p5, p6)
	p5.store = p6.store
end
function v3.render(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1.createElement(v_u_2.Provider, {
		["value"] = p7.store
	}, v_u_1.oneChild(p7.props[v_u_1.Children]))
end
return v3
