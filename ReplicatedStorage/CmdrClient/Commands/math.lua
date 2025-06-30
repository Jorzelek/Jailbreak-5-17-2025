-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYB1BlcmZvcm0JQ2xpZW50UnVuBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cAhBdXRvRXhlYwRBcmdzBG1hdGglUGVyZm9ybSBhIG1hdGggb3BlcmF0aW9uIG9uIDIgdmFsdWVzLgtEZWZhdWx0VXRpbElhbGlhcyAiK3xQZXJmb3JtIGFuIGFkZGl0aW9uLiIgbWF0aCArICQxe251bWJlcnxOdW1iZXJ9ICQye251bWJlcnxOdW1iZXJ9S2FsaWFzICItfFBlcmZvcm0gYSBzdWJ0cmFjdGlvbi4iIG1hdGggLSAkMXtudW1iZXJ8TnVtYmVyfSAkMntudW1iZXJ8TnVtYmVyfU5hbGlhcyAiKnxQZXJmb3JtIGEgbXVsdGlwbGljYXRpb24uIiBtYXRoICogJDF7bnVtYmVyfE51bWJlcn0gJDJ7bnVtYmVyfE51bWJlcn1IYWxpYXMgIi98UGVyZm9ybSBhIGRpdmlzaW9uLiIgbWF0aCAvICQxe251bWJlcnxOdW1iZXJ9ICQye251bWJlcnxOdW1iZXJ9UWFsaWFzICIqKnxQZXJmb3JtIGFuIGV4cG9uZW50aWF0aW9uLiIgbWF0aCAqKiAkMXtudW1iZXJ8TnVtYmVyfSAkMntudW1iZXJ8TnVtYmVyfUdhbGlhcyAiJXxQZXJmb3JtIGEgbW9kdWx1cy4iIG1hdGggJSAkMXtudW1iZXJ8TnVtYmVyfSAkMntudW1iZXJ8TnVtYmVyfQRUeXBlDG1hdGhPcGVyYXRvcglPcGVyYXRpb24RQSBtYXRoIG9wZXJhdGlvbi4GbnVtYmVyBVZhbHVlD0EgbnVtYmVyIHZhbHVlLgACBwQAAAAABk0EAVwAAAAAUgUCAFIGAwCfBAMAggQAAAEDAQAgAgEYAAAAAAAAIQAAAAAIAAABAgBDowAAAOIABwBvAQgAMAEAugAAAAD/AQAAAAAAADABACcBAAAAbwEJADABAOICAAAAbwEKADABAMQDAAAA/wEAAAYAAABvAgsAbwMMAG8EDQBvBQ4AbwYPAG8HEADFAQIHAQAAADABAH0EAAAA/wEAAAMAAADiAhIAbwMTADADAhERAAAAbwMUADADAroAAAAAbwMVADADAuICAAAA4gMSAG8EFgAwBAMREQAAAG8EFwAwBAO6AAAAAG8EGAAwBAPiAgAAAOIEEgBvBRYAMAUEEREAAABvBRcAMAUEugAAAABvBRgAMAUE4gIAAADFAQIEAQAAADABANsFAAAAwAEZADABADMGAAAAggACABoDAwMEAwUDBgMHAwgDAgUHAAECAwQFBgMJAwoDCwMMAw0DDgMPAxADEQMSBQMRAAIDEwMUAxUDFgMXAxgGAAEAAQABGAAAAQAAAQAAAAEAAAEAAAEAAQEBAQEBAAD6AAgAAQEAAAEAAAEAAAIBAAABAAABAAACAQAAAQAAAQAAAADyABIAAAABAAAAAAEbkWinJ4dwYylVAjMSoM1DGqbkEUD8gOf4ieThVjCoZuT/2HBUCago

-- Decompiled by Krnl

local v4 = {
	["Name"] = "math",
	["Aliases"] = {},
	["Description"] = "Perform a math operation on 2 values.",
	["Group"] = "DefaultUtil",
	["AutoExec"] = {
		"alias \"+|Perform an addition.\" math + $1{number|Number} $2{number|Number}",
		"alias \"-|Perform a subtraction.\" math - $1{number|Number} $2{number|Number}",
		"alias \"*|Perform a multiplication.\" math * $1{number|Number} $2{number|Number}",
		"alias \"/|Perform a division.\" math / $1{number|Number} $2{number|Number}",
		"alias \"**|Perform an exponentiation.\" math ** $1{number|Number} $2{number|Number}",
		"alias \"%|Perform a modulus.\" math % $1{number|Number} $2{number|Number}"
	},
	["Args"] = {
		{
			["Type"] = "mathOperator",
			["Name"] = "Operation",
			["Description"] = "A math operation."
		},
		{
			["Type"] = "number",
			["Name"] = "Value",
			["Description"] = "A number value."
		},
		{
			["Type"] = "number",
			["Name"] = "Value",
			["Description"] = "A number value."
		}
	},
	["ClientRun"] = function(_, p1, p2, p3)
		return p1.Perform(p2, p3)
	end
}
return v4
