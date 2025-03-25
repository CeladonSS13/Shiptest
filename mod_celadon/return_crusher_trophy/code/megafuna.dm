

/mob/living/simple_animal/hostile/megafauna/cult_templar // Офы выпилили курсед клэймор
	crusher_loot = list(/obj/item/melee/sword/claymore, /obj/item/clothing/suit/space/hardsuit/cult/enchanted, /obj/item/upgradescroll)

/obj/item/crusher_trophy/ice_block_talisman
	name = "ice block talisman"
	desc = "A glowing trinket that a demonic miner had on him, it seems he couldn't utilize it for whatever reason."
	icon_state = "freeze_cube"
	denied_type = /obj/item/crusher_trophy/ice_block_talisman

/obj/item/crusher_trophy/ice_block_talisman/effect_desc()
	return "waveform collapse to freeze a creature in a block of ice for a period, preventing them from moving"

/obj/item/crusher_trophy/ice_block_talisman/on_mark_detonation(mob/living/target, mob/living/user)
	target.apply_status_effect(/datum/status_effect/ice_block_talisman)

/datum/status_effect/ice_block_talisman
	id = "ice_block_talisman"
	duration = 40
	status_type = STATUS_EFFECT_REFRESH
	alert_type = /atom/movable/screen/alert/status_effect/ice_block_talisman
	/// Stored icon overlay for the hit mob, removed when effect is removed
	var/icon/cube

/atom/movable/screen/alert/status_effect/ice_block_talisman
	name = "Frozen Solid"
	desc = "You're frozen inside an ice cube, and cannot move!"
	icon_state = "frozen"

/datum/status_effect/ice_block_talisman/on_apply()
	RegisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(owner_moved))
	if(!owner.stat)
		to_chat(owner, "<span class='userdanger'>You become frozen in a cube!</span>")
	cube = icon('icons/effects/freeze.dmi', "ice_cube")
	var/icon/size_check = icon(owner.icon, owner.icon_state)
	cube.Scale(size_check.Width(), size_check.Height())
	owner.add_overlay(cube)
	return ..()

/// Blocks movement from the status effect owner
/datum/status_effect/ice_block_talisman/proc/owner_moved()
	return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

/datum/status_effect/ice_block_talisman/on_remove()
	if(!owner.stat)
		to_chat(owner, "<span class='notice'>The cube melts!</span>")
	owner.cut_overlay(cube)
	UnregisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE)

/mob/living/simple_animal/hostile/megafauna
	var/list/crusher_loot

/mob/living/simple_animal/hostile/megafauna/proc/spawn_crusher_loot()
	loot = crusher_loot

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher
	crusher_loot = /obj/item/crusher_trophy/watcher_wing

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/magmawing
	crusher_loot = /obj/item/crusher_trophy/magma_wing
	crusher_drop_mod = 75

/mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing
	crusher_loot = /obj/item/crusher_trophy/ice_wing
	crusher_drop_mod = 75

/mob/living/simple_animal/hostile/asteroid/brimdemon
	crusher_loot = /obj/item/crusher_trophy/brimdemon_fang

/obj/item/crusher_trophy/brimdemon_fang
	name = "brimdemon's fang"
	icon_state = "brimdemon_fang"
	desc = "A fang from a brimdemon's corpse."
	denied_type = /obj/item/crusher_trophy/brimdemon_fang
	var/static/list/comic_phrases = list("BOOM", "BANG", "KABLOW", "KAPOW", "OUCH", "BAM", "KAPOW", "WHAM", "POW", "KABOOM")
	var/static/list/damage_heal_order = list(BRUTE, BURN, OXY)

/obj/item/crusher_trophy/brimdemon_fang/effect_desc()
	return "mark detonation creates audiosensory effects on the target and slightly heals the wielder"

/obj/item/crusher_trophy/brimdemon_fang/on_mark_detonation(mob/living/target, mob/living/user)
	target.balloon_alert_to_viewers("[pick(comic_phrases)]!")
	playsound(target, 'sound/creatures/brimdemon_crush.ogg', 100)
	user.heal_ordered_damage(bonus_value * 0.4, damage_heal_order)

/mob/living/simple_animal/hostile/asteroid/elite/broodmother
	loot_drop = /obj/item/crusher_trophy/broodmother_tongue

// Broodmother's loot: Broodmother Tongue
/obj/item/crusher_trophy/broodmother_tongue
	name = "broodmother tongue"
	desc = "The tongue of a broodmother.  If attached a certain way, makes for a suitable crusher trophy."
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	icon_state = "broodmother_tongue"
	denied_type = /obj/item/crusher_trophy/broodmother_tongue
	bonus_value = 35

