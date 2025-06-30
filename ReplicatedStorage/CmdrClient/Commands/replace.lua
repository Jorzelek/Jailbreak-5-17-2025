-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Bytecode (Base64):
-- BgMYBGdzdWIDUnVuBE5hbWUHQWxpYXNlcwtEZXNjcmlwdGlvbgVHcm91cAhBdXRvRXhlYwRBcmdzB3JlcGxhY2UCLy8bUmVwbGFjZXMgdGV4dCBBIHdpdGggdGV4dCBCC0RlZmF1bHRVdGlsfWFsaWFzICJtYXB8TWFwcyBhIENTViBpbnRvIGFub3RoZXIgQ1NWIiByZXBsYWNlICQxe3N0cmluZ3xDU1Z9IChbXixdKykgIiQye3N0cmluZ3xtYXBwZWQgdmFsdWV8VXNlICUxIHRvIGluc2VydCB0aGUgZWxlbWVudH0iYWFsaWFzICJqb2lufEpvaW5zIGEgQ1NWIHdpdGggYSBzcGVjaWZpZWQgZGVsaW1pdGVyIiByZXBsYWNlICQxe3N0cmluZ3xDU1Z9ICwgJDJ7c3RyaW5nfERlbGltaXRlcn0EVHlwZQZzdHJpbmcISGF5c3RhY2s0VGhlIHNvdXJjZSBzdHJpbmcgdXBvbiB3aGljaCB0byBwZXJmb3JtIHJlcGxhY2VtZW50LgZOZWVkbGUeVGhlIHN0cmluZyBwYXR0ZXJuIHNlYXJjaCBmb3IuB0RlZmF1bHQLUmVwbGFjZW1lbnQ1VGhlIHN0cmluZyB0byByZXBsYWNlIG1hdGNoZXMgKCUxIHRvIGluc2VydCBtYXRjaGVzKS4AAAIIBAAAAAAGUgYCAFIHAwC8BAHMAAAAAJ8EBACCBAAAAQMBAB0CARgAAAAAAAAeAAAAAAYAAAECAEajAAAA4gAHAG8BCAAwAQC6AAAAAP8BAAACAAAAbwIJAG8DCgDFAQIDAQAAADABACcBAAAAbwELADABAOICAAAAbwEMADABAMQDAAAA/wEAAAIAAABvAg0AbwMOAMUBAgMBAAAAMAEAfQQAAAD/AQAAAwAAAOICEABvAxEAMAMCEQ8AAABvAxIAMAMCugAAAABvAxMAMAMC4gIAAADiAxAAbwQRADAEAxEPAAAAbwQUADAEA7oAAAAAbwQVADAEA+ICAAAA4gQXAG8FEQAwBQQRDwAAAG8FGAAwBQS6AAAAAG8FGQAwBQTiAgAAAG8FGgAwBQQ6FgAAAMUBAgQBAAAAMAEA2wUAAADAARsAMAEAFgYAAACCAAIAHAMDAwQDBQMGAwcDCAMCBQcAAQIDBAUGAwkDAQMKAwsDDAMNAw4DDwUDDwACAxADEQMSAxMDFAMVBQQPAAIWAxYDFwMYBgABAAEAARgAAAEAAAEAAAAAAAAAAQAAAQAAAQABAQAA/gAEAAEBAAABAAABAAACAQAAAQAAAQAAAgEAAAEAAAEAAAEAAAAA8QATAAAAAQAAAAABWxHjjhlU49Bp1YkacqaJPsMEsPZFaiPOyMsy0FYMMrXglmgDJ8D9Ow==

-- Decompiled by Krnl

local v4 = {
	["Name"] = "replace",
	["Aliases"] = { "gsub", "//" },
	["Description"] = "Replaces text A with text B",
	["Group"] = "DefaultUtil",
	["AutoExec"] = { "alias \"map|Maps a CSV into another CSV\" replace $1{string|CSV} ([^,]+) \"$2{string|mapped value|Use %1 to insert the element}\"", "alias \"join|Joins a CSV with a specified delimiter\" replace $1{string|CSV} , $2{string|Delimiter}" },
	["Args"] = {
		{
			["Type"] = "string",
			["Name"] = "Haystack",
			["Description"] = "The source string upon which to perform replacement."
		},
		{
			["Type"] = "string",
			["Name"] = "Needle",
			["Description"] = "The string pattern search for."
		},
		{
			["Type"] = "string",
			["Name"] = "Replacement",
			["Description"] = "The string to replace matches (%1 to insert matches).",
			["Default"] = ""
		}
	},
	["Run"] = function(_, p1, p2, p3)
		return p1:gsub(p2, p3)
	end
}
return v4
