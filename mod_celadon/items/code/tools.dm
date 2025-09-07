/obj/item/storage/belt/utility/chief/full/PopulateContents()
	new /obj/item/weldingtool/electric(src)
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src,MAXCOIL,pick("red","yellow","orange"))
	new /obj/item/extinguisher/mini(src)
	new /obj/item/analyzer(src)

/obj/item/storage/belt/utility/full/ert/PopulateContents()
	new /obj/item/weldingtool/electric(src)
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/multitool(src)
	new /obj/item/construction/rcd/combat(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/stack/cable_coil(src)

// MARK: Repair Kit

/obj/item/gun_maint_kit
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/items_and_weapons.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'
	icon_state = "repair_kit"
	wear_reduction = 100
	uses = 5

/obj/item/gun_maint_kit/small
	name = "firearm maintenance small kit"
	desc = "A minimal firearm maintenance kit with 15 uses, specifically designed for lubricating moving parts."
	icon_state = "repair_kit_small"
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron = 375)
	wear_reduction = 25
	uses = 15

// Добавляем дополнительный прок лишь для изменения времени использования набора. Безусловно должен быть способ сделать это компактнее.
/obj/item/gun_maint_kit/small/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(!uses)
		to_chat(user, span_warning("[src] is out of uses!"))
		return
	var/obj/item/gun/ballistic/fixable = target
	if(!istype(fixable))
		return
	if(!fixable.gun_wear)
		to_chat(user, span_notice("[fixable] is already in good condition!"))
		return
	if(fixable.safety)
		to_chat(user, span_notice("The safety of [fixable] is locking its mechanisms, and needs to be disabled for cleaning.")) //notice that you are PLAYING WITH FIRE.
		return
	fixable.add_overlay(GLOB.cleaning_bubbles)
	playsound(src, 'sound/misc/slip.ogg', 15, TRUE, -8)
	user.visible_message(span_notice("[user] starts to wipe down [fixable] with [src]!"), span_notice("You start to give [fixable] a deep clean with [src]..."))
	if(!do_after(user, 5 SECONDS, target = target, extra_checks = CALLBACK(fixable, TYPE_PROC_REF(/obj/item/gun/ballistic, accidents_happen), user)))
		fixable.cut_overlay(GLOB.cleaning_bubbles)
		return
	fixable.cut_overlay(GLOB.cleaning_bubbles)
	fixable.wash(CLEAN_SCRUB)
	fixable.adjust_wear(-wear_reduction)
	user.visible_message(span_notice("[user] finishes cleaning [fixable]!"), span_notice("You finish cleaning [fixable], [fixable.gun_wear < wear_reduction ? "and it's in pretty good condition" : "though it would benefit from another cycle"]."))
	uses--

// MARK: Shuttle Expansion

/obj/item/areaeditor/shuttle/disposable
	name = "Shuttle Expansion Disposable Permit"
	desc = "A disposable set of documents used to expand flyable shuttles."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/permit.dmi'
	icon_state = "permit"

/obj/item/areaeditor/shuttle/proc/check_disposable(mob/creator)
	spawn(1)
	del src
	creator.update_appearance()

// OMNITOOLS

// MARK: Трикодер
/obj/item/multitool/tricorder
	name = "tricorder"
	desc = "A multifunctional device that can perform a wide range of tasks."
	icon_state = "tricorder"
	item_state = "tricorder"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'
	usesound = 'sound/weapons/etherealhit.ogg'
	custom_materials = list(/datum/material/iron = 500, /datum/material/silver = 300, /datum/material/gold = 300)
	item_flags = NOBLUDGEON
	tool_behaviour = TOOL_MULTITOOL
	toolspeed = 0.2
	var/ranged_scan_distance = 1
	var/medicalTricorder = FALSE	//Set to TRUE for normal medical scanner, set to FALSE for a gutted version

/obj/item/multitool/tricorder/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(mode > 0 && !istype(target, /mob/living))
		return
	if(istype(target, /turf/closed/))
		return
	user.changeNext_move(CLICK_CD_RANGE)
	if(target in view(ranged_scan_distance, get_turf(user)))
		switch(mode)
			if(0)
				atmosanalyzer_scan(user, (target.return_analyzable_air() ? target : get_turf(target)))
				playsound(get_turf(user), 'sound/effects/pop.ogg', 50)
			if(1)
				healthscan(user, target, advanced = TRUE)
				playsound(src, 'sound/effects/fastbeep.ogg', 10)
				if(!proximity_flag)
					target.Beam(user, icon_state = "medbeam", time = 5, beam_color = "#9ce")
			if(2)
				chemscan(user, target)
				playsound(src, 'sound/effects/fastbeep.ogg', 10)
				if(!proximity_flag)
					target.Beam(user, icon_state = "medbeam", time = 5, beam_color = "#9ce")

// MARK: Дебаг-Аутфит
/obj/item/multitool/tricorder/ranged
	name = "long-range tricorder"
	desc = "A multifunctional device that can perform a wide range of tasks. A hand-held long-range environmental scanner which reports current gas levels."
	icon_state = "tricorder_ranged"
	item_state = "tricorder_ranged"
	medicalTricorder = TRUE
	ranged_scan_distance = 15
	var/modes = "atmos"

/obj/item/multitool/tricorder/ranged/Initialize()
	. = ..()
	update_appearance(UPDATE_ICON)

/obj/item/multitool/tricorder/ranged/examine()
	. = ..()
	. += span_notice("The mode is: [modes] scan")

/obj/item/multitool/tricorder/ranged/attack_self(mob/user)
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
	update_appearance(UPDATE_ICON)

/obj/item/multitool/tricorder/ranged/update_overlays()
	. = ..()
	if(modes)
		switch(mode)
			if(0)
				. += "atmos_overlay"
			if(1)
				. += "health_overlay"
			if(2)
				. += "chem_overlay"

/obj/item/construction/rcd/arcd/debug
	max_matter = INFINITY
	matter = INFINITY
	upgrade = RCD_UPGRADE_FRAMES | RCD_UPGRADE_SIMPLE_CIRCUITS
	delay_mod = 0.3

/obj/item/inducer/adv
	icon_state = "inducer-adv"
	item_state = "inducer-adv"
	desc = "A tool for inductively charging internal power cells. This one has a white-bluespace color scheme, and seems to be rigged to transfer charge at a much faster rate."
	cell_type = null
	powertransfer = 4000
	cell_type = /obj/item/stock_parts/cell/bluespace

// MARK: Респрайты

/obj/item/multitool
	//icon_state = "multitool"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'
	//lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	//righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'

/obj/item/inducer
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'

/obj/item/construction/rcd/arcd
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'

/obj/item/construction/plumbing
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'

/obj/item/stack/cable_coil
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'

// MARK: Газ Анализатор

/obj/item/analyzer/ranged
	name = "long-range gas analyzer"
	desc = "A hand-held long-range environmental scanner which reports current gas levels."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'
	icon_state = "analyzer_ranged"
	custom_materials = list(/datum/material/iron = 400, /datum/material/glass = 1000, /datum/material/gold = 200)
	var/ranged_scan_distance = 15

/obj/item/analyzer/ranged/afterattack(atom/target, mob/user, proximity_flag)
	. = ..()
	if(!(target in view(ranged_scan_distance, get_turf(user))))
		return
	if(istype(target, /turf/closed/))
		return
	user.changeNext_move(CLICK_CD_RANGE)
	playsound(get_turf(user), 'sound/effects/pop.ogg', 50)
	atmosanalyzer_scan(user=user, target=get_turf(src), silent=FALSE)
	flick("[icon_state]_act", src)

// MARK: Мед-Сканер

/obj/item/healthanalyzer/ranged
	name = "long-range health analyzer"
	desc = "A handheld body scanner capable of accurately detecting the patient's vital signs from a distance."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'
	icon_state = "ranged_analyzer"
	item_state = "ranged_analyzer"
	healthmode = "ranged_analyzer"
	reagentmode = "ranged_reagent_analyzer"
	healthmodeinhand = "ranged_analyzer"
	reagentmodeinhand = "ranged_reagent_analyzer"
	ranged_scan_distance = 15
	custom_premium_price = 1000

/obj/item/healthanalyzer/advanced
	ranged_scan_distance = 15

/obj/item/healthanalyzer/afterattack(mob/living/M, mob/living/carbon/human/user, adjacent, params)
	. = ..()
	if(adjacent || !istype(M))
		return ..()
	if(can_see(user, M, ranged_scan_distance))
		user.changeNext_move(CLICK_CD_RANGE)
		M.Beam(user, icon_state = "medbeam", time = 5, beam_color = "#9ce")
		attack(M, user)
		return

// MARK: Bluespace-RPD

#define BSRPD_CAPAC_MAX 50
#define BSRPD_CAPAC_USE 1
#define BSRPD_CAPAC_NEW 5

/obj/item/pipe_dispenser/bluespace
	name = "Bluespace-RPD"
	desc = "A breakthrough in pipe-laying technology prevents you from being burned to a crisp while building yet another engine."
	icon_state = "rpd_ranged"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/tools.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/tools_righthand.dmi'
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
		return ..()

	if(bs_capac < bs_use)
		to_chat(user, span_warning("[src] has no charge."))
		return FALSE

	user.changeNext_move(CLICK_CD_RANGE)
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
