// /datum/mission/outpost/acquire/New(...)
// 	var/rand_val = 0
// 	switch(type_mission)
// 		if("extraction_plasma")
// 			desc = "[pick("Factions", "Corporations", "Federations")] require large 	amounts of plasma sheets for [pick("base", "station", "ships")]. You are 	tasked with extracting them in large quantities in a short period of time."
// 			num_wanted = rand(num_wanted - 200, num_wanted + 200)
// 			value = (num_wanted * (value / 10))
// 		if("capture_creature")
// 			rand_val = rand(1, 10)
// 			value = (rand_val * (value / 10) + 1000)
// 		if("mission")
// 			num_wanted = rand(num_wanted, num_wanted + 2)
// 			value = (num_wanted * (value / 10) + 500)
// 	return ..()

/*
/// MARK: 	The Creature
*/

/datum/mission/outpost/acquire/creature
	// type_mission = "capture_creature"
	value = 2000

/datum/mission/outpost/acquire/creature/ice_whelp
	name = "Capture an ice whelp"
	desc = "I require a live ice whelp for research purposes. Trap one within the given \
			Lifeform Containment Unit and return it to me and you will be paid handsomely."
	value = 2700

/datum/mission/outpost/acquire/creature/migo
	value = 1000

/datum/mission/outpost/acquire/creature/legion
	value = 1700

/datum/mission/outpost/acquire/creature/floorbot
	name = "Detain a malfunctioning floorbot"
	desc = "I require a functional abandoned floorbot for \"research\" purposes. Trap one within \
			the given Lifeform Containment Unit and return it to me and you will be paid handsomely."
	value = 2660
	weight = 1
	objective_type = /mob/living/simple_animal/bot/floorbot/rockplanet

/datum/mission/outpost/acquire/creature/firebot
	name = "Detain a malfunctioning firebot"
	desc = "I require a functional abandoned firebot for \"research\" purposes. Trap one within \
			the given Lifeform Containment Unit and return it to me and you will be paid handsomely."
	value = 2600
	weight = 1
	objective_type = /mob/living/simple_animal/bot/firebot/rockplanet

/*
/// MARK: Plasma
*/

/datum/mission/outpost/acquire/extraction_plasma
	// type_mission = "extraction_plasma"
	name = "Plasma required"
	duration = 70 MINUTES
	value = 600
	weight = 1
	container_type = /obj/structure/closet/crate/extraction/plasma
	objective_type = /obj/item/stack/sheet/mineral/plasma
	num_wanted = 250

/obj/structure/closet/crate/extraction/plasma
	name = "crate for plasma"
	desc = "A plasma crate."
	icon_state = "scicrate"
