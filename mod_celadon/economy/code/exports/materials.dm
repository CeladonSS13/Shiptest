/datum/export/material/diamond
	cost = 75
	material_id = /datum/material/diamond
	message = "cm3 of diamonds"

/datum/export/material/plasma
	cost = 30
	k_elasticity = 0
	material_id = /datum/material/plasma
	message = "cm3 of plasma"

/datum/export/material/uranium
	cost = 20
	material_id = /datum/material/uranium
	message = "cm3 of uranium"

/datum/export/material/gold
	cost = 15
	material_id = /datum/material/gold
	message = "cm3 of gold"

/datum/export/material/silver
	cost = 10
	material_id = /datum/material/silver
	message = "cm3 of silver"

/datum/export/material/titanium
	cost = 15
	material_id = /datum/material/titanium
	message = "cm3 of titanium"

/datum/export/material/hellstone
	cost = 100
	material_id = /datum/material/hellstone
	message = "cm3 of hellstone"

/datum/export/material/bscrystal
	cost = 50
	message = "of bluespace crystals"
	material_id = /datum/material/bluespace

/datum/export/material/plastic
	cost = 5
	message = "cm3 of plastic"
	material_id = /datum/material/plastic

/datum/export/material/metal
	cost = 2
	message = "cm3 of metal"
	material_id = /datum/material/iron
	export_types = list(
		/obj/item/stack/sheet/metal, /obj/item/stack/tile/plasteel,
		/obj/item/stack/rods, /obj/item/stack/ore, /obj/item/coin)

/datum/export/material/glass
	cost = 2
	message = "cm3 of glass"
	material_id = /datum/material/glass
	export_types = list(/obj/item/stack/sheet/glass, /obj/item/stack/ore,
		/obj/item/shard)

/datum/export/material/hot_ice
	cost = 100
	message = "cm3 of Hot Ice"
	material_id = /datum/material/hot_ice
	export_types = /obj/item/stack/sheet/hot_ice
