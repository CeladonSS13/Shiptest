// unlock_cost - Цена разблокировки технологии за шахтерские очки
// price - Цена покупки в кредитах
// unlimited = TRUE - предмет неограничен
// unlimited = FALSE, stock = N - предмет ограничен N штуками

/obj/machinery/computer/trade_mining_console/nanotrasen
	name = "Nanotrasen trade console"
	desc = "Защищенная торговая консоль Nanotrasen Trade Manager. Используйте майнинг очки с банковской карты для разблокировки технологий, затем покупайте их за кредиты. Все операции требуют наличия банковской карты и айди карты."
	light_color = LIGHT_COLOR_BLUE
	theme = "ntos"

/obj/machinery/computer/trade_mining_console/nanotrasen/Initialize(mapload)
	available_items = list(
		/obj/item/reagent_containers/hypospray/medipen/survival = list(
			"unlock_cost" = 5000,
			"price" = 300,
			"unlimited" = TRUE,
			"category" = "Medical",
			"description" = "Advanced stimulant injector for emergency medical situations. Provides rapid healing and combat enhancement."
		),
		/obj/item/mod/control/pre_equipped/magnate = list(
			"unlock_cost" = 5000,
			"price" = 10000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "High-end MODsuit designed for corporate executives and VIPs. Features advanced protection and utility modules."
		),
		/obj/item/research_notes/loot/medium = list(
			"unlock_cost" = 4000,
			"price" = 6000,
			"unlimited" = FALSE,
			"stock" = 4,
			"category" = "Research",
			"description" = "Valuable research data containing technological insights. Can be used to advance scientific knowledge."
		),
		/obj/item/storage/firstaid/advanced = list(
			"unlock_cost" = 1500,
			"price" = 900,
			"unlimited" = TRUE,
			"category" = "Medical",
			"description" = "Advanced medical kit containing high-grade medical supplies for treating severe injuries."
		),
		/obj/item/gun/energy/e_gun/e_old/smg = list(
			"unlock_cost" = 3000,
			"price" = 5000,
			"unlimited" = TRUE,
			"category" = "Weapons",
			"description" = "Compact energy submachine gun. Reliable sidearm for security personnel and explorers."
		),
		/obj/item/stock_parts/cell/gun/upgraded = list(
			"unlock_cost" = 3000,
			"price" = 1000,
			"unlimited" = TRUE,
			"category" = "Engineering",
			"description" = "A high capacity weapon cell. Intended for use in heavy weapons and the odd piece of personal gear."
		),
		/obj/item/stock_parts/cell/gun/pgf = list(
			"unlock_cost" = 8000,
			"price" = 1800,
			"unlimited" = TRUE,
			"category" = "Weapons",
			"description" = "Exclusive only to the PGF military, the EWC-6m is an Etherbor energy weapon cell designed for military-grade use, including expanded capacity and output."
		),
		/obj/item/storage/box/hypospray = list(
			"unlock_cost" = 8000,
			"price" = 1500,
			"unlimited" = TRUE,
			"category" = "Medical",
			"description" = "A medical product traditionally manufactured by Nanotrasen and Cybersun, this hypospray takes 30-unit vials as the drug supply for easy swapping."
		),
		/obj/item/storage/box/hypospray = list(
			"unlock_cost" = 8000,
			"price" = 1500,
			"unlimited" = TRUE,
			"category" = "Medical",
			"description" = "A medical product traditionally manufactured by Nanotrasen and Cybersun, this hypospray takes 30-unit vials as the drug supply for easy swapping."
		),
		/obj/item/mod/control/pre_equipped/mining = list(
			"unlock_cost" = 1000,
			"price" = 2000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "A recently developed MODsuit design, featurning integrated mining tools and impact plates to protect against Frontier fauna."
		),
		/obj/item/kinetic_crusher = list(
			"unlock_cost" = 4000,
			"price" = 1800,
			"unlimited" = TRUE,
			"category" = "Weapons",
			"description" = "A multipurpose disembarkation and self-defense tool designed by EXOCOM using an incomplete Nanotrasen prototype."
		),
		/obj/item/crusher_trophy/demon_claws = list(
			"unlock_cost" = 2000,
			"price" = 10000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "A set of blood-drenched claws from a massive demon's hand."
		),
		/obj/item/crusher_trophy/shiny = list(
			"unlock_cost" = 5000,
			"price" = 10000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "A glimmering nugget of dull metal. As it turns out, the fools were right- pyrite is a far rarer substance than gold in the space age. You could probably sell this for a fair price."
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
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "Elite contractor hardsuit with advanced armor plating and life support systems. Military-grade protection."
		),
		/obj/item/melee/powerfist = list(
			"unlock_cost" = 3000,
			"price" = 3000,
			"unlimited" = TRUE,
			"category" = "Weapons",
			"description" = "Powered gauntlet that delivers devastating melee attacks. Favored by close-combat specialists."
		),
		/obj/item/research_notes/loot/medium = list(
			"unlock_cost" = 4000,
			"price" = 6000,
			"unlimited" = FALSE,
			"stock" = 4,
			"category" = "Research",
			"description" = "Classified research data containing advanced technological specifications."
		),
		/obj/item/storage/firstaid/advanced = list(
			"unlock_cost" = 1500,
			"price" = 900,
			"unlimited" = TRUE,
			"category" = "Medical",
			"description" = "Military-grade medical supplies for field operations and emergency treatment."
		),
		/obj/item/disk/design_disk/a556_42 = list(
			"unlock_cost" = 10000,
			"price" = 7000,
			"unlimited" = TRUE,
			"category" = "Research",
			"description" = "A design disk containing the pattern for a refill box of standard 5.56x42mm ammo, used in Hydra."
		),
		/obj/item/disk/design_disk/a762_40 = list(
			"unlock_cost" = 7000,
			"price" = 10000,
			"unlimited" = TRUE,
			"category" = "Research",
			"description" = "A design disk containing the pattern for a refill box of standard 7.62x40mm ammo."
		),
		/obj/item/mod/module/armor_booster = list(
			"unlock_cost" = 5000,
			"price" = 7000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "MOD armor booster module."
		),
		/obj/item/organ/cyberimp/eyes/hud/security = list(
			"unlock_cost" = 2000,
			"price" = 1000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "These cybernetic eye implants will display a security HUD over everything you see."
		),
		/obj/item/organ/cyberimp/eyes/hud/medical = list(
			"unlock_cost" = 2000,
			"price" = 1000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "These cybernetic eye implants will display a medical HUD over everything you see."
		),
		/obj/item/autosurgeon/three = list(
			"unlock_cost" = 2000,
			"price" = 3000,
			"unlimited" = 10,
			"category" = "Medical",
			"description" = "Three Use Autosurgeon. USES 3 OF TIMES!"
		),
		/obj/item/kinetic_crusher/syndie_crusher = list(
			"unlock_cost" = 3000,
			"price" = 1500,
			"unlimited" = TRUE,
			"category" = "Weapons",
			"description" = "Designed by Syndicate Research and Development for their resource-gathering operations on hostile worlds."
		),
		/obj/item/crusher_trophy/goliath_crystal = list(
			"unlock_cost" = 3000,
			"price" = 2000,
			"unlimited" = TRUE,
			"category" = "Equipment",
			"description" = "A crystal ripped off from a goliath infected by the strange crystals."
		),
		/obj/item/circuitboard/machine/boarding_pad = list(
			"unlock_cost" = 5000,
			"price" = 3000,
			"unlimited" = TRUE,
			"category" = "Engineering",
			"description" = "Плата для абордажа вражеских шаттлов, один человек на пад."
		)
	)
	. = ..()
