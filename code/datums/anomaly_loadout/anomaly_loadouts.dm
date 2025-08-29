/datum/anomalyloadout
	var/name = "fish"
	var/desc = "glup glup glup"
	var/loadoutpoints = 5000
	var/list/weaponoptions = list()
	var/weaponcostmult = 1
	var/list/armoroptions = list()
	var/armorcostmult = 1
	var/list/drip = list()
	var/dripcostmult = 1
	var/list/hats = list()
	var/hatcostmult = 1
	var/list/utility = list()
	var/utilitycostmult = 1
	var/list/engineering = list()
	var/engineeringcostmult = 1
	var/list/medical = list()
	var/medicalcostmult = 1
	var/uniform = list()
	var/list/selectedItems = list()
	var/mob/living/carbon/human/le_creature


/datum/anomalyloadout/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		le_creature = user
		ui = new(user, src, "AnomalyLoadout")
		ui.state = GLOB.always_state
		ui.open()

/datum/anomalyloadout/ui_close(mob/user)
	. = ..()
	done()

/datum/anomalyloadout/ui_static_data(mob/user)
	. = ..()
	var/list/returnval = list()
	returnval["weaponoptions"] = weaponoptions
	returnval["weaponcostmult"] = weaponcostmult
	returnval["armoroptions"] = armoroptions
	returnval["armorcostmult"] = armorcostmult
	returnval["drip"] = drip
	returnval["dripcostmult"] = dripcostmult
	returnval["hats"] = hats
	returnval["hatcostmult"] = hatcostmult
	returnval["utility"] = utility
	returnval["utilitycostmult"] = utilitycostmult
	returnval["engineering"] = engineering
	returnval["engineeringcostmult"] = engineeringcostmult
	returnval["medical"] = medical
	returnval["medicalcostmult"] = medicalcostmult
	returnval["uniform"] = uniform
	return returnval


/datum/anomalyloadout/ui_data(mob/user)
	var/list/returnval = list()
	
	returnval["loadoutpoints"] = loadoutpoints
	returnval["selectedItems"] = selectedItems
	return returnval

/datum/anomalyloadout/ui_act(action, params, datum/tgui/ui)
	. = ..()
	var/path = text2path(params["item"])
	switch(action)
		if("done")
			ui.close()
		if("add")
			switch(params["type"])
				if("weaponoptions")
					try_add_item(path,weaponoptions,weaponcostmult)
				if("armoroptions")
					try_add_item(path,armoroptions,armorcostmult)
				if("drip")
					try_add_item(path,drip,dripcostmult)
				if("hats")
					try_add_item(path,hats,hatcostmult)
				if("utility")
					try_add_item(path,utility,utilitycostmult)
				if("engineering")
					try_add_item(path,engineering,engineeringcostmult)
				if("medical")
					try_add_item(path,medical,medicalcostmult)
		if("remove")
			if(selectedItems[path])
				loadoutpoints += selectedItems[path]["price"]
				selectedItems -= path
			else
				to_chat(le_creature, span_warning("Huh???"))

/datum/anomalyloadout/proc/try_add_item(path, array, costmult)
	if(array[path])
		var/price = array[path]["price"] * costmult
		if(price <= loadoutpoints)
			if(!selectedItems[path])
				selectedItems[path] = array[path]
				selectedItems[path]["price"] = price
				loadoutpoints -= price
			else
				to_chat(le_creature,span_warning("You already have one of those!"))
		else
			to_chat(le_creature,span_warning("Poverty ;-;"))

/datum/anomalyloadout/proc/done()

	var/obj/item/storage/box/garbage = new()
	for(var/i in selectedItems)
		new i(garbage)
	var/datum/component/storage/back_storage = le_creature.back.GetComponent(/datum/component/storage)
	if(back_storage)
		back_storage.handle_item_insertion(garbage, TRUE)
	else if(!le_creature.put_in_hands(garbage, TRUE))
		to_chat(le_creature, "Unable to place loadout box.")
	le_creature.set_sleeping(0)

