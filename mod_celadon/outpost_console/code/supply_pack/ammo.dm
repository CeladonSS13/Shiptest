/datum/supply_pack/ammo
	category = "Security - Ammunition"
	stable_price = TRUE

// MARK: 4.6x30
/datum/supply_pack/ammo/c46x30mm_boxcrate
	name = "4.6x30mm Ammo Box"

/datum/supply_pack/ammo/c46x30mm_ap
	name = "4.6x30mm Armor Piercing Ammo Box"

/datum/supply_pack/ammo/c46x30mm_hp
	name = "4.6x30mm Hollow Point Ammo Box"

/datum/supply_pack/ammo/c46x30mm_rubber
	name = "4.6x30mm Rubber Ammo Box"
	desc = "Contains a 80-round 4.6x30mm hollow point box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm/rubber)
	cost = 300

// MARK: 5.7x39
/datum/supply_pack/ammo/c57x39mm_boxcrate
	name = "5.7x39mm Ammo Box"

/datum/supply_pack/ammo/c57x39mm_ap
	name = "5.7x39mm Armour Piercing Ammo Box"
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/ammo/c57x39mm_hp
	name = "5.7x39mm Hollow Point Ammo Box"

/datum/supply_pack/ammo/c57x39mm_rubber
	name = "5.7x39mm Rubber Ammo Box"
	desc = "Contains one 80-round 5.7x39mm rubber box for PDWs such as the Sidewinder."
	contains = list(/obj/item/storage/box/ammo/c57x39/rubber)
	cost = 300
	faction = /datum/faction/syndicate
	faction_locked = TRUE
	faction_discount = 0

/datum/supply_pack/ammo/a762_rubber
	name = "7.62x40mm CLIP Rubber Ammo Box"
	desc = "A box of standard 7.62x40mm rubber ammo."
	contains = list(/obj/item/storage/box/ammo/a762_40/rubber)
	cost = 800
	faction = /datum/faction/solgov
	faction_locked = TRUE
	faction_discount = 0

// MARK: .410
/datum/supply_pack/ammo/a410_buckshot
	name = ".410 Buckshot Box"
	desc = "Contains a box with 60 buckshot cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box)
	cost = 1000

/datum/supply_pack/ammo/a410_flechette
	name = ".410 Flechette Box"
	desc = "Contains a box with 60 flechette rounds of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/flechette)
	cost = 1500

/datum/supply_pack/ammo/a410_slug
	name = ".410 Slug Box"
	desc = "Contains a box with 60 slug cartridges of .410 caliber."
	contains = list(/obj/item/storage/box/ammo/a410_ammo_box/slug)
	cost = 2000

// MARK: 5.56x45mm
/datum/supply_pack/ammo/box556_box
	name = "5.56x45mm Ammo Box"
	desc = "Contains one 60-round 5.56x45mm ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box)
	cost = 500

/datum/supply_pack/ammo/box556/a856_box
	name = "5.56x45mm Enhanced Performance Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Enhanced Performance ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/a856)
	cost = 650

/datum/supply_pack/ammo/box556/m903_box
	name = "5.56x45mm Armor Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Armor Piercing ammo."
	contains = list(/obj/item/storage/box/ammo/a556_box/m903)
	cost = 1300

/datum/supply_pack/ammo/c22lr
	available = FALSE

/datum/supply_pack/ammo/c22lr_hp
	available = FALSE

/datum/supply_pack/ammo/c22lr_ap
	available = FALSE

/datum/supply_pack/ammo/c299
	available = FALSE

/datum/supply_pack/ammo/a556_ammo_box
	name = "5.56x42mm Ammo Box"
	desc = "Contains one 60-round 5.56x42mm box."
	faction = /datum/faction/solgov
	faction_locked = TRUE

/datum/supply_pack/ammo/a556_ammo_box/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a556_ap
	name = "5.56x42mm Armor Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Armor Piercing box."
	faction = /datum/faction/solgov
	faction_locked = TRUE

/datum/supply_pack/ammo/a556_ap/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a556_hp
	name = "5.56x42mm Hollow Point Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Hollow Point box."
	faction = /datum/faction/solgov
	faction_locked = TRUE

/datum/supply_pack/ammo/a556_hp/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a65clip_box
	name = "6.5mm Ammo Box"
	desc = "Contains a twenty-round 6.5mm ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."

/datum/supply_pack/ammo/a65clip_trackers
	name = "6.5mm Tracker Shell"
	desc = "Contains a 10-round 6.5mm tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."

/datum/supply_pack/ammo/a762_ammo_box
	name = "7.62x40mm Ammo Box"
	desc = "Contains one 60-round 7.62x40mm box for the SKM rifles."

/datum/supply_pack/ammo/a762_ap
	name = "7.62x40mm AP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Armor Piercing box for the SKM rifles."

