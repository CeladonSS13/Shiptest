/datum/export/material/diamond
	cost = 75
	material_id = /datum/material/diamond
	unit_name = "cm3 of diamonds"

/datum/export/material/plasma
	cost = 30
	// k_elasticity = 0
	material_id = /datum/material/plasma
	unit_name = "cm3 of plasma"

/datum/export/material/uranium
	cost = 20
	material_id = /datum/material/uranium
	unit_name = "cm3 of uranium"

/datum/export/material/gold
	cost = 15
	material_id = /datum/material/gold
	unit_name = "cm3 of gold"

/datum/export/material/silver
	cost = 10
	material_id = /datum/material/silver
	unit_name = "cm3 of silver"

/datum/export/material/titanium
	cost = 15
	material_id = /datum/material/titanium
	unit_name = "cm3 of titanium"

/datum/export/material/hellstone
	cost = 100
	material_id = /datum/material/hellstone
	unit_name = "cm3 of hellstone"

/datum/export/material/bscrystal
	cost = 50
	unit_name = "of bluespace crystals"
	material_id = /datum/material/bluespace

/datum/export/material/plastic
	cost = 5
	unit_name = "cm3 of plastic"
	material_id = /datum/material/plastic

/datum/export/material/metal
	cost = 2
	unit_name = "cm3 of metal"
	material_id = /datum/material/iron
	export_types = list(
		/obj/item/stack/sheet/metal, /obj/item/stack/tile/plasteel,
		/obj/item/stack/rods, /obj/item/stack/ore, /obj/item/coin)

/datum/export/material/glass
	cost = 2
	unit_name = "cm3 of glass"
	material_id = /datum/material/glass
	export_types = list(/obj/item/stack/sheet/glass, /obj/item/stack/ore,
		/obj/item/shard)

/datum/export/material/hot_ice
	cost = 100
	unit_name = "cm3 of Hot Ice"
	material_id = /datum/material/hot_ice
	export_types = /obj/item/stack/sheet/hot_ice
