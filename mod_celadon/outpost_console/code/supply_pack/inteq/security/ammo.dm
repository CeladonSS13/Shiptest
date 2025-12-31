/datum/supply_pack/faction/inteq/ammo
	category = "Security - Ammunition"
	stable_price = TRUE

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> 9x18mm
> 10x22mm
> .44 Roumain
> .357
> 12 Gauge
> 7.62x40mm
> .308
> 5.56x45mm

MARK: 9x18mm
*/

/datum/supply_pack/faction/inteq/ammo/c9mm_ammo_box
	name = "9x18mm Ammo Box"
	desc = "9x18mm ammo box for guns like the commander. Contains 45 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/inteq/ammo/c9mmap_ammo_box
	name = "9x18mm AP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/c9mmhp_ammo_box
	name = "9x18mm HP Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/c9mmrubber_ammo_box
	name = "9x18mm Rubber Ammo Box"
	desc = "Contains a 45-round 9x18mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/*
	MARK: 4.63x30mm
*/

/datum/supply_pack/faction/inteq/ammo/wt_ammo_box
	name = "4.6x30mm ammo box"
	desc = "4.6x30mm ammo box for guns like the P46 Schnauzer. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm)
	cost = 300 // old - 500

/datum/supply_pack/faction/inteq/ammo/wt_ammo_box_ap
	name = "4.6x30mm AP ammo box"
	desc = "4.6x30mm AP ammo box for guns like the P46 Schnauzer. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/ap)
	cost = 600 // old - 1000

/datum/supply_pack/faction/inteq/ammo/wt_ammo_box_hp
	name = "4.6x30mm HP ammo box"
	desc = "4.6x30mm HP ammo box for guns like the P46 Schnauzer. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/hp)
	cost = 375 // old - 700

/datum/supply_pack/faction/inteq/ammo/wt_ammo_box_rubber
	name = "4.6x30mm Rubber ammo box"
	desc = "4.6x30mm Rubber ammo box for guns like the P46 Schnauzer. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/rubber)
	cost = 300 // old - 500

/*
	MARK: 10x22mm
*/

/datum/supply_pack/faction/inteq/ammo/c10mm_ammo_box
	name = "10x22mm Ammo Box"
	desc = "Contains a 36-round 10x22mm box for SMGs like the SKM-44v Mongrel."
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 200

/datum/supply_pack/faction/inteq/ammo/c10mmap_ammo_box
	name = "10x22mm AP Ammo Box"
	desc = "Contains a 36-round 10x22mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/c10mmhp_ammo_box
	name = "10x22mm HP Ammo Box"
	desc = "Contains a 36-round 10x22mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/c10mmrubber_ammo_box
	name = "10x22mm Rubber Ammo Box"
	desc = "Contains a 36-round 10x22mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c10mm_rubber)
	cost = 200

/*
	MARK: .44
*/

/datum/supply_pack/faction/inteq/ammo/a44roum
	name = ".44 Roumain Ammo Box"
	desc = "Contains a 48-round box of .44 roumain ammo."
	contains = list(/obj/item/storage/box/ammo/a44roum)
	cost = 200

/datum/supply_pack/faction/inteq/ammo/a44roum_rubber
	name = ".44 Roumain Rubber Ammo Box"
	desc = "Contains a 48-round box of .44 roumain ammo loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a44roum_rubber)
	cost = 200

/datum/supply_pack/faction/inteq/ammo/a44roum_hp
	name = ".44 Roumain Hollow Point Ammo Box"
	desc = "Contains a 48-round box of .44 roumain hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a44roum_hp)
	cost = 350

/*
	MARK: .357
*/

/datum/supply_pack/faction/inteq/ammo/a357_ammo_box
	name = ".357 Ammo Box"
	desc = "Contains a 36-round .357 box for Horizon-X revolver."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/a357hp_ammo_box
	name = ".357 HP Ammo Box"
	desc = "Contains a 36-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 325

