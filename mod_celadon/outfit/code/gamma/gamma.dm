/datum/client_colour/monochrome_green
	colour = list(rgb(128, 209, 123), rgb(68, 131, 73), rgb(24, 79, 23), rgb(0, 0, 0))
	override = TRUE
	fade_in = 20
	fade_out = 20

/obj/item/clothing/head/helmet/riot/gamma_vision
	name = "hardhat night vision gamma"
	desc = "No data."
	icon = 'mod_celadon/_storge_icons/icons/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/head.dmi'
	icon_state = "gamma_vision"
	item_state = "gamma_vision"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 30, "energy" = 25, "bomb" = 50, "bio" = 100, "fire" = 40, "acid" = 50)
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	resistance_flags = FIRE_PROOF | ACID_PROOF
	dog_fashion = null
	var/mob/living/carbon/user = null
	var/active = 0
	var/see_in_dark = 6
	// var/lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE // NEEDS_TO_FIX_ALARM!
	var/current_lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE

/obj/item/clothing/head/helmet/riot/gamma_vision/attack_self(mob/living/carbon/human/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			active = !active
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			item_state = "[initial(item_state)][up ? "up" : ""]"
			to_chat(user, span_notice("[up ? alt_toggle_message : toggle_message] \the [src]."))

			if(active)
				user.lighting_alpha = 192
				user.see_in_dark = 6
				user.add_client_colour(/datum/client_colour/monochrome_green)
				// user.update_sight(user.lighting_alpha, user.see_in_dark)
				// user.lighting_alpha = initial(user.lighting_alpha)
				// user.see_in_dark = initial(user.see_in_dark)
				// user.update_sight(user.lighting_alpha, user.see_in_dark) - доделать бы, не обновляет значения
			else
				user.see_in_dark = 2
				user.lighting_alpha = 255
				user.remove_client_colour(/datum/client_colour/monochrome_green)
				// user.lighting_alpha = initial(user.lighting_alpha)
				// user.see_in_dark = initial(user.see_in_dark)
				// user.update_sight(user.lighting_alpha, user.see_in_dark)

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

/obj/item/clothing/head/helmet/space/hardsuit/security/gamma/white_squadron_rig
	name = "white squadron rig helmet"
	desc = "No data"
	icon = 'mod_celadon/_storge_icons/icons/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/head.dmi'
	icon_state = "hardsuit0-gamma"
	item_state = "hardsuit1-gamma"
	hardsuit_type = "gamma"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 20,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)

/obj/item/clothing/suit/space/hardsuit/security/gamma/white_squadron_rig
	name = "white squadron rig"
	desc = "No data"
	icon = 'mod_celadon/_storge_icons/icons/obj/suit.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/suit.dmi'
	icon_state = "white_squadron_rig"
	item_state = "white_squadron_rig"
	hardsuit_type = "gamma"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 20,"energy" = 40, "bomb" = 10, "bio" = 100, "rad" = 50, "fire" = 75, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/gamma/white_squadron_rig

/obj/item/clothing/suit/armor/vest/gamma
	name = "Gamma armor vest"
	desc = "No data."
	icon = 'mod_celadon/_storge_icons/icons/obj/uniform.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/uniform.dmi'
	icon_state = "white_squadron_jacket"
	item_state = "white_squadron_jacket"
	armor = list("melee" = 38, "bullet" = 33, "laser" = 33, "energy" = 43, "bomb" = 28, "bio" = 3, "rad" = 3, "fire" = 53, "acid" = 53)

/obj/item/clothing/under/gamma/uniform
	name = "Комбенизон ГАММЫ"
	desc = "No data."
	icon = 'mod_celadon/_storge_icons/icons/obj/uniform.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/uniform.dmi'
	icon_state = "white_squadron_uniform"
	mob_overlay_state = "white_squadron_uniform"

/obj/item/clothing/gloves/combat/gamma
	name = "white squadron gloves"
	desc = "No data."
	icon = 'mod_celadon/_storge_icons/icons/obj/gloves.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/gloves.dmi'
	icon_state = "white_squadron_gloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50)

/obj/item/clothing/shoes/gamma
	name = "Gamma boots"
	desc = "no data."
	icon = 'mod_celadon/_storge_icons/icons/obj/shoes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/shoes.dmi'
	icon_state = "white_squadron_boots"
	item_state = "white_squadron_boots"
	strip_delay = 100
	equip_delay_other = 100
	permeability_coefficient = 0.9
	can_be_tied = FALSE

/obj/item/storage/backpack/messenger/gamma
	name = "gamma messenger bag"
	desc = "no data."
	icon = 'mod_celadon/_storge_icons/icons/obj/back.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/back.dmi'
	icon_state = "white_squadron_backpack"
	item_state = "white_squadron_backpack"

/obj/item/storage/belt/security/webbing/gamma
	name = "gamma cargo"
	desc = "no data."
	icon = 'mod_celadon/_storge_icons/icons/obj/back.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/back.dmi'
	slot_flags = ITEM_SLOT_BELT
	icon_state = "white_squadron_cargo"
	item_state = "white_squadron_cargo"

/obj/item/melee/gamma_tomahawk
	name = "gamma tomahawk"
	desc = "no data"
	icon = 'mod_celadon/_storge_icons/icons/obj/weapons.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/items/mob/weapons.dmi'
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/mob/hands/weapons_hands_left.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/mob/hands/weapons_hands_right.dmi'
	icon_state = "white_squadron_tomahawk"
	item_state = "white_squadron_tomahawk"
	hitsound = 'sound/weapons/bladeslice.ogg'
	pickup_sound =  'sound/items/unsheath.ogg'
	drop_sound = 'sound/items/handling/metal_drop.ogg'
	flags_1 = CONDUCT_1
	obj_flags = UNIQUE_RENAME
	force = 15
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	block_chance = 60
	armour_penetration = 20
	sharpness = IS_SHARP
	attack_verb = list("slashed", "cut")
