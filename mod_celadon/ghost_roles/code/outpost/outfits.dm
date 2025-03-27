/// COOK

/datum/job/outpost/cook
	name = "Outpost Cook"
	wiki_page = "Food" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/outpost/cook

	access = list(ACCESS_OUTPOST_SERVICE_COOK, ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_OUTPOST_SERVICE_COOK, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_MINERAL_STOREROOM)

	display_order = JOB_DISPLAY_ORDER_COOK

/datum/outfit/outpost/cook
	name = "Outpost Cook"

	belt = /obj/item/pda/cook
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/chef
	suit = /obj/item/clothing/suit/toggle/chef
	head = /obj/item/clothing/head/chefhat
	mask = /obj/item/clothing/mask/fakemoustache/italian
	gloves  =/obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/sneakers/white
	id = /obj/item/card/id/elysium_cook
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/sharpener = 1,
							/obj/item/plant_analyzer)

/datum/outfit/outpost/cook/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/possible_boxes = subtypesof(/obj/item/storage/box/ingredients)
	var/chosen_box = pick(possible_boxes)
	var/obj/item/storage/box/I = new chosen_box(src)
	H.equip_to_slot_or_del(I, ITEM_SLOT_BACKPACK)
	var/datum/martial_art/cqc/under_siege/justacook = new
	justacook.teach(H)


/// BARTENDER

/datum/job/outpost/bartender
	name = "Outpost Bartender"
	wiki_page = "Drinks"

	outfit = /datum/outfit/outpost/bartender

	access = list(ACCESS_CENT_BAR, ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	minimal_access = list(ACCESS_CENT_BAR, ACCESS_BAR, ACCESS_MINERAL_STOREROOM, ACCESS_THEATRE)
	display_order = JOB_DISPLAY_ORDER_BARTENDER

/datum/outfit/outpost/bartender
	name = "Elysium Outpost Bartender"

	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	belt = /obj/item/gun/ballistic/shotgun/doublebarrel/presawn
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/bartender
	suit = /obj/item/clothing/suit/armor/vest
	gloves = /obj/item/clothing/gloves/tackler/combat
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/storage/box/beanbag,
							/obj/item/storage/box/ammo/a12g_slug,
							/obj/item/storage/box/ammo/a12g_rubbershot,
							/obj/item/barcodescanner,
							/obj/item/barcode = 5,
							/obj/item/reagent_containers/food/drinks/shaker)
	shoes = /obj/item/clothing/shoes/laceup
	box = /obj/item/storage/box/survival
	id = /obj/item/card/id/elysium_Bartender
	suit_store = /obj/item/gun/ballistic/shotgun/doublebarrel
	l_pocket = /obj/item/pda/bar
	r_pocket = /obj/item/lighter

/datum/outfit/outpost/bartender/post_equip(mob/living/carbon/human/H, visualsOnly)
	ADD_TRAIT(H, TRAIT_ALCOHOL_TOLERANCE, "status_effect")
	ADD_TRAIT(H, TRAIT_STABLELIVER, "status_effect")
	. = ..()

	var/obj/item/card/id/W = H.get_idcard()
	if(H.age < AGE_MINOR)
		W.registered_age = AGE_MINOR
		to_chat(H, "<span class='notice'>Формально вы еще не достигли совершеннолетия, чтобы иметь доступ к алкоголю или подавать его, но ваше удостоверение личности незаметно изменено, чтобы показать ваш возраст как [AGE_MINOR]. Постарайтесь сохранить это в тайне!</span>")


/// MAID (JANITOR)

/datum/job/outpost/maid
	name = "Maid"
	wiki_page = "Maid"

	outfit = /datum/outfit/outpost/maid

	access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)

	display_order = JOB_DISPLAY_ORDER_JANITOR

/datum/outfit/outpost/maid
	name = "Maid"

	head = /obj/item/clothing/head/maidheadband
	neck = /obj/item/clothing/neck/maid
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/costume/maid/white
	gloves = /obj/item/clothing/gloves/maid/white
	back = /obj/item/storage/backpack
	belt = /obj/item/pda/janitor
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/advanced = 1)
	shoes = /obj/item/clothing/shoes/laceup
	box = /obj/item/storage/box/survival
	id = /obj/item/card/id/elysium_maid
	suit_store = /obj/item/gun/ballistic/shotgun/doublebarrel
	l_pocket = /obj/item/pda/bar
	r_pocket = /obj/item/lighter

