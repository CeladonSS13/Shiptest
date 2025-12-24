/datum/supply_pack/faction/solfed/ammo
	category = "Security - Ammunition"
	stable_price = TRUE

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> .357
> 9x18mm
> 5.56x42mm
> 5.56 HITP Caseless
> 6.5x57mm
> 7.62x40mm

> Ferroslugs
> Ferro Pellets
> Ferro Lances
> 8x58mm
*/

/*
	MARK: .357
*/

/datum/supply_pack/faction/solfed/ammo/a357_ammo_box
	name = ".357 Ammo Box"
	desc = "Contains a 48-round .357 box for revolvers such as the R-23 'Viper' revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 300

/datum/supply_pack/faction/solfed/ammo/a357hp_ammo_box
	name = ".357 HP Ammo Box"
	desc = "Contains a 48-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 400

/datum/supply_pack/faction/solfed/ammo/a357match_ammo_box
	name = ".357 Match Ammo Box"
	desc = "Contains a 48-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 400

/*
	MARK: 9x18mm
*/

/datum/supply_pack/faction/solfed/ammo/c9mm_ammo_box
	name = "9x18mm Ammo Box"
	desc = "9x18mm ammo box for guns like the Vector. Contains 45 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/solfed/ammo/c9mmap_ammo_box
	name = "9x18mm AP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/solfed/ammo/c9mmhp_ammo_box
	name = "9x18mm HP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/solfed/ammo/c9mmrubber_ammo_box
	name = "9x18mm Rubber Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/*
	MARK: 5.56x45mm
*/

/datum/supply_pack/faction/solfed/ammo/box556_box
	name = "5.56x45mm Ammo Box"
	desc = "Contains one 60-round 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box)
	cost = 500

/datum/supply_pack/faction/solfed/ammo/box556/a856_box
	name = "5.56x45mm Enhanced Performance Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Enhanced Performance ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
	cost = 650

/datum/supply_pack/faction/solfed/ammo/box556/m903_box
	name = "5.56x45mm Armour Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Armour Piercing ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/m903)
	cost = 1300

/*
	MARK: 5.56 HITP Caseless
*/

/datum/supply_pack/faction/solfed/ammo/c556mmHITP_ammo_box
	name = "5.56 HITP Caseless Ammo Box"
	desc = "Contains a 48-round 5.56mm caseless box for SolFed sidearms like the Pistole C."
	contains = list(/obj/item/storage/box/ammo/c556mm)
	cost = 150

/datum/supply_pack/faction/solfed/ammo/c556mmHITPap_ammo_box
	name = "5.56 HITP Caseless AP Ammo Box"
	desc = "Contains a 48-round 5.56mm caseless boxloaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c556mm_ap)
	cost = 200

/datum/supply_pack/faction/solfed/ammo/c556mmhitphp_ammo_box
	name = "5.56 HITP Caseless HP Ammo Box"
	desc = "Contains a 48-round 5.56mm caseless box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c556mm_hp)
	cost = 200

/datum/supply_pack/faction/solfed/ammo/c556HITPrubber_ammo_box
	name = "5.56 HITP Caseless Rubber Ammo Box"
	desc = "Contains a 48-round 5.56 caseless box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c556mm_rubber)
	cost = 150

/*
	MARK: 5.56x42mm
*/

/datum/supply_pack/faction/solfed/ammo/a556_ammo_box
	name = "5.56x42mm Ammo Box"
	desc = "Contains one 60-round 5.56x42mm box."
	contains = list(/obj/item/storage/box/ammo/a556_42)
	cost = 700

/datum/supply_pack/faction/solfed/ammo/a556_ap
	name = "5.56x42mm Armour Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Armour Piercing box."
	contains = list(/obj/item/storage/box/ammo/a556_42/ap)
	cost = 1000

/datum/supply_pack/faction/solfed/ammo/a556_hp
	name = "5.56x42mm Hollow Point Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Hollow Point box."
	contains = list(/obj/item/storage/box/ammo/a556_42/hp)
	cost = 1000

/*
	MARK: 6.5x57mm
*/

/datum/supply_pack/faction/solfed/ammo/a65clip_box
	name = "6.5x57mm Ammo Box"
	desc = "Contains a twenty-round 6.5x57mm ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 500

