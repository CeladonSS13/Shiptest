/datum/export/hunting/meat
	unit_name = "raw meat"
	desc = "People of the frontier need to eat too. Any slab does the trick."
	cost = 10
	export_types = list(/obj/item/food/meat, /obj/item/food/fishmeat)

/datum/export/hunting/stack/get_amount(obj/O)
	if(!typesof(/obj/item/stack))
		return
	var/obj/item/stack/I = O
	return I.amount

/datum/export/hunting/stack/bone
	unit_name = "animal bone"
	desc = "Animal bone export. Paid per bone."
	cost = 10
	export_types = list(/obj/item/stack/sheet/bone)

/*
/datum/export/hunting/stack/hide
	unit_name = "animal hide"
	desc = "Animal hide export. Paid per hide."
	cost = 50
	export_types = list(/obj/item/stack/sheet/animalhide/goliath_hide) // Also includes polar bear hide.
*/

/datum/export/hunting/stack/rarehide
	unit_name = "rare animal hide"
	desc = "Rare animal hide export. Paid per hide."
	cost = 250
	export_types = list(/obj/item/stack/sheet/animalhide/ashdrake)	// [CELADON-EDIT]

/datum/export/hunting/stack/leather
	unit_name = "leather"
	desc = "Processed hide of an animal. Paid per sheet."
	cost = 100 // You need to process goliath hide, which takes effort!
	export_types = list(/obj/item/stack/sheet/leather)

/datum/export/hunting/stack/sinew
	unit_name = "animal sinew"
	desc = "Animal sinew export. Not as desirable. Paid per sinew."
	cost = 5
	export_types = list(/obj/item/stack/sheet/sinew)

/datum/export/hunting/trophy
	desc = "Off-sector collectors can pay quite a price for animal trophies in good condition."

/datum/export/hunting/trophy/common
	cost = 250
	unit_name = "common hunting trophy"
	export_types = list(
// [CELADON-ADD]
		/obj/item/crusher_trophy/shiny,
		/obj/item/crusher_trophy/legion_skull,
		/obj/item/crusher_trophy/wolf_ear,
		/obj/item/crusher_trophy/bear_paw,
		/obj/item/crusher_trophy/goliath_tentacle,
		/obj/item/crusher_trophy/watcher_wing,
		/obj/item/crusher_trophy/brimdemon_fang,
		/obj/item/crusher_trophy/lobster_claw,
		/obj/item/mob_trophy/shiny,
// [/CELADON-ADD]
		/obj/item/mob_trophy/legion_skull,
		/obj/item/mob_trophy/wolf_ear,
		/obj/item/mob_trophy/bear_paw,
		/obj/item/mob_trophy/goliath_tentacle,
		/obj/item/mob_trophy/watcher_wing,
		/obj/item/mob_trophy/brimdemon_fang,
		/obj/item/mob_trophy/lobster_claw
	)

/datum/export/hunting/trophy/rare
	cost = 1000
	unit_name = "rare hunting trophy"
	elasticity_coeff = 0
	export_types = list(
// [CELADON-ADD]
		/obj/item/crusher_trophy/watcher_wing_forgotten,
		/obj/item/crusher_trophy/legion_skull_crystal,
		/obj/item/crusher_trophy/goliath_crystal,
		/obj/item/crusher_trophy/dwarf_skull,
		/obj/item/crusher_trophy/fang,
		/obj/item/crusher_trophy/war_paw,
		/obj/item/crusher_trophy/elder_tentacle,
		/obj/item/crusher_trophy/ice_crystal,
		/obj/item/crusher_trophy/magma_skull,
		/obj/item/crusher_trophy/magma_skull/magma,
		/obj/item/crusher_trophy/magma_wing,
		/obj/item/crusher_trophy/tail_spike,
		/obj/item/crusher_trophy/ice_wing,
		/obj/item/crusher_trophy/dwarf_skull,
		/obj/item/mob_trophy/watcher_wing_forgotten,
		/obj/item/mob_trophy/legion_skull_crystal,
		/obj/item/mob_trophy/goliath_crystal,
// [/CELADON-ADD]
		/obj/item/mob_trophy/dwarf_skull,
		/obj/item/mob_trophy/fang,
		/obj/item/mob_trophy/war_paw,
		/obj/item/mob_trophy/elder_tentacle,
		/obj/item/mob_trophy/ice_crystal,
		/obj/item/mob_trophy/magma_wing,
		/obj/item/mob_trophy/tail_spike,
		/obj/item/mob_trophy/ice_wing
	)

/datum/export/hunting/trophy/mega
	cost = 3000
	elasticity_coeff = 0
	unit_name = "big game hunting trophy"
	export_types = list(
// [CELADON-ADD]
		/obj/item/crusher_trophy/legionnaire_spine,
		/obj/item/crusher_trophy/ash_spike,
		/obj/item/crusher_trophy/demon_claws,
		/obj/item/crusher_trophy/broodmother_tongue,
		/obj/item/crusher_trophy/ice_block_talisman,
		/obj/item/crusher_trophy/king_goat,
		/obj/item/crusher_trophy/miner_eye,
		/obj/item/crusher_trophy/vortex_talisman,
		/obj/item/crusher_trophy/blaster_tubes,
// [/CELADON-ADD]
		/obj/item/mob_trophy/ash_spike,
		/obj/item/mob_trophy/demon_claws,
		/obj/item/mob_trophy/broodmother_tongue,
		/obj/item/mob_trophy/ice_block_talisman,
		/obj/item/mob_trophy/miner_eye,
		/obj/item/mob_trophy/vortex_talisman,
		/obj/item/mob_trophy/blaster_tubes
	)

// [CELADON-ADD]
// Hides
/datum/export/hunting/stack
	desc = "Rawhide of various origins. The more exotic the species, the higher the price."
	include_subtypes = FALSE

/datum/export/hunting/stack/monkey
	cost = 50
	unit_name = "monkey hide"
	export_types = list(/obj/item/stack/sheet/animalhide/monkey)

/datum/export/hunting/stack/human
	unit_name = "piece of human skin"
	cost = 100
	export_types = list(/obj/item/stack/sheet/animalhide/human)

/datum/export/hunting/stack/goliath_hide
	unit_name = "goliath hide"
	cost = 200
	export_types = list(/obj/item/stack/sheet/animalhide/goliath_hide)
	include_subtypes = TRUE

/datum/export/hunting/stack/cat
	unit_name = "cat hide"
	cost = 150
	export_types = list(/obj/item/stack/sheet/animalhide/cat)

/datum/export/hunting/stack/corgi
	unit_name = "corgi hide"
	cost = 200
	export_types = list(/obj/item/stack/sheet/animalhide/corgi)

/datum/export/hunting/stack/lizard
	unit_name = "lizard hide"
	cost = 150
	export_types = list(/obj/item/stack/sheet/animalhide/lizard)

/datum/export/hunting/stack/gondola
	unit_name = "gondola hide"
	cost = 250
	export_types = list(/obj/item/stack/sheet/animalhide/gondola)

/datum/export/hunting/stack/xeno
	unit_name = "alien hide"
	cost = 100
	export_types = list(/obj/item/stack/sheet/animalhide/xeno)


// [/CELADON-ADD]