/datum/supply_pack/faction/inteq/ammo/a357match_ammo_box
	name = ".357 Match Ammo Box"
	desc = "Contains a 36-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 325

/*
	MARK: 12 Gauge
*/

/datum/supply_pack/faction/inteq/ammo/buckshot
	name = "12g Buckshot"
	desc = "Contains a box of 32 12 gauge buckshot shells for use in lethal persuasion."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/inteq/ammo/slugs
	name = "12g Shotgun Slug"
	desc = "Contains a box of 32 12 gauge slug shells for use in lethal persuasion."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/inteq/ammo/blank_shells
	name = "12g Blank Shell"
	desc = "Contains a box of 12 gauge blank shells."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/inteq/ammo/rubbershot
	name = "12g Rubbershot"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/inteq/ammo/techshells
	name = "12g Unloaded Shotgun Technological Shells"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 200
	contains = list(/obj/item/storage/box/techshot)

/*
	MARK: 7.62
*/

/datum/supply_pack/faction/inteq/ammo/a762_ammo_box
	name = "7.62x40mm Ammo Box"
	desc = "Contains two 120-round 7.62x40mm ammo, issued by IRMG."
	contains = list(/obj/item/storage/box/ammo/a762_40/inteq,
					/obj/item/storage/box/ammo/a762_40/inteq)
	cost = 700

/datum/supply_pack/faction/inteq/ammo/a762_ap
	name = "7.62x40mm Armour Piercing Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Armour Piercing ammo, issued by IRMG."
	contains = list(/obj/item/storage/box/ammo/a762_40/ap/inteq)
	cost = 450

/datum/supply_pack/faction/inteq/ammo/a762_hp
	name = "7.62x40mm Hollow Point Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Hollow Point ammo, issued by IRMG."
	contains = list(/obj/item/storage/box/ammo/a762_40/hp/inteq)
	cost = 450

/*
	MARK: .308
*/

/datum/supply_pack/faction/inteq/ammo/a308_ammo_box
	name = "308 Ammo Box"
	desc = "Contains a thirty-round .308 ammo box for DMRs such as the SsG-04 and CM-GAL-S"
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 200

/datum/supply_pack/faction/inteq/ammo/a308_ap
	name = "308 Armour Piercing Ammo Box"
	desc = "Contains a thirty-round .308 armour piercing box for DMRs such as the SsG-04 and CM-GAL-S."
	contains = list(/obj/item/storage/box/ammo/a308/ap)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/a308_hp
	name = "308 Hollow Point Ammo Box"
	desc = "Contains a thirty-round .308 hollow point box for DMRs such as the SsG-04 and CM-GAL-S."
	contains = list(/obj/item/storage/box/ammo/a308/hp)
	cost = 250

/*
	MARK: 5.56x45mm
*/

/datum/supply_pack/faction/inteq/ammo/box556_box
	name = "5.56x45mm Ammo Box"
	desc = "Contains two 60-round 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box)
	cost = 500

/datum/supply_pack/faction/inteq/ammo/box556/a856_box
	name = "5.56x45mm Enhanced Performance Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Enhanced Performance ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
	cost = 650

/datum/supply_pack/faction/inteq/ammo/box556/m903_box
	name = "5.56x45mm Armour Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Armour Piercing ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/m903)
	cost = 1300

/*
	MARK: 6.5mm / 6.5x57mm
*/

/datum/supply_pack/faction/inteq/ammo/a65clip_box
	name = "6.5mm Ammo Box Crate"
	desc = "Contains a twenty-round 6.5mm ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip)
	cost = 200 //4 ammo efficiency at 40 damage

/datum/supply_pack/faction/inteq/ammo/a65clip_trackers
	name = "6.5mm Tracker Shell Crate"
	desc = "Contains a 10-round 6.5mm tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."
	contains = list(/obj/item/storage/box/ammo/a65clip/trac)
	cost = 250
