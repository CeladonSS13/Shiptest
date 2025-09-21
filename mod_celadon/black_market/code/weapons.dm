/datum/blackmarket_item/weapon/guncase/svd
	name = "SR-33 Dragunov sniper rifle"
	desc = "A semiautomatic sniper rifle, famed for it's marksmanship, and is built from the ground up for it. Fires 7.62x54mmR rounds."
	item = /obj/item/gun/ballistic/automatic/marksman/svd/no_mag
	mag_type = /obj/item/ammo_box/magazine/svd_rounds
	pair_item = list(/datum/blackmarket_item/ammo/svd_rounds)

	cost_min = 7000
	cost_max = 12000
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
