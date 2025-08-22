/datum/supply_pack/faction/independent/vendor_refill
	category = "Vendor Refills"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/faction/independent/vendor_refill/bartending
	name = "Booze-o-mat and Coffee Supply Crate"
	desc = "Bring on the booze and coffee vending machine refills."
	cost = 700
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee)
	crate_name = "bartending supply crate"

/datum/supply_pack/faction/independent/vendor_refill/cola
	name = "Softdrinks Supply Crate"
	desc = "Got whacked by a toolbox, but you still have those pesky teeth? Get rid of those pearly whites with this soda machine refill, today!"
	cost = 700
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

/datum/supply_pack/faction/independent/vendor_refill/snack
	name = "Snack Supply Crate"
	desc = "One vending machine refill of cavity-bringin' goodness! The number one dentist recommended order!"
	cost = 700
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/faction/independent/vendor_refill/autodrobe
	name = "Autodrobe Supply Crate"
	desc = "Autodrobe missing your favorite dress? Solve that issue today with this autodrobe refill."
	cost = 700
	contains = list(/obj/item/vending_refill/autodrobe)
	crate_name = "autodrobe supply crate"

/datum/supply_pack/faction/independent/vendor_refill/cigarette
	name = "Cigarette Supply Crate"
	desc = "Don't believe the reports - smoke today! Contains a cigarette vending machine refill."
	cost = 700
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"

/datum/supply_pack/faction/independent/vendor_refill/games
	name = "Games Supply Crate"
	desc = "Get your game on with this game vending machine refill."
	cost = 700
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"

/datum/supply_pack/faction/independent/vendor_refill/vend_circ
	name = "Vendor circuit board "
	desc = "Circuit board for building vendors."
	cost = 250
	contains = list(/obj/item/circuitboard/machine/vendor,
					/obj/item/screwdriver)
	crate_name = "vend circuit crate"

/datum/supply_pack/faction/independent/vendor_refill/shaft
	name = "Mining equipment vendor refill"
	desc = "Mining equipment vendor cartridge for replacing in Mining vendors."
	cost = 8000
	contains = list(/obj/item/vending_refill/mining_equipment)
	crate_name = "miner supply crate"

/datum/supply_pack/faction/independent/vendor_refill/sectech
	name = "SecTech vendor refill"
	desc = "SecTech vendor cartridge for replacing in SecTech vendors."
	cost = 4000
	contains = list(/obj/item/vending_refill/security)
	crate_name = "SecTech supply crate"

/datum/supply_pack/faction/independent/vendor_refill/secdrobe
	name = "SecDrobe vendor refill"
	desc = "SecTech vendor cartridge for replacing in SecTech vendors."
	cost = 2000
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe)
	crate_name = "SecDrobe supply crate"
