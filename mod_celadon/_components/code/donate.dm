/datum/donator
	var/key
	var/donator_tier = 0
	// Используется для "Динамического Списка"
	var/list/DONATOR_GHOST_LIST

/datum/donator/New(client/owner)
	..()
	src.key = owner.key
	load_vip_tiers()

/datum/donator/proc/load_vip_tiers()
	var/donators_text = file2text("[global.config.directory]/donators.txt")
	if (!donators_text)
		return

	var/regex/donators_regex = new(@"^(?!#)(.+?)\s*=\s*(\d+)$", "gm")
	while (donators_regex.Find(donators_text))
		if (donators_regex.group[1] == src.ckey || donators_regex.group[1] == src.key)
			donator_tier = text2num(donators_regex.group[2])
			if (donator_tier >= 1 || check_rights_for(src, R_ADMIN))
				LAZYADD(DONATOR_GHOST_LIST, VIP_GHOST_TIER1_LIST)
			if (donator_tier >= 3 || check_rights_for(src, R_ADMIN))
				LAZYADD(DONATOR_GHOST_LIST, VIP_GHOST_TIER3_LIST)

// MARK: New Buttons
/mob/dead/observer/verb/ChangerGhost()
	set category = "Ghost.VIP"
	set name = "Change Ghost"
	set desc = "Изменяет внешний вид вашего призрака."
	if(client.donator.donator_tier <= 0 && !check_rights_for(client, R_ADMIN))
		to_chat(usr, "<span class='warning'>Увы. Данная функция доступна только для тех, кто поддержал проект. (Tier1)</span>")
		return

	if(check_rights_for(client, R_ADMIN))
		if(!client.donator.DONATOR_GHOST_LIST)
			LAZYADD(client.donator.DONATOR_GHOST_LIST, VIP_GHOST_TIER1_LIST)
			LAZYADD(client.donator.DONATOR_GHOST_LIST, VIP_GHOST_TIER3_LIST)
	var/ghost_type = tgui_input_list(usr, "Какого призрака ты хочешь выбрать?", "Изменение призрака", client.donator.DONATOR_GHOST_LIST, 30 SECONDS)
	if(!ghost_type)
		return
	icon = 'mod_celadon/_storge_icons/icons/assets/vip/ghost.dmi'
	icon_state = ghost_type

/mob/dead/observer/verb/ChangerColorGhost()
	set category = "Ghost.VIP"
	set name = "Change Ghost Color"
	set desc = "Изменяет цвет вашего призрака."
	if(client.donator.donator_tier <= 1 && !check_rights_for(client, R_ADMIN))
		to_chat(usr, "<span class='warning'>Увы. Данная функция доступна только для тех, кто поддержал проект. (Tier2)</span>")
		return

	var pick_color = input(usr, "Light color", text("Input")) as color|null
	color = pick_color

// MARK: Donate Loadout
/datum/preferences
	var/max_loadout_items

/datum/preferences/New(client/C)
	..()
	max_loadout_items = CONFIG_GET(number/max_loadout_items) // Standart - 10 points
	spawn()
		if(C.donator.donator_tier >= 2 || check_rights_for(C, R_ADMIN))
			max_loadout_items += 3 // Tier 2 - 13 points
		if(C.donator.donator_tier >= 3 || check_rights_for(C, R_ADMIN))
			max_loadout_items += 2 // Tier 3 - 15 points