/datum/anomalyloadout/New()
	. = ..()
	drip[/obj/item/clothing/shoes/sneakers/black] = list(
			"name" = "black shoes",
			"desc" = "A pair of black shoes.",
			"price" = 0,
			"faction" = FALSE,
	) 
	drip[/obj/item/clothing/shoes/laceup] = list(
			"name" = "laceup shoes",
			"desc" = "The height of fashion, and they're pre-polished!",
			"price" = 0,
			"faction" = FALSE,
	) 
	drip[/obj/item/clothing/shoes/workboots] = list(
			"name" = "work boots",
			"desc" = "Nanotrasen-issue Engineering lace-up work boots for the especially blue-collar.",
			"price" = 50,
			"faction" = FALSE,
	) 
	drip[/obj/item/clothing/shoes/workboots/mining] = list(
			"name" = "mining boots",
			"desc" = "Steel-toed mining boots for motility in hazardous environments. Very good at keeping toes uncrushed.",
			"price" = 50,
			"faction" = FALSE,
	) 
	drip[/obj/item/clothing/shoes/combat] = list(
			"name" = "combat boots",
			"desc" = "High speed, low drag combat boots.",
			"price" = 75,
			"faction" = FALSE,
	) 
	engineering[/obj/item/storage/toolbox/electrical] = list(
			"name" = "electrical toolbox",
			"desc" = "Danger. Very robust.",
			"price" = 150,
			"faction" = FALSE,
	)
	engineering[/obj/item/storage/toolbox/mechanical] = list(
			"name" = "mechanical toolbox",
			"desc" = "Danger. Very robust.",
			"price" = 150,
			"faction" = FALSE,
	)
	engineering[/obj/item/weldingtool/electric] = list(
			"name" = "electrical welding tool",
			"desc" = "A welding tool capable of welding functionality through the use of electricity.",
			"price" = 850,
			"faction" = FALSE,
	)
	engineering[/obj/item/stock_parts/cell/high] = list(
			"name" = "high-capacity power cell",
			"desc" = "A rechargeable electrochemical power cell. This one is capable of holding 10MJ.",
			"price" = 20,
			"faction" = FALSE,
	)
	engineering[/obj/item/storage/belt/utility/full/engi] = list(
			"name" = "full engineering toolbelt",
			"desc" = "Contains all basic tools, including an industrial welder and a multitool!",
			"price" = 200,
			"faction" = FALSE,
	)
	engineering[/obj/item/clothing/gloves/color/yellow] = list(
			"name" = "insulated gloves",
			"desc" = "Access is a polite fiction",
			"price" = 750,
			"faction" = FALSE,
	)
	engineering[/obj/item/gear_pack/anglegrinder] = list(
			"name" = "angle grinder",
			"desc" = "Great for making enterances, dismantling salvage, and getting yourself tinitus. Don't forget a bowman to protect your ears!",
			"price" = 1450,
			"faction" = FALSE,
	)
	engineering[/obj/item/clothing/glasses/welding] = list(
			"name" = "welding goggles",
			"desc" = "Protects the eyes from bright flashes; approved by the mad scientist association.",
			"price" = 150,
			"faction" = FALSE,
	)
	engineering[/obj/item/storage/pouch/engi] = list(
			"name" = "technician pouch",
			"desc" = "An orange pouch used to hold a small amount of tools or supplies, often used for emergency repair kits. Fits into your pocket. Comes with a crowbar, screwdriver, wrench, and an emergency welding tool by default",
			"price" = 250,
			"faction" = FALSE,
	)
	engineering[/obj/item/storage/firstaid/radiation] = list(
			"name" = "radiation treatment kit",
			"desc" = "Used to treat severe radiation poisoning.",
			"price" = 500,
			"faction" = FALSE,
	)
	utility[/obj/item/clothing/head/helmet/space/eva] = list(
			"name" = "EVA helmet",
			"desc" = "A lightweight space helmet with the basic ability to protect the wearer from the vacuum of space during emergencies.",
			"price" = 200,
			"faction" = FALSE,
	) 
	utility[/obj/item/clothing/suit/space/eva] = list(
			"name" = "EVA suit",
			"desc" = "A lightweight space suit with the basic ability to protect the wearer from the vacuum of space during emergencies.",
			"price" = 800,
			"faction" = FALSE,
	)
	utility[/obj/item/flashlight/seclite] = list(
			"name" = "seclite",
			"desc" = "A robust flashlight used by security. Can be attached to most armored helmets",
			"price" = 100,
			"faction" = FALSE,
	)
	utility[/obj/item/attachment/rail_light] = list(
			"name" = "rail light",
			"desc" = "A flashlight made to be mounted on a firearm.",
			"price" = 75,
			"faction" = FALSE,
	) 
	utility[/obj/item/attachment/bayonet] = list(
			"name" = "bayonet",
			"desc" = "Stabby-Stabby",
			"price" = 250,
			"faction" = FALSE,
	)
	utility[/obj/item/soap] = list(
			"name" = "soap",
			"desc" = "A cheap bar of soap. Doesn't smell.",
			"price" = 20,
			"faction" = FALSE,
	) 
	utility[/obj/item/pickaxe/mini] = list(
			"name" = "compact pickaxe",
			"desc" = "A smaller, compact version of the standard pickaxe.",
			"price" = 150,
			"faction" = FALSE,
	)
	utility[/obj/item/pickaxe] = list(
			"name" = "pickaxe",
			"desc" = "A big, bulky pickaxe",
			"price" = 100,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/bag/ore] = list(
			"name" = "mining satchel",
			"desc" = "This little bugger can be used to store and transport ores.",
			"price" = 50,
			"faction" = FALSE,
	) 
	utility[/obj/item/mining_scanner] = list(
			"name" = "manual mining scanner",
			"desc" = "A scanner that checks surrounding rock for useful minerals; it can also be used to stop gibtonite detonations.\nIt has a speaker that can be toggled with <b>alt+click</b>",
			"price" = 50,
			"faction" = FALSE,
	)
	utility[/obj/item/pickaxe/drill/jackhammer] = list(
			"name" = "hypersonic jackhammer",
			"desc" = "The epitome of conventional rock-smashing technology, invented by NT and cost-optimized by EXOCOM. Smashes rocks, objects, and unfortunate wildlife with sonic blasts.",
			"price" = 1750,
			"faction" = FALSE,
	)
	utility[/obj/item/radio/headset/alt] = list(
			"name" = "bowman headset",
			"desc" = "An updated, modular intercom that fits over the head. Protects ears from flashbangs.",
			"price" = 50,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/belt/military] = list(
			"name" = "chest rig",
			"desc" = "A set of tactical webbing worn by military cosplayers and actual militaries alike.",
			"price" = 500,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/belt/military/assault] = list(
			"name" = "assault belt",
			"desc" = "A tactical assault belt.",
			"price" = 300,
			"faction" = FALSE,
	)
	utility[/obj/item/clothing/accessory/holster] = list(
			"name" = "shoulder holster",
			"desc" = "A holster to carry a handgun and ammo.",
			"price" = 600,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/box/emptysandbags] = list(
			"name" = "box of empty sandbags",
			"desc" = "Fortifications on a budget",
			"price" = 150,
			"faction" = FALSE,
	)
	utility[/obj/item/grenade/smokebomb] = list(
			"name" = "smoke grenade",
			"desc" = "A smoke grenade. Widely used by military forces on the frontier and beyond to screen unit movements and signal landing zones.",
			"price" = 70,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/pouch] = list(
			"name" = "utility pouch",
			"desc" = "A small pouch for 2 small storing items.",
			"price" = 150,
			"faction" = FALSE,
	) 
	utility[/obj/item/storage/pouch/ammo] = list(
			"name" = "ammunition pouch",
			"desc" = "An ammunition pouch, commonly used by soldiers to hold additional ammo in an accessible location.",
			"price" = 150,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/pouch/grenade] = list(
			"name" = "grenade pouch",
			"desc" = "A row of small pouches intended for holding explosives safely, primarily grenades.",
			"price" = 150,
			"faction" = FALSE,
	)
	utility[/obj/item/storage/pouch/squad] = list(
			"name" = "command pouch",
			"desc" = "A light blue pouch used by squad leaders everywhere to hold command equipment.",
			"price" = 150,
			"faction" = FALSE,
	)
	utility[/obj/item/shield/riot] = list(
			"name" = "ballistic shield",
			"desc" = "A shield adept at blocking blunt objects and bullets from connecting with the torso of the shield wielder. Use 10 plasteel to repair.",
			"price" = 1000,
			"faction" = FALSE,
	) 
	utility[/obj/item/shield/riot/tele] = list(
			"name" = "telescopic shield",
			"desc" = "An advanced riot shield made of lightweight materials that collapses for easy storage.",
			"price" = 750,
			"faction" = FALSE,
	) 
	utility[/obj/item/melee/knife/survival] = list(
			"name" = "survival knife",
			"desc" = "A hunting grade survival knife.",
			"price" = 120,
			"faction" = FALSE,
	) 
	utility[/obj/item/melee/sword/mass] = list(
			"name" = "mass produced machete",
			"desc" = "A mass-produced machete made of stamped steel, with a faux-leather grip for ease of handling. Right between that of a one-handed and two-handed weapon.",
			"price" = 250,
			"faction" = FALSE,
	) 
	utility[/obj/item/melee/knife/combat] = list(
			"name" = "combat knife",
			"desc" = "A military combat utility survival knife.",
			"price" = 350,
			"faction" = FALSE,
	) 
	utility[/obj/item/grenade/frag] = list(
			"name" = "frag grenade",
			"desc" = "An anti-personnel fragmentation grenade, this weapon excels at killing soft targets by shredding them with metal shrapnel.",
			"price" = 250,
			"faction" = FALSE,
	)
	armoroptions[/obj/item/clothing/suit/armor/vest] = list(
			"name" = "armor vest",
			"desc" = "A slim Type I armored vest that provides decent protection against most types of damage.",
			"price" = 600,
			"faction" = FALSE,
	) 
	hats[/obj/item/clothing/head/helmet/sec] = list(
			"name" = "helmet",
			"desc" = "Standard Security gear. Protects the head from impacts.",
			"price" = 150,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/detective/wammo] = list(
			"name" = "HP Detective Special",
			"desc" = "A small law enforcement firearm. Originally commissioned by Nanotrasen for their Private Investigation division, it has become extremely popular among independent civilians as a cheap, compact sidearm. Uses .38 Special rounds.",
			"price" = 600,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/firebrand/wammo] = list(
			"name" = "HP Firebrand",
			"desc" = "An archaic precursor to revolver-type firearms, this gun was rendered completely obsolete millennia ago. While fast to fire, it is extremely inaccurate. Uses .357 ammo.",
			"price" = 700,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/commander/wammo] = list(
			"name" = "VI Commander",
			"desc" = "A service pistol produced as Vigilitas Interstellar's standard sidearm. Has a reputation for being easy to use, due to its light recoil and high magazine capacity. Chambered in 9x18mm.",
			"price" = 750,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/ringneck/wammo] = list(
			"name" = "Ringneck-76",
			"desc" = "A service handgun popular among law enforcement, mercenaries, and independent spacers with discerning tastes. Chambered in 10x22mm.",
			"price" = 1000,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/candor/wammo] = list(
			"name" = "Candor",
			"desc" = "A classic semi-automatic handgun, widely popular throughout the Frontier. An engraving on the slide marks it as a product of Hunter's Pride. Chambered in .45.",
			"price" = 1000,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/shadow/wammo] = list(
			"name" = "HP Shadow",
			"desc" = "A mid-size revolver. Despite the antiquated design, it is cheap, reliable, and stylish, making it a favorite among fast-drawing spacers and the officers of various militaries, as well as small-time police units. Chambered in .44.",
			"price" = 1000,
			"faction" = FALSE,
	)
	weaponoptions[/obj/item/storage/guncase/pistol/m20_auto_elite/wammo] = list(
			"name" = "Model 20 \"Auto Elite\"",
			"desc" = "A large handgun chambered .44 Roumain. Originally developed by Serene Outdoors for the Star City Police Department when their older handguns proved underpowered, the Auto Elite proved heavy and unwieldy in practice. It has nevertheless seen modest success as a sidearm for big game hunters and among customers looking to make an impression.",
			"price" = 1250,
			"faction" = FALSE,
	)
	
	 
	weaponoptions[/obj/item/storage/guncase/pistol/viper/wammo] = list(
			"name" = "Viper-23",
			"desc" = "A powerful bull-barrel revolver. Very popular among mercenaries and the occasional well-to-do spacer or pirate for its flashy appearance and powerful cartridge. Chambered in .357 Magnum.",
			"price" = 1500,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/pouch/medical] = list(
			"name" = "aid pouch",
			"desc" = "An individual first aid kit, for use preventing and treating battlefield injuries. Contains 5 gauzes, 5 sutures, 5 regen meshes, and an epipen.",
			"price" = 250,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/firstaid/regular] = list(
			"name" = "first-aid kit",
			"desc" = "A first aid kit with the ability to heal common types of injuries.",
			"price" = 400,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/firstaid/brute] = list(
			"name" = "brute trauma treatment kit",
			"desc" = "A first aid kit for when you get toolboxed.",
			"price" = 500,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/firstaid/fire] = list(
			"name" = "burn treatment kit",
			"desc" = "A specialized medical kit for treating severe burns.",
			"price" = 500,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/firstaid/toxin] = list(
			"name" = "toxin treatment kit",
			"desc" = "Used to treat toxic blood content and radiation poisoning.",
			"price" = 500,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/firstaid/advanced] = list(
			"name" = "advanced first aid kit",
			"desc" = "An advanced kit to help deal with advanced wounds.",
			"price" = 1100,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/firstaid/tactical] = list(
			"name" = "combat medical kit",
			"desc" = "Some serious equipment. Also contains a belt defib.",
			"price" = 4000,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/pill_bottle/charcoal] = list(
			"name" = "charcoal pills",
			"desc" = "7 charcoal pills to cleanse toxins both dispersed in your body, and in your bloodstream and stomach",
			"price" = 200,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/pill_bottle/iron] = list(
			"name" = "iron pills",
			"desc" = "7 iron pills for blood defiency",
			"price" = 200,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/pill_bottle/mannitol] = list(
			"name" = "mannitol pills",
			"desc" = "7 mannitol pills for brain damage and light traumas",
			"price" = 200,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/pill_bottle/mining] = list(
			"name" = "physical patches bottle",
			"desc" = "contains a patch of silver sulf and 3 styptic acid",
			"price" = 200,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/pill_bottle/mining] = list(
			"name" = "physical patches bottle",
			"desc" = "contains a patch of silver sulf and 3 styptic acid",
			"price" = 200,
			"faction" = FALSE,
	)
	medical[/obj/item/defibrillator/loaded] = list(
			"name" = "defibrillator",
			"desc" = "cracklepads!",
			"price" = 750,
			"faction" = FALSE,
	)
	medical[/obj/item/storage/case/surgery] = list(
			"name" = "surgical case",
			"desc" = "A large sterile tray with a lid for storing all of the tools you'd need for surgery.",
			"price" = 3000,
			"faction" = FALSE,
	)


	


