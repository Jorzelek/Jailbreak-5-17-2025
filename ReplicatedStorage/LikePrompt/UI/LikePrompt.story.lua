-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMcB3Zpc2libGUIc2V0U3RhdGUEaW5pdAVwcmludA5jbGlja2VkIGRvbmUuLgtvbkNsaWNrRG9uZQlleHBpcmVkLi4Jb25FeHBpcmVkDGNvdW50ZG93blRpbAVzdGF0ZQl3b3Jrc3BhY2UQR2V0U2VydmVyVGltZU5vdwZyZW5kZXILd2lsbFVubW91bnQHdW5tb3VudAlDb21wb25lbnQDQXBwBmV4dGVuZAdyZXF1aXJlCkxpa2VQcm9tcHQGc2NyaXB0BlBhcmVudAVtb3VudA1jcmVhdGVFbGVtZW50BGdhbWURUmVwbGljYXRlZFN0b3JhZ2UKR2V0U2VydmljZQVSb2FjdAAIBQEAAAAACOIDAQCpBAEAMAQDoAAAAAC8AQAqAgAAAJ8BAwGCAAEAAwMBBQEAAwIACQMBGAABAAD/AAADCgAAAAAEAAEAAAANpAABAAAAAEBvAQIAnwACAfsAAADiAgQAqQMAADADAqADAAAAvAAAKgUAAACfAAMBggABAAYDBAQAAABAAwUDAQUBAwMCABIGARgAAAAAAQABAAD/AAADEwAAAAAEAAEAAAANpAABAAAAAEBvAQIAnwACAfsAAADiAgQAqQMAADADAqADAAAAvAAAKgUAAACfAAMBggABAAYDBAQAAABAAwcDAQUBAwMCABgIARgAAAAAAQABAAD/AAADGQAAAAAHAQIAAAAb+wEAAPsCAQDiAwQATQUAGAUAAABNBAWgAAAAADAEA6AAAAAApAUIAAAAcEC8BQW3CQAAAJ8FAgKVBAUGMAQD8wEAAADZBAAAEgAAADAEA1MCAAAA2QQBABIAAAAwBANhAwAAAJ8BAwCCAQAACgMBAwkDBgMIBQQAAQIDAwoCAAAAAAAANEADCwQAAHBAAwwCAQIODQEYAAAAAQAAAAAAAQAAAAAAAAABAAAABgAAAPcADwAAAAABAQAAAAABggABAAAAIA4BGAAgAAAAAAIAAgAAAAb7AQAATQABEgAAAAD7AQEAnwACAYIAAQABAw8AIwABGAAAAAAAASQAAAAABgECAAAAKfsCAABNAQKIAAAAAG8DAQC8AQGcAgAAAJ8BAwKkAgQAAAAwQKQFBwAAAGBATQQFJAgAAABNAwSGBQAAAJ8CAgLAAwkAMAMBEwoAAADZAwEAEgIBABIAAgAwAwGACwAAAMADDAAwAwE0DQAAAPsEAABNAwTkDgAAAPsFAABNBAXKDwAAAFIFAQCfBAICUgUAAJ8DAwLZBAMAEgIAABIAAwCCBAIAEAMQAxEDEgMTBAAAMEADFAMVBAAAYEADFgYAAwMDDQYEAw4DFwMYBAADBAUGAAEYAAAAAAAAAAEAAAAAAAAAAAEAAAUAAAAAEgAAAgAAAAAAAAAAAAEAAAAHAAAAAAQAAAECABKjAAAApAABAAAAAEBvAgIAvAAAFgMAAACfAAMCpAEFAAAAQEBNAgAhBgAAAJ8BAgJNAgHKBwAAAMADCAASAAEAEgACAIIDAgAJAxkEAAAAQAMaAxsDEwQAAEBAAxwDGAYGAQYBAAEYAAEAAAAAAAEAAAAAAQACAAAAAQAAAAAHtFJXK0QpWYKGlj2/MkCEBR7SV/0cZj884+kDvA5stDyxdzmQnHRGTA==

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Roact)
local v_u_3 = v_u_2.createElement
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = v_u_2.Component:extend("App")
	local v_u_6 = require(script.Parent.LikePrompt)
	function v5.init(p7)
		p7:setState({
			["visible"] = true
		})
	end
	function v5.render(p_u_8)
		-- upvalues: (ref) v_u_3, (copy) v_u_6
		return v_u_3(v_u_6, {
			["visible"] = p_u_8.state.visible,
			["countdownTil"] = workspace:GetServerTimeNow() + 20,
			["onClickDone"] = function()
				-- upvalues: (copy) p_u_8
				print("clicked done..")
				p_u_8:setState({
					["visible"] = false
				})
			end,
			["onExpired"] = function()
				-- upvalues: (copy) p_u_8
				print("expired..")
				p_u_8:setState({
					["visible"] = false
				})
			end
		})
	end
	function v5.willUnmount(_) end
	local v_u_9 = v_u_2.mount(v_u_2.createElement(v5), p4)
	return function()
		-- upvalues: (ref) v_u_2, (copy) v_u_9
		v_u_2.unmount(v_u_9)
	end
end
