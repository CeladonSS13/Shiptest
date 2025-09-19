/datum/blackmarket_item/weapon/guncase/svd
	name = "SR-33 Dragunov sniper rifle"
	desc = "A semiautomatic sniper rifle, famed for it's marksmanship, and is built from the ground up for it. Fires 7.62x54mmR rounds."
	item = /obj/item/gun/ballistic/automatic/marksman/svd/no_mag
	mag_type = /obj/item/ammo_box/magazine/svd_rounds
	pair_item = list(/datum/blackmarket_item/ammo/svd_rounds)

	cost_min = 3000
	cost_max = 6000
	stock = 1
	availability_prob = 20

/datum/blackmarket_item/weapon/guncase/morita
	name = "Morita Mk.I Rifle"
	desc = "A semiautomatic sniper rifle, famed for it's marksmanship, and is built from the ground up for it. Fires 7.62x54mmR rounds."
	item = /obj/item/gun/ballistic/automatic/assault/morita1/no_mag
	mag_type = /obj/item/ammo_box/magazine/morita1
	pair_item = list(/datum/blackmarket_item/ammo/morita1_rounds)

	cost_min = 15000
	cost_max = 25000
	stock = 1
	availability_prob = 20

/datum/blackmarket_item/weapon/guncase/saiga
	name = "Saiga-410 \"Saiga\""
	desc = "Cамозарядный гладкоствольный карабин, разработанный на Ижевском машиностроительном заводе на базе автомата Калашникова. Предназначен для промысловой и любительской охоты на мелкого и среднего зверя и птицу, может использоваться в качестве спортивно-тренировочного оружия. Калибр 410х76mm."
	item = /obj/item/gun/ballistic/automatic/assault/saiga/no_mag
	mag_type = /obj/item/ammo_box/magazine/saiga
	pair_item = list(/datum/blackmarket_item/ammo/saida_rounds)

	cost_min = 15000
	cost_max = 25000
	stock = 1
	availability_prob = 20

/datum/blackmarket_item/weapon/esword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive. Activating it produces a loud, distinctive noise."
	item = /obj/item/holo/esword

	cost_min = 3500
	cost_max = 4000
	stock = 2
	availability_prob = 20

/datum/blackmarket_item/weapon/mecha_weapon_bay
	name = "Concealed Weapons Bay"
	desc = "Ripley with a laser cannon? 200 Series with a missile rack? Sky's the limit with this omni-compatible weapons bay! (Missiles and lasers not included)"
	item = /obj/item/mecha_parts/weapon_bay/concealed

	cost_min = 1000
	cost_max = 2000
	stock_max = 3
	availability_prob = 20
	spawn_weighting = FALSE
