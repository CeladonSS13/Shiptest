/datum/design/a556/surplus
	name = "Некачественные патроны 5.56x45mm"
	desc = "Коробка некачественных патронов 5.56x45mm."
	id = "a556surp"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 35000, /datum/material/titanium = 3000)
	build_path = /obj/item/storage/box/ammo/a556_box/surplus
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/a308/surplus
	name = "Некачественные патроны .308"
	desc = "Коробка некачественных патронов .308."
	id = "a308_brak"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 45000, /datum/material/titanium = 4000)
	build_path = /obj/item/storage/box/ammo/a308/surplus
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

// Возвращаем эту штуку
/datum/design/nuclear_gun
	name = "Advanced Energy Gun"
	desc = "An energy gun with an experimental miniaturized reactor."
	id = "nuclear_gun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/uranium = 3000, /datum/material/titanium = 1000)
	build_path = /obj/item/gun/energy/e_gun/e_old/nuclear
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/techweb_node/radioactive_weapons
	id = "radioactive_weapons"
	display_name = "Radioactive Weaponry"
	description = "Weapons using radioactive technology."
	prereq_ids = list("adv_engi", "adv_weaponry")
	design_ids = list("nuclear_gun")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
	export_price = 5000

/obj/item/disk/design_disk/bof_disk/bof_buckshot
	name = "Fauna hunting bullet design disk"
	var/design = /datum/design/bane_of_fauna/bof_buckshot

/obj/item/disk/design_disk/bof_disk/bof_buckshot/Initialize()
	. = ..()
	blueprints[1] = new design

/datum/design/bane_of_fauna/bof_buckshot
	name = "Fauna hunting bullet"
	id = "bof-bullet"
	desc = "A rather odd bullet design that works well against most fauna."
	build_type = AUTOLATHE
	build_path = /obj/item/ammo_casing/shotgun/bof
	materials = list(
		/datum/material/titanium = 4000,
		/datum/material/plasma = 2000,
		/datum/material/gold = 2000,
	)
