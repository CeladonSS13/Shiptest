	// NanoTrasen
/obj/item/clothing/head/helmet/space/hardsuit/nanotrasen
	name = "navy-blue helmet"
	desc = "A dual-mode advanced hardsuit designed for special combat operations. It is in EVA mode. Produced by the NanoTrasen."
	alt_desc = "A dual-mode advanced hardsuit designed for special combat operations. It is in combat mode. Produced by the NanoTrasen."
	mob_overlay_icon = 'mod_celadon/nt_hardsuit/icons/human_head.dmi'
	icon = 'mod_celadon/_storge_icons/icons/obj/head.dmi'
	vox_override_icon = 'mod_celadon/nt_hardsuit/icons/vox_head.dmi'
	icon_state = "hardsuit1-nanotras"
	item_state = "nanotras_helm"
	hardsuit_type = "nanotras"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	on = TRUE
	var/obj/item/clothing/suit/space/hardsuit/nanotrasen/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEEARS
	visor_flags = STOPSPRESSUREDAMAGE
	var/full_retraction = FALSE //whether or not our full face is revealed or not during combat mode

/obj/item/clothing/head/helmet/space/hardsuit/nanotrasen/update_icon_state()
	icon_state = "hardsuit[on]-[hardsuit_type]"
	return ..()

/obj/item/clothing/head/helmet/space/hardsuit/nanotrasen/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/nanotrasen))
		linkedsuit = loc

/obj/item/clothing/head/helmet/space/hardsuit/nanotrasen/attack_self(mob/user) //Toggle Helmet
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You cannot toggle your helmet while in this [user.loc]!</span>" )
		return
	on = !on
	if(on || force)
		to_chat(user, "<span class='notice'>You switch your hardsuit to EVA mode, sacrificing speed for space protection.</span>")
		name = initial(name)
		desc = initial(desc)
		set_light_on(TRUE)
		clothing_flags |= visor_flags
		cold_protection |= HEAD
		if(full_retraction)
			flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		else
			flags_cover |= HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
	else
		to_chat(user, "<span class='notice'>You switch your hardsuit to combat mode, sacrificing space protection for improved speed.</span>")
		name += " (combat)"
		desc = alt_desc
		set_light_on(FALSE)
		clothing_flags &= ~visor_flags
		cold_protection &= ~HEAD
		if(full_retraction)
			flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		else
			flags_cover &= ~(HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
	update_appearance()
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/space/hardsuit/nanotrasen/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = initial(linkedsuit.desc)
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			linkedsuit.slowdown = 0.7
			linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
		else
			linkedsuit.name += " (combat)"
			linkedsuit.desc = linkedsuit.alt_desc
			linkedsuit.slowdown = linkedsuit.combat_slowdown
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			if(linkedsuit.lightweight)
				linkedsuit.flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

		linkedsuit.icon_state = "hardsuit[on]-[hardsuit_type]"
		linkedsuit.update_appearance()
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()
		user.update_equipment_speed_mods()

/obj/item/clothing/suit/space/hardsuit/nanotrasen
	name = "navy-blue hardsuit"
	desc = "Nanotrasen's take on dual-mode hardsuits. It's a well armored and heavily modified version of the standart issue prewar security hardsuit using reverse-engineered dual-mode technology. Those suits are normally issued to Nanotrasen's elite security forces. It is in EVA mode."
	alt_desc = "Nanotrasen's take on dual-mode hardsuits. It's a well armored and heavily modified version of the standart issue prewar security hardsuit using reverse-engineered dual-mode technology. Those suits are normally issued to Nanotrasen's elite security forces. It is in combat mode."
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/mob/spacesuits_celadon.dmi'
	icon = 'mod_celadon/_storge_icons/icons/obj/spacesuits_celadon.dmi'
	vox_override_icon = 'mod_celadon/nt_hardsuit/icons/vox_suit.dmi'
	icon_state = "hardsuit1-nanotras"
	item_state = "nanotras_hardsuit"
	hardsuit_type = "nanotras"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/nanotrasen
	jetpack = /obj/item/tank/jetpack/suit
	supports_variations = VOX_VARIATION
	var/combat_slowdown = 0.2
	var/lightweight = 0
