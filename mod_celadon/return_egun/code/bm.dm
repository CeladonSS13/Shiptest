/datum/blackmarket_item/weapon/guncase/proto_gauss
	name = "Prototype Gauss Rifle"
	desc = "A prototype gauss rifle made by Nanotrasen. Perfect for making swiss cheese out of people. Chambered in ferromagnetic pellets."
	item = /obj/item/gun/ballistic/automatic/powered/gauss
	pair_item = list(/datum/blackmarket_item/ammo/proto_gauss_mag)

	cost_min = 1500
	cost_max = 3500
	stock = 2
	availability_prob = 25

/datum/blackmarket_item/weapon/guncase/cycler_old
	name = "Cycler Old Shotgun"
	desc = "Perpetuate the cycle of violence with this dual feed shotgun! Has two built in 4 shell magazine tubes that can be swapped at the press of a button!"
	item = /obj/item/gun/ballistic/shotgun/automatic/dual_tube
	gun_unloaded = FALSE
	mag_number = 0

	cost_min = 2500
	cost_max = 4000
	stock = 2
	availability_prob = 25
