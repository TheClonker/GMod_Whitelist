GMN_WHITELIST = {}

function gmn_whitelist_reload() 
	--print("[GMN] Reload Whitelist")
	local data = file.Read("gmn/whitelist", "DATA") 
	GMN_WHITELIST = string.Explode("\n", data)
	table.remove( GMN_WHITELIST, table.Count(GMN_WHITELIST) ) -- Remove empty last Bit

end
function gmn_whitelist_init()
	timer.Create( "gmn_whitelist_relaoder", 60, 0, gmn_whitelist_reload )
	gmn_whitelist_reload()
end
hook.Add( "Initialize", "gmn_whitelist_init", gmn_whitelist_init )



hook.Add("CheckPassword", "gmn_whitelist_gatekeeper", function(SteamID, IP, ServerPass, UserPass, PlayerName) 
	--print("[GMN Whitelist] Checking User: " .. tostring(PlayerName) .. " with ID: " .. tostring(SteamID))
	if not table.HasValue( GMN_WHITELIST, SteamID ) then 
		print("[GMN Whitelist] User: " .. tostring(PlayerName) .. " (" .. tostring(SteamID) .. ") not on Whitelist!")
		return false, "Um auf diesem Server zu spielen musst du unserer Steam Gruppe 'Gmod Networks' auf Steam beitreten!\nBitte beachte das es bis zu zwei Minuten dauern kann bis unserer System dies bemerkt hat!"
	end
end)