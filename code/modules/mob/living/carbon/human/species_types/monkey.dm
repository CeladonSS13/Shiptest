///DO NOT USE set_species(/datum/species/monkey)
///USE monkeyize() INSTEAD
/datum/species/monkey
	name = "\improper Monkey"
	id = SPECIES_MONKEY
	skinned_type = /obj/item/stack/sheet/animalhide/
	changesource_flags = MIRROR_BADMIN
	use_damage_color = FALSE
	deathsound = list('sound/voice/human/deathgasp_1.ogg', 'sound/voice/human/deathgasp_2.ogg')

	species_chest = /obj/item/bodypart/chest/monkey
	species_head = /obj/item/bodypart/head/monkey
	species_l_arm = /obj/item/bodypart/l_arm/monkey
	species_r_arm = /obj/item/bodypart/r_arm/monkey
	species_l_leg = /obj/item/bodypart/leg/left/monkey
	species_r_leg = /obj/item/bodypart/leg/right/monkey
