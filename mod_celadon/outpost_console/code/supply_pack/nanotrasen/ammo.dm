/datum/supply_pack/faction/nanotrasen/ammo
	category = "Ammunition"

/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> 9x18mm
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
MARK: 4.63x30mm
*/

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box
	name = "4.6x30mm ammo box"
	desc = "4.6x30mm ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm)
	cost = 295 // old - 500

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box_ap
	name = "4.6x30mm AP ammo box"
	desc = "4.6x30mm AP ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/ap)
	cost = 600 // old - 1000

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box_hp
	name = "4.6x30mm HP ammo box"
	desc = "4.6x30mm HP ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/hp)
	cost = 370 // old - 700

/datum/supply_pack/faction/nanotrasen/ammo/wt_ammo_box_rubber
	name = "4.6x30mm Rubber ammo box"
	desc = "4.6x30mm Rubber ammo box for guns like the WT550. Contains 50 shells"
	contains = list(/obj/item/storage/box/ammo/c46x30mm/rubber)
	cost = 295 // old - 500

/*
MARK: ferro pellets
*/

/datum/supply_pack/faction/nanotrasen/ammo/ferropelletboxcrate
	name = "Ferromagnetic Pellet Box Crate"
	desc = "Contains a 48-round ferromagnetic pellet ammo box for gauss guns."
	contains = list(/obj/item/storage/box/ammo/ferropellet)
	cost = 210

/datum/supply_pack/faction/nanotrasen/ammo/hcpellets
	name = "High Conductivity Pellet Box Crate"
	desc = "Contains a 48-round high conductivity pellet ammo box for gauss guns."
	contains = list(/obj/item/storage/box/ammo/ferropellet/hc)
	cost = 260
