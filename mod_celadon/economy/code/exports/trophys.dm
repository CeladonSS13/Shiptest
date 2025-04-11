/datum/export/minor_artifact
	cost = 1250
	unit_name = "minor collectable artifact"
	export_types = list(/obj/item/immortality_talisman,
						/obj/item/book_of_babel,
						/obj/item/wisp_lantern,
						/obj/item/reagent_containers/glass/bottle/potion/flight,
						/obj/item/melee/sword/katana,
						/obj/item/clothing/suit/space/hardsuit/cult,
						/obj/item/voodoo,
						/obj/item/grenade/clusterbuster/inferno,
						/obj/item/clothing/neck/memento_mori,
						/obj/item/organ/heart/cursed/wizard,
						/obj/item/clothing/suit/hooded/cloak/drake,
						/obj/item/dragons_blood,
						/obj/item/lava_staff,
						/obj/item/ship_in_a_bottle,
						/obj/item/veilrender/vealrender,
						/obj/item/clothing/suit/armor/ascetic,
						)

/datum/export/major_artifact
	cost = 2500
	unit_name = "collectable artifact"
	export_types = list(/obj/item/rod_of_asclepius,
						/obj/item/clothing/suit/space/hardsuit/ert/paranormal,
						/obj/item/prisoncube,
						/obj/item/staff/storm,
						/obj/item/gun/energy/spur,
						/obj/item/freeze_cube,
						/obj/item/clothing/gloves/gauntlets,
						/obj/item/necromantic_stone/lava,
						)

//Megafauna loot, except for ash drakes and legion

/datum/export/megafauna
	cost = 10000
	unit_name = "major collectable artifact"
	export_types = list(/obj/item/hierophant_club,
						/obj/item/melee/cleaving_saw,
						/obj/item/organ/vocal_cords/colossus,
						/obj/machinery/anomalous_crystal,
						/obj/item/mayhem,
						/obj/item/blood_contract,
						)

/datum/export/megafauna/hev
	cost = 7500
	unit_name = "H.E.C.K. suit"
	export_types = list(/obj/item/clothing/suit/space/hostile_environment)

/datum/export/megafauna/hev/helmet
	cost = 5000
	unit_name = "H.E.C.K. helmet"
	export_types = list(/obj/item/clothing/head/helmet/space/hostile_environment)

/datum/export/trophycommon
	cost = 250
	unit_name = "common hunting trophy"
	export_types = list(/obj/item/crusher_trophy/legion_skull,
						/obj/item/crusher_trophy/wolf_ear,
						/obj/item/crusher_trophy/bear_paw,
						/obj/item/crusher_trophy/goliath_tentacle,
						/obj/item/crusher_trophy/watcher_wing,
						)

/datum/export/trophyrare
	cost = 1000
	elasticity_coeff = 0.1
	unit_name = "rare hunting trophy"
	export_types = list(/obj/item/crusher_trophy/dwarf_skull,
						/obj/item/crusher_trophy/fang,
						/obj/item/crusher_trophy/war_paw,
						/obj/item/crusher_trophy/elder_tentacle,
						/obj/item/crusher_trophy/ice_crystal,
						/obj/item/crusher_trophy/magma_wing,
						/obj/item/crusher_trophy/tail_spike,
						/obj/item/crusher_trophy/ice_wing,
						)

/datum/export/trophymega
	cost = 3000
	elasticity_coeff = 0.2
	unit_name = "big game hunting trophy"
	export_types = list(/obj/item/crusher_trophy/legionnaire_spine,
						/obj/item/crusher_trophy/ash_spike,
						/obj/item/crusher_trophy/demon_claws,
						/obj/item/crusher_trophy/broodmother_tongue,
						/obj/item/crusher_trophy/ice_block_talisman,
						/obj/item/crusher_trophy/miner_eye,
						/obj/item/crusher_trophy/vortex_talisman,
						/obj/item/crusher_trophy/blaster_tubes,
						)

/datum/export/dogtag
	desc = "CLIP has posted several bounties for wanted members of both the Frontiersman and the Clique. Bring back their tags, we'll reward you well."
	cost = 500
	elasticity_coeff = 0.02
	recovery_ds = 0.5 MINUTES

/datum/export/dogtag/frontiersmen
	cost = 400
	unit_name = "frontiersmen dogtags"
	export_types = list(/obj/item/clothing/neck/dogtag/frontier)

/datum/export/dogtag/ramzi
	unit_name = "ramzi dogtags"
	export_types = list(/obj/item/clothing/neck/dogtag/ramzi)
