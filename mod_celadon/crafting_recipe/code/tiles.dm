// MARK: SUNS Floor Tiles

// --- Базовые классы ---
/datum/crafting_recipe/suns_sandstone_base
	time = 10
	reqs = list(/obj/item/stack/sheet/mineral/sandstone = 2)
	category = CAT_MISC

/datum/crafting_recipe/suns_wood_base
	time = 10
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)
	category = CAT_MISC

// --- Рецепты из песчаника ---
/datum/crafting_recipe/suns_sandstone_base/suns_tile
	name = "White Marble Tile"
	result = /obj/item/stack/tile/suns

/datum/crafting_recipe/suns_sandstone_base/suns_dark_tile
	name = "Black Marble Tile"
	result = /obj/item/stack/tile/suns/dark

/datum/crafting_recipe/suns_sandstone_base/suns_dark_plain_tile
	name = "Black Plain Marble Tile"
	result = /obj/item/stack/tile/suns/dark/plain

/datum/crafting_recipe/suns_sandstone_base/suns_dark_pattern_tile
	name = "Patterned Black Marble Tile"
	result = /obj/item/stack/tile/suns/dark/pattern

/datum/crafting_recipe/suns_sandstone_base/suns_pattern_tile
	name = "Patterned White Marble Tile"
	result = /obj/item/stack/tile/suns/pattern

/datum/crafting_recipe/suns_sandstone_base/suns_plain_tile
	name = "White Plain Marble Tile"
	result = /obj/item/stack/tile/suns/plain

// --- Рецепты из дерева ---
/datum/crafting_recipe/suns_wood_base/suns_hatch_tile
	name = "Hatched Wood Tile"
	result = /obj/item/stack/tile/suns/hatch

/datum/crafting_recipe/suns_wood_base/suns_hatch_mahogany_tile
	name = "Hatched Mahogany Tile"
	result = /obj/item/stack/tile/suns/hatch/mahogany

/datum/crafting_recipe/suns_wood_base/suns_hatch_maple_tile
	name = "Hatched Maple Tile"
	result = /obj/item/stack/tile/suns/hatch/maple

/datum/crafting_recipe/suns_wood_base/suns_hatch_ebony_tile
	name = "Hatched Ebony Tile"
	result = /obj/item/stack/tile/suns/hatch/ebony

/datum/crafting_recipe/suns_wood_base/suns_hatch_walnut_tile
	name = "Hatched Walnut Tile"
	result = /obj/item/stack/tile/suns/hatch/walnut

/datum/crafting_recipe/suns_wood_base/suns_hatch_bamboo_tile
	name = "Hatched Bamboo Tile"
	result = /obj/item/stack/tile/suns/hatch/bamboo

/datum/crafting_recipe/suns_wood_base/suns_hatch_birch_tile
	name = "Hatched Birch Tile"
	result = /obj/item/stack/tile/suns/hatch/birch

/datum/crafting_recipe/suns_wood_base/suns_hatch_yew_tile
	name = "Hatched Yew Tile"
	result = /obj/item/stack/tile/suns/hatch/yew

/datum/crafting_recipe/suns_wood_base/suns_diagonal_tile
	name = "Diagonal Wood Tile"
	result = /obj/item/stack/tile/suns/diagonal

// --- Смешанные рецепты ---
/datum/crafting_recipe/suns_grid_tile
	name = "Dark Grid Tile"
	result = /obj/item/stack/tile/suns/grid
	time = 10
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/sheet/mineral/sandstone = 1)
	category = CAT_MISC
