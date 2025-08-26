
/obj/item/multitool
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/multitool/tricorder
	name = "tricorder"
	desc = "A multifunctional device that can perform a wide range of tasks."
	icon_state = "tricorder"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/multitool_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/multitool_righthand.dmi'
	item_flags = NOBLUDGEON
	tool_behaviour = TOOL_MULTITOOL
	usesound = 'sound/weapons/etherealhit.ogg'
	toolspeed = 0.2
	var/ranged_scan_distance = 1

	custom_materials = list(/datum/material/iron = 500, /datum/material/silver = 300, /datum/material/gold = 300)

	var/medicalTricorder = FALSE	//Set to TRUE for normal medical scanner, set to FALSE for a gutted version

/*
/obj/item/multitool/tricorder/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] пробует провести глубокий анализ себя!"))
	return BRUTELOSS
*/

/obj/item/multitool/tricorder/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(can_see(user, target, ranged_scan_distance))
		switch(mode)
			if(0)
				atmosanalyzer_scan(user, (target.return_analyzable_air() ? target : get_turf(target)))
			if(1)
				healthscan(user, target, advanced = TRUE)
			if(2)
				chemscan(user, target)
	var/sound_to_play = (mode == 0) ? 'sound/effects/pop.ogg' : 'sound/effects/fastbeep.ogg'
	playsound(src, sound_to_play, 10)

// Дебаговский трикодер
/obj/item/multitool/tricorder/debug
	name = "long-range tricorder"
	desc = "A multifunctional device that can perform a wide range of tasks. A hand-held long-range environmental scanner which reports current gas levels."
	icon_state = "tricorder_atmos"
	medicalTricorder = TRUE
	ranged_scan_distance = 15
	tool_behaviour = "atmos"

/obj/item/multitool/tricorder/debug/examine()
	. = ..()
	. += "The mode is: [tool_behaviour] scan"

/obj/item/multitool/tricorder/debug/attack_self(mob/user)
	mode++
	if(mode > 2)
		mode = 0

	switch(mode)
		if(0)
			tool_behaviour = "atmos"
		if(1)
			tool_behaviour = "health"
		if(2)
			tool_behaviour = "chem"

	playsound(get_turf(user), 'sound/machines/click.ogg', 50, TRUE)
	balloon_alert(user, "mode: [tool_behaviour] scan")
	icon_state = "tricorder_[tool_behaviour]"

/obj/item/construction/rcd/arcd
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/construction/rcd/arcd/debug
	max_matter = INFINITY
	matter = INFINITY
	upgrade = RCD_UPGRADE_FRAMES | RCD_UPGRADE_SIMPLE_CIRCUITS
	delay_mod = 0.3

/obj/item/construction/plumbing
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/inducer
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

/obj/item/analyzer/ranged
	name = "long-range gas analyzer"
	desc = "A hand-held long-range environmental scanner which reports current gas levels."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'
	icon_state = "analyzerranged"
	custom_materials = list(/datum/material/iron = 400, /datum/material/glass = 1000, /datum/material/gold = 200, /datum/material/plastic = 200)
	var/ranged_scan_distance = 15

/obj/item/analyzer/ranged/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!can_see(user, target, ranged_scan_distance))
		return
	atmosanalyzer_scan(user=user, target=get_turf(src), silent=FALSE)