/datum/supply_pack/faction/solfed/ammo/ammoa65clip_trackers
	name = "6.5x57mm Tracker Shell"
	desc = "Contains a 10-round 6.5x57mm tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip/trac)
	cost = 600

/*
	MARK: 7.62x40mm
*/

/datum/supply_pack/faction/solfed/ammo/ammoa762_ammo_box
	name = "7.62x40mm Ammo Box"
	desc = "Contains one 60-round 7.62x40mm box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40)
	cost = 350

/datum/supply_pack/faction/solfed/ammo/ammoa762_ap
	name = "7.62x40mm AP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Armour Piercing box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/ap)
	cost = 600

/datum/supply_pack/faction/solfed/ammo/ammoa762_hp
	name = "7.62x40mm HP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Hollow Point box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/hp)
	cost = 600

/datum/supply_pack/faction/solfed/ammo/a762_40_rubber
	name = "7.62x40mm Rubber Ammo Box"
	desc = "A box of standard 7.62x40mm rubber ammo."
	contains = list(/obj/item/storage/box/ammo/a762_40/rubber)
	cost = 800

/*
	MARK: .308
*/

/datum/supply_pack/faction/solfed/ammo/a308_box
	name = ".308 Ammo Box"
	desc = "Contains a 40-round .308 box."
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 650

// /datum/supply_pack/faction/solfed/ammo/a308_rubber_box
// 	name = ".308 Rubber Ammo Box"
// 	desc = "Contains a 40-round .308 box loaded with less-than-lethal rubber rounds."
// 	contains = list(/obj/item/storage/box/ammo/a308/a308_rub)
// 	cost = 300

/datum/supply_pack/faction/solfed/ammo/a308_sp_box
	name = ".308 SP Ammo Box"
	desc = "Contains a 40-round .308 box loaded with soft point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a308/hp)
	cost = 800

// /datum/supply_pack/faction/solfed/ammo/a308_ap_box
// 	name = ".308 AP Ammo Box"
// 	desc = "Contains a 40-round .308 box loaded with armor piercing ammo."
// 	contains = list(/obj/item/storage/box/ammo/a308/ap)
// 	cost = 1300

/*
	MARK: Ferroslugs
*/

/datum/supply_pack/faction/solfed/ammo/ferroslugboxcrate
	name = "Ferromagnetic Slug (FE slug) Box"
	desc = "Contains a 48-round ferromagnetic slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug)
	cost = 175

/datum/supply_pack/faction/solfed/ammo/hcslugs
	name = "High Conductivity Slug (FE slug) Box"
	desc = "Contains a 48-round high conductivity slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug/hc)
	cost = 225

/*
	MARK: Ferro Pellets
*/

/datum/supply_pack/faction/solfed/ammo/ferropelletboxcrate
	name = "Ferromagnetic Pellet (FE pellet) Box"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 200 //5.7 ammo efficiency at 25 damage

/datum/supply_pack/faction/solfed/ammo/hcpellets
	name = "High Conductivity Pellet (FE pellet) Box"
	desc = "Contains a 48-round high conductivity pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet/hc)
	cost = 250

/*
	MARK: Ferro Lances
*/

/datum/supply_pack/faction/solfed/ammo/ferrolanceboxcrate
	name = "Ferromagnetic Lance (FE lance) Box"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance)
	cost = 300 //5 ammo efficiency at 30 damage

/datum/supply_pack/faction/solfed/ammo/ferrolanceboxcrate_hc
	name = "High Conductivity Lance (FE lance) Box"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance/hc)
	cost = 350

/*
	MARK: 8x58mm
*/

/datum/supply_pack/faction/solfed/ammo/a858
	name = "8x58mm Ammo Box"
	desc = "Contains a 20-round 8x58 ammo box for Solarian-manufactured sniper rifles, such as the SSG-69."
	contains = list(/obj/item/storage/box/ammo/a858)
	cost = 200

/datum/supply_pack/faction/solfed/ammo/a858_box
	name = "8x58mm Caseless Ammo box"
	desc = "Contains a 8x58mm Caseless Ammo box for the standard-issue SSG-669C, containing 40-rounds."
	contains = list(/obj/item/storage/box/ammo/a858)
	cost = 400

