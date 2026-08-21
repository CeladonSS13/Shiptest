
			// nanotrasen survival box
/obj/item/storage/box/survival/nanotrasen
	name = "NT-brand survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "bluebox"
	possible_illustrations = "nanotrasen"
	illustration = "nanotrasen"

/obj/item/storage/box/survival/nanotrasen/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/breath = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/food/ration = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar = 1,\
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/survival/nanotrasen/security
	name = "NT-brand survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "dangerbox"
	possible_illustrations = "nanotrasen"
	illustration = "nanotrasen"

/obj/item/storage/box/survival/nanotrasen/security/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/gas/vigilitas = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/food/ration = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar = 1,\
		)
	generate_items_inside(items_inside,src)

			// syndicate survival box
/obj/item/storage/box/survival/syndicate
	name = "military-grade cybersun survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "milbox"
	possible_illustrations = "syndie"
	illustration = "syndie"
/obj/item/storage/box/survival/syndicate/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/gas/syndicate = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen/atropine = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/food/shoalpocket/warm = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar/syndie = 1,\
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/survival/ramzi
	name = "contraband survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "dangerbox"
	possible_illustrations = "writing_warning"
	illustration = "writing_warning"
/obj/item/storage/box/survival/ramzi/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/gas/ramzi = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen/atropine = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/food/shoalpocket/warm = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar/syndie = 1,\
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/survival/pirate
	name = "contraband survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "secbox"
	possible_illustrations = "syringe"
	illustration = "syringe"
/obj/item/storage/box/survival/pirate/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/balaclava/combat = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/charcoal = 1,\
		/obj/item/food/shoalpocket/warm = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar/red= 1,\
		)
	generate_items_inside(items_inside,src)

			// inteq survival box
/obj/item/storage/box/survival/inteq
	name = "IRMG general survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "box"
	possible_illustrations = "writing_warning"
	illustration = "writing_warning"
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
	name = "military-grade survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "milbox_sol"
	possible_illustrations = "solfed"
	illustration = "solfed"
/obj/item/storage/box/survival/solfed/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/breath = 1,\
		/obj/item/tank/internals/emergency_oxygen/engi = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/penacid = 1,\
		/obj/item/food/ration = 1,\
		/obj/item/radio = 1,\
		/obj/item/crowbar = 1,\
		)
	generate_items_inside(items_inside,src)


			// independent & elisium survival box
/obj/item/storage/box/survival/independent
	name = "mass-produced survival box"
	icon = 'mod_celadon/_storage_icons/icons/resprite/survival_boxes.dmi'
	icon_state = "secbox"
	possible_illustrations = "emergency"
	illustration = "emergency"
/obj/item/storage/box/survival/independent/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/mask/breath = 1,\
		/obj/item/tank/internals/emergency_oxygen = 1,\
		/obj/item/reagent_containers/hypospray/medipen = 1,\
		/obj/item/reagent_containers/pill/charcoal = 1,\
		/obj/item/food/ration/bar = 1,\
		/obj/item/flashlight/flare = 1,\
		/obj/item/radio = 1,\
		)
	generate_items_inside(items_inside,src)

//It's a maid costume from the IRMG and Syndicate, what else.
/obj/item/storage/box/inteqmaid
	name = "IRMG non standard issue maid outfit"
	desc = "A box containing a 'tactical' and 'practical' maid outfit from the IRMG."

/obj/item/storage/box/inteqmaid/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/head/maidheadband/inteq = 1,
		/obj/item/clothing/under/syndicate/inteq/skirt/maid = 1,
		/obj/item/clothing/gloves/combat/maid/inteq = 1,)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/syndimaid
	name = "Syndicate maid outfit"
	desc = "A box containing a 'tactical' and 'practical' maid outfit."
	icon_state = "syndiebox"

/obj/item/storage/box/syndimaid/PopulateContents()
	var/static/items_inside = list(
		/obj/item/clothing/head/maidheadband/syndicate = 1,
		/obj/item/clothing/under/syndicate/skirt/maid = 1,
		/obj/item/clothing/gloves/combat/maid = 1,)
	generate_items_inside(items_inside,src)
