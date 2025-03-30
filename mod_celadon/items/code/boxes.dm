
			// nanotrasen survival box
/obj/item/storage/box/survival/nanotrasen
	name = "nanotrasen survival box"
	icon = 'mod_celadon/_storge_icons/icons/survival_boxes.dmi'
	icon_state = "box_survival_nt_alt"
	mask_type = null
	internal_type = null
	medipen_type = null
	radio_type = null
/obj/item/storage/box/survival/nanotrasen/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/breath = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/reagent_containers/food/snacks/ration = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar = 1,\
		)
	generate_items_inside(items_inside,src)


			// syndicate survival box
/obj/item/storage/box/survival/syndicate
	name = "syndicate survival box"
	icon = 'mod_celadon/_storge_icons/icons/survival_boxes.dmi'
	icon_state = "box_survival_syn"
	mask_type = null
	internal_type = null
	medipen_type = null
	radio_type = null
/obj/item/storage/box/survival/syndicate/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/gas/syndicate = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen/atropine = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/reagent_containers/food/snacks/donkpocket/warm = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar/syndie = 1,\
		)
	generate_items_inside(items_inside,src)


			// inteq survival box
/obj/item/storage/box/survival/inteq
	name = "inteq survival box"
	icon = 'mod_celadon/_storge_icons/icons/survival_boxes.dmi'
	icon_state = "box_survival_iq"
	mask_type = null
	internal_type = null
	medipen_type = null
	radio_type = null
/obj/item/storage/box/survival/inteq/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/gas/inteq = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen/atropine = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/storage/ration/chicken_wings_hot_sauce = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar/red = 1,\
		)
	generate_items_inside(items_inside,src)


			// solfed survival box
/obj/item/storage/box/survival/solfed
	name = "solfed survival box"
	icon = 'mod_celadon/_storge_icons/icons/survival_boxes.dmi'
	icon_state = "box_survival_sol"
	mask_type = null
	internal_type = null
	medipen_type = null
	radio_type = null
/obj/item/storage/box/survival/solfed/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/breath = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/reagent_containers/food/snacks/ration = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar = 1,\
		)
	generate_items_inside(items_inside,src)


			// independent & elisium survival box
/obj/item/storage/box/survival/independent
	name = "mass-produced survival box"
	icon = 'mod_celadon/_storge_icons/icons/survival_boxes.dmi'
	icon_state = "box_survival_ind"
	mask_type = null
	internal_type = null
	medipen_type = null
	radio_type = null
/obj/item/storage/box/survival/independent/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/breath = 1,\
		/obj/item/tank/internals/emergency_oxygen = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/charcoal = 1,\
		/obj/item/reagent_containers/food/snacks/ration/bar = 1,\
		/obj/item/flashlight/flare = 1,\
		/obj/item/radio = 1,\
		)
	generate_items_inside(items_inside,src)

