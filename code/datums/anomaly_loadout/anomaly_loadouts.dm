

/datum/anomalyloadout
	var/name = "fish"
	var/desc = "glup glup glup"
	var/loadoutpoints = 3000
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

	if(GLOB.anomaly_loadout_weaponoptions_indie.len == 0)
		initIndieWeapons()
	weaponoptions = GLOB.anomaly_loadout_weaponoptions_indie
	if(GLOB.anomaly_loadout_armoroptions_indie.len == 0)
		initIndieArmors()
	armoroptions = GLOB.anomaly_loadout_armoroptions_indie
	if(GLOB.anomaly_loadout_drip_indie.len == 0)
		initIndieDrip()
	drip = GLOB.anomaly_loadout_drip_indie
	if(GLOB.anomaly_loadout_hats_indie.len == 0)
		initIndieHats()
	hats = GLOB.anomaly_loadout_hats_indie
	if(GLOB.anomaly_loadout_utility_indie.len == 0)
		initIndieUtility()
	utility = GLOB.anomaly_loadout_utility_indie
	if(GLOB.anomaly_loadout_engineering_indie.len == 0)
		initIndieEngineering()
	engineering = GLOB.anomaly_loadout_engineering_indie
	if(GLOB.anomaly_loadout_medical_indie.len == 0)
		initIndieMedical()
	medical = GLOB.anomaly_loadout_medical_indie


