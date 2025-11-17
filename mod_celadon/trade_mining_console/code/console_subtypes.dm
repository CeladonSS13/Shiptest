/obj/machinery/computer/trade_mining_console/nanotrasen
	name = "Nanotrasen trade console"
	desc = "A Nanotrasen console for purchasing standard equipment."
	light_color = LIGHT_COLOR_BLUE

/obj/machinery/computer/trade_mining_console/nanotrasen/Initialize(mapload)
	available_items = list(
		/obj/item/gun/ballistic/automatic/pistol = list("price" = 2000, "unlock_cost" = 4000),
		/obj/item/mod/control/pre_equipped/advanced = list("price" = 5000, "unlock_cost" = 10000),
		/obj/item/storage/firstaid/brute = list("price" = 900, "unlock_cost" = 1500),
		/obj/item/disk/design_disk = list("price" = 2000, "unlock_cost" = 4000),
		/obj/item/gun/energy/e_gun = list("price" = 1500, "unlock_cost" = 3000)
	)
	. = ..()

/obj/machinery/computer/trade_mining_console/syndicate
	name = "Syndicate trade console"
	desc = "A Syndicate console for purchasing military-grade equipment."
	light_color = LIGHT_COLOR_RED

/obj/machinery/computer/trade_mining_console/syndicate/Initialize(mapload)
	available_items = list(
		/obj/item/mod/control/pre_equipped/syndicate = list("price" = 5000, "unlock_cost" = 10000),
		/obj/item/gun/ballistic/automatic/powered/gauss/claris = list("price" = 3000, "unlock_cost" = 6000),
		/obj/item/melee/powerfist = list("price" = 2500, "unlock_cost" = 5000),
		/obj/item/storage/firstaid/brute = list("price" = 900, "unlock_cost" = 1500),
		/obj/item/disk/design_disk = list("price" = 10000, "unlock_cost" = 20000)
	)
	. = ..()
