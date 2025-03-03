/datum/supply_pack/faction/independent/exploration
	group = "Exploration"
	crate_type = /obj/structure/closet/crate/wooden


/*
MARK: Набор для типов планет
 */

/datum/supply_pack/faction/independent/exploration/lava
	name = "Lava Exploration Kit"
	desc = "Contains 60 lavaproof rods, two pocket extinguishers and goggles to protect yourself from the heat."
	cost = 700
	contains = list(
		/obj/item/extinguisher/mini,
		/obj/item/extinguisher/mini,
		/obj/item/clothing/glasses/heat,
		/obj/item/clothing/glasses/heat,
		/obj/item/stack/rods/lava/thirty,
		/obj/item/stack/rods/lava/thirty,
	)
	crate_name = "Lava Exploration Kit"

/datum/supply_pack/faction/independent/exploration/ice
	name = "Ice Exploration Kit"
	desc = "Contains 2 sets of winter clothes and ice hiking boots, along with goggles to protect eyes from the cold."
	cost = 700
	contains = list(
		/obj/item/clothing/glasses/cold,
		/obj/item/clothing/glasses/cold,
		/obj/item/clothing/suit/hooded/wintercoat,
		/obj/item/clothing/suit/hooded/wintercoat,
		/obj/item/clothing/shoes/winterboots/ice_boots,
		/obj/item/clothing/shoes/winterboots/ice_boots,
	)
	crate_name = "Ice Exploration Kit"


/*
MARK: Стандартные наборы для исследований
*/
/datum/supply_pack/faction/independent/exploration/lavaproof_rods
	name ="Lavaproof Rods Crate"
	desc = "Contains 60 lavaproof rods for safely traversing molten pits."
	cost = 350
	contains = list(
		/obj/item/stack/rods/lava/thirty,
		/obj/item/stack/rods/lava/thirty,
		)
	crate_name = "Lavaproof Rod Crate"

/datum/supply_pack/faction/independent/exploration/capsules
	name = "Bluespace Shelter Capsule"
	desc = "Contains a Bluespace Shelter Capsule, for instant shelter in rough situations."
	cost = 700
	contains = list(
		/obj/item/survivalcapsule
	)

/datum/supply_pack/faction/independent/exploration/binocular
	name = "Binoculars"
	desc = "Contains one pair of binoculars for surveying terrain."
	cost = 350
	contains = list(
		/obj/item/binoculars
	)

/datum/supply_pack/faction/independent/exploration/anom_neutralizer
	name = "Anomaly Neutralizer"
	desc = "Contains a single use anomaly neutralizer for stabilizing hazardous anomalies."
	cost = 450
	contains = list(
		/obj/item/anomaly_neutralizer
	)

/datum/supply_pack/faction/independent/exploration/mineral_scanner
	name = "Underground Mineral Scanner"
	desc = "Contains an underground mineral scanner for locating veins of ore beneath the earth. Deep core laser drill for extracting said ores not included."
	cost = 400
	contains = list(
		/obj/item/pinpointer/mineral
	)

/datum/supply_pack/faction/independent/exploration/gps
	name = "GPS"
	desc = "Contains a GPS device, useful for keeping track of yourself and others."
	cost = 200
	contains = list(
		/obj/item/gps
	)

/datum/supply_pack/faction/independent/exploration/flares
	name = "Flare Supply Pack"
	desc = "Contains 4 boxes of flares (28 total)! Great for lighting things up."
	cost = 200
	contains = list(
		/obj/item/storage/box/flares,
		/obj/item/storage/box/flares,
		/obj/item/storage/box/flares,
		/obj/item/storage/box/flares,
	)

/datum/supply_pack/faction/independent/exploration/nvg
	name = "Night Vision Goggles"
	desc = "Contains a singular pair of Night Vision Goggles, for all your spelunking and military LARP occasions."
	cost = 1000
	contains = list(
		/obj/item/clothing/glasses/night
	)
