#define BATON_BASH_COOLDOWN (3 SECONDS)
/*
 * [CELADON-OVERRIDE] - Файл глоабльно изменен, ID-мода для поиска: BALLISTIC_SHIELD
 * Причина: Переработка механики щитов (https://github.com/CeladonSS13/Shiptest/pull/1901)
 */

/obj/item/shield
	name = "shield"
	icon = 'icons/obj/shields.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	block_cooldown_time = 0 SECONDS
	slot_flags = ITEM_SLOT_BACK
	force = 10
	item_flags = SLOWS_WHILE_IN_HAND
	slowdown = 0	// [CELADON-REMOVE] - BALLISTIC_SHIELD - Rebalance
	integrity_failure = 0.1
	block_chance = 50
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("shoved", "bashed")
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 70)
	uses_integrity = TRUE
	/// makes beam projectiles pass through the shield
	var/transparent = FALSE
	/// threshold where armor piercing works
	var/ap_threshold = 20
	/// if the shield will break by sustaining damage
	var/breakable_by_damage = TRUE
	/// baton bash cooldown
	COOLDOWN_DECLARE(baton_bash)
	/// is shield bashable?
	var/is_bashable = TRUE
	/// sound when a shield is bashed
	var/shield_bash_sound = 'sound/effects/shieldbash.ogg'
	var/recoil_bonus = -2
	var/broken = FALSE
	/// material used to repair
	var/obj/item/stack/sheet/repair_material = /obj/item/stack/sheet/plasteel
	/// whether or not it is repairable
	var/is_repairable = TRUE

// [CELADON-ADD] - Флаг на включение сломаных щитов из модов - BALLISTIC_SHIELD - Extended Edition
	var/broken_shield = FALSE
	var/spread_bonus = 0
	var/braking_sound = 'sound/effects/glassbr3.ogg'
	var/braking_alert = "cracks!"
// [/CELADON-ADD]

