-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMSCmdldE1vZHVsZXMKY3JlYXRlUGxhbgdydW5QbGFuA3J1bgdyZXF1aXJlBnNjcmlwdAtFeHBlY3RhdGlvbg1UZXN0Qm9vdHN0cmFwCFRlc3RFbnVtCFRlc3RQbGFuC1Rlc3RQbGFubmVyC1Rlc3RSZXN1bHRzClRlc3RSdW5uZXILVGVzdFNlc3Npb24JUmVwb3J0ZXJzDFRleHRSZXBvcnRlchFUZXh0UmVwb3J0ZXJRdWlldBBUZWFtQ2l0eVJlcG9ydGVyAAIHAgMAAAAT+wIAAFIEAAC8AgJrAAAAAJ8CAwL7BAEATQMEEAEAAABSBAIAnwMCAvsFAgBNBAV1AgAAAFIFAwCfBAICUgUBAFIGBACfBQIBggABAAMDAQMCAwMADQQBGAAAAAAAAQAAAAABAAAAAAIAAAEOAAAAAA4AAAECAHWjAAAApAABAAAAAECkAgMAAAAgQE0BAv8EAAAAnwACAqQBAQAAAABApAMDAAAAIEBNAgN3BQAAAJ8BAgKkAgEAAAAAQKQEAwAAACBATQMEvgYAAACfAgICpAMBAAAAAECkBQMAAAAgQE0EBfsHAAAAnwMCAqQEAQAAAABApAYDAAAAIEBNBQbiCAAAAJ8EAgKkBQEAAAAAQKQHAwAAACBATQYH+QkAAACfBQICpAYBAAAAAECkCAMAAAAgQE0HCL8KAAAAnwYCAqQHAQAAAABApAkDAAAAIEBNCAnYCwAAAJ8HAgKkCAEAAAAAQKQLAwAAACBATQoLmgwAAABNCQrYDQAAAJ8IAgKkCQEAAAAAQKQMAwAAACBATQsMmgwAAABNCgsdDgAAAJ8JAgKkCgEAAAAAQKQNAwAAACBATQwNmgwAAABNCwxoDwAAAJ8KAgLACxAAEgABABIABAASAAYA4gwSADALDDYRAAAAMAAM/wQAAAAwAQx3BQAAADACDL4GAAAAMAMM+wcAAAAwBAziCAAAADAFDPkJAAAAMAYMvwoAAAAwBwzYCwAAAOINEwAwCA3YDQAAADAJDR0OAAAAMAoNaA8AAAAwDQyaDAAAAIIMAgAUAwUEAAAAQAMGBAAAIEADBwMIAwkDCgMLAwwDDQMOAw8DEAMRAxIGAAMEBQoRBAUGBwgJCgsMBQMNDg8BAAEAARgAAAAAAAAAAAEAAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAQAAAAAAAAEAAAAAAAABAAAAAAAAAAABAAAAAAAAAAABAAAAAAAAAAACAAAACAEAAgABAAEAAQABAAEAAQABAAIBAAEAAQD9AAcBAAAAAAGG3tTPy+IQILQavluoOS6kagFYjQUN2Axjidonr9g6j1bv5t23dQTI

-- Decompiled by Krnl

local v1 = require(script.Expectation)
local v_u_2 = require(script.TestBootstrap)
local v3 = require(script.TestEnum)
local v4 = require(script.TestPlan)
local v_u_5 = require(script.TestPlanner)
local v6 = require(script.TestResults)
local v_u_7 = require(script.TestRunner)
local v12 = {
	["run"] = function(p8, p9)
		-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_7
		local v10 = v_u_2:getModules(p8)
		local v11 = v_u_5.createPlan(v10)
		p9((v_u_7.runPlan(v11)))
	end,
	["Expectation"] = v1,
	["TestBootstrap"] = v_u_2,
	["TestEnum"] = v3,
	["TestPlan"] = v4,
	["TestPlanner"] = v_u_5,
	["TestResults"] = v6,
	["TestRunner"] = v_u_7,
	["TestSession"] = require(script.TestSession),
	["Reporters"] = {
		["TextReporter"] = require(script.Reporters.TextReporter),
		["TextReporterQuiet"] = require(script.Reporters.TextReporterQuiet),
		["TeamCityReporter"] = require(script.Reporters.TeamCityReporter)
	}
}
return v12
