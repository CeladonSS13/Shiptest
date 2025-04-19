/datum/supply_pack/faction/inteq/ammo
	group = "Ammunition"

/* 9mm */

/datum/supply_pack/faction/inteq/ammo/c9mm_ammo_box
	name = "9mm Ammo Box Crate"
	desc = "9mm ammo box for guns like the commander. Contains 45 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 200

/datum/supply_pack/faction/inteq/ammo/c9mmap_ammo_box
	name = "9mm AP Ammo Box Crate"
	desc = "Contains a 45-round 9mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/c9mmhp_ammo_box
	name = "9mm HP Ammo Box Crate"
	desc = "Contains a 45-round 9mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 250

/datum/supply_pack/faction/inteq/ammo/c9mmrubber_ammo_box
	name = "9mm Rubber Ammo Box Crate"
	desc = "Contains a 45-round 9mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 200

/* .44 */

/datum/supply_pack/faction/inteq/ammo/a44roum
	name = ".44 Roumain Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo."
	contains = list(/obj/item/storage/box/ammo/a44roum)
	cost = 210

/datum/supply_pack/faction/inteq/ammo/a44roum_rubber
	name = ".44 Roumain Rubber Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain ammo loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/a44roum_rubber)
	cost = 210

/datum/supply_pack/faction/inteq/ammo/a44roum_hp
	name = ".44 Roumain Hollow Point Ammo Box Crate"
	desc = "Contains a 48-round box of .44 roumain hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a44roum_hp)
	cost = 265

/* .357 */

/datum/supply_pack/faction/inteq/ammo/a357_ammo_box
	name = ".357 Ammo Box Crate"
	desc = "Contains a 36-round .357 box for Horizon-X revolver."
	contains = list(/obj/item/storage/box/ammo/a357)
	cost = 255

/datum/supply_pack/faction/inteq/ammo/a357hp_ammo_box
	name = ".357 HP Ammo Box Crate"
	desc = "Contains a 36-round .357 box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/a357_hp)
	cost = 320

/datum/supply_pack/faction/inteq/ammo/a357match_ammo_box
	name = ".357 Match Ammo Box Crate"
	desc = "Contains a 36-round .357 match box for better performance against armor."
	contains = list(/obj/item/storage/box/ammo/a357_match)
	cost = 320

/* 12 Gauge */

/datum/supply_pack/faction/inteq/ammo/buckshot
	name = "Buckshot Crate"
	desc = "Contains a box of 32 12 gauge buckshot shells for use in lethal persuasion."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/inteq/ammo/slugs
	name = "Shotgun Slug Crate"
	desc = "Contains a box of 32 12 gauge slug shells for use in lethal persuasion."
	cost = 205
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/inteq/ammo/blank_shells
	name = "Blank Shell Crate"
	desc = "Contains a box of 12 gauge blank shells."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/inteq/ammo/rubbershot
	name = "Rubbershot Crate"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/inteq/ammo/techshells
	name = "Unloaded Shotgun Technological Shells Crate"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 210
	contains = list(/obj/item/storage/box/techshot)

/* 10mm */

/datum/supply_pack/faction/inteq/ammo/c10mm_ammo_box
	name = "10mm Ammo Box Crate"
	desc = "Contains a 36-round 10mm box for SMGs like the SKM-44v Mongrel."
	contains = list(/obj/item/storage/box/ammo/c10mm)
	cost = 210

/datum/supply_pack/faction/inteq/ammo/c10mmap_ammo_box
	name = "10mm AP Ammo Box Crate"
	desc = "Contains a 36-round 10mm box loaded with armor piercing ammo."
	contains = list(/obj/item/storage/box/ammo/c10mm_ap)
	cost = 260

/datum/supply_pack/faction/inteq/ammo/c10mmhp_ammo_box
	name = "10mm HP Ammo Box Crate"
	desc = "Contains a 36-round 10mm box loaded with hollow point ammo, great against unarmored targets."
	contains = list(/obj/item/storage/box/ammo/c10mm_hp)
	cost = 260

/datum/supply_pack/faction/inteq/ammo/c10mmrubber_ammo_box
	name = "10mm Rubber Ammo Box Crate"
	desc = "Contains a 36-round 10mm box loaded with less-than-lethal rubber rounds."
	contains = list(/obj/item/storage/box/ammo/c10mm_rubber)
	cost = 210

/* 7.62 */

/datum/supply_pack/faction/inteq/ammo/a762_ammo_box
	name = "7.62x40mm Ammo Box Crate"
	desc = "Contains two 60-round 7.62x40mm ammo, issued by IRMG."
	contains = list(/obj/item/storage/box/ammo/a762_40/inteq,
					/obj/item/storage/box/ammo/a762_40/inteq)
	cost = 700

/datum/supply_pack/faction/inteq/ammo/a762_ap
	name = "7.62x40mm Armour Piercing Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm Armour Piercing box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/ap)
	cost = 450

/datum/supply_pack/faction/inteq/ammo/a762_hp
	name = "7.62x40mm Hollow Point Ammo Box Crate"
	desc = "Contains one 60-round 7.62x40mm Hollow Point box for the SKM rifles."
	contains = list(/obj/item/storage/box/ammo/a762_40/hp)
	cost = 450

/* .308 */

/datum/supply_pack/faction/inteq/ammo/a308_ammo_box
	name = "308 Ammo Box Crate"
	desc = ".308 ammo box for guns like the F4 SSG-04."
	contains = list(/obj/item/storage/box/ammo/a308)
	cost = 185

/datum/supply_pack/faction/inteq/ammo/a308_ap
	name = "308 Armour Piercing Ammo Box Crate"
	desc = "Contains a thirty-round .308 armour piercing box for DMRs such as the SsG-04 and CM-GAL-S."
	contains = list(/obj/item/storage/box/ammo/a308/ap)
	cost = 230

/datum/supply_pack/faction/inteq/ammo/a308_hp
	name = "308 Hollow Point Ammo Box Crate"
	desc = "Contains a thirty-round .308 hollow point box for DMRs such as the SsG-04 and CM-GAL-S."
	contains = list(/obj/item/storage/box/ammo/a308/hp)
	cost = 230

/datum/supply_pack/faction/inteq/ammo/a308_hp
	name = "308 Hollow Point Ammo Box Crate"
	desc = "Contains a thirty-round .308 hollow point box for DMRs such as the SsG-04 and CM-GAL-S."
	contains = list(/obj/item/storage/box/ammo/a308/hp)
	cost = 500

/* 5.56 */

/datum/supply_pack/faction/inteq/ammo/box556_box
	name = "5.56mm Ammo Box Crate"
	desc = "A box of standard 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box)
	cost = 500

/datum/supply_pack/faction/inteq/ammo/box556/a856_box
	name = "5.56mm EP Ammo Box Crate"
	desc = "A box of enhanced performance 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
	cost = 650

/datum/supply_pack/faction/inteq/ammo/box556/m903_box
	name = "5.56mm AP Ammo Box Crate"
	desc = "A box of armour-piercing 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/m903)
	cost = 1300