/obj/item/crusher_trophy/broodmother_tongue/effect_desc()
	return "waveform collapse to have a <b>[bonus_value]%</b> chance to summon a patch of goliath tentacles at the target's location"

/obj/item/crusher_trophy/broodmother_tongue/on_mark_detonation(mob/living/target, mob/living/user)
	if(rand(1, 100) <= bonus_value && target.stat != DEAD)
		new /obj/effect/temp_visual/goliath_tentacle/broodmother/patch(get_turf(target), user)

/mob/living/simple_animal/hostile/asteroid/elite/legionnaire
	loot_drop = /obj/item/crusher_trophy/legionnaire_spine

/obj/item/crusher_trophy/legionnaire_spine
	name = "legionnaire spine"
	desc = "The spine of a legionnaire.  It almost feels like it's moving..."
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	icon_state = "legionnaire_spine"
	denied_type = /obj/item/crusher_trophy/legionnaire_spine
	bonus_value = 50	//These skulls are a joke, so this bonus value had to be put on steroidal emergency treatment

/obj/item/crusher_trophy/legionnaire_spine/effect_desc()
	return "waveform collapse to have a <b>[bonus_value]%</b> chance to summon a loyal legion skull"

/obj/item/crusher_trophy/legionnaire_spine/on_mark_detonation(mob/living/target, mob/living/user)
	if(!rand(1, 100) <= bonus_value || target.stat == DEAD)
		return
	var/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/A = new /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion(user.loc)
	A.flags_1 |= (flags_1 & ADMIN_SPAWNED_1)
	A.GiveTarget(target)
	A.friends = user
	A.faction = user.faction.Copy()

//Lavaland Goliath
/mob/living/simple_animal/hostile/asteroid/goliath/beast
	crusher_loot = /obj/item/crusher_trophy/goliath_tentacle

/mob/living/simple_animal/hostile/asteroid/goliath/beast/ancient
	crusher_loot = /obj/item/crusher_trophy/elder_tentacle
	crusher_drop_mod = 75

/mob/living/simple_animal/hostile/asteroid/hivelord/spawn_crusher_loot()
	loot += crusher_loot //we don't butcher

//Legion
/mob/living/simple_animal/hostile/asteroid/hivelord/legion
	crusher_loot = /obj/item/crusher_trophy/legion_skull

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf
	crusher_loot = /obj/item/crusher_trophy/dwarf_skull

// Snow Legion
/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow
	crusher_loot = /obj/item/crusher_trophy/legion_skull

/mob/living/simple_animal/hostile/asteroid/old_demon
	crusher_drop_mod = 75

/obj/item/crusher_trophy/ice_crystal
	name = "frost gem"
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	desc = "The glowing remnant of an ancient ice demon- so cold that it hurts to touch."
	icon_state = "ice_crystal"
	denied_type = /obj/item/crusher_trophy/ice_crystal

/obj/item/crusher_trophy/ice_crystal/effect_desc()
	return "waveform collapse to freeze a creature in a block of ice for a period, preventing them from moving"

/obj/item/crusher_trophy/ice_crystal/on_mark_detonation(mob/living/target, mob/living/user)
	target.apply_status_effect(/datum/status_effect/ice_crystal)

/datum/status_effect/ice_crystal
	id = "ice_crystal"
	duration = 20
	status_type = STATUS_EFFECT_REFRESH
	alert_type = /atom/movable/screen/alert/status_effect/ice_crystal
	/// Stored icon overlay for the hit mob, removed when effect is removed
	var/icon/cube

/atom/movable/screen/alert/status_effect/ice_crystal
	name = "Frozen Solid"
	desc = "You're frozen inside an ice cube, and cannot move!"
	icon_state = "frozen"

/datum/status_effect/ice_crystal/on_apply()
	RegisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(owner_moved))
	if(!owner.stat)
		to_chat(owner, "<span class='userdanger'>You become frozen in a cube!</span>")
	cube = icon('icons/effects/freeze.dmi', "ice_cube")
	var/icon/size_check = icon(owner.icon, owner.icon_state)
	cube.Scale(size_check.Width(), size_check.Height())
	owner.add_overlay(cube)
	return ..()

/// Blocks movement from the status effect owner
/datum/status_effect/ice_crystal/proc/owner_moved()
	return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

/datum/status_effect/ice_crystal/on_remove()
	if(!owner.stat)
		to_chat(owner, "<span class='notice'>The cube melts!</span>")
	owner.cut_overlay(cube)
	UnregisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE)

/mob/living/simple_animal/hostile/asteroid/ice_whelp
	crusher_loot = /obj/item/crusher_trophy/tail_spike

