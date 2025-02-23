/datum/blackmarket_item/clothing/random_belt
	name = "Used Utility Storage"
	desc = "The previous owner will not grieve over his loss."

	price_min = 100
	price_max = 700
	stock_min = 3
	stock_max = 7
	availability_prob = 40
	item = /obj/item/storage/belt

/datum/blackmarket_item/clothing/random_belt/spawn_item(loc)
	var/obj/item/storage/belt/I = pick(list(
		/obj/item/storage/belt/security,
		/obj/item/storage/belt/security/webbing,
		/obj/item/storage/belt/military,
		/obj/item/storage/belt/military/snack,
		/obj/item/storage/belt/military/army,
		/obj/item/storage/belt/military/assault,
		/obj/item/storage/belt/janitor,
		/obj/item/storage/belt/bandolier,
		/obj/item/storage/belt/security/webbing/inteq,
		/obj/item/storage/belt/medical,
		/obj/item/storage/belt/medical/webbing))
	I = new I(loc)
	if(prob(25))
		var/mob/living/carbon/human/dummy = new()
		I.add_mob_blood(dummy)
		qdel(dummy)

/datum/blackmarket_item/clothing/random_nvd
	name = "Night Vision System"
	desc = "Any matches with the devices used by any faction are coincidential."

	price_min = 900
	price_max = 1750
	stock_min = 1
	stock_max = 2
	availability_prob = 10
	item = /obj/item/clothing/glasses/night

/datum/blackmarket_item/clothing/random_nvd/cycle(availibility, force_appear)
	. = ..()
	generate_nvd()

/datum/blackmarket_item/clothing/random_nvd/proc/generate_nvd()
	var/I = pick("night", "meson", "health", "sec", "robo")
	switch(I)
		if("night")
			item = /obj/item/clothing/glasses/night
			name = "Night Vision System"
		if("meson")
			item = /obj/item/clothing/glasses/meson/night
			name = "Night Vision Meson Scanner"
		if("health")
			item = /obj/item/clothing/glasses/hud/health/night
			name = "Night Vision Health Scanner"
		if("sec")
			item = /obj/item/clothing/glasses/hud/security/night
			name = "Night Vision Identity Scaner"
		if("robo")
			item = /obj/item/clothing/glasses/hud/diagnostic/night
			name = "Night Vision Diagnostics Scaner"
