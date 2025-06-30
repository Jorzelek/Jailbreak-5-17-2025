-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMJEnRvZ2dsZUdyb3VwVmlzaWJsZQV2YWx1ZQ9zZXRHcm91cFZpc2libGUEZ2FtZRFSZXBsaWNhdGVkU3RvcmFnZQpHZXRTZXJ2aWNlB3JlcXVpcmUFUm9kdXgNY3JlYXRlUmVkdWNlcgADAgEAAAAAAlYBAACCAQIAAAAGAQEYAAAHAAAAAAMCAAAAAANNAgHMAAAAAIICAgABAwIACQMBGAAAAAoAAAAABgAAAQIAGKMAAACkAAEAAAAAQG8CAgC8AAAWAwAAAJ8AAwKkAQUAAABAQE0CAKcGAAAAnwECAk0CAdYHAAAAqQMAAOIECgDABQsAMAUElggAAADABQwAMAUEKwkAAACfAgMAggIAAA0DBAQAAABAAwUDBgMHBAAAQEADCAMJAwEDAwUCCAkGAAYBAgABAQABGAABAAAAAAABAAAAAAIAAAABAAADAAD8AAEAAAAAAuGb9CeaBlg301+es5lgkaOzFEJ7jeB4csoCt++DXfWx3X+mtqU0mvA=

-- Decompiled by Krnl

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Rodux).createReducer(false, {
	["toggleGroupVisible"] = function(p2)
		return not p2
	end,
	["setGroupVisible"] = function(_, p3)
		return p3.value
	end
})
