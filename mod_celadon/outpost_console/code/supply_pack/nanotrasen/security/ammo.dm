/datum/supply_pack/faction/nanotrasen/ammo
	category = "Security - Ammunition"

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> 9x18mm
> 12g
> 4.63x30mm
> ferro pellets

MARK: 9x18mm
*/

/datum/supply_pack/faction/nanotrasen/ammo/c9mm_ammo_box
	name = "9x18mm ammo box"
	desc = "9x18mm ammo box for guns like the commander or the saber SMG. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm)
	cost = 250

/datum/supply_pack/faction/nanotrasen/ammo/c9mm_ammo_box_ap
	name = "9x18mm AP ammo box"
	desc = "9x18mm AP ammo box for guns like the commander or the saber SMG. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm_ap)
	cost = 450

/datum/supply_pack/faction/nanotrasen/ammo/c9mm_ammo_box_hp
	name = "9x18mm HP ammo box"
	desc = "9x18mm HP ammo box for guns like the commander or the saber SMG. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm_hp)
	cost = 350

/datum/supply_pack/faction/nanotrasen/ammo/c9mm_rubber
	name = "9x18mm Rubber ammo box"
	desc = "9x18mm Rubber ammo box for guns like the commander or the saber SMG. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c9mm_rubber)
	cost = 250


/*
	MARK: 12 Gauge
*/

/datum/supply_pack/faction/nanotrasen/ammo/buckshot
	name = "12g Buckshot"
	desc = "Contains a box of 32 12 gauge buckshot shells for use in lethal persuasion."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_buckshot)

/datum/supply_pack/faction/nanotrasen/ammo/slugs
	name = "12g Shotgun Slug"
	desc = "Contains a box of 32 12 gauge slug shells for use in lethal persuasion."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_slug)

/datum/supply_pack/faction/nanotrasen/ammo/blank_shells
	name = "12g Blank Shell"
	desc = "Contains a box of 12 gauge blank shells."
	cost = 200
	contains = list(/obj/item/storage/box/ammo/a12g_blank)

/datum/supply_pack/faction/nanotrasen/ammo/rubbershot
	name = "12g Rubbershot"
	desc = "Contains a box of 32 12 gauge rubbershot shells. Perfect for crowd control and training."
	cost = 500
	contains = list(/obj/item/storage/box/ammo/a12g_rubbershot)

/datum/supply_pack/faction/nanotrasen/ammo/techshells
	name = "12g Unloaded Shotgun Technological Shells"
	desc = "Contains a box of 7 versatile tech shells, capable of producing a variety of deadly effects for any situation. Some assembly required."
	cost = 200
	contains =
	 list(/obj/item/storage/box/techshot)

/*
	MARK: 4.63x30mm
*/

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box
	name = "4.6x30mm ammo box"
	desc = "4.6x30mm ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm)
	cost = 300 // old - 500

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box_ap
	name = "4.6x30mm AP ammo box"
	desc = "4.6x30mm AP ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/ap)
	cost = 600 // old - 1000

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box_hp
	name = "4.6x30mm HP ammo box"
	desc = "4.6x30mm HP ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/hp)
	cost = 375 // old - 700

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box_rubber
	name = "4.6x30mm Rubber ammo box"
	desc = "4.6x30mm Rubber ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/rubber)
	cost = 300 // old - 500

/*
	MARK: ferro pellets
*/

/datum/supply_pack/faction/nanotrasen/ammo/ferropelletboxcrate
	name = "Ferromagnetic Pellet (FE pellet) Box"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 200

/datum/supply_pack/faction/nanotrasen/ammo/hcpellets
	name = "High Conductivity Pellet Box"
	desc = "Contains a 48-round high conductivity pellet ammo box for gauss guns."
	contains = list(/obj/item/storage/box/ammo/ferropellet/hc)
	cost = 250
