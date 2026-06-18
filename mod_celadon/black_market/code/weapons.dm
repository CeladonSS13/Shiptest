/datum/blackmarket_item/weapon/guncase/svd
	name = "SR-33 Dragunov sniper rifle"
	desc = "A semiautomatic sniper rifle, famed for it's marksmanship, and is built from the ground up for it. Fires 7.62x54mmR rounds."
	item = /obj/item/gun/ballistic/automatic/marksman/svd/no_mag
	mag_type = /obj/item/ammo_box/magazine/svd_rounds
	pair_item = list(/datum/blackmarket_item/ammo/svd_rounds)

	cost_min = 3800
	cost_max = 4000
	stock_min = 1
	stock_max = 1
	availability_prob = 20

/datum/blackmarket_item/weapon/esword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive. Activating it produces a loud, distinctive noise."
	item = /obj/item/holo/esword

	cost_min = 3500
	cost_max = 4000
	stock_min = 1
	stock_max = 2
	availability_prob = 20

/datum/blackmarket_item/weapon/mecha_weapon_bay
	name = "Concealed Weapons Bay"
	desc = "Ripley with a laser cannon? 200 Series with a missile rack? Sky's the limit with this omni-compatible weapons bay! (Missiles and lasers not included)"
	item = /obj/item/mecha_parts/weapon_bay/concealed

	cost_min = 1000
	cost_max = 2000
	stock_min = 1
	stock_max = 3
	availability_prob = 20
	spawn_weighting = FALSE

// возвращаю сюда старые пушки
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
	name = "Cycler Shotgun"
	desc = "Perpetuate the cycle of violence with this dual feed shotgun! Has two built in 4 shell magazine tubes that can be swapped at the press of a button!"
	item = /obj/item/gun/ballistic/shotgun/automatic/negotiator/old
	gun_unloaded = FALSE
	mag_number = 0

	cost_min = 2500
	cost_max = 4000
	stock = 2
	availability_prob = 25


// MARK: SRM guns
/datum/blackmarket_item/weapon/guncase/vickland
	name = "Vickland Battle Rifle"
	desc = "Somehow-somewhere somewho has been seen with this gun. Now you see this gun here. It's a high-powered semi-automatic battle rifle chambered in 8x50mmR and produced by Hunter's Pride. Fed via stripper clips with a 10 round capacity."
	cost_min = 3000
	cost_max = 4000
	item = /obj/item/gun/ballistic/automatic/marksman/vickland
	pair_item = list(/datum/blackmarket_item/ammo/c8x50mm_box)
	gun_unloaded = FALSE
	mag_number = 0

	stock_min = 1
	stock_max = 2
	availability_prob = 25

/datum/blackmarket_item/weapon/guncase/invictus
	name = "Invictus Automatic Rifle"
	desc = "A pretty big gun for hunting pretty big creatures. The gun itself has been hunted, so the price is high. It's a high-powered automattic rifle chambered in .308 and produced by Hunter's Pride. Comes with two magazines with a 20 round capacity."
	cost_min = 5000
	cost_max = 6500
	item = /obj/item/gun/ballistic/automatic/assault/invictus
	pair_item = list(/datum/blackmarket_item/ammo/invictus)
	stock_min = 1
	stock_max = 2
	availability_prob = 25

/datum/blackmarket_item/weapon/guncase/twobore
	name = "HP Huntsman double-barrel shotgun"
	desc = "Incredibly big double-barrel shotgun! But the previous owner is not so big now. If you want an intact trophy, don't aim for the head. Chambered in two-bore."
	item = /obj/item/gun/ballistic/shotgun/doublebarrel/twobore
	gun_unloaded = FALSE
	mag_number = 0
	pair_item = list(/datum/blackmarket_item/ammo/twobore_box)

	cost_min = 4000
	cost_max = 5000
	stock = 1
	availability_prob = 25

// MARK: Mower (.308)
/datum/blackmarket_item/weapon/guncase/mower
	name = "Machinegun \"Mower\""
	desc = "FUCKING HELL, JERRY! A hefty and relatively accurate HMG, the Mower is built for heavy fire support on the move. Chambered in .308."
	item = /obj/item/gun/ballistic/automatic/hmg/mower
	pair_item = list(/datum/blackmarket_item/ammo/mower)

	cost_min = 5000
	cost_max = 6500
	stock = 1
	availability_prob = 25
