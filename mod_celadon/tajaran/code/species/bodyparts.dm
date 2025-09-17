/obj/item/bodypart
	var/skin_tone_nose = ""
	var/skin_tone_tajaran = ""


/obj/item/bodypart/head/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID | BODYTYPE_SNOUT

/obj/item/bodypart/chest/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	is_dimorphic = FALSE
	acceptable_bodytype = BODYTYPE_TAJARAN | BODYTYPE_HUMANOID
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/l_arm/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/r_arm/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/left/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/right/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajaran_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARAN
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID


// Tajara Robotic (Synths)
/obj/item/bodypart/chest/robot/tajaran
	name = "prosthetic tajara chest"
	is_dimorphic = TRUE
	icon = 'icons/mob/augmentation/augments_lizard.dmi' // FIXME: TODO: ПОЧЕМУ ЛИЗАРД?!
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_TAJARAN

/obj/item/bodypart/head/robot/tajaran
	name = "prosthetic tajara head"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/l_arm/robot/tajaran
	name = "prosthetic tajara left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/tajaran
	name = "prosthetic tajara right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/tajaran
	name = "prosthetic tajara left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/tajaran
	name = "prosthetic tajara right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

// Surplus tajaran Robotic
/obj/item/bodypart/l_arm/robot/surplus/tajaran
	name = "surplus prosthetic tajara left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/tajaran
	name = "surplus prosthetic tajara right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/tajaran
	name = "surplus prosthetic tajara left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/tajaran
	name = "surplus prosthetic tajara right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/tajaran/digitigrade
	name = "surplus prosthetic digitigrade tajara left leg"
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/robot/surplus/tajaran/digitigrade
	name = "surplus prosthetic digitigrade tajara right leg"
	bodytype = BODYTYPE_TAJARAN | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE
