/obj/item/bodypart
	var/skin_tone_riol = ""

/obj/item/bodypart/head/riol
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_head"
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_RIOL
	bodytype = BODYTYPE_RIOL | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID | BODYTYPE_SNOUT

/obj/item/bodypart/chest/riol
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_chest"
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_RIOL
	is_dimorphic = FALSE
	acceptable_bodytype = BODYTYPE_RIOL | BODYTYPE_HUMANOID
	bodytype = BODYTYPE_RIOL | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/l_arm/riol
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_l_arm"
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_RIOL
	bodytype = BODYTYPE_RIOL | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/r_arm/riol
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_r_arm"
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_RIOL
	bodytype = BODYTYPE_RIOL | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/left/riol
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_l_leg"
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_RIOL
	bodytype = BODYTYPE_RIOL | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/right/riol
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_r_leg"
	should_draw_greyscale = TRUE
	uses_mutcolor = TRUE
	limb_id = SPECIES_RIOL
	bodytype = BODYTYPE_RIOL | BODYTYPE_ORGANIC | BODYTYPE_HUMANOID

/obj/item/bodypart/leg/left/riol/digitigrade
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_l_leg_digitigrade"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/riol/digitigrade
	icon = 'mod_celadon/_storge_icons/icons/species/riol/riol_bodypats.dmi'
	icon_state = "riol_r_leg_digitigrade"
	bodytype = BODYTYPE_HUMANOID | BODYTYPE_ORGANIC | BODYTYPE_DIGITIGRADE


// Riol Robotic (Synths)
/obj/item/bodypart/chest/robot/riol
	name = "prosthetic riol chest"
	is_dimorphic = TRUE
	icon = 'icons/mob/augmentation/augments_lizard.dmi' // FIXME: TODO: ПОЧЕМУ ЛИЗАРД?!
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC
	acceptable_bodytype = BODYTYPE_RIOL

/obj/item/bodypart/head/robot/riol
	name = "prosthetic riol head"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/l_arm/robot/riol
	name = "prosthetic riol left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/riol
	name = "prosthetic riol right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/riol
	name = "prosthetic riol left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/riol
	name = "prosthetic riol right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

// Surplus riol Robotic
/obj/item/bodypart/l_arm/robot/surplus/riol
	name = "surplus prosthetic riol left arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/r_arm/robot/surplus/riol
	name = "surplus prosthetic riol right arm"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/riol
	name = "surplus prosthetic riol left leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/right/robot/surplus/riol
	name = "surplus prosthetic riol right leg"
	icon = 'icons/mob/augmentation/augments_lizard.dmi'
	should_draw_greyscale = TRUE
	overlay_icon_state = TRUE
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC

/obj/item/bodypart/leg/left/robot/surplus/riol/digitigrade
	name = "surplus prosthetic digitigrade riol left leg"
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE

/obj/item/bodypart/leg/right/robot/surplus/riol/digitigrade
	name = "surplus prosthetic digitigrade riol right leg"
	bodytype = BODYTYPE_RIOL | BODYTYPE_ROBOTIC | BODYTYPE_DIGITIGRADE
