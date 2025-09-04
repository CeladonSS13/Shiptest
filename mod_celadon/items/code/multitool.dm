// MARK: Tricorder

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

// MARK: Дебаг-Аутфит

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

/obj/item/construction/rcd/arcd/debug
	max_matter = INFINITY
	matter = INFINITY
	upgrade = RCD_UPGRADE_FRAMES | RCD_UPGRADE_SIMPLE_CIRCUITS
	delay_mod = 0.3

/obj/item/inducer/debug
	icon_state = "inducer-adv"
	desc = "A tool for inductively charging internal power cells. This one has a white-bluespace color scheme, and seems to be rigged to transfer charge at a much faster rate."
	cell_type = null
	powertransfer = 4000
	cell_type = /obj/item/stock_parts/cell/bluespace

// MARK: Рескины

/obj/item/multitool
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'


/obj/item/construction/rcd/arcd
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'

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

// MARK: Мед-Сканер

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

/obj/item/analyzer/ranged/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!can_see(user, target, ranged_scan_distance))
		return
	atmosanalyzer_scan(user=user, target=get_turf(src), silent=FALSE)

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

// MARK: Bluespace-RPD

#define BSRPD_CAPAC_MAX 50
#define BSRPD_CAPAC_USE 1
#define BSRPD_CAPAC_NEW 5

/obj/item/pipe_dispenser/bluespace
	name = "Bluespace-RPD"
	desc = "A breakthrough in pipe-laying technology prevents you from being burned to a crisp while building yet another engine."
	icon_state = "rpd_ranged"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/multitool.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	var/bs_capac = BSRPD_CAPAC_MAX
	var/bs_use = BSRPD_CAPAC_USE
	var/bs_prog = 0
	bluespace = TRUE

/obj/item/pipe_dispenser/bluespace/attackby(obj/item/item, mob/user, param)
	if(istype(item, /obj/item/stack/sheet/bluespace_crystal) || istype(item, /obj/item/stack/ore/bluespace_crystal))
		if(BSRPD_CAPAC_NEW > (BSRPD_CAPAC_MAX - bs_capac) || bs_use == 0)
			to_chat(user, span_warning("[src] is at maximum charge capacity!"))
			return
		item.use(1)
		to_chat(user, span_notice("Recharging the bluespace capacitor inside [src]"))
		bs_capac += BSRPD_CAPAC_NEW
		return
	if(istype(item, /obj/item/assembly/signaler/anomaly/bluespace))
		if(bs_use)
			to_chat(user, span_notice("Installing [item] into [src]; now this thing will work much forever!"))
			bs_use = 0
			qdel(item)
		else
			to_chat(user, span_warning("Where to charge [src] more then!"))
		return
	return ..()

/obj/item/pipe_dispenser/bluespace/examine(mob/user)
	. = ..()
	if(user.Adjacent(src))
		. += span_notice("Currently it has [bs_use == 0 ? "INFINITY" : bs_capac / bs_use] of charges.")
		if(bs_use != 0)
			. += span_notice("\nThe bluespace core is not installed.")
	else
		. += "I can't see charge from here."

/obj/item/pipe_dispenser/bluespace/afterattack(atom/A, mob/user, proximity_flag)
	if(!range_check(A, user))
		return FALSE

	if(proximity_flag)
		return try_build_pipe(A, user) ? TRUE : ..()

	if(bs_capac < bs_use)
		to_chat(user, span_warning("[src] has no charge."))
		return FALSE

	user.Beam(A, icon_state = "rped_upgrade", time = 1 SECONDS)

	if(try_build_pipe(A, user))
		bs_capac -= bs_use
		return TRUE

	return FALSE

/obj/item/pipe_dispenser/bluespace/proc/range_check(atom/A, mob/user)
	if(!(A in view(7, get_turf(user))))
		to_chat(user, span_warning("The \'Out of Range\' light on [src] blinks red."))
		return FALSE
	else
		return TRUE

#undef BSRPD_CAPAC_MAX
#undef BSRPD_CAPAC_USE
#undef BSRPD_CAPAC_NEW
