/datum/supply_pack/ammo
	category = "Security - Ammunition"
	stable_price = TRUE

// MARK: 4.6x30
/datum/supply_pack/ammo/c46x30mm_rubber
	name = "4.6x30mm Rubber Ammo Box Crate"
	desc = "Contains a 80-round 4.6x30mm hollow point box for PDWs such as the WT-550."
	contains = list(/obj/item/storage/box/ammo/c46x30mm/rubber)
	cost = 300

// MARK: 5.7x39
/datum/supply_pack/ammo/c57x39mm_rubber
	name = "5.7x39mm Hollow Point Ammo Box Crate"
	desc = "Contains one 80-round 5.7x39mm Rubber box for PDWs such as the Sidewinder."
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
	name = "5.56x45mm Armour Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x45mm Armour Piercing ammo."
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
	cost = 700
	faction = /datum/faction/solgov
	faction_locked = TRUE

/datum/supply_pack/ammo/a556_ammo_box/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a556_ap
	name = "5.56x42mm Armour Piercing Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Armour Piercing box."
	cost = 1000

/datum/supply_pack/ammo/a556_ap/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a556_hp
	name = "5.56x42mm Hollow Point Ammo Box"
	desc = "Contains one 60-round 5.56x42mm Hollow Point box."
	cost = 1000

/datum/supply_pack/ammo/a556_hp/syndicate
	faction = /datum/faction/syndicate

/datum/supply_pack/ammo/a65clip_box
	name = "6.5mm Ammo Box Crate"
	desc = "Contains a twenty-round 6.5mm ammo box for various sniper rifles such as the CM-F90 and the Boomslang series."

/datum/supply_pack/ammo/a65clip_trackers
	name = "6.5mm Tracker Shell Crate"
	desc = "Contains a 10-round 6.5mm tracker box for various sniper rifles such as the CM-F90 and the Boomslang series."

/datum/supply_pack/ammo/a762_ammo_box
	name = "7.62x40mm Ammo Box"
	desc = "Contains one 60-round 7.62x40mm box for the SKM rifles."
	cost = 350

/datum/supply_pack/ammo/a762_ap
	name = "7.62x40mm AP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Armour Piercing box for the SKM rifles."
	cost = 450

/datum/supply_pack/ammo/a762_hp
	name = "7.62x40mm HP Ammo Box"
	desc = "Contains one 60-round 7.62x40mm Hollow Point box for the SKM rifles."
	cost = 450
