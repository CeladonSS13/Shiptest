/datum/crafting_recipe/mesonsunglasses
	name = "Meson Sunglasses Glasses"
	result = /obj/item/clothing/glasses/meson/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(
		/obj/item/clothing/glasses/meson = 1,
		/obj/item/clothing/glasses/sunglasses = 1,
		/obj/item/stack/cable_coil = 5
	)
	category = CAT_CLOTHING

/datum/crafting_recipe/sunremoval
	name = "Meson Sunglasses Disassembly"
	result = /obj/item/clothing/glasses/sunglasses
	time = 20
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	reqs = list(/obj/item/clothing/glasses/meson/sunglasses = 1)
	category = CAT_CLOTHING
