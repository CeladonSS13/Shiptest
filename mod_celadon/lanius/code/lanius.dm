/mob/living/carbon/human/species/lanius
	race = /datum/species/lanius
	gib_type = /obj/effect/decal/cleanable/ash
///
/mob/living/carbon/human/species/lanius/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/footstep, FOOTSTEP_MOB_HEAVY, 0.35)
	src.gender = G_PLURAL

/datum/species/lanius
	// Animated beings of stone. They have increased defenses, and do not need to breathe. They're also slow as fuuuck.
	name = "\improper Lanius"
	id = SPECIES_LANIUS
	sexes = FALSE
	special_step_sounds = 'sound/effects/footstep/heavy1.ogg'
	species_gibs = "lanius"
	loreblurb = "The Lanius are a metallic scavenger race, \
	 whose biological composition somehow drains oxygen from atmosphere."
	species_eye_path = 'mod_celadon/_storge_icons/icons/lanius/lanius_organs.dmi'
	species_traits = list(EYECOLOR, EMOTE_OVERLAY, NOBLOOD, MUTCOLORS, NO_UNDERWEAR, NOHUSK, NO_BONES)
	inherent_traits = list(TRAIT_NOBREATH, TRAIT_RESISTHEAT,TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_NOFIRE,TRAIT_CHUNKYFINGERS,TRAIT_VIRUSIMMUNE,TRAIT_PIERCEIMMUNE,TRAIT_NODISMEMBER,TRAIT_SHOCKIMMUNE,TRAIT_GENELESS)
	inherent_biotypes = MOB_HUMANOID | MOB_ORGANIC | MOB_MINERAL
	toxic_food = VEGETABLES | DAIRY | CLOTH | GROSS | MEAT | RAW
	meat = /obj/item/stack/sheet/plasteel{amount = 5}
	species_language_holder = /datum/language_holder/lanius
	brutemod = 0.70
	burnmod = 0.70
	punchdamagelow = 5
	punchdamagehigh = 14
	punchstunthreshold = 25
	no_equip = list(ITEM_SLOT_MASK, ITEM_SLOT_OCLOTHING, ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_SUITSTORE)
	nojumpsuit = 1
	damage_overlay_type = ""

	mutanttongue = /obj/item/organ/tongue/lanius
	mutanteyes = /obj/item/organ/eyes/lanius
	mutantheart = /obj/item/organ/heart/lanius
	mutantliver = /obj/item/organ/liver/lanius
	mutantstomach = /obj/item/organ/stomach/lanius
	mutantears = /obj/item/organ/ears/lanius
	mutantlungs = null
	mutantappendix = null
	mutantbrain = /obj/item/organ/brain/lanius

	species_chest = /obj/item/bodypart/chest/lanius
	species_head = /obj/item/bodypart/head/lanius
	species_l_arm = /obj/item/bodypart/l_arm/lanius
	species_r_arm = /obj/item/bodypart/r_arm/lanius
	species_l_leg = /obj/item/bodypart/leg/left/lanius
	species_r_leg = /obj/item/bodypart/leg/right/lanius

	species_robotic_chest = /obj/item/bodypart/chest/lanius
	species_robotic_head = /obj/item/bodypart/head/lanius
	species_robotic_l_arm = /obj/item/bodypart/l_arm/lanius
	species_robotic_r_arm = /obj/item/bodypart/r_arm/lanius
	species_robotic_l_leg = /obj/item/bodypart/leg/left/lanius
	species_robotic_r_leg = /obj/item/bodypart/leg/right/lanius

/datum/species/lanius/spec_life(mob/living/carbon/human/H)
	. = ..()
	H.loc.remove_air(LANIUS_GAS_USE)

/mob/living/carbon/human/species/lanius/spawn_gibs()
		new /obj/effect/gibspawner(drop_location(), src)

/obj/item/clothing/head/wig/mob_can_equip(mob/living/target, mob/living/equipper, slot, disable_warning, bypass_equip_delay_self, swap)
	if(!islanius(target))
		return ..()
	return FALSE
