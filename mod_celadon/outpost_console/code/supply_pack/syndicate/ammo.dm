/datum/supply_pack/faction/syndicate/ammo
	category = "Ammunition"

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> .22lr
> .357
> 9x18mm
> 10x22mm
> .45
> 5.7x39mm
> 12 Gauge
> 5.56x42mm
> 6.5mm
> .50 BMG
> .410

MARK: .22lr
*/

/datum/supply_pack/faction/syndicate/ammo/c22lr
	name = ".22 LR Ammo Box Crate"
	desc = "Contains a 75-round ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c22lr_hp
	name = ".22 LR HP Ammo Box Crate"
	desc = "Contains a 75-round hollow point ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/hp)
	cost = 310

/datum/supply_pack/faction/syndicate/ammo/c22lr_ap
	name = ".22 LR AP Ammo Box Crate"
	desc = "Contains a 75-round armour piercing ammo box for refilling .22 LR weapons."
	contains = list(/obj/item/storage/box/ammo/c22lr/ap)
	cost = 310

/*
MARK: .357
*/

/datum/supply_pack/faction/syndicate/ammo/a357_ammo_box
	name = ".357 Ammo Box Crate"
	desc = "Contains a 48-round .357 box for revolvers such as the R-23 'Viper' revolver and the HP Firebrand."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 255

/datum/supply_pack/faction/syndicate/ammo/a357hp_ammo_box
	name = ".357 HP Ammo Box Crate"
	desc = "Contains a 48-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 320

/datum/supply_pack/faction/syndicate/ammo/a357match_ammo_box
	name = ".357 Match Ammo Box Crate"
	desc = "Contains a 48-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 320

/*
MARK: 9x18mm
*/

/datum/supply_pack/faction/syndicate/ammo/c9mm_ammo_box
	name = "9x18mm Ammo Box Crate"
	desc = "9x18mm ammo box for guns like the commander. Contains 45 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/syndicate/ammo/c9mmap_ammo_box
	name = "9x18mm AP Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c9mmhp_ammo_box
	name = "9x18mm HP Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/syndicate/ammo/c9mm_rubber
	name = "9x18mm Rubber Ammo Box Crate"
	desc = "Contains a 45-round 9x18mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/*
MARK: 10x22mm
*/

/datum/supply_pack/faction/syndicate/ammo/c10mm_ammo_box
	name = "10x22mm Ammo Box Crate"
	desc = "Contains a 10x22mm ammo box for guns like the Ringneck"
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 350

/datum/supply_pack/faction/syndicate/ammo/c10mm_ammo_box_ap
	name = "10x22mm AP Ammo Box Crate"
	desc = "Contains a 10x22mm AP ammo box for guns like the Ringneck"
	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
	cost = 350

/datum/supply_pack/faction/syndicate/ammo/c10mm_ammo_box_hp
	name = "10x22mm HP Ammo Box Crate"
	desc = "Contains a 10x22mm HP ammo box for guns like the Ringneck"
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 350

/*
MARK: .45
*/

/datum/supply_pack/faction/syndicate/ammo/c45_ammo_box
	name = ".45 Ammo Box Crate"
	desc = "Contains a 48-round .45 box for SMGs like the C-20r 'Cobra'."
	contains = list(/obj/item/storage/box/ammo/c45)
	cost = 210

/datum/supply_pack/faction/syndicate/ammo/c45ap_ammo_box
	name = ".45 AP Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c45_ap)
	cost = 260

/datum/supply_pack/faction/syndicate/ammo/c45hp_ammo_box
	name = ".45 HP Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c45_hp)
	cost = 260

/datum/supply_pack/faction/syndicate/ammo/c45mmrubber_ammo_box
	name = ".45 Rubber Ammo Box Crate"
	desc = "Contains a 48-round .45 box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c45_rubber)
	cost = 210

/*
MARK: 5.7x39mm
*/

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_boxcrate
	name = "5.7x39mm Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39)
	cost = 295

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_ap
	name = "5.7x39mm AP Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/ap)
	cost = 370

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_hp
	name = "5.7x39mm HP Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm Hollow Point box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/hp)
	cost = 370

/datum/supply_pack/faction/syndicate/ammo/c57x39mm_rubber
	name = "5.7x39mm Rubber Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm Rubber box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/rubber)
	cost = 295

/*
MARK: 12 Gauge
*/

/datum/supply_pack/faction/syndicate/ammo/buckshot
	name = "12g Buckshot Crate"
	desc = "Contains a box of 32 12 gauge buckshot shells for use in lethal persuasion."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/syndicate/ammo/slugs
	name = "12g Shotgun Slug Crate"
	desc = "Contains a box of 32 12 gauge slug shells for use in lethal persuasion."
	cost = 205
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/syndicate/ammo/blank_shells
	name = "12g Blank Shell Crate"
	desc = "Contains a box of 12 gauge blank shells."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/syndicate/ammo/rubbershot
	name = "12g Rubbershot Crate"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/syndicate/ammo/techshells
	name = "12g Unloaded Shotgun Technological Shells Crate"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 210
	contains = list(/obj/item/storage/box/techshot)

/*
MARK: 5.56x42mm
*/

/datum/supply_pack/faction/syndicate/ammo/c556_ammo_box
	name = "5.56x42 Ammo Box Crate"
	desc = "Contains a 5.56x42mm ammo box for guns like the SMR-80 Hydra"
	contains = list(/obj/item/storage/box/ammo/a556_42)
	cost = 300

/datum/supply_pack/faction/syndicate/ammo/c556_ammo_box_ap
	name = "5.56x42 AP Ammo Box Crate"
	desc = "Contains a 5.56x42mm AP ammo box for guns like the SMR-80 Hydra"
	contains = list(/obj/item/storage/box/ammo/a556_42/ap)
	cost = 500

/datum/supply_pack/faction/syndicate/ammo/c556_ammo_box_hp
	name = "5.56x42 HP Ammo Box Crate"
	desc = "Contains a 5.56x42mm HP ammo box for guns like the SMR-80 Hydra"
	contains = list(/obj/item/storage/box/ammo/a556_42/hp)
	cost = 375


/*
MARK: 6.5mm
*/

/datum/supply_pack/faction/syndicate/ammo/a65clip_box
	name = "6.5mm Ammo Box Crate"
	desc = "Contains a twenty-round 6.5mm ammo box for various sniper rifles such as the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 200

/datum/supply_pack/faction/syndicate/ammo/a65clip_trackers
	name = "6.5mm Tracker Shell Crate"
	desc = "Contains a 10-round 6.5mm tracker box for various sniper rifles such as the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip/trac)
	cost = 250

/*
MARK: .50 BMG
*/

/datum/supply_pack/faction/syndicate/ammo/ammoa50
	name = ".50 BMG Ammo Box Crate"
	desc = "Contains a 20-round .50 BMG ammo box for the Taipan Anti-Material Rifle. Make them count, they aren't cheap."
	contains = list(/obj/item/storage/box/ammo/a50box)
	cost = 1000

/*
MARK: .410
*/

/datum/supply_pack/faction/independent/ammo/a410_buckshot
	name = ".410 Buckshot Box"
	desc = "Contains a box with 60 buckshot cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box)
	cost = 1000

/datum/supply_pack/faction/independent/ammo/a410_slug
	name = ".410 Slug Box"
	desc = "Contains a box with 60 slug cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/slug)
	cost = 1500

/datum/supply_pack/faction/independent/ammo/a410_flechette
	name = ".410 Flechette Box"
	desc = "Contains a box with 60 flechette rounds of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/flechette)
	cost = 1500
