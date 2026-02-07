/datum/supply_pack/faction/syndicate/ammo
	category = "Security - Ammunition"
	stable_price = TRUE

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> .357
> 10x22mm
> .45
> 5.7x39mm
> 12 Gauge
> 5.56x42mm
> 6.5mm
> .50 BMG

- Ferroslugs
- Ferro Pellets
- Ferro Lances
- .22lr
- 9x18mm

MARK: .22lr
*/

/*
/datum/supply_pack/faction/syndicate/ammo/c22lr
	name = ".22 LR Ammo Box"
	desc = "Contains a 75-round ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c22lr_hp
	name = ".22 LR HP Ammo Box"
	desc = "Contains a 75-round hollow point ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/hp)
	cost = 300

/datum/supply_pack/faction/syndicate/ammo/c22lr_ap
	name = ".22 LR AP Ammo Box"
	desc = "Contains a 75-round armour piercing ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/ap)
	cost = 300
*/

/*
	MARK: .357
*/

/datum/supply_pack/faction/syndicate/ammo/a357_ammo_box
	name = ".357 Ammo Box"
	desc = "Contains a 48-round .357 box for revolvers such as the R-23 'Viper' revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/a357hp_ammo_box
	name = ".357 HP Ammo Box"
	desc = "Contains a 48-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 325

/datum/supply_pack/faction/syndicate/ammo/a357match_ammo_box
	name = ".357 Match Ammo Box"
	desc = "Contains a 48-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 325

/*
	MARK: 9x18mm
*/

/* 9x18mm - Do not like Syndicate
/datum/supply_pack/faction/syndicate/ammo/c9mm_ammo_box
	name = "9x18mm Ammo Box"
	desc = "9x18mm ammo box for guns like the commander. Contains 45 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/syndicate/ammo/c9mmap_ammo_box
	name = "9x18mm AP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c9mmhp_ammo_box
	name = "9x18mm HP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c9mm_rubber
	name = "9x18mm Rubber Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200
*/

/*
	MARK: 10x22mm
*/

/datum/supply_pack/faction/syndicate/ammo/c10mm_ammo_box
	name = "10x22mm Ammo Box"
	desc = "Contains a 10x22mm ammo box for guns like the Ringneck"
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 350

/datum/supply_pack/faction/syndicate/ammo/c10mm_ammo_box_ap
	name = "10x22mm AP Ammo Box"
	desc = "Contains a 10x22mm AP ammo box for guns like the Ringneck"
	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
	cost = 350

/datum/supply_pack/faction/syndicate/ammo/c10mm_ammo_box_hp
	name = "10x22mm HP Ammo Box"
	desc = "Contains a 10x22mm HP ammo box for guns like the Ringneck"
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 350

/*
	MARK: .45
*/

/datum/supply_pack/faction/syndicate/ammo/c45_ammo_box
	name = ".45 Ammo Box"
	desc = "Contains a 48-round .45 box for SMGs like the C-20r 'Cobra'."
	contains = list(/obj/item/storage/box/ammo/c45)
	cost = 200

/datum/supply_pack/faction/syndicate/ammo/c45ap_ammo_box
	name = ".45 AP Ammo Box"
	desc = "Contains a 48-round .45 box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c45_ap)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c45hp_ammo_box
	name = ".45 HP Ammo Box"
	desc = "Contains a 48-round .45 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c45_hp)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c45mmrubber_ammo_box
	name = ".45 Rubber Ammo Box"
	desc = "Contains a 48-round .45 box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c45_rubber)
	cost = 200

/*
	MARK: 5.7x39mm
*/

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_boxcrate
	name = "5.7x39mm Ammo Box"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39)
	cost = 300

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_ap
	name = "5.7x39mm AP Ammo Box"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/ap)
	cost = 375

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_hp
	name = "5.7x39mm HP Ammo Box"
	desc = "Contains one 80-round 5.7x39mm Hollow Point box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/hp)
	cost = 375

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_rubber
	name = "5.7x39mm Rubber Ammo Box"
	desc = "Contains one 80-round 5.7x39mm Rubber box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/rubber)
	cost = 300

/*
	MARK: 12 Gauge
*/

