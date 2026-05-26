/datum/supply_pack/vendor_refill
	category = "Misc - Vendor Refills"
	stable_price = TRUE

/datum/supply_pack/vendor_refill/bartending
	name = "Booze-o-mat and Coffee Supply"
	cost = 700

/datum/supply_pack/vendor_refill/cola
	name = "Softdrinks Supply"
	cost = 700

/datum/supply_pack/vendor_refill/snack
	name = "Snack Supply"
	cost = 700

/datum/supply_pack/vendor_refill/autodrobe
	name = "Autodrobe Supply"
	cost = 700

/datum/supply_pack/vendor_refill/cigarette
	name = "Cigarette Supply"
	cost = 700

/datum/supply_pack/vendor_refill/games
	name = "Games Supply"
	cost = 700

/datum/supply_pack/vendor_refill/vendor_circuit
	name = "Vendor Circuit Board"
	desc = "Circuit board for building vendors."
	cost = 250
	contains = list(
		/obj/item/circuitboard/machine/vendor,
		/obj/item/screwdriver,
	)
	crate_name = "vend circuit crate"

/datum/supply_pack/vendor_refill/mining
	name = "Mining Equipment Supply"
	desc = "Mining equipment vendor cartridge for replacing in Mining vendors."
	cost = 700
	contains = list(/obj/item/vending_refill/mining_equipment)
	crate_name = "miner supply crate"

/datum/supply_pack/vendor_refill/sectech
	name = "SecTech Supply"
	desc = "SecTech vendor cartridge for replacing in SecTech vendors."
	cost = 700
	contains = list(/obj/item/vending_refill/security)
	crate_name = "SecTech supply crate"

/datum/supply_pack/vendor_refill/secdrobe
	name = "SecDrobe Supply"
	desc = "SecDrobe vendor cartridge for replacing in SecDrobe vendors."
	cost = 700
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe)
	crate_name = "SecDrobe supply crate"
