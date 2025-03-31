/datum/mission/outpost/acquire/New(...)
	var/rand_val = 0
	switch(type_mission)
		if("extraction_plasma")
			desc = "[pick("Factions", "Corporations", "Federations")] require large 	amounts of plasma sheets for [pick("base", "station", "ships")]. You are 	tasked with extracting them in large quantities in a short period of time."
			num_wanted = rand(num_wanted - 200, num_wanted + 200)
			value = (num_wanted * (value / 10))
		if("aquarium")
			num_wanted = rand(num_wanted + 2, num_wanted + 4)
			value = (num_wanted * (value / 5) + 500)
		if("bounty_dogtags")
			num_wanted = rand(num_wanted, num_wanted + 2)
			value = (num_wanted * (value / 5) + 500)
		if("true_love")
			num_wanted = rand(num_wanted, num_wanted + 2)
			value = (num_wanted * (value / 3) + 500)
		if("anomaly_core")
			num_wanted = rand(num_wanted, num_wanted + 3)
			value = (num_wanted * (value / 3))
		if("capture_creature")
			rand_val = rand(1, 10)
			value = (rand_val * (value / 10) + 1000)
		if("landmine")
			num_wanted = rand(num_wanted, num_wanted + 3)
			value = (num_wanted * (value / 3) + 150)
		if("fish")
			num_wanted = rand(num_wanted, num_wanted + 2)
			value = (num_wanted * value + 500)
			desc = "I am a chef in need of [num_wanted] fish for my latest dish. Any fish will do, just make sure they're not filleted!"
		if("fish_big")
			num_wanted = rand(num_wanted + 3, num_wanted + 9)
			value = (num_wanted * value + 500)
			desc = "I am a grand chef in need of [num_wanted] fish for my latest dish. Any fish will do, just make sure they're not filleted!"
		if("mission")
			num_wanted = rand(num_wanted, num_wanted + 2)
			value = (num_wanted * (value / 10) + 500)
	return ..()

/*
/// MARK: 	True Love
*/

/datum/mission/outpost/acquire/true_love
	type_mission = "true_love"

/*
/// MARK: Anomaly
*/

/datum/mission/outpost/acquire/anomaly
	type_mission = "anomaly_core"

/*
/// MARK: 	The Creature
*/

/datum/mission/outpost/acquire/creature
	type_mission = "capture_creature"
	value = 2000

/datum/mission/outpost/acquire/creature/ice_whelp
	name = "Capture an ice whelp"
	desc = "I require a live ice whelp for research purposes. Trap one within the given \
			Lifeform Containment Unit and return it to me and you will be paid handsomely."
	value = 2700
	weight = 2
	objective_type = /mob/living/simple_animal/hostile/asteroid/ice_whelp

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
/// MARK: Acquire: Landmines
*/

/datum/mission/outpost/acquire/landmine
	type_mission = "landmine"

	desc = "The Solar Federation and Vigilitas Interstellar have assigned us to offer a bounty to turn in disarmed ordnance for future ventures. We'll pay you well, but we're not responsible for any accidents."
	value = 750

/*
/// MARK: Dogtags
*/

/datum/mission/outpost/acquire/bounty
	type_mission = "bounty_dogtags"
	desc = "SolFed has posted several bounties for wanted members of both the Frontiersman and the Clique. Bring back their tags, we'll reward you well."

/datum/mission/outpost/acquire/bounty/ramzi
	value = 5000

/*
/// MARK: 	Salvage
*/

/datum/mission/outpost/acquire/salvage
	name = "Deliver Protolathe"
	desc = "The Nanotrasen Corporation is contracting out to have scientific equipment returned. Looking for a rare circuitboard (R&D Console, Protolathe, Circuit Imprinter) of any type."
	weight = 2
	value = 4000
	duration = 120 MINUTES
	dur_mod_range = 0.3
	container_type = /obj/item/storage/toolbox/bounty/salvage
	objective_type = /obj/item/circuitboard/machine/protolathe
	num_wanted = 1

/datum/mission/outpost/acquire/salvage/console
	name = "Deliver R&D Console"
	desc = "The Nanotrasen Corporation is contracting out to have scientific equipment returned. Looking for a rare circuitboard (R&D Console, Protolathe, Circuit Imprinter) of any type."
	weight = 3
	value = 2500
	duration = 120 MINUTES
	dur_mod_range = 0.3
	container_type = /obj/item/storage/toolbox/bounty/salvage
	objective_type = /obj/item/circuitboard/computer/rdconsole
	num_wanted = 1

/*
/// MARK: Aquarium
*/

/datum/mission/outpost/acquire/aquarium
	type_mission = "aquarium"
	name = "Fish needed for my aquarium!"
	weight = 6
	value = 2800
	duration = 60 MINUTES
	val_mod_range = 0.2
	container_type = /obj/item/storage/fish_case/mission/big