/mob/living/simple_animal/hostile/asteroid/lobstrosity
	crusher_loot = /obj/item/crusher_trophy/lobster_claw

/obj/item/crusher_trophy/lobster_claw
	name = "lobster claw"
	icon_state = "lobster_claw"
	desc = "A lobster claw."
	denied_type = /obj/item/crusher_trophy/lobster_claw
	bonus_value = 1

/obj/item/crusher_trophy/lobster_claw/effect_desc()
	return "mark detonation to briefly stagger the target for [bonus_value] seconds"

/obj/item/crusher_trophy/lobster_claw/on_mark_detonation(mob/living/target, mob/living/user)
	target.apply_status_effect(/datum/status_effect/stagger, bonus_value SECONDS)

/mob/living/simple_animal/hostile/asteroid
	var/crusher_loot
	var/crusher_drop_mod = 25

/mob/living/simple_animal/hostile/asteroid/polarbear
	crusher_loot = /obj/item/crusher_trophy/bear_paw

/obj/item/crusher_trophy/bear_paw
	name = "polar bear paw"
	desc = "It's a polar bear paw."
	icon_state = "bear_paw"
	icon ='icons/obj/lavaland/elite_trophies.dmi'
	denied_type = /obj/item/crusher_trophy/bear_paw

/obj/item/crusher_trophy/bear_paw/effect_desc()
	return "doubled strikes when below 50% health"

/obj/item/crusher_trophy/bear_paw/on_mark_detonation(mob/living/target, mob/living/user)
	if(user.health / user.maxHealth > 0.5)
		return
	var/obj/item/I = user.get_active_held_item()
	if(!I)
		return
	I.melee_attack_chain(user, target, null)

/mob/living/simple_animal/hostile/asteroid/polarbear/warrior
	crusher_loot = /obj/item/crusher_trophy/war_paw
	crusher_drop_mod = 75

/obj/item/crusher_trophy/war_paw
	name = "Armored bear paw"
	desc = "It's a paw from a true warrior. Still remembers the basics of CQB."
	icon_state = "armor_paw"
	icon ='icons/obj/lavaland/elite_trophies.dmi'
	denied_type = /obj/item/crusher_trophy/war_paw

/obj/item/crusher_trophy/war_paw/effect_desc()
	return "doubled strikes when below 70% health"

/obj/item/crusher_trophy/war_paw/on_mark_detonation(mob/living/target, mob/living/user)
	if(user.health / user.maxHealth > 0.7)
		return
	var/obj/item/I = user.get_active_held_item()
	if(!I)
		return
	I.melee_attack_chain(user, target, null)

/mob/living/simple_animal/hostile/asteroid/wolf
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2, /obj/item/stack/sheet/sinew/wolf = 2, /obj/item/stack/sheet/bone = 2, /obj/item/crusher_trophy/wolf_ear = 0.5)
	crusher_loot = /obj/item/crusher_trophy/wolf_ear

/obj/item/crusher_trophy/wolf_ear
	name = "wolf ear"
	desc = "The battered remains of a wolf's ear. You could attach it to a crusher, or use the fur to craft a trophy."
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	icon_state = "torn_ear"
	denied_type = /obj/item/crusher_trophy/wolf_ear

/obj/item/crusher_trophy/wolf_ear/effect_desc()
	return "waveform collapse to give the user a slight speed boost"

/obj/item/crusher_trophy/wolf_ear/on_mark_detonation(mob/living/target, mob/living/user)
	user.apply_status_effect(/datum/status_effect/speed_boost, 3 SECONDS)

/mob/living/simple_animal/hostile/asteroid/wolf/alpha
	crusher_loot = /obj/item/crusher_trophy/fang

/obj/item/crusher_trophy/fang
	name = "battle-stained fang"
	desc = "A wolf fang, displaying the wear and tear associated with a long and colorful life. Could be attached to a kinetic crusher or used to make a trophy."
	icon = 'icons/obj/lavaland/elite_trophies.dmi'
	icon_state = "fang"
	denied_type = /obj/item/crusher_trophy/fang
	var/bleed_stacks_per_hit = 5

/obj/item/crusher_trophy/fang/effect_desc()
	return "waveform collapse to build up a small stack of bleeding, causing a burst of damage if applied repeatedly."

/obj/item/crusher_trophy/fang/on_mark_detonation(mob/living/M, mob/living/user)
	if(istype(M) && (M.mob_biotypes & MOB_ORGANIC))
		var/datum/status_effect/stacking/saw_bleed/bloodletting/B = M.has_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting)
		if(!B)
			M.apply_status_effect(/datum/status_effect/stacking/saw_bleed/bloodletting, bleed_stacks_per_hit)
		else
			B.add_stacks(bleed_stacks_per_hit)

















