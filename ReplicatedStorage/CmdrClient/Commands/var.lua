-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMUCXZhcnNfdXNlZAhHZXRTdG9yZQlDbGllbnRSdW4ETmFtZQdBbGlhc2VzC0Rlc2NyaXB0aW9uBUdyb3VwCEF1dG9FeGVjBEFyZ3MDdmFyF0dldHMgYSBzdG9yZWQgdmFyaWFibGUuC0RlZmF1bHRVdGlsVmFsaWFzICJpbml0LWVkaXR8RWRpdCB5b3VyIGluaXRpYWxpemF0aW9uIHNjcmlwdCIgZWRpdCAke3ZhciBpbml0fSBcXAogJiYgdmFyPSBpbml0IHx8bGFsaWFzICJpbml0LWVkaXQtZ2xvYmFsfEVkaXQgdGhlIGluaXRpYWxpemF0aW9uIHNjcmlwdCBmb3IgYWxsIHVzZXJzIiBlZGl0ICR7dmFyICRpbml0fSBcXAogJiYgdmFyPSAkaW5pdCB8fGxhbGlhcyAiaW5pdC1ydW58UmUtcnVucyB0aGUgaW5pdGlhbGl6YXRpb24gc2NyaXB0IG1hbnVhbGx5LiIgcnVuLWxpbmVzICR7dmFyIGluaXR9ICYmIHJ1bi1saW5lcyAke3ZhciAkaW5pdH0IaW5pdC1ydW4EVHlwZQlzdG9yZWRLZXkDS2V5rwFUaGUga2V5IHRvIGdldCwgcmV0cmlldmVkIGZyb20geW91ciB1c2VyIGRhdGEgc3RvcmUuIEtleXMgcHJlZml4ZWQgd2l0aCAuIGFyZSBub3Qgc2F2ZWQuIEtleXMgcHJlZml4ZWQgd2l0aCAkIGFyZSBnYW1lLXdpZGUuIEtleXMgcHJlZml4ZWQgd2l0aCAkLiBhcmUgZ2FtZS13aWRlIGFuZCBub24tc2F2ZWQuAAIFAgAAAAAHbwQAALwCAFUBAAAAnwIDAqkDAQBqAwIBggABAAIDAQMCABQDARgAAAAAAAABFQAAAAAGAAABAgAtowAAAOIABwBvAQgAMAEAugAAAAD/AQAAAAAAADABACcBAAAAbwEJADABAOICAAAAbwEKADABAMQDAAAA/wEAAAQAAABvAgsAbwMMAG8EDQBvBQ4AxQECBQEAAAAwAQB9BAAAAP8BAAABAAAA4gIQAG8DEQAwAwIRDwAAAG8DEgAwAwK6AAAAAG8DEwAwAwLiAgAAAMUBAgIBAAAAMAEA2wUAAADAARQAMAEAMwYAAACCAAIAFQMEAwUDBgMHAwgDCQMDBQcAAQIDBAUGAwoDCwMMAw0DDgMPAxADEQUDDwACAxIDEwMUBgABAAEAARgAAAEAAAEAAAABAAABAAABAAEBAQEAAPwABgABAQAAAQAAAQAAAAD8AAgAAAABAAAAAAFAA58ozRq9VnLH9bxs16U0CTBQl/BBU7C163QMrdXQlP1sx4OcEjlk

-- Decompiled by Krnl

local v3 = {
	["Name"] = "var",
	["Aliases"] = {},
	["Description"] = "Gets a stored variable.",
	["Group"] = "DefaultUtil",
	["AutoExec"] = {
		"alias \"init-edit|Edit your initialization script\" edit ${var init} \\\\\n && var= init ||",
		"alias \"init-edit-global|Edit the initialization script for all users\" edit ${var $init} \\\\\n && var= $init ||",
		"alias \"init-run|Re-runs the initialization script manually.\" run-lines ${var init} && run-lines ${var $init}",
		"init-run"
	},
	["Args"] = {
		{
			["Type"] = "storedKey",
			["Name"] = "Key",
			["Description"] = "The key to get, retrieved from your user data store. Keys prefixed with . are not saved. Keys prefixed with $ are game-wide. Keys prefixed with $. are game-wide and non-saved."
		}
	},
	["ClientRun"] = function(p1, p2)
		p1:GetStore("vars_used")[p2] = true
	end
}
return v3