/obj/item/shield/proc/on_block(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", damage = 0, attack_type = MELEE_ATTACK, damage_type)
// [CELADON-ADD] - BALLISTIC_SHIELD - Rebalance - Щиты не должны ломаться лол
	if(damage_type != BRUTE && damage_type != BURN)
		return FALSE
// [/CELADON-ADD]
	take_damage(damage)

/obj/item/shield/atom_break(damage_flag)
	. = ..()
	if(!broken)
		if(isliving(loc))
// [CELADON-ADD] - BALLISTIC_SHIELD - Extended Edition
			//loc.balloon_alert(loc, "[src] cracks!") // [CELADON-EDIT]
			loc.balloon_alert(loc, "[src] [braking_alert]")
			var/mob/living/user = loc
			user.dropItemToGround(src, force = TRUE)
		playsound(src, braking_sound, 100)
		if(broken_shield)
			icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields.dmi'
			icon_state = "[src::icon_state]_broken"
// [/CELADON-ADD]
		name = "broken [src::name]"
		block_chance = 0
		slowdown = 0
		broken = TRUE

/obj/item/shield/examine(mob/user)
	. = ..()
	var/healthpercent = round((atom_integrity/max_integrity) * 100, 1)
	switch(healthpercent)
		if(50 to 99)
			. += span_info("It looks slightly damaged.")
		if(25 to 50)
			. += span_info("It appears heavily damaged.")
		if(0 to 25)
			. += span_warning("It's falling apart!")

/obj/item/shield/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(transparent && (hitby.pass_flags & PASSGLASS))
		return FALSE
// [CELADON-ADD] - BALLISTIC_SHIELD - Rebalance - Щиты не должны блокировать лежа
	if(damage_type == STAMINA)
		return FALSE
	if(attack_type == MARTIAL_ARTS)
		return FALSE
	if(isprojectile(hitby))
		var/obj/projectile/bullet = hitby
		if(!defense_check(get_turf(owner), get_turf(bullet?.fired_from), owner?.dir))
			return FALSE
	else if(!defense_check(get_turf(owner), get_turf(hitby), owner?.dir))
		return FALSE
	if(owner.body_position == LYING_DOWN)
		final_block_chance -= 30
// [/CELADON-ADD]
	if(!(REVERSE_DIR(hitby.dir) & owner.dir))
		return FALSE
	if(attack_type == THROWN_PROJECTILE_ATTACK)
		final_block_chance += 30
	if(attack_type == LEAP_ATTACK)
		final_block_chance = 100
	if(isobj(hitby))
		var/obj/pointy = hitby
		//9mm 10-30 - ap thresh = -40
		//57 10+20 - ap thresh  = 10
		//5556 12.5+30 - ap thresh = 22.5
		//6.5 20+80 - ap thresh = 80
		var/chance_to_pen = (damage*0.5 + pointy.armour_penetration*1.5) - ap_threshold
		if(prob(chance_to_pen))
			take_damage(armour_penetration, damage_type)
			to_chat(owner, span_boldwarning("Your shield is penetrated by [hitby]!"))
			return FALSE
	. = ..()
	if(. && !broken)
		on_block(owner, hitby, attack_text, damage, attack_type, damage_type)

// [CELADON-ADD] - BALLISTIC_SHIELD - Rebalance
/obj/item/shield/proc/defense_check(turf/aloc, turf/bloc, mobdir)
	. = TRUE
	var/dx = aloc.x - bloc.x
	var/dy = aloc.y - bloc.y

	switch(mobdir)
		if(NORTH)
			if(abs(dx) <= dy * 2)
				. = FALSE
		if(SOUTH)
			if(abs(dx) <= dy * -2)
				. = FALSE
		if(EAST)
			if(abs(dy) <= dx * 2)
				. = FALSE
		if(WEST)
			if(abs(dy) <= dx * -2)
				. = FALSE
	return

/obj/item/shield/riot
	name = "ballistic shield"
	desc = "A shield adept at blocking blunt objects and bullets from connecting with the torso of the shield wielder. Use 10 plasteel to repair."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/shields_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/shields_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields_back.dmi'
	icon_state = "ballistic"

	force = 15
	max_integrity = 400
	block_chance = 60
	recoil_bonus = -3
	spread_bonus = -3
	slowdown = 0.5

	custom_materials = list(/datum/material/iron=8500)
	material_flags = MATERIAL_NO_EFFECTS
	broken_shield = TRUE
// [/CELADON-ADD]

/obj/item/shield/proc/repair(attacking_item, obj/item/stack/sheet, user)
	if (istype(attacking_item, repair_material))
		if (atom_integrity >= max_integrity)
			to_chat(user, span_warning("[src] is already in perfect condition."))
		else
			while(atom_integrity < max_integrity)
				var/obj/item/stack/sheet/material_used = attacking_item
				if(material_used.get_amount() < 10)
					to_chat(user, span_notice("You do not have enough [material_used] to repair!"))
					return
				if(!do_after(user, 3 SECONDS, target= src))  // [CELADON-EDIT] - SECONDS, WHY NOT USE SECONDS ?
					return
				material_used.use(10)
//	[CELADON-ADD] - BALLISTIC_SHIELD - Extended Edition
				if(broken_shield)
					if(istype(src, /obj/item/shield/tele))
						icon_state = "teleriot1"
					else
						icon_state = initial(icon_state)
//	[/CELADON-ADD]
				update_integrity(max_integrity)
				to_chat(user, span_notice("You repair [src] with [material_used]."))
				name = src::name
				broken = FALSE
				block_chance = initial(block_chance)
				slowdown = initial(slowdown)
	else
		to_chat(user, span_warning("[src] isn't made of this material!"))

/obj/item/shield/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, /obj/item/melee))
		if(COOLDOWN_FINISHED(src, baton_bash))
			user.visible_message(span_warning("[user] bashes [src] with [attacking_item]!"))
			playsound(src, shield_bash_sound, 50, TRUE)
			COOLDOWN_START(src, baton_bash, BATON_BASH_COOLDOWN)
	else if(istype(attacking_item, /obj/item/stack/sheet))
		if(is_repairable == TRUE)
			repair(attacking_item, /obj/item/stack/sheet, user)
		else
			to_chat(user, span_warning("[src] cannot be repaired!"))

// [CELADON-ADD] - BALLISTIC_SHIELD - Extended Edition
/obj/item/shield/riot/spike
	name = "spike shield"
	desc = "A ballistic shield adept at blocking blunt objects and bullets, adorned with a vicious spike. Use 10 plasteel to repair"
	icon_state = "spike"
	force = 24
	attack_verb = list("stabbed", "gashed")
	hitsound = 'sound/weapons/bladeslice.ogg'
// [/CELADON-ADD]

// [CELADON-EDIT] - BALLISTIC_SHIELD - Extended Edition
/obj/item/shield/riot/roman
	name = "\improper Roman shield"
	desc = "Bears an inscription on the inside: <i>\"Romanes venio domus\"</i>."
	icon_state = "roman_shield"
	item_state = "roman_shield"
	transparent = FALSE
	custom_materials = list(/datum/material/iron=8500)
	max_integrity = 65
	broken_shield = FALSE

/obj/item/shield/riot/roman/fake
	desc = "Bears an inscription on the inside: <i>\"Romanes venio domus\"</i>. It appears to be a bit flimsy."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 30
	block_chance = 0
	recoil_bonus = 0 //it's PLASTIC
	spread_bonus = 0
	slowdown = 0
