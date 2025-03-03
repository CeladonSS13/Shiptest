/obj/item/clothing/glasses/meson/truesight
	name = "The Lens of Truesight"
	desc = "I can see forever!"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	icon_state = "monocle"

/obj/item/clothing/glasses/meson/gar
	name = "gar mesons"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	icon_state = "garm"
	item_state = "garm"
	desc = "Do the impossible, see the invisible!"
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb = list("sliced")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP
	custom_price = 500

/obj/item/clothing/glasses/monocle
	name = "monocle"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "Such a dapper eyepiece!"
	icon_state = "monocle"
	supports_variations = VOX_VARIATION

/obj/item/clothing/glasses/material/mining/gar
	name = "gar material scanner"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	icon_state = "garm"
	item_state = "garm"
	desc = "Do the impossible, see the invisible!"
	force = 10
	throwforce = 20
	throw_speed = 4
	attack_verb = list("sliced")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP
	glass_colour_type = /datum/client_colour/glass_colour/lightgreen

/obj/item/clothing/glasses/sunglasses/garb
	name = "black gar glasses"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "Go beyond impossible and kick reason to the curb!"
	icon_state = "garb"
	item_state = "garb"
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb = list("sliced")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP

/obj/item/clothing/glasses/sunglasses/garb/supergarb
	name = "black giga gar glasses"
	desc = "Believe in us humans."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	icon_state = "supergarb"
	item_state = "garb"
	force = 12
	throwforce = 12

/obj/item/clothing/glasses/sunglasses/gar
	name = "gar glasses"
	desc = "Just who the hell do you think I am?!"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	icon_state = "gar"
	item_state = "gar"
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb = list("sliced")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP
	glass_colour_type = /datum/client_colour/glass_colour/orange

/obj/item/clothing/glasses/sunglasses/gar/supergar
	name = "giga gar glasses"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "We evolve past the person we were a minute before. Little by little we advance with each turn. That's how a drill works!"
	icon_state = "supergar"
	item_state = "gar"
	force = 12
	throwforce = 12
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/welding/ghostbuster
	name = "optical ecto-scanner"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "A bulky pair of unwieldy glasses that lets you see things best left unseen. Obscures vision, but also gives a bit of eye protection"
	icon_state = "bustin-g"
	item_state = "bustin-g"
	invis_view = SEE_INVISIBLE_OBSERVER
	invis_override = null
	flash_protect = 1
	visor_vars_to_toggle = VISOR_FLASHPROTECT | VISOR_TINT | VISOR_INVISVIEW
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/thermal/monocle
	name = "thermoncle"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "Never before has seeing through walls felt so gentlepersonly."
	icon_state = "thermoncle"
	flags_1 = null //doesn't protect eyes because it's a monocle, duh

/obj/item/clothing/glasses/thermal/monocle/examine(mob/user) //Different examiners see a different description!
	if(user.gender == MALE)
		desc = replacetext(desc, "person", "man")
	else if(user.gender == FEMALE)
		desc = replacetext(desc, "person", "woman")
	. = ..()
	desc = initial(desc)

/obj/item/clothing/glasses/godeye
	name = "eye of god"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "A strange eye, said to have been torn from an omniscient creature that used to roam the wastes."
	icon_state = "godeye"
	item_state = "godeye"
	vision_flags = SEE_TURFS|SEE_MOBS|SEE_OBJS
	darkness_view = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	clothing_flags = SCAN_REAGENTS

/obj/item/clothing/glasses/godeye/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, EYE_OF_GOD_TRAIT)

/obj/item/clothing/glasses/godeye/attackby(obj/item/W as obj, mob/user as mob, params)
	if(istype(W, src) && W != src && W.loc == user)
		if(W.icon_state == "godeye")
			W.icon_state = "doublegodeye"
			W.item_state = "doublegodeye"
			W.desc = "A pair of strange eyes, said to have been torn from an omniscient creature that used to roam the wastes. There's no real reason to have two, but that isn't stopping you."
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.update_inv_wear_mask()
		else
			to_chat(user, "<span class='notice'>The eye winks at you and vanishes into the abyss, you feel really unlucky.</span>")
		qdel(src)
	..()

/// PRISM
/obj/item/clothing/glasses/prism_glasses
	name = "prism glasses"
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "The lenses seem to glow slightly, and reflect light into dazzling colors."
	icon = 'icons/obj/slimecrossing.dmi'
	icon_state = "prismglasses"
	actions_types = list(/datum/action/item_action/change_prism_colour, /datum/action/item_action/place_light_prism)
	var/glasses_color = "#FFFFFF"

/obj/item/clothing/glasses/prism_glasses/item_action_slot_check(slot)
	if(slot == ITEM_SLOT_EYES)
		return TRUE

/// HUD
/obj/item/clothing/glasses/hud/security/sunglasses/gars
	name = "\improper HUD gar glasses"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/eyes.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/eyes.dmi'
	desc = "GAR glasses with a HUD."
	icon_state = "gars"
	item_state = "garb"
	force = 10
	throwforce = 10
	throw_speed = 4
	attack_verb = list("sliced")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP

/obj/item/clothing/glasses/hud/security/sunglasses/gars/supergars
	name = "giga HUD gar glasses"
	desc = "GIGA GAR glasses with a HUD."
	icon_state = "supergars"
	item_state = "garb"
	force = 12
	throwforce = 12
