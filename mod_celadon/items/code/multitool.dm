
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

/*	// Оставленая фишка для суицида если вдруг вернутся в билд
/obj/item/multitool/tricorder/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] пробует провести глубокий анализ себя!"))
	return BRUTELOSS
*/

/obj/item/multitool/tricorder/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(mode > 0 && !istype(target, /mob/living))
		return
	if(istype(target, /turf/closed/))
		return
	if(can_see(user, target, ranged_scan_distance))
		switch(mode)
			if(0)
				atmosanalyzer_scan(user, (target.return_analyzable_air() ? target : get_turf(target)))
			if(1)
				healthscan(user, target, advanced = TRUE)
			if(2)
				chemscan(user, target)
		playsound(src, mode ? 'sound/effects/fastbeep.ogg' : 'sound/effects/pop.ogg', 50)

// Дебаговский трикодер
/obj/item/multitool/tricorder/debug
	name = "long-range tricorder"
	desc = "A multifunctional device that can perform a wide range of tasks. A hand-held long-range environmental scanner which reports current gas levels."
	icon_state = "tricorder_atmos"
	medicalTricorder = TRUE
	ranged_scan_distance = 15
	var/modes = "atmos"

/obj/item/multitool/tricorder/debug/examine()
	. = ..()
	. += span_notice("The mode is: [modes] scan")

/obj/item/multitool/tricorder/debug/attack_self(mob/user)
	mode++
	switch(mode)
		if(1)
			modes = "health"
		if(2)
			modes = "chem"
		if(3)
			mode = 0
			modes = "atmos"

	playsound(get_turf(user), 'sound/machines/click.ogg', 50, TRUE)
	balloon_alert(user, "[modes] scan")
	icon_state = "tricorder_[modes]"

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
	custom_materials = list(/datum/material/iron = 400, /datum/material/glass = 1000, /datum/material/gold = 200)
	var/ranged_scan_distance = 15

/obj/item/analyzer/ranged/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!can_see(user, target, ranged_scan_distance))
		return
	atmosanalyzer_scan(user=user, target=get_turf(src), silent=FALSE)

/obj/item/healthanalyzer/range
	name = "long-range health analyzer"
	desc = "A handheld body scanner capable of accurately detecting the patient's vital signs from a distance."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'
	icon_state = "rangeanalyzer"
	item_state = "rangeanalyzer"
	healthmode = "rangeanalyzer"
	reagentmode = "rangereagentanalyzer"
	healthmodeinhand = "rangeanalyzer"
	reagentmodeinhand = "rangereagentanalyzer"
	works_from_distance = TRUE
	custom_premium_price = 1000

/obj/item/healthanalyzer/advanced
	works_from_distance = TRUE

/obj/item/healthanalyzer/afterattack(mob/living/M, mob/living/carbon/human/user, adjacent, params)
	. = ..()
	if(adjacent || !istype(M))
		return ..()
	if(works_from_distance)
		M.Beam(user, icon_state = "medbeam", time = 5, beam_color = "#9ce")
		attack(M, user)
		return
	return ..()