/datum/anomalyloadout/proc/initIndieWeapons()
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/detective] = list(
			"name" = "HP Detective Special (.38)",
			"desc" = "A small law enforcement firearm. Originally commissioned by Nanotrasen for their Private Investigation division, it has become extremely popular among independent civilians as a cheap, compact sidearm. Uses .38 Special rounds.",
			"price" = 600,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/firebrand] = list(
			"name" = "HP Firebrand (.357)",
			"desc" = "An archaic precursor to revolver-type firearms, this gun was rendered completely obsolete millennia ago. While fast to fire, it is extremely inaccurate. Uses .357 ammo.",
			"price" = 700,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/commander] = list(
			"name" = "VI Commander (9x18mm)",
			"desc" = "A service pistol produced as Vigilitas Interstellar's standard sidearm. Has a reputation for being easy to use, due to its light recoil and high magazine capacity. Chambered in 9x18mm.",
			"price" = 750,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/ringneck] = list(
			"name" = "Ringneck-76 (10x22mm)",
			"desc" = "A service handgun popular among law enforcement, mercenaries, and independent spacers with discerning tastes. Chambered in 10x22mm.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/candor] = list(
			"name" = "Candor (.45)",
			"desc" = "A classic semi-automatic handgun, widely popular throughout the Frontier. An engraving on the slide marks it as a product of Hunter's Pride. Chambered in .45.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/shadow] = list(
			"name" = "HP Shadow (.44)",
			"desc" = "A mid-size revolver. Despite the antiquated design, it is cheap, reliable, and stylish, making it a favorite among fast-drawing spacers and the officers of various militaries, as well as small-time police units. Chambered in .44.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/m20_auto_elite] = list(
			"name" = "Model 20 \"Auto Elite\" (.44)",
			"desc" = "A large handgun chambered .44 Roumain. Originally developed by Serene Outdoors for the Star City Police Department when their older handguns proved underpowered, the Auto Elite proved heavy and unwieldy in practice. It has nevertheless seen modest success as a sidearm for big game hunters and among customers looking to make an impression.",
			"price" = 1250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/viper] = list(
			"name" = "Viper-23 (.357)",
			"desc" = "A powerful bull-barrel revolver. Very popular among mercenaries and the occasional well-to-do spacer or pirate for its flashy appearance and powerful cartridge. Chambered in .357 Magnum.",
			"price" = 1500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/derringer] = list(
			"name" = ".38 Derringer (.357)",
			"desc" = "No. Just... no.",
			"price" = 350,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/derringer] = list(
			"name" = ".38 Derringer (.38)",
			"desc" = "No. Just... no.",
			"price" = 350,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/energy/laser] = list(
			"name" = "SL L-204 laser gun",
			"desc" = "A lasgun!",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/miniegun] = list(
			"name" = "miniature energy gun",
			"desc" = "An egun but smol!",
			"price" = 500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/energy/egun] = list(
			"name" = "energy rifle",
			"desc" = "An egun!",
			"price" = 1250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/gun/energy/laser/scatter] = list(
			"name" = "scatter laser gun",
			"desc" = "A laser gun mimicking the function of a shotgun, manufactured with an adjustable lens capable of projecting scattershot or slugs.",
			"price" = 1250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/energy/iongun] = list(
			"name" = "ion rifle",
			"desc" = "A man-portable anti-armor weapon designed to disable mechanical threats at range. The high energy load requires the gun to cooldown between each shot.",
			"price" = 3500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/pistol/kalixpistol] = list(
			"name" = "Etherbor SG-8",
			"desc" = "Etherbor's current and sidearm offering. While marketed for the military, it's also available for civillians as an upgrade over older and obsolete beam pistols.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/energy/kalixrifle] = list(
			"name" = "Etherbor BG-12 Beam Gun",
			"desc" = "Etherbor Industries's current civilian energy weapon model. The BG-12 energy beam gun is identical to the military model, minus the removal of the full auto mode. Otherwise, it's no different from older hunting beams from Kalixcis's history.",
			"price" = 3000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/doublebarrel] = list(
			"name" = "Double Barrel Shotgun (12g)",
			"desc" = "Doom soundtrack sold seperately.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/conflagration] = list(
			"name" = "HP Conflagration (12g)",
			"desc" = "A lightweight lever-action shotgun with a 5 round ammunition capacity. The lever action allows it to be cycled quickly and acurrately. In theory, you could ever operate it one-handed. Chambered in 12g. 6 round capacity",
			"price" = 1500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/hellfire] = list(
			"name" = "HP Hellfire (12g)",
			"desc" = "A hefty pump-action riot shotgun with an eight-round tube, manufactured by Hunter's Pride. Especially popular among the Frontier's police forces. Chambered in 12g. 9 rounds capacity",
			"price" = 2000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/brimstone] = list(
			"name" = "HP Brimstone (12g)",
			"desc" = "A simple and sturdy pump-action shotgun sporting a 5-round capacity, manufactured by Hunter's Pride. Found widely throughout the Frontier in the hands of hunters, pirates, police, and countless others. Chambered in 12g.",
			"price" = 2000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/buckmaster] = list(
			"name" = "Model 11 \"Buckmaster\" (12g)",
			"desc" = "A semi-automatic hunting shotgun produced by Serene Outdoors. Much lighter and handier than military combat shotguns, it offers the same fire rate and magazine capacity, making it an excellent choice for hunting birds and large game or for security forces looking to upgrade from pump action guns. Chambered in 12g.",
			"price" = 3000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/cobra] = list(
			"name" = "Cobra-20 (.45)",
			"desc" = "An older model of submachine gun manufactured by Scarborough Arms and marketed to mercenaries, law enforcement, and independent militia. Only became popular after the end of the ICW. Chambered in .45.",
			"price" = 3000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/wt550] = list(
			"name" = "WT-550 Automatic Rifle (4.6x30mm)",
			"desc" = "An outdated PDW, used centuries ago by Nanotrasen security elements. Uses 4.6x30mm rounds.",
			"price" = 3000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/m12] = list(
			"name" = "Model 12 \"Sporter\" (.22LR)",
			"desc" = "An extremely popular target shooting rifle produced by Serene Outdoors. Inexpensive, widely available, and produced in massive numbers, the Sporter is also popular for hunting small game and ground birds. Chambered in .22 LR.",
			"price" = 500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/m13] = list(
			"name" = "Model 13 \"Larker\" (.22LR)",
			"desc" = "A common after-market modification of the Model 12 \"Sporter\" rifle, keyed to fire a three round burst.",
			"price" = 750,
			"faction" = FALSE,
		)

		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/m15] = list(
			"name" = "Model 15 Super Sporter (5.56x42 CLIP)",
			"desc" = "A popular semi-automatic hunting rifle produced by Serene Outdoors. Solid all-round performance, high accuracy, and ease of access compared to military rifles makes the Super Sporter a popular choice for hunting medium game and occasionally self-defense. Chambered in 5.56mm.",
			"price" = 2500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/winchester] = list(
			"name" = "HP Flaming Arrow (.38)",
			"desc" = "A sturdy and lightweight lever-action rifle with hand-stamped Hunter's Pride marks on the receiver. A popular choice among Frontier homesteaders for hunting small game and rudimentary self-defense. Chambered in .38.",
			"price" = 750,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/absolution] = list(
			"name" = "HP Absolution (.357)",
			"desc" = "A large lever-action rifle with hand-stamped Hunter's Pride marks on the receiver and an 8 round ammunition capacity. More powerful than the Flaming Arrow, the Absolution is a popular pick for hunting larger fauna like bears and goliaths, especially when a bolt action's slower rate of fire would be a liability. Chambered in .357.",
			"price" = 2000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/illestren] = list(
			"name" = "HP Illestren (8x50mmR)",
			"desc" = "A sturdy and conventional bolt-action rifle. One of Hunter's Pride's most successful firearms, the Illestren is popular among colonists, pirates, snipers, and countless others. Chambered in 8x50mmR.",
			"price" = 1250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/beacon] = list(
			"name" = "HP Beacon (.45-70)",
			"desc" = "A break-action rifle made by Hunter's Pride and sold to civilian hunters. Boasts excellent accuracy and stopping power. Uses .45-70 ammo.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_weaponoptions_indie[/obj/item/storage/guncase/skm] = list(
			"name" = "SKM-24 (7.62x40mm CLIP)",
			"desc" = "An obsolete model of assault rifle once used by CLIP. Legendary for its durability and low cost, surplus rifles are commonplace on the Frontier, and the design has been widely copied. Chambered in 7.62x40mm CLIP.",
			"price" = 5000,
			"faction" = FALSE,
		)

