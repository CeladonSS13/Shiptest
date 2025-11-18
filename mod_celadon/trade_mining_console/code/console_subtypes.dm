// unlock_cost - Цена разблокировки технологии за шахтерские очки
// price - Цена покупки в кредитах
// stock = 0 - значит предмет бесконечен. Если он больше нуля, то имеет ограниченное кол-во

/obj/machinery/computer/trade_mining_console/nanotrasen
	name = "Nanotrasen trade console"
	desc = "Защищенная торговая консоль Nanotrasen Trade Manager. Используйте майнинг очки с банковской карты для разблокировки технологий, затем покупайте их за кредиты. Все операции требуют наличия банковской карты и айди карты."
	light_color = LIGHT_COLOR_BLUE
	theme = "ntos"

/obj/machinery/computer/trade_mining_console/nanotrasen/Initialize(mapload)
	available_items = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpack = list(
			"unlock_cost" = 6000,
			"price" = 300,
			"stock" = 0,
			"category" = "Medical",
			"description" = "Advanced stimulant injector for emergency medical situations. Provides rapid healing and combat enhancement."
		),
		/obj/item/mod/control/pre_equipped/magnate = list(
			"unlock_cost" = 5000,
			"price" = 8000,
			"stock" = 0,
			"category" = "Equipment",
			"description" = "High-end MODsuit designed for corporate executives and VIPs. Features advanced protection and utility modules."
		),
		/obj/item/research_notes/loot/medium = list(
			"unlock_cost" = 4000,
			"price" = 6000,
			"stock" = 4,
			"category" = "Research",
			"description" = "Valuable research data containing technological insights. Can be used to advance scientific knowledge."
		),
		/obj/item/storage/firstaid/advanced = list(
			"unlock_cost" = 1500,
			"price" = 900,
			"stock" = 0,
			"category" = "Medical",
			"description" = "Advanced medical kit containing high-grade medical supplies for treating severe injuries."
		),
		/obj/item/gun/energy/e_gun/e_old/smg = list(
			"unlock_cost" = 3000,
			"price" = 5000,
			"stock" = 0,
			"category" = "Weapons",
			"description" = "Compact energy submachine gun. Reliable sidearm for security personnel and explorers."
		)
	)
	. = ..()

/obj/machinery/computer/trade_mining_console/syndicate
	name = "Syndicate trade console"
	desc = "Защищенная торговая консоль Syndicate Trade Manager. Используйте майнинг очки с банковской карты для разблокировки технологий, затем покупайте их за кредиты. Все операции требуют наличия банковской карты и айди карты."
	light_color = LIGHT_COLOR_RED
	theme = "syndicate"

/obj/machinery/computer/trade_mining_console/syndicate/Initialize(mapload)
	available_items = list(
		/obj/item/clothing/suit/space/hardsuit/syndi/elite/oldcontractor = list(
			"unlock_cost" = 7000,
			"price" = 15000,
			"stock" = 0,
			"category" = "Equipment",
			"description" = "Elite contractor hardsuit with advanced armor plating and life support systems. Military-grade protection."
		),
		/obj/item/melee/powerfist = list(
			"unlock_cost" = 3000,
			"price" = 3000,
			"stock" = 0,
			"category" = "Weapons",
			"description" = "Powered gauntlet that delivers devastating melee attacks. Favored by close-combat specialists."
		),
		/obj/item/research_notes/loot/medium = list(
			"unlock_cost" = 4000,
			"price" = 6000,
			"stock" = 4,
			"category" = "Research",
			"description" = "Classified research data containing advanced technological specifications."
		),
		/obj/item/storage/firstaid/advanced = list(
			"unlock_cost" = 1500,
			"price" = 900,
			"stock" = 0,
			"category" = "Medical",
			"description" = "Military-grade medical supplies for field operations and emergency treatment."
		),
		/obj/item/disk/design_disk/a556_42 = list(
			"unlock_cost" = 15000,
			"price" = 10000,
			"stock" = 0,
			"category" = "Research",
			"description" = "Design disk containing blueprints for advanced ammunition manufacturing."
		)
	)
	. = ..()