// [/CELADON-ADD]

/obj/item/shield/buckler
	name = "wooden buckler"
	desc = "A medieval wooden buckler."
	icon = 'icons/obj/shields.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	icon_state = "buckler"
	item_state = "buckler"
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 10)
	resistance_flags = FLAMMABLE
	transparent = FALSE

	max_integrity = 55
	block_chance = 25
	recoil_bonus = 0
	spread_bonus = 0
	slowdown = 0

	integrity_failure = 0.2
	w_class = WEIGHT_CLASS_NORMAL
	repair_material = /obj/item/stack/sheet/mineral/wood
	var/shield_break_leftover = /obj/item/stack/sheet/mineral/wood
	var/shield_break_sound = 'sound/effects/bang.ogg'
	broken_shield = FALSE

/obj/item/shield/buckler/atom_destruction(damage_flag)
	playsound(src, shield_break_sound, 50)
	new shield_break_leftover(get_turf(src))
	if(isliving(loc))
		loc.balloon_alert(loc, "shield broken!")
	return ..()

// [CELADON-ADD] - RETURN-LEGACY-SHIELD
/obj/item/shield/riot/flash
	name = "strobe shield"
	desc = "A shield with a built in, high intensity light capable of blinding and disorienting suspects. Takes regular handheld flashes as bulbs. Use 10 plasteel to repair."
	icon_state = "flashshield"
	item_state = "flashshield"
	var/obj/item/assembly/flash/handheld/embedded_flash

/obj/item/shield/riot/flash/Initialize()
	. = ..()
	embedded_flash = new(src)

/obj/item/shield/riot/flash/ComponentInitialize()
	. = .. ()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/shield/riot/flash/attack(mob/living/M, mob/user)
	. =  embedded_flash.attack(M, user)
	update_appearance()

/obj/item/shield/riot/flash/attack_self(mob/living/carbon/user)
	. = embedded_flash.attack_self(user)
	update_appearance()

/obj/item/shield/riot/flash/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	. = ..()
	if (. && !embedded_flash.burnt_out)
		embedded_flash.activate()
		update_appearance()

/obj/item/shield/riot/flash/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/assembly/flash/handheld))
		var/obj/item/assembly/flash/handheld/flash = W
		if(flash.burnt_out)
			to_chat(user, span_warning("No sense replacing it with a broken bulb!"))
			return
		else
			to_chat(user, span_notice("You begin to replace the bulb..."))
			if(do_after(user, 2 SECONDS, target = user))	//if(do_after(user, 20, target = user)) // [CELADON-EDIT] - ORIGIRAL
				if(flash.burnt_out || !flash || QDELETED(flash))
					return
				playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
				qdel(embedded_flash)
				embedded_flash = flash
				flash.forceMove(src)
				update_appearance()
				return
	..()

/obj/item/shield/riot/flash/emp_act(severity)
	. = ..()
	embedded_flash.emp_act(severity)
	update_appearance()

/obj/item/shield/riot/flash/update_icon_state()
	if(!embedded_flash || embedded_flash.burnt_out)
		icon_state = "ballistic"
		item_state = "ballistic"
	else
		icon_state = "flashshield"
		item_state = "flashshield"
	return ..()

/obj/item/shield/riot/flash/examine(mob/user)
	. = ..()
	if (embedded_flash?.burnt_out)
		. += span_info("The mounted bulb has burnt out. You can try replacing it with a new one.")
// [/CELADON-ADD]

/obj/item/shield/energy
	name = "energy combat shield"
	desc = "A shield that reflects almost all energy projectiles, but is useless against physical attacks. It can be retracted, expanded, and stored anywhere."
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("shoved", "bashed")
	throw_range = 5
	force = 3
	throwforce = 3
	throw_speed = 3
	base_icon_state = "eshield" // [base_icon_state]1 for expanded, [base_icon_state]0 for contracted
	breakable_by_damage = FALSE
	is_repairable = FALSE
	var/on_force = 10
	var/on_throwforce = 8
	var/on_throw_speed = 2
	var/active = 0
	var/clumsy_check = TRUE

/obj/item/shield/energy/Initialize()
	. = ..()
	icon_state = "[base_icon_state]0"

/obj/item/shield/energy/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	return 0

/obj/item/shield/energy/IsReflect()
	return (active)

/obj/item/shield/energy/attack_self(mob/living/carbon/human/user)
	if(clumsy_check && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, span_userdanger("You beat yourself in the head with [src]!"))
		user.take_bodypart_damage(5)
	active = !active
	icon_state = "[base_icon_state][active]"

	if(active)
		force = on_force
		throwforce = on_throwforce
		throw_speed = on_throw_speed
		w_class = WEIGHT_CLASS_BULKY
		playsound(user, 'sound/weapons/saberon.ogg', 35, TRUE)
		to_chat(user, span_notice("[src] is now active."))
	else
		force = initial(force)
		throwforce = initial(throwforce)
		throw_speed = initial(throw_speed)
		w_class = WEIGHT_CLASS_TINY
		playsound(user, 'sound/weapons/saberoff.ogg', 35, TRUE)
		to_chat(user, span_notice("[src] can now be concealed."))
	add_fingerprint(user)

