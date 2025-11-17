/obj/machinery/computer/trade_mining_console/nanotrasen
	name = "Nanotrasen trade console"
	desc = "A Nanotrasen console for purchasing standard equipment."
	light_color = LIGHT_COLOR_BLUE

/obj/machinery/computer/trade_mining_console/nanotrasen/Initialize(mapload)
	available_items = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpack 	= list("price" = 300, "unlock_cost" = 6000, "stock" = 0),
		/obj/item/mod/control/pre_equipped/magnate 					= list("price" = 8000, "unlock_cost" = 5000, "stock" = 0),
		/obj/item/research_notes/loot/medium 						= list("price" = 6000, "unlock_cost" = 4000, "stock" = 4),
		/obj/item/storage/firstaid/advanced 						= list("price" = 900, "unlock_cost" = 1500, "stock" = 0),
		/obj/item/gun/energy/e_gun/e_old/smg 						= list("price" = 5000, "unlock_cost" = 3000, "stock" = 0)
	)
	. = ..()

/obj/machinery/computer/trade_mining_console/syndicate
	name = "Syndicate trade console"
	desc = "A Syndicate console for purchasing military-grade equipment."
	light_color = LIGHT_COLOR_RED

/obj/machinery/computer/trade_mining_console/syndicate/Initialize(mapload)
	available_items = list(
		/obj/item/clothing/suit/space/hardsuit/syndi/elite/oldcontractor	= list("price" = 15000, "unlock_cost" = 7000, "stock" = 0),
		/obj/item/melee/powerfist 											= list("price" = 3000, "unlock_cost" = 3000, "stock" = 0),
		/obj/item/research_notes/loot/medium 								= list("price" = 6000, "unlock_cost" = 4000, "stock" = 4),
		/obj/item/storage/firstaid/advanced 								= list("price" = 900, "unlock_cost" = 1500, "stock" = 0),
		/obj/item/disk/design_disk/a556_42									= list("price" = 10000, "unlock_cost" = 15000, "stock" = 0)
	)
	. = ..()
