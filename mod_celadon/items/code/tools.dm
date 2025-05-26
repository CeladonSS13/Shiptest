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
