/obj/item/storage/firstaid/synthflesh
	name = "synthflesh kit"
	desc = "kit with a meat symbol on it"
	icon = 'mod_celadon/_storge_icons/icons/items/misc/storage.dmi'
	icon_state = "synthflesh"
	lefthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/storage_hands_left.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/items/misc/in_hands/storage_hands_right.dmi'

/obj/item/storage/firstaid/synthflesh/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL //holds the same equipment as a medibelt
	STR.max_items = 12
	STR.max_combined_w_class = 24
	STR.set_holdable(list(
		/obj/item/reagent_containers/glass/beaker/synthflesh,
		/obj/item/reagent_containers/pill/patch/synthflesh
		))

/obj/item/storage/firstaid/synthflesh/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/glass/beaker/synthflesh= 4,
		/obj/item/reagent_containers/pill/patch/synthflesh= 4,)
	generate_items_inside(items_inside,src)