/datum/supply_pack/faction/syndicate/ammo/buckshot
	name = "12g Buckshot"
	desc = "Contains a box of 32 12 gauge buckshot shells for use in lethal persuasion."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/syndicate/ammo/slugs
	name = "12g Shotgun Slug"
	desc = "Contains a box of 32 12 gauge slug shells for use in lethal persuasion."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/syndicate/ammo/blank_shells
	name = "12g Blank Shell"
	desc = "Contains a box of 12 gauge blank shells."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/syndicate/ammo/rubbershot
	name = "12g Rubbershot"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/syndicate/ammo/techshells
	name = "12g Unloaded Shotgun Technological Shells"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 200
	contains = list(/obj/item/storage/box/techshot)

/*
	MARK: 5.56x42mm
*/

/datum/supply_pack/faction/syndicate/ammo/c556_ammo_box
	name = "5.56x42 Ammo Box"
	desc = "Contains a 5.56x42mm ammo box for guns like the SMR-80 Hydra"
	contains = list(/obj/item/storage/box/ammo/a556_42)
	cost = 300

/datum/supply_pack/faction/syndicate/ammo/c556_ammo_box_ap
	name = "5.56x42 AP Ammo Box"
	desc = "Contains a 5.56x42mm AP ammo box for guns like the SMR-80 Hydra"
	contains = list(/obj/item/storage/box/ammo/a556_42/ap)
	cost = 500

/datum/supply_pack/faction/syndicate/ammo/c556_ammo_box_hp
	name = "5.56x42 HP Ammo Box"
	desc = "Contains a 5.56x42mm HP ammo box for guns like the SMR-80 Hydra"
	contains = list(/obj/item/storage/box/ammo/a556_42/hp)
	cost = 375


/*
	MARK: 6.5mm
*/

/datum/supply_pack/faction/syndicate/ammo/a65clip_box
	name = "6.5mm Ammo Box"
	desc = "Contains a twenty-round 6.5mm ammo box for various sniper rifles such as the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 200

/datum/supply_pack/faction/syndicate/ammo/a65clip_trackers
	name = "6.5mm Tracker Shell"
	desc = "Contains a 10-round 6.5mm tracker box for various sniper rifles such as the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip/trac)
	cost = 250

/*
	MARK: .50 BMG
*/

/datum/supply_pack/faction/syndicate/ammo/ammoa50
	name = ".50 BMG Ammo Box"
	desc = "Contains a 20-round .50 BMG ammo box for the Taipan Anti-Material Rifle. Make them count, they aren't cheap."
	contains = list(/obj/item/storage/box/ammo/a50box)
	cost = 1000

/*
	MARK: FE - Ferromagnetic
*/
/* // SUNS - NEED TECH DISK
/datum/supply_pack/faction/syndicate/ammo/ferroslugboxcrate
	name = "Ferromagnetic Slug (FE slug) Box"
	desc = "Contains a 48-round ferromagnetic slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug)
	cost = 200

/datum/supply_pack/faction/syndicate/ammo/hcslugs
	name = "High Conductivity Slug (FE slug) Box"
	desc = "Contains a 48-round high conductivity slug for gauss guns such as the Model-H."
	contains = list(/obj/item/storage/box/ammo/ferroslug/hc)
	cost = 250


/datum/supply_pack/faction/syndicate/ammo/ferropelletboxcrate
	name = "Ferromagnetic Pellet (FE pellet) Box"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 300 //5.7 ammo efficiency at 25 damage

/datum/supply_pack/faction/syndicate/ammo/hcpellets
	name = "High Conductivity Pellet (FE pellet) Box"
	desc = "Contains a 48-round high conductivity pellet ammo box for gauss guns such as the Claris."
	contains = list(/obj/item/storage/box/ammo/ferropellet/hc)
	cost = 400

/datum/supply_pack/faction/syndicate/ammo/ferrolanceboxcrate
	name = "Ferromagnetic Lance (FE lance) Box"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance)
	cost = 300 //5 ammo efficiency at 30 damage

/datum/supply_pack/faction/syndicate/ammo/ferrolanceboxcrate_hc
	name = "High Conductivity Lance (FE lance) Box"
	desc = "Contains a 48-round box for high-powered gauss guns such as the GAR assault rifle."
	contains = list(/obj/item/storage/box/ammo/ferrolance/hc)
	cost = 400
*/
