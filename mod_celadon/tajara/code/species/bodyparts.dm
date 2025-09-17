/obj/item/bodypart
	var/skin_tone_nose = ""
	var/skin_tone_tajara = ""


/obj/item/bodypart/head/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID | BODYTYPE_SNOUT

/obj/item/bodypart/chest/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	is_dimorphic = FALSE
	acceptable_bodytype = BODYTYPE_TAJARA | BODYTYPE_HUMANOID
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/l_arm/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/r_arm/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/left/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/right/tajaran
	icon = 'mod_celadon/_storage_icons/icons/species/tajaran/tajara_bodyparts.dmi'
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_TAJARA
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID


// Tajara Robotic (Synths)
/obj/item/bodypart/chest/robot/tajaran
	name = "prosthetic tajaran chest"
	is_dimorphic = TRUE
	icon = 'icons/mob/augmentation/augments_lizard.dmi' // FIXME: TODO: ПОЧЕМУ ЛИЗАРД?!
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_TAJARA

/obj/item/bodypart/head/robot/tajaran
	name = "prosthetic tajaran head"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/l_arm/robot/tajaran
	name = "prosthetic tajaran left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/tajaran
	name = "prosthetic tajaran right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/tajaran
	name = "prosthetic tajaran left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/tajaran
	name = "prosthetic tajaran right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

// Surplus tajaran Robotic
/obj/item/bodypart/l_arm/robot/surplus/tajaran
	name = "surplus prosthetic tajaran left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/tajaran
	name = "surplus prosthetic tajaran right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/tajaran
	name = "surplus prosthetic tajaran left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/tajaran
	name = "surplus prosthetic tajaran right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/tajaran/digitigrade
	name = "surplus prosthetic digitigrade tajaran left leg"
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/robot/surplus/tajaran/digitigrade
	name = "surplus prosthetic digitigrade tajaran right leg"
	bodytype = BODYTYPE_TAJARA | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE
