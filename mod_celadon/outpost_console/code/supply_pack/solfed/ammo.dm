/datum/supply_pack/faction/solfed/ammo
	group = "Ammunition"

/* 9mm */

/datum/supply_pack/faction/solfed/ammo/c9mm_ammo_box
	name = "9mm Ammo Box Crate"
	desc = "9mm ammo box for guns like the Vector. Contains 45 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/solfed/ammo/c9mmap_ammo_box
	name = "9mm AP Ammo Box Crate"
	desc = "Contains a 45-round 9mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/solfed/ammo/c9mmhp_ammo_box
	name = "9mm HP Ammo Box Crate"
	desc = "Contains a 45-round 9mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/solfed/ammo/c9mmrubber_ammo_box
	name = "9mm Rubber Ammo Box Crate"
	desc = "Contains a 45-round 9mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/* 5.56 caseless */

/datum/supply_pack/faction/solfed/ammo/c556mmHITP_ammo_box
	name = "5.56 Caseless Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless box for SolGov sidearms like the Pistole C."
	contains = list(/obj/item/storage/box/ammo/c556mm)
	cost = 165

/datum/supply_pack/faction/solfed/ammo/c556mmHITPap_ammo_box
	name = "5.56 Caseless AP Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless boxloaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c556mm_ap)
	cost = 205

/datum/supply_pack/faction/solfed/ammo/c556mmhitphp_ammo_box
	name = "5.56 Caseless HP Ammo Box Crate"
	desc = "Contains a 48-round 5.56mm caseless box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c556mm_hp)
	cost = 205

/datum/supply_pack/faction/solfed/ammo/c556HITPrubber_ammo_box
	name = "5.56 Caseless Rubber Ammo Box Crate"
	desc = "Contains a 48-round 5.56 caseless box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c556mm_rubber)
	cost = 165

/* ferroslugs */

/datum/supply_pack/faction/solfed/ammo/ferroslugboxcrate
	name = "Ferromagnetic Slug Box Crate"
	desc = "Contains a 48-round ferromagnetic slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug)
	cost = 175

/datum/supply_pack/faction/solfed/ammo/hcslugs
	name = "High Conductivity Slug Box Crate"
	desc = "Contains a 48-round high conductivity slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug/hc)
	cost = 215

/* ferro pellets */

/datum/supply_pack/faction/solfed/ammo/ferropelletboxcrate
	name = "Ferromagnetic Pellet Box Crate"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 210 //5.7 ammo efficiency at 25 damage

/datum/supply_pack/faction/solfed/ammo/hcpellets
	name = "High Conductivity Pellet Box Crate"
	desc = "Contains a 48-round high conductivity pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet/hc)
	cost = 260

/* ferro lances */

/datum/supply_pack/faction/solfed/ammo/ferrolanceboxcrate
	name = "Ferromagnetic Lance Box Crate"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance)
	cost = 285 //5 ammo efficiency at 30 damage

/datum/supply_pack/faction/solfed/ammo/ferrolanceboxcrate_hc
	name = "High Conductivity Lance Box Crate"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance/hc)
	cost = 360

/* 8x58mm Caseless */

/datum/supply_pack/faction/solfed/ammo/a858
	name = "8x58mm Ammo Box Crate"
	desc = "Contains a 20-round 8x58 ammo box for Solarian-manufactured sniper rifles, such as the SSG-69."
	contains = list(/obj/item/storage/box/ammo/a858)
	cost = 200

/datum/supply_pack/faction/solfed/ammo/a858_box
	name = "8x58mm Caseless Ammo box"
	desc = "Contains a 8x58mm Caseless Ammo box for the standard-issue SSG-669C, containing 40-rounds."
	contains = list(/obj/item/storage/box/ammo/a858_ammo_box)
	cost = 400