/datum/anomalyloadout/syndicate


/datum/anomalyloadout/syndicate/New()
	. = ..()
	weaponoptions[/obj/item/storage/guncase/pistol/himehabu/wammo] = list(
			"name" = "PC-81 \"Himehabu\"",
			"desc" = "An astonishingly compact machine pistol firing ultra-light projectiles, designed to be as small and concealable as possible while remaining a credible threat at very close range. Armor penetration is practically non-existent. Chambered in .22.",
			"price" = 250,
			"faction" = TRUE,
	)  
	weaponoptions[/obj/item/storage/guncase/pistol/asp/wammo] = list(
			"name" = "BC-81 \"Asp\"",
			"desc" = "An armor-piercing combat handgun once used by Syndicate strike teams, now primarily used by descendants of the Gorlex Marauders. Chambered in 5.7mm.",
			"price" = 1250,
			"faction" = TRUE,
	)   
	weaponoptions[/obj/item/storage/guncase/pistol/pc76/wammo] = list(
			"name" = "PC-76 \"Ringneck\"",
			"desc" = "A compact handgun used by most Syndicate-affiliated groups. Small enough to conceal in most pockets, making it popular for covert elements and simply as a compact defensive weapon. Chambered in 10x22mm.",
			"price" = 1250,
			"faction" = TRUE,
	)   
	weaponoptions[/obj/item/storage/guncase/pistol/a357/wammo] = list(
			"name" = "R-23 \"Viper\"",
			"desc" = "An imposing revolver used by officers and certain agents of Syndicate member factions during the ICW, still favored by captains and high-ranking officers of the former Syndicate. Chambered in .357 Magnum.",
			"price" = 1750,
			"faction" = TRUE,
	) 
	weaponoptions[/obj/item/storage/guncase/pistol/rattlesnake/wammo] = list(
			"name" = "MP-84 \"Rattlesnake\"",
			"desc" = "A machine pistol, once used by Syndicate infiltrators and special forces during the ICW. Still used by specialists in former Syndicate factions. Chambered in 9x18mm.",
			"price" = 2500,
			"faction" = TRUE,
	)  
	engineering[/obj/item/storage/toolbox/syndicate] = list(
			"name" = "black and red toolbox",
			"desc" = "Syndicate toolbox, containing a full toolset and some insuls",
			"price" = 1150,
			"faction" = TRUE,
	)
	engineering[/obj/item/storage/belt/utility/syndicate] = list(
			"name" = "syndicate toolbelt",
			"desc" = "Syndicate toolbelt, containing a full toolset and an inducer",
			"price" = 1150,
			"faction" = TRUE,
	)
	utility[/obj/item/clothing/gloves/combat] = list(
			"name" = "combat gloves",
			"desc" = "These tactical gloves are extra-durable, offering some fire and acid protection.",
			"price" = 50,
			"faction" = TRUE,
	)


