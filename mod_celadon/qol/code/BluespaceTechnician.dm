// DEBUG_QUALITY

// MARK: Датум

/datum/component/storage/concrete/stack/debug
	max_w_class = WEIGHT_CLASS_GIGANTIC
	max_combined_w_class = WEIGHT_CLASS_GIGANTIC * 14
	max_combined_stack_amount = 3000
	max_items = 50


// MARK: Предметы

/obj/item/card/id/debug
	assignment = "Bluespace Technician"
	job_icon = "scrambled"

/obj/item/storage/belt/utility/chief/debug
	name = "\improper Bluespace Technician's toolbelt"

/obj/item/clothing/head/helmet/space/hardsuit/syndi/elite/debug
	name = "bluespace technician hardsuit helmet"

/obj/item/clothing/suit/space/hardsuit/syndi/elite/debug
	name = "bluespace technician hardsuit"

/obj/item/storage/box/cashbundledebug
	name = "box of cash bundle"
	icon_state = "secbox"
	illustration = "writing_syndie"

/obj/item/storage/box/cashbundledebug/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/spacecash/bundle/c10000(src)

/obj/item/storage/box/traitorbundledebug
	name = "box of traitor"
	icon_state = "syndiebox"
	illustration = "writing_syndie"

/obj/item/storage/box/traitorbundledebug/PopulateContents()
	var/static/items_inside = list(
		/obj/item/uplink/debug=1,\
		/obj/item/uplink/nuclear/debug=1,\
		/obj/item/card/emag=1,\
		/obj/item/flashlight/emp/debug=1,\
		/obj/item/stamp/chameleon = 1,\
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/toolbundledebug
	name = "box of tools"
	illustration = "pda"

/obj/item/storage/box/toolbundledebug/PopulateContents()
	var/static/items_inside = list(
	)
	generate_items_inside(items_inside,src)

/obj/item/storage/bag/sheetsnatcher/debug
	name = "sheet snatcher of materials"
	w_class = WEIGHT_CLASS_TINY
	capacity = 5000
	component_type = /datum/component/storage/concrete/stack/debug

/obj/item/storage/bag/sheetsnatcher/debug/ComponentInitialize()
	. = ..()
	var/datum/component/storage/concrete/stack/debug/STR = GetComponent(/datum/component/storage/concrete/stack/debug)
	STR.max_combined_stack_amount = 5000

/obj/item/storage/bag/sheetsnatcher/debug/PopulateContents() 	//less uranium because radioactive
	var/static/items_inside = list(
		/obj/item/stack/sheet/metal/fifty=1,\
		/obj/item/stack/sheet/glass/fifty=1,\
		/obj/item/stack/sheet/rglass=50,\
		/obj/item/stack/sheet/plasmaglass=50,\
		/obj/item/stack/sheet/titaniumglass=50,\
		/obj/item/stack/sheet/plastitaniumglass=50,\
		/obj/item/stack/sheet/plasteel=50,\
		/obj/item/stack/sheet/mineral/plastitanium=50,\
		/obj/item/stack/sheet/mineral/titanium=50,\
		/obj/item/stack/sheet/mineral/gold=50,\
		/obj/item/stack/sheet/mineral/silver=50,\
		/obj/item/stack/sheet/mineral/plasma=50,\
		/obj/item/stack/sheet/mineral/uranium=20,\
		/obj/item/stack/sheet/mineral/diamond=50,\
		/obj/item/stack/sheet/bluespace_crystal=50,\
		/obj/item/stack/sheet/mineral/hidden/hellstone=50,\
		/obj/item/stack/sheet/mineral/wood=50,\
		/obj/item/stack/sheet/plastic/fifty=1,\
		/obj/item/stack/sheet/mineral/sandstone=50
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/bag/chemistry/debug
	name = "chemistry bag of reagents"
	w_class = WEIGHT_CLASS_TINY

/obj/item/storage/bag/chemistry/debug/PopulateContents()
	new /obj/item/reagent_containers/glass/beaker(src)
	new /obj/item/reagent_containers/glass/beaker/large(src)
	new /obj/item/reagent_containers/glass/beaker/plastic(src)
	new /obj/item/reagent_containers/glass/beaker/meta(src)
	new /obj/item/reagent_containers/glass/beaker/noreact(src)
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/glass/beaker/bluespace(src)

/obj/item/storage/box/debugtools
	name = "box of debug tools"
	icon_state = "syndiebox"

/obj/item/storage/box/debugtools/PopulateContents()
	var/static/items_inside = list(
		/obj/item/storage/box/traitorbundledebug=1,\
		/obj/item/storage/box/cashbundledebug=1,\
		/obj/item/storage/bag/chemistry/debug=1,\
		/obj/item/storage/bag/sheetsnatcher/debug=1,\
		/obj/item/disk/tech_disk/debug=1,\
		/obj/item/construction/rcd/arcd/debug=1,\
		/obj/item/gun/energy/plasmacutter/adv = 1,\
		/obj/item/gun/medbeam=1,\
		/obj/item/extinguisher/advanced = 1,\
		/obj/item/geiger_counter=1,\
		/obj/item/shovel = 1,\
		)
	generate_items_inside(items_inside,src)
