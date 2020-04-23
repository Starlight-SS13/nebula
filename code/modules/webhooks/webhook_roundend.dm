/decl/webhook/roundend
	id = WEBHOOK_ROUNDEND

// Data expects three numerical fields: "survivors", "escaped", "ghosts", "clients"
/decl/webhook/roundend/get_message(var/list/data)
	. = ..()
	var/desc = "A round of **[SSticker.mode ? SSticker.mode.name : "Unknown"]** has ended.\n\n"
	if(data)
		var/s_escaped =  "Escaped"
		if(!SSevac.evacuation_controller.emergency_evacuation)
			s_escaped = "Transferred"
		if(data["survivors"] > 0)
			desc += "Survivors: **[data["survivors"]]**\n"
			desc += "[s_escaped]: **[data["escaped"]]**\n"
		else
			desc += "There were **no survivors**.\n\n"
		desc += "Ghosts: **[data["ghosts"]]**\n"
		desc += "Players: **[data["clients"]]**\n"
		desc += "Round duration: **[roundduration2text()]**"

	.["embeds"] = list(list(
		"title" = "Round [game_id] is ending.",
		"description" = desc,
		"color" = COLOR_WEBHOOK_DEFAULT
	))