// [CELADON-EDIT] - BALLISTIC_SHIELD - Extended Edition
/obj/item/shield/tele
	name = "telescopic shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage. Use 10 plasteel to repair."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/shields_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/shields_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields_back.dmi'
	icon_state = "teleriot0"
	custom_materials = list(/datum/material/iron = 3600, /datum/material/glass = 3600, /datum/material/silver = 270, /datum/material/titanium = 180)
	slot_flags = null
	force = 3
	throwforce = 3
	throw_speed = 3
	throw_range = 4

	max_integrity = 300
	block_chance = 50
	recoil_bonus = -2
	spread_bonus = -2
	slowdown = 0.3

	//repair_material = /obj/item/stack/sheet/rglass
	w_class = WEIGHT_CLASS_NORMAL
	var/active = 0
	broken_shield = TRUE
// [/CELADON-ADD] - FULL-EDIT

/obj/item/shield/tele/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(active)
		return ..()
	return 0

/obj/item/shield/tele/attack_self(mob/living/user)
	if(broken)	// [CELADON-ADD] - BALLISTIC_SHIELD - Extended Edition - Сломаный щит нельзя сложить
		return
	active = !active
	icon_state = "teleriot[active]"
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)

	if(active)
		force = 8
		throwforce = 5
		throw_speed = 2
		w_class = WEIGHT_CLASS_BULKY
		slot_flags = ITEM_SLOT_BACK
		to_chat(user, span_notice("You extend \the [src]."))
	else
		force = 3
		throwforce = 3
		throw_speed = 3
		w_class = WEIGHT_CLASS_NORMAL
		slot_flags = null
		to_chat(user, span_notice("[src] can now be concealed."))
	add_fingerprint(user)

// [CELADON-ADD] - BALLISTIC_SHIELD - Rebalance
/obj/item/shield/goliath
	name = "Goliath shield"
	desc = "A shield made from interwoven plates of goliath hide."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/shields_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/weapons/shields_righthand.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/weapons/shields_back.dmi'
	icon_state = "goliath_shield"
	custom_materials = list()
	transparent = FALSE

	max_integrity = 70
	block_chance = 25
	recoil_bonus = 0
	spread_bonus = 0
	slowdown = 0

	w_class = WEIGHT_CLASS_BULKY
// [/CELADON-ADD]

// [CELADON-EDIT]
/obj/item/shield/heavy
	name = "heavy ballistic shield"
	desc = "A heavy shield designed to keep everything behind it safe from any due harm. Use 10 plasteel to repair."
	icon = 'icons/obj/shields.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	mob_overlay_icon = 'icons/mob/clothing/back.dmi'
	icon_state = "heavy"

	// It's a heavy shield. So it'll obviously weigh more, but it can certainly take more of a beating; as well as dish out some
	force = 10
	throwforce = 10
	throw_range = 2
	ap_threshold = 30

	max_integrity = 500
	block_chance = 60
	recoil_bonus = -4
	spread_bonus = 8
	slowdown = 1.5

	armor = list("melee" = 70, "bullet" = 70, "laser" = 70, "energy" = 0, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	var/wielded = FALSE
// [/CELADON-EDIT]

/obj/item/shield/heavy/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_wield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_unwield))

/obj/item/shield/heavy/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 10, force_wielded = 20)

/// triggered on wield of two handed item
/obj/item/shield/heavy/proc/on_wield(obj/item/source, mob/user)
	slowdown = 2
	wielded = TRUE
	INVOKE_ASYNC(src, PROC_REF(do_wield), user)

/obj/item/shield/heavy/proc/do_wield(mob/user)
	if(!broken)
		if(do_after(user, 1.5 SECONDS, user, IGNORE_USER_LOC_CHANGE | IGNORE_TARGET_LOC_CHANGE, TRUE,
		CALLBACK(src, PROC_REF(is_wielded))))
			block_chance = 80

/// triggered on unwield of two handed item
/obj/item/shield/heavy/proc/on_unwield(obj/item/source, mob/user)
	SIGNAL_HANDLER
	wielded = FALSE
	if(!broken)
		block_chance = initial(block_chance)
		slowdown = initial(slowdown)

/obj/item/shield/heavy/proc/is_wielded()
	return wielded

#undef BATON_BASH_COOLDOWN
