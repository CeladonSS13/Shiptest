/obj/item/bodypart
	var/skin_tone_nose = ""
	var/skin_tone_tajara = ""


/obj/item/bodypart/head/tajara
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID | BODYTYPE_SNOUT

/obj/item/bodypart/chest/tajara
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	is_dimorphic = FALSE
	acceptable_bodytype = BODYTYPE_TAJARA | BODYTYPE_HUMANOID
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/l_arm/tajara
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/r_arm/tajara
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/left/tajara
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/right/tajara
	icon = 'mod_celadon/_storge_icons/icons/species/tajara/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID


// Tajara Robotic (Synths)
/obj/item/bodypart/chest/robot/tajara
	name = "prosthetic tajara chest"
	is_dimorphic = TRUE
	icon = 'icons/mob/augmentation/augments_lizard.dmi' // FIXME: TODO: ПОЧЕМУ ЛИЗАРД?!
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_TAJARA

/obj/item/bodypart/head/robot/tajara
	name = "prosthetic tajara head"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/l_arm/robot/tajara
	name = "prosthetic tajara left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/tajara
	name = "prosthetic tajara right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/tajara
	name = "prosthetic tajara left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/tajara
	name = "prosthetic tajara right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

// Surplus tajara Robotic
/obj/item/bodypart/l_arm/robot/surplus/tajara
	name = "surplus prosthetic tajara left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/tajara
	name = "surplus prosthetic tajara right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/tajara
	name = "surplus prosthetic tajara left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/tajara
	name = "surplus prosthetic tajara right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/tajara/digitigrade
	name = "surplus prosthetic digitigrade tajara left leg"
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/robot/surplus/tajara/digitigrade
	name = "surplus prosthetic digitigrade tajara right leg"
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE
