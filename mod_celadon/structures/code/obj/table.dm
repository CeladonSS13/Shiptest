/obj/structure/table/scrap
	name = "scrap table"
	desc = "It's a scrap, junk..."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/table_scrap.dmi'
	icon_state = "table-0"
	base_icon_state = "table"
	frame = /obj/structure/table_frame
	framestack = /obj/item/stack/ore/salvage/scrapmetal
	buildstack = /obj/item/stack/ore/salvage/scrapmetal
	resistance_flags = FLAMMABLE
	max_integrity = 60
	buildstackamount = 10
	smoothing_groups = list(SMOOTH_GROUP_SCRAP_TABLES) //Don't smooth with SMOOTH_GROUP_TABLES
	canSmoothWith = list(SMOOTH_GROUP_SCRAP_TABLES)
	flipped_table_type = /obj/structure/flippedtable/scraptable

	hitsound_type = PROJECTILE_HITSOUND_WOOD

/obj/structure/table/scrap/narsie_act(total_override = TRUE)
	switch(rand(1, 2))
		if(1)
			icon_state = "scrap_table"
		if(2)
			icon_state = "scrap_table_2"

	if(!total_override)
		..()

/obj/structure/flippedtable/scraptable
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/flipped_tables.dmi'
	icon_state = "scrap_table"

/obj/structure/flippedtable/scraptable2
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/flipped_tables.dmi'
	icon_state = "scrap_table_2"

/obj/structure/table/wood/reinforced/bar
	name = "reinforced wooden bar table"
	desc = "A reinforced version of the four-legged wooden bar table. Likely as easy to burn as a normal one."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/table_bar.dmi'
	icon_state = "table-0"
	base_icon_state = "table"

/obj/structure/table/reinforced/glass
	name = "reinforced glass table"
	desc = "A reinforced version of the four-legged glass table. Likely as easy to burn as a normal one."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/rglass_table.dmi'
	buildstack = /obj/item/stack/sheet/rglass
	icon_state = "rglass_table-0"
	base_icon_state = "rglass_table"

/obj/item/stack/sheet/plasmarglass
	tableVariant = /obj/structure/table/reinforced/plasmarglass

/obj/structure/table/reinforced/plasmarglass
	name = "reinforced plasma glass table"
	desc = "A reinforced version of the four-legged plasma glass table. Likely as easy to burn as a normal one. Protect acid."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/rplasmaglass_table.dmi'
	icon_state = "rplasmaglass_table-0"
	base_icon_state = "rplasmaglass_table"
	resistance_flags = ACID_PROOF
	// material_flags = MATERIAL_NO_EFFECTS
	buildstack = /obj/item/stack/sheet/plasmarglass
	armor = list("melee" = 20, "bullet" = 30, "laser" = 30, "energy" = 100, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 100)

/obj/item/stack/sheet/plastitaniumglass
	tableVariant = /obj/structure/table/reinforced/plastitaniumglass

/obj/structure/table/reinforced/plastitaniumglass
	name = "reinforced plastitanium glass table"
	desc = "A reinforced version of the four-legged plastitanium glass table. Likely as easy to burn as a normal one. Protect acid."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/plastitaniumglass_table.dmi'
	icon_state = "plastitaniumglass_table-0"
	base_icon_state = "plastitaniumglass_table"
	resistance_flags = ACID_PROOF
	// material_flags = MATERIAL_NO_EFFECTS
	buildstack = /obj/item/stack/sheet/plastitaniumglass
	armor = list("melee" = 20, "bullet" = 30, "laser" = 30, "energy" = 100, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 100)

/obj/item/stack/sheet/titaniumglass
	tableVariant = /obj/structure/table/reinforced/titaniumglass

/obj/structure/table/reinforced/titaniumglass
	name = "reinforced titanium glass table"
	desc = "A reinforced version of the four-legged titanium glass table. Likely as easy to burn as a normal one. Protect acid."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/titaniumglass_table.dmi'
	icon_state = "titaniumglass_table-0"
	base_icon_state = "titaniumglass_table"
	resistance_flags = ACID_PROOF
	// material_flags = MATERIAL_NO_EFFECTS
	buildstack = /obj/item/stack/sheet/titaniumglass
	armor = list("melee" = 20, "bullet" = 30, "laser" = 30, "energy" = 100, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 100)

/obj/structure/table/glass/light_glass
	name = "light glass table"
	desc = "What did I say about leaning on the glass tables? Now you need surgery."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/glass_table.dmi'
	icon_state = "glass_table-0"
	base_icon_state = "glass_table"
	buildstack = /obj/item/stack/sheet/glass

/obj/item/stack/sheet/plasmaglass
	tableVariant = /obj/structure/table/glass/plasma_glass

/obj/structure/table/glass/plasma_glass
	name = "plasma glass table"
	desc = "What did I say about leaning on the plasma glass tables? Now you need surgery."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/plasmaglass_table.dmi'
	icon_state = "plasmaglass_table-0"
	base_icon_state = "plasmaglass_table"
	buildstack = /obj/item/stack/sheet/plasmaglass

/obj/item/stack/sheet/metal/syndi
	name = "syndi metal"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/stack_objects.dmi'
	icon_state = "sheet-metal"
	item_state = "sheet-metal"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/sheets_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/sheets_righthand.dmi'
	tableVariant = /obj/structure/table/syndi

/obj/structure/table/syndi
	name = "syndicate glass table"
	desc = "What did I say about leaning on the glass tables? Now you need surgery."
	icon = 'mod_celadon/_storge_icons/icons/structures/tables/table_syndicate.dmi'
	icon_state = "table-0"
	base_icon_state = "table"
	buildstack = /obj/item/stack/sheet/metal/syndi
