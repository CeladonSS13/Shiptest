/datum/mission/ruin/multiple/moonshine_crates
	name = "Retrieve Booze"
	desc = "So... Uh.. I'm looking for someone to go pick up the alcohol I bought from a local brewer. They said they deliver - but it's been like 3 weeks, and I really need this for a party... Can you go and pick it up from them?"
	author = "Guy Raelman"
	faction = /datum/faction/independent
	value = 1750
	mission_limit = 1
	setpiece_item = /obj/item/storage/bottles/moonshine/sealed
	specific_item = FALSE
	required_count = 3

/datum/mission/ruin/multiple/moonshine_crates/distillery
	name = "Assess and Retrieve Booze Supply"
	desc = "One of the main suppliers of my store's moonshine has stopped shipping out our orders, and we still have several outstanding! Find our sealed crates of booze and bring them back."
	author = "Tallymere Party Store"
	mission_limit = 1
	value = 2500

/* Aurora wrote these */

/datum/mission/ruin/multiple/notes
	name = "recover research notes"
	desc = "Hello, on behalf of Cybersun Biodynamics, we are offering an active bounty on the return of the research notes of Dr. Margret Kithin, located in a former base of operations of which we lost contact with in recent years. Last we saw, the facility had been claimed by pirate elements, who seemed keen on desecrating the facility. We only care about our research being returned."
	faction = /datum/faction/syndicate/cybersun
	value = 8000
	mission_limit = 1
	setpiece_item = /obj/item/documents/syndicate/cybersun/biodynamics
	required_count = 2

/datum/mission/ruin/multiple/e11_stash
	name = "recover a stash of Eoehoma weapons"
	desc = "My first mate found an Eoehoma document detailing a production plant for energy weapons in the sector, we'll pay well if you can recover and deliver 6 guns back to us."
	faction = /datum/faction/independent
	value = 2750
	mission_limit = 1
	setpiece_item = /obj/item/gun/energy/e_gun/e11
	required_count = 6

// СМ. -> code/datums/ruins/whitesands.dm
// /datum/mission/ruin/multiple/e11_stash/can_turn_in(atom/movable/item_to_check)
// 	if(istype(item_to_check, /obj/item/gun))
// 		var/obj/item/gun/eoehoma_gun = item_to_check
// 		if(eoehoma_gun.manufacturer == MANUFACTURER_EOEHOMA)
// 			return TRUE