/datum/mission/outpost/acquire/aquarium/New(...)
	. = ..()
	objective_type = pick(/obj/item/fish/clownfish,
						/obj/item/fish/pufferfish,
						/obj/item/fish/cardinal,
						/obj/item/fish/greenchromis,
						/obj/item/fish/trout,
						/obj/item/fish/salmon,
						/obj/item/fish/dwarf_moonfish,
						/obj/item/fish/gunner_jellyfish,
						/obj/item/fish/plasmatetra,
						/obj/item/fish/catfish,
						/obj/item/fish/bass,
						/obj/item/fish/armorfish,
						/obj/item/fish/needlefish,
						)
	desc = "My aquarium is sorely lacking in [initial(objective_type.name)], can you please bring one to me? \
			Don't worry about if it's alive or dead, I have methods."

/datum/mission/outpost/acquire/aquarium/rare
	name = "Rare fish needed for my aquarium!"
	weight = 1
	value = 4600
	val_mod_range = 0.3

/datum/mission/outpost/acquire/aquarium/rare/New(...)
	. = ..()
	objective_type = pick(/obj/item/fish/lanternfish,
						/obj/item/fish/firefish,
						/obj/item/fish/donkfish,
						)
	desc = "I seek to make my beloved aquarium truly spectacular, and to do this I need only the finest fish! \
			Bring me a [initial(objective_type.name)] and I will reward you handsomely."

/datum/mission/outpost/acquire/aquarium/sabatoge
	name = "That bastard has had it good for too long!"
	weight = 1
	value = 6600
	duration = 100 MINUTES

/datum/mission/outpost/acquire/aquarium/sabatoge/New(...)
	. = ..()
	desc = "My arch-nemesis [pick("Rutherford","Baldwin","Anderson","Percival")] thinks his aquarium is so much better than mine, I'll show him! \
			Bring me an emulsijack, and make sure it's alive!"
	objective_type = pick(/obj/item/fish/emulsijack)

/*
/// MARK: Fish
*/

/datum/mission/outpost/acquire/fish
	type_mission = "fish"
	value = 500
	container_type = /obj/item/storage/fish_case/mission/big

/datum/mission/outpost/acquire/fish/big
	type_mission = "fish_big"
	name = "Fish needed for my meal"
	weight = 3
	duration = 80 MINUTES
	objective_type = /obj/item/fish
	container_type = /obj/item/storage/fish_case/mission/big

/*
/// MARK: Plasma
*/

/datum/mission/outpost/acquire/extraction_plasma
	type_mission = "extraction_plasma"
	name = "Plasma required"
	duration = 70 MINUTES
	value = 600
	weight = 1
	container_type = /obj/structure/closet/crate/extraction/plasma
	objective_type = /obj/item/stack/sheet/mineral/plasma
	num_wanted = 250

/*
/// MARK: Mission containers
*/

/obj/structure/closet/mob_capture
	name = "\improper Lifeform Containment Unit"
	desc = "A large closet-like container, used to capture hostile lifeforms for retrieval and analysis. The interior is heavily armored, preventing animals from breaking out while inside."
	icon_state = "abductor"
	icon_door = "abductor"
	color = "#FF88FF"
	drag_slowdown = 1
	max_integrity = 300
	armor = list("melee" = 50, "bullet" = 10, "laser" = 10, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 30, "fire" = 80, "acid" = 70)
	mob_storage_capacity = 1
	max_mob_size = MOB_SIZE_LARGE
	anchorable = FALSE
	can_weld_shut = FALSE

/obj/structure/closet/mob_capture/attack_animal(mob/living/simple_animal/M)
	if(M.loc == src)
		return FALSE
	return ..()

/obj/item/storage/box/true_love
	name = "gift box"
	desc = "A cardboard box covered in gift wrap. Looks like it was wrapped in a hurry."
	icon_state = "giftdeliverypackage3"
	item_state = "gift"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	foldable = null

/obj/item/storage/box/true_love/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = WEIGHT_CLASS_NORMAL
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 5

/obj/item/storage/fish_case/mission
	name = "fish delivery case"
	desc = "A stasis case that keeps fish alive during transportation, or at least stops them from becoming more dead."

/obj/item/storage/fish_case/mission/big
	name = "large fish delivery case"
	desc = "A specialized container for the delivering of large quatities of fish. Guarantees they stay fresh during delivery!."

/obj/item/storage/fish_case/mission/big/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.display_numerical_stacking = TRUE

/obj/item/storage/box/anomaly
	name = "anomaly case"
	desc = "A metallic box made to store anomaly cores. They aren't always the safest to lug around."
	icon = 'icons/obj/nuke_tools.dmi'
	icon_state = "core_container_sealed" //it'd be neat if I could figure out how to make this seal but that's a problem for me in 6 months
	item_state = "tile"
	lefthand_file = 'icons/mob/inhands/misc/tiles_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/tiles_righthand.dmi'
	foldable = null

/obj/item/storage/box/anomaly/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 6
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 4

/obj/item/storage/toolbox/bounty/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 8
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_items = 7

/obj/item/storage/toolbox/bounty/hunt/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 14
	STR.max_w_class = 7
	STR.max_items = 7

/obj/item/storage/toolbox/bounty/salvage/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 6
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_items = 4

/obj/structure/closet/crate/extraction/plasma
	name = "crate for plasma"
	desc = "A plasma crate."
	icon_state = "scicrate"