/datum/outfit/outpost/maid/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(GARBAGEDAY in SSevents.holidays)
		l_pocket = /obj/item/gun/ballistic/revolver/viper
		r_pocket = /obj/item/ammo_box/a357


/// ARTIST (CLOWN)

/datum/job/outpost/artist
	name = "Artist"
	wiki_page = "Clown"

	outfit = /datum/outfit/outpost/artist

	access = list(ACCESS_THEATRE)
	minimal_access = list(ACCESS_THEATRE)

	display_order = JOB_DISPLAY_ORDER_CLOWN

/datum/job/outpost/artist/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.apply_pref_name("clown", M.client)

/datum/outfit/outpost/artist
	name = "Artist"

	id = /obj/item/card/id/elysium_artist
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/clown
	shoes = /obj/item/clothing/shoes/galoshes //  Clown shoes удалены оффами. Отличная замена. Отличная ведь?
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_pocket = /obj/item/bikehorn
	backpack_contents = list(
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/instrument/bikehorn = 1,
		)

	implants = list(/obj/item/implant/sad_trombone)

	// back = /obj/item/storage/backpack/clown  - Вырезано оффами.

	box = /obj/item/storage/box/hug/survival


/datum/outfit/outpost/artist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.fully_replace_character_name(H.real_name, pick(GLOB.clown_names)) //rename the mob AFTER they're equipped so their ID gets updated properly.
	ADD_TRAIT(H, TRAIT_NAIVE, JOB_TRAIT)
	H.dna.add_mutation(CLOWNMUT)
	for(var/datum/mutation/human/clumsy/M in H.dna.mutations)
		M.mutadone_proof = TRUE
	var/datum/atom_hud/fan = GLOB.huds[DATA_HUD_FAN]
	fan.add_hud_to(H)


/// WAGABOND

/datum/job/outpost/wagabond
	name = "Wagabond"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/outpost/wagabond
	display_order = JOB_DISPLAY_ORDER_ASSISTANT
	wiki_page = "Wagabond"

/datum/outfit/outpost/wagabond
	name = "Wagabond"

	suit = /obj/item/clothing/suit/gothcoat
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/shemag/black
	back = /obj/item/storage/backpack/satchel
	uniform = /obj/item/clothing/under/utility
	shoes = /obj/item/clothing/shoes/sneakers/black
	id = /obj/item/card/id/elysium_wagabond
	l_pocket = /obj/item/spacecash/bundle/c500

/// MEDIC
/datum/job/outpost/medic
	name = "Outpost Medical Doctor"
	wiki_page = "Medical"

	outfit = /datum/outfit/outpost/medic

	access = list(ACCESS_OUTPOST_MED_GENERAL, ACCESS_OUTPOST_MED_MORGUE, ACCESS_OUTPOST_MED_STORAGE, ACCESS_OUTPOST_MED_HIRURG)
	minimal_access = list(ACCESS_OUTPOST_MED_GENERAL, ACCESS_OUTPOST_MED_MORGUE, ACCESS_OUTPOST_MED_STORAGE, ACCESS_OUTPOST_MED_HIRURG)

	display_order = JOB_DISPLAY_ORDER_MEDICAL_DOCTOR

/datum/outfit/outpost/medic
	name = "Outpost Medical Doctor"

	belt = /obj/item/pda/medical
	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/doctor/blue
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/apron/surgical
	id = /obj/item/card/id/elysium_medic
	back = /obj/item/storage/backpack/duffelbag/med
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1,
							/obj/item/storage/backpack/medic = 1,
							/obj/item/storage/backpack/satchel/med = 1,
							/obj/item/storage/backpack/messenger/med = 1,
							/obj/item/clothing/suit/hooded/wintercoat/medical = 1,
							/obj/item/clothing/under/rank/medical/doctor/blue = 1,
							/obj/item/spacecash/bundle/c100 = 3)

	box = /obj/item/storage/box/survival/medical

	chameleon_extras = /obj/item/gun/syringe

/datum/outfit/outpost/medic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/possible_boxes = subtypesof(/obj/item/storage/box/ingredients)
	var/chosen_box = pick(possible_boxes)
	var/obj/item/storage/box/I = new chosen_box(src)
	H.equip_to_slot_or_del(I, ITEM_SLOT_BACKPACK)