/datum/anomalyloadout/proc/initIndieArmors()
		GLOB.anomaly_loadout_armoroptions_indie[/obj/item/clothing/suit/armor/vest] = list(
			"name" = "armor vest",
			"desc" = "A slim Type I armored vest that provides decent protection against most types of damage.",
			"price" = 600,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_armoroptions_indie[/obj/item/clothing/suit/space/hardsuit/mining/independent] = list(
			"name" = "mining hardsuit",
			"desc" = "An inexpensive, widespread suit designed for work in hazardous, low pressure environments. Equipped with extra plating against blunt impacts and other common threats as well as a powerful shoulder-mounted floodlight. <br> Suits like this are a common sight among miners on the frontier, frequently equipped with additional improvised plating.",
			"price" = 1500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_armoroptions_indie[/obj/item/clothing/suit/space/hardsuit/medical] = list(
			"name" = "medical hardsuit",
			"desc" = "A special suit that protects against hazardous, low pressure environments. Built with lightweight materials for easier movement.",
			"price" = 1500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_armoroptions_indie[/obj/item/clothing/suit/space/hardsuit/engine] = list(
			"name" = "engineering hardsuit",
			"desc" = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding.",
			"price" = 1500,
			"faction" = FALSE,
		)

/datum/anomalyloadout/proc/initIndieDrip()
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/sneakers/black] = list(
				"name" = "black shoes",
				"desc" = "A pair of black shoes.",
				"price" = 0,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/laceup] = list(
				"name" = "laceup shoes",
				"desc" = "The height of fashion, and they're pre-polished!",
				"price" = 0,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/workboots] = list(
				"name" = "work boots",
				"desc" = "Nanotrasen-issue Engineering lace-up work boots for the especially blue-collar.",
				"price" = 50,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/workboots/mining] = list(
				"name" = "mining boots",
				"desc" = "Steel-toed mining boots for motility in hazardous environments. Very good at keeping toes uncrushed.",
				"price" = 50,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/combat] = list(
				"name" = "combat boots",
				"desc" = "High speed, low drag combat boots.",
				"price" = 75,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/cowboy] = list(
				"name" = "cowboy boots",
				"desc" = "A small sticker lets you know they've been inspected for snakes, It is unclear how long ago the inspection took place...",
				"price" = 75,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/cowboy/black] = list(
				"name" = "cowboy boots, black",
				"desc" = "A small sticker lets you know they've been inspected for snakes, It is unclear how long ago the inspection took place...",
				"price" = 75,
				"faction" = FALSE,
		)
		GLOB.anomaly_loadout_drip_indie[/obj/item/clothing/shoes/cowboy/white] = list(
				"name" = "cowboy boots, white",
				"desc" = "A small sticker lets you know they've been inspected for snakes, It is unclear how long ago the inspection took place...",
				"price" = 75,
				"faction" = FALSE,
		)

/datum/anomalyloadout/proc/initIndieEngineering()
		GLOB.anomaly_loadout_engineering_indie[/obj/item/storage/toolbox/electrical] = list(
			"name" = "electrical toolbox",
			"desc" = "Danger. Very robust.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/storage/toolbox/mechanical] = list(
			"name" = "mechanical toolbox",
			"desc" = "Danger. Very robust.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/weldingtool/electric] = list(
			"name" = "electrical welding tool",
			"desc" = "A welding tool capable of welding functionality through the use of electricity.",
			"price" = 850,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/stock_parts/cell/high] = list(
			"name" = "high-capacity power cell",
			"desc" = "A rechargeable electrochemical power cell. This one is capable of holding 10MJ.",
			"price" = 20,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/storage/belt/utility/full/engi] = list(
			"name" = "full engineering toolbelt",
			"desc" = "Contains all basic tools, including an industrial welder and a multitool!",
			"price" = 200,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/clothing/gloves/color/yellow] = list(
			"name" = "insulated gloves",
			"desc" = "Access is a polite fiction",
			"price" = 750,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/gear_pack/anglegrinder] = list(
			"name" = "angle grinder",
			"desc" = "Great for making enterances, dismantling salvage, and getting yourself tinitus. Don't forget a bowman to protect your ears!",
			"price" = 1450,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/clothing/glasses/welding] = list(
			"name" = "welding goggles",
			"desc" = "Protects the eyes from bright flashes; approved by the mad scientist association.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/storage/pouch/engi] = list(
			"name" = "technician pouch",
			"desc" = "An orange pouch used to hold a small amount of tools or supplies, often used for emergency repair kits. Fits into your pocket. Comes with a crowbar, screwdriver, wrench, and an emergency welding tool by default",
			"price" = 250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_engineering_indie[/obj/item/storage/firstaid/radiation] = list(
			"name" = "radiation treatment kit",
			"desc" = "Used to treat severe radiation poisoning.",
			"price" = 500,
			"faction" = FALSE,
		)

/datum/anomalyloadout/proc/initIndieHats()
/datum/anomalyloadout/proc/initIndieUtility()

		GLOB.anomaly_loadout_utility_indie[/obj/item/clothing/head/helmet/space/eva] = list(
			"name" = "EVA helmet",
			"desc" = "A lightweight space helmet with the basic ability to protect the wearer from the vacuum of space during emergencies.",
			"price" = 200,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/clothing/suit/space/eva] = list(
			"name" = "EVA suit",
			"desc" = "A lightweight space suit with the basic ability to protect the wearer from the vacuum of space during emergencies.",
			"price" = 800,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/flashlight/seclite] = list(
			"name" = "seclite",
			"desc" = "A robust flashlight used by security. Can be attached to most armored helmets",
			"price" = 100,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/attachment/rail_light] = list(
			"name" = "rail light",
			"desc" = "A flashlight made to be mounted on a firearm.",
			"price" = 75,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/attachment/bayonet] = list(
			"name" = "bayonet",
			"desc" = "Stabby-Stabby",
			"price" = 250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/soap] = list(
			"name" = "soap",
			"desc" = "A cheap bar of soap. Doesn't smell.",
			"price" = 20,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/pickaxe/mini] = list(
			"name" = "compact pickaxe",
			"desc" = "A smaller, compact version of the standard pickaxe.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/pickaxe] = list(
			"name" = "pickaxe",
			"desc" = "A big, bulky pickaxe",
			"price" = 100,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/bag/ore] = list(
			"name" = "mining satchel",
			"desc" = "This little bugger can be used to store and transport ores.",
			"price" = 50,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/mining_scanner] = list(
			"name" = "manual mining scanner",
			"desc" = "A scanner that checks surrounding rock for useful minerals; it can also be used to stop gibtonite detonations.\nIt has a speaker that can be toggled with <b>alt+click</b>",
			"price" = 50,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/pickaxe/drill/jackhammer] = list(
			"name" = "hypersonic jackhammer",
			"desc" = "The epitome of conventional rock-smashing technology, invented by NT and cost-optimized by EXOCOM. Smashes rocks, objects, and unfortunate wildlife with sonic blasts.",
			"price" = 1750,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/radio/headset/alt] = list(
			"name" = "bowman headset",
			"desc" = "An updated, modular intercom that fits over the head. Protects ears from flashbangs.",
			"price" = 50,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/belt/military] = list(
			"name" = "chest rig",
			"desc" = "A set of tactical webbing worn by military cosplayers and actual militaries alike.",
			"price" = 500,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/belt/military/assault] = list(
			"name" = "assault belt",
			"desc" = "A tactical assault belt.",
			"price" = 300,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/clothing/accessory/holster] = list(
			"name" = "shoulder holster",
			"desc" = "A holster to carry a handgun and ammo.",
			"price" = 600,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/box/emptysandbags] = list(
			"name" = "box of empty sandbags",
			"desc" = "Fortifications on a budget",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/grenade/smokebomb] = list(
			"name" = "smoke grenade",
			"desc" = "A smoke grenade. Widely used by military forces on the frontier and beyond to screen unit movements and signal landing zones.",
			"price" = 70,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/pouch] = list(
			"name" = "utility pouch",
			"desc" = "A small pouch for 2 small storing items.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/pouch/ammo] = list(
			"name" = "ammunition pouch",
			"desc" = "An ammunition pouch, commonly used by soldiers to hold additional ammo in an accessible location.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/pouch/grenade] = list(
			"name" = "grenade pouch",
			"desc" = "A row of small pouches intended for holding explosives safely, primarily grenades.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/storage/pouch/squad] = list(
			"name" = "command pouch",
			"desc" = "A light blue pouch used by squad leaders everywhere to hold command equipment.",
			"price" = 150,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/shield/riot] = list(
			"name" = "ballistic shield",
			"desc" = "A shield adept at blocking blunt objects and bullets from connecting with the torso of the shield wielder. Use 10 plasteel to repair.",
			"price" = 1000,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/shield/riot/tele] = list(
			"name" = "telescopic shield",
			"desc" = "An advanced riot shield made of lightweight materials that collapses for easy storage.",
			"price" = 750,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/melee/knife/survival] = list(
			"name" = "survival knife",
			"desc" = "A hunting grade survival knife.",
			"price" = 120,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/melee/sword/mass] = list(
			"name" = "mass produced machete",
			"desc" = "A mass-produced machete made of stamped steel, with a faux-leather grip for ease of handling. Right between that of a one-handed and two-handed weapon.",
			"price" = 250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/melee/knife/combat] = list(
			"name" = "combat knife",
			"desc" = "A military combat utility survival knife.",
			"price" = 350,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/grenade/frag] = list(
			"name" = "frag grenade",
			"desc" = "An anti-personnel fragmentation grenade, this weapon excels at killing soft targets by shredding them with metal shrapnel.",
			"price" = 250,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/tank/internals/emergency_oxygen/engi] = list(
			"name" = "extended-capacity emergency oxygen tank",
			"desc" = "Used for emergencies. Contains very little oxygen, so try to conserve it until you actually need it.",
			"price" = 30,
			"faction" = FALSE,
		)
		GLOB.anomaly_loadout_utility_indie[/obj/item/tank/internals/oxygen] = list(
			"name" = "oxygen tank",
			"desc" = "A tank of oxygen, this one is blue.",
			"price" = 30,
			"faction" = FALSE,
		)



/datum/anomalyloadout/proc/initIndieMedical()
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/pouch/medical] = list(
			"name" = "aid pouch",
			"desc" = "An individual first aid kit, for use preventing and treating battlefield injuries. Contains 5 gauzes, 5 sutures, 5 regen meshes, and an epipen.",
			"price" = 250,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/pouch/medical/afak] = list(
			"name" = "aid pouch (AFAK)",
			"desc" = "An army first aid kit, for use preventing and treating battlefield injuries. Contains 15 sutures, 15 regen meshes, an epipen, and a survival pen.",
			"price" = 400,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/regular] = list(
			"name" = "first-aid kit",
			"desc" = "A first aid kit with the ability to heal common types of injuries.",
			"price" = 400,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/brute] = list(
			"name" = "brute trauma treatment kit",
			"desc" = "A first aid kit for when you get toolboxed.",
			"price" = 500,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/fire] = list(
			"name" = "burn treatment kit",
			"desc" = "A specialized medical kit for treating severe burns.",
			"price" = 500,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/toxin] = list(
			"name" = "toxin treatment kit",
			"desc" = "Used to treat toxic blood content and radiation poisoning.",
			"price" = 500,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/medical] = list(
			"name" = "\"MD\" medical aid kit",
			"desc" = "A medkit for practicing Medical Doctors! Contains everything a standard first aid kit does, and some wound tending tools as well. Does NOT come with a health analyzer!",
			"price" = 1100,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/advanced] = list(
			"name" = "advanced first aid kit",
			"desc" = "An advanced kit to help deal with advanced wounds.",
			"price" = 700,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/firstaid/tactical] = list(
			"name" = "combat medical kit",
			"desc" = "Some serious equipment. Also contains a belt defib.",
			"price" = 4000,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/pill_bottle/charcoal] = list(
			"name" = "charcoal pills",
			"desc" = "7 charcoal pills to cleanse toxins both dispersed in your body, and in your bloodstream and stomach",
			"price" = 200,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/pill_bottle/iron] = list(
			"name" = "iron pills",
			"desc" = "7 iron pills for blood defiency",
			"price" = 200,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/pill_bottle/mannitol] = list(
			"name" = "mannitol pills",
			"desc" = "7 mannitol pills for brain damage and light traumas",
			"price" = 200,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/defibrillator/loaded] = list(
			"name" = "defibrillator",
			"desc" = "cracklepads!",
			"price" = 750,
			"faction" = FALSE,
	)
	GLOB.anomaly_loadout_medical_indie[/obj/item/storage/case/surgery] = list(
			"name" = "surgical case",
			"desc" = "A large sterile tray with a lid for storing all of the tools you'd need for surgery.",
			"price" = 3000,
			"faction" = FALSE,
	)
/datum/anomalyloadout/syndicate


/datum/anomalyloadout/syndicate/New()
	. = ..()
	if(GLOB.anomaly_loadout_weaponoptions_syndie.len == 0)
		initSyndieWeapons()
	weaponoptions += GLOB.anomaly_loadout_weaponoptions_syndie


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

/datum/anomalyloadout/syndicate/proc/initSyndieWeapons()
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/pistol/pc76] = list(
			"name" = "PC-76 \"Ringneck\"",
			"desc" = "A compact handgun used by most Syndicate-affiliated groups. Small enough to conceal in most pockets, making it popular for covert elements and simply as a compact defensive weapon. Chambered in 10x22mm.",
			"price" = 1250,
			"faction" = TRUE,
	)
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/pistol/a357] = list(
			"name" = "R-23 \"Viper\"",
			"desc" = "An imposing revolver used by officers and certain agents of Syndicate member factions during the ICW, still favored by captains and high-ranking officers of the former Syndicate. Chambered in .357 Magnum.",
			"price" = 1750,
			"faction" = TRUE,
	)
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/pistol/rattlesnake] = list(
			"name" = "MP-84 \"Rattlesnake\"",
			"desc" = "A machine pistol, once used by Syndicate infiltrators and special forces during the ICW. Still used by specialists in former Syndicate factions. Chambered in 9x18mm.",
			"price" = 2500,
			"faction" = TRUE,
	)
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/bulldog] = list(
			"name" = "SG-60r \"Bulldog\"",
			"desc" = "A bullpup combat shotgun usually seen with a characteristic drum magazine. Wildly popular among Syndicate strike teams during the ICW, although it proved less useful against military-grade equipment. Still popular among former Syndicate factions, especially the Ramzi Clique pirates. Chambered in 12g.",
			"price" = 4000,
			"faction" = TRUE,
	)
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/c20r] = list(
			"name" = "C-20r \"Cobra\"",
			"desc" = "A bullpup submachine gun with an integrated suppressor, heavily used by Syndicate strike teams during the ICW. Still sees widespread use by the descendants of the Gorlex Marauders. Chambered in .45.",
			"price" = 2800,
			"faction" = TRUE,
	)
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/sidewinder] = list(
			"name" = "CDW-81 \"Sidewinder\"",
			"desc" = "An armor-piercing, compact personal defense weapon, introduced late into the Inter-Corporate War as an improvement over the C-20r when fighting armored personnel. Issued only in small numbers, and used today by specialists of former Syndicate factions. Chambered in 5.7mm.",
			"price" = 3000,
			"faction" = TRUE,
	)
	GLOB.anomaly_loadout_weaponoptions_syndie[/obj/item/storage/guncase/hydra] = list(
			"name" = "SMR-80 \"Hydra\"",
			"desc" = "Scarborough Arms' premier modular assault rifle platform. This is the basic configuration, optimized for light weight and handiness. A very well-regarded, if expensive and rare, assault rifle. Chambered in 5.56mm CLIP.",
			"price" = 5000,
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