/datum/anomalyloadout/syndicate/cybersun

/datum/anomalyloadout/syndicate/cybersun/New()
	. = ..()

/datum/anomalyloadout/syndicate/cybersun/engineer
	engineeringcostmult = 0.5

/datum/anomalyloadout/syndicate/cybersun/engineer/New()
	. = ..()


/datum/anomalyloadout/syndicate/cybersun/miner
	utilitycostmult = 0.5

/datum/anomalyloadout/syndicate/cybersun/miner/New()
	. = ..()

/datum/anomalyloadout/syndicate/cybersun/assistant
	utilitycostmult = 0.75

/datum/anomalyloadout/syndicate/cybersun/assistant/New()
	. = ..()
	

/datum/anomalyloadout/syndicate/cybersun/captain

/datum/anomalyloadout/syndicate/cybersun/captain/New()
	. = ..()
	loadoutpoints += 3000
	uniform[/obj/item/clothing/under/syndicate/cybersun/officer] = list(
			"name" = "cybersun officer's suit",
			"desc" = "A crimson-red suit used by the officers employed by Cybersun.",
			"price" = 0,
			"faction" = TRUE,
	)
	armoroptions[/obj/item/clothing/suit/armor/vest/capcarapace/cybersun] = list(
			"name" = "Cybersun captain's haori",
			"desc" = "An extraordinarily fashionable haori, utilized by Cybersun captains. Weaved with armored fabric to protect the user from gunshots.",
			"price" = 3000,
			"faction" = TRUE,
	)
	hats[/obj/item/clothing/head/HoS/cybersun] = list(
			"name" = "cybersun hat",
			"desc" = "A crimson-red hat fit for a high ranking cybersun officer.",
			"price" = 0,
			"faction" = TRUE,
	)
	