/datum/supply_pack/ammo/a762_hp
	name = "7.62x40mm HP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Hollow Point box for the SKM rifles."

/datum/supply_pack/ammo/a308_ammo_box
	name = ".308 Ammo Box"
	desc = "Contains a 40-round .308 box."

/datum/supply_pack/ammo/a308_ap
	name = ".308 AP Ammo Box"
	desc = "Contains a 40-round .308 armor piercing box."
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/ammo/a308_hp
	name = ".308 HP Ammo Box"
	desc = "Contains a 40-round .308 box loaded with hollow point ammo, great against unarmored targets."

/datum/supply_pack/ammo/a300_box
	name = ".300 Ammo Box"

/datum/supply_pack/ammo/a300_trac
	name = ".300 Trac Ammo Box"

/datum/supply_pack/ammo/a357_ammo_box
	name = ".357 Ammo Box"

/datum/supply_pack/ammo/a357hp_ammo_box
	name = ".357 HP Ammo Box"

/datum/supply_pack/ammo/a357match_ammo_box
	name = ".357 Match Ammo Box"

/datum/supply_pack/ammo/c38
	name = ".38 Ammo Box"
	desc = "Contains a 60-round ammo box for refilling .38 weapons."

/datum/supply_pack/ammo/a44roum
	name = ".44 Roumain Ammo Box"

/datum/supply_pack/ammo/a44roum_rubber
	name = ".44 Roumain Rubber Ammo Box"

/datum/supply_pack/ammo/a44roum_hp
	name = ".44 Roumain Hollow Point Ammo Box"

/datum/supply_pack/ammo/c45_ammo_box
	name = ".45 Ammo Box"

/datum/supply_pack/ammo/c45ap_ammo_box
	name = ".45 AP Ammo Box"
	faction_locked = TRUE
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/c45hp_ammo_box
	name = ".45 HP Ammo Box"

/datum/supply_pack/ammo/c45mmrubber_ammo_box
	name = ".45 Rubber Ammo Box"
	faction_locked = TRUE
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a4570_box
	name = ".45-70 Ammo Box"

/datum/supply_pack/ammo/a4570_match
	name = ".45-70 Match"
	desc = "Contains a 24-round box containing devastatingly powerful .45-70 caliber ammunition, that travels faster, pierces armour better, and ricochets off targets."

/datum/supply_pack/ammo/a4570_hp
	name = ".45-70 Hollow Point Ammo Box"
	available = FALSE

/datum/supply_pack/ammo/a50
	name = ".50 BMG Ammo Box"
	desc = "Contains a 20-round .50 BMG ammo box for the Taipan Anti-Material Rifle. Make them count, they aren't cheap."

/datum/supply_pack/ammo/c10mm_ammo_box
	name = "10x22mm Ammo Box"

/datum/supply_pack/ammo/c10mmap_ammo_box
	name = "10x22mm AP Ammo Box"
	faction_locked = TRUE
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/c10mmap_ammo_box/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/ammo/c10mmhp_ammo_box
	name = "10x22mm HP Ammo Box"

/datum/supply_pack/ammo/c10mmrubber_ammo_box
	name = "10x22mm Rubber Ammo Box"
	faction_locked = TRUE
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/c10mmrubber_ammo_box/inteq
	faction = /datum/faction/inteq

/datum/supply_pack/ammo/c556mmHITP_ammo_box
	name = "5.56 Caseless Ammo Box"

/datum/supply_pack/ammo/c556mmHITPap_ammo_box
	name = "5.56 caseless AP Ammo Box"
	faction = /datum/faction/solgov
	faction_locked = TRUE

/datum/supply_pack/ammo/c556mmhitphp_ammo_box
	name = "5.56 Caseless HP Ammo Box"

/datum/supply_pack/ammo/c556HITPrubber_ammo_box
	name = "5.56 Caseless Rubber Ammo Box"
	faction = /datum/faction/solgov
	faction_locked = TRUE

/datum/supply_pack/ammo/c8x50mm_boxcrate
	name = "8x50mm Ammo Box"

/datum/supply_pack/ammo/c8x50mm_boxhp_boxcrate
	name = "8x50mm Hollow Point"

/datum/supply_pack/ammo/c8x50mm_tracbox
	name = "8x50mm Tracker"

/datum/supply_pack/ammo/a858
	name = "8x58mm Ammo Box"

/datum/supply_pack/ammo/c9mm_ammo_box
	name = "9x18mm Ammo Box"

/datum/supply_pack/ammo/c9mmap_ammo_box
	name = "9x18mm AP Ammo Box"

/datum/supply_pack/ammo/c9mmhp_ammo_box
	name = "9x18mm HP Ammo Box"

/datum/supply_pack/ammo/c9mmrubber_ammo_box
	name = "9x18mm Rubber Ammo Box"
