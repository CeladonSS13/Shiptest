/obj/item/food/meat/roachmeat/fuhrer
	// preloaded_reagents = list("protein" = 6, "seligitillin" = 6, "fuhrerole" = 12, "diplopterum" = 6)
	name = "Fuhrer meat"
	desc = "A glorious slab of sickly-green bubbling meat cut from a fuhrer roach. it emanates an aura of dominance. Delicious!"
	icon_state = "xenomeat"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	bite_consumption = 4
//	filling_color = "#E2FFDE"
	microwaved_type = /obj/item/food/meat/steak/xeno
//	slice_path = /obj/item/food/meat/rawcutlet/xeno
	tastes = list("meat" = 6)
	foodtypes = RAW | MEAT


/obj/item/food/meat/roachmeat
	name = "Kampfer meat"
	desc = "A slab of sickly-green bubbling meat cut from a kampfer roach. You swear you can see it still twitching occasionally. Delicious!"
	icon_state = "xenomeat"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	bite_consumption = 4
//	filling_color = "#E2FFDE"
	microwaved_type = /obj/item/food/meat/steak/xeno
//	slice_path = /obj/item/food/meat/rawcutlet/xeno
	tastes = list("meat" = 1, "acid" = 1)
	foodtypes = RAW | MEAT


/obj/item/food/meat/roachmeat/seuche
	name = "Seuche meat"
	desc = "A slab of sickly-green bubbling meat cut from a seuche roach. You can already taste the hepatitis. Delicious!"
	//food_reagents = list("protein" = 4, "seligitillin" = 8, "diplopterum" = 6)
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
						/datum/reagent/consumable/nutriment/vitamin = 6,
						/datum/reagent/uranium/radium = 6)

/obj/item/food/meat/roachmeat/panzer
	name = "Panzer meat"
	desc = "A slab of sickly-green bubbling meat cut from a panzer roach. Very tough, but crunchy, Delicious!"
	// food_reagents = list("protein" = 8, "blattedin" = 12, "starkellin" = 15, "diplopterum" = 4)
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
						/datum/reagent/consumable/nutriment/vitamin = 6,
						/datum/reagent/uranium/radium = 6)

/obj/item/food/meat/roachmeat/fuhrer
	name = "Fuhrer meat"
	desc = "A glorious slab of sickly-green bubbling meat cut from a fuhrer roach. it emanates an aura of dominance. Delicious!"
	food_reagents = list("protein" = 6, "seligitillin" = 6, "fuhrerole" = 12, "diplopterum" = 6)
	food_reagents = list(/datum/reagent/consumable/nutriment = 12,
						/datum/reagent/consumable/nutriment/vitamin = 12,
						/datum/reagent/uranium/radium = 12)
	// price_tag = 300

/obj/item/food/meat/roachmeat/kaiser
	name = "Kaiser meat"
	desc = "A slab of sickly-green meat of a kaiser roach, bubbling with unimaginable power. Delicious!"
	// food_reagents = list("protein" = 6, "blattedin" = 12, "seligitillin" = 6, "starkellin" = 15, "fuhrerole" = 4, "diplopterum" = 6, "kaiseraurum" = 16)
	food_reagents = list(/datum/reagent/consumable/nutriment = 5,
						/datum/reagent/consumable/nutriment/vitamin = 7,
						/datum/reagent/uranium/radium = 7)
	// price_tag = 1000

/obj/item/food/meat/roachmeat/jager
	name = "Jager meat"
	desc = "A slab of sickly-green bubbling meat cut from a jager roach. You swear you can see it still twitching. Delicious!"
	// food_reagents = list("protein" = 6, "blattedin" = 6, "gewaltine" = 8, "diplopterum" = 2)
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
						/datum/reagent/consumable/nutriment/vitamin = 6,
						/datum/reagent/uranium/radium = 6)

/obj/item/food/meat/roachmeat/kraftwerk
	name = "Kraftwerk meat"
	desc = "A slab of sickly-green meat cut from a kraftwerk roach, bursting with nanite activity. Delicious!"
	// food_reagents = list("protein" = 6, "blattedin" = 6, "gewaltine" = 6, "uncap nanites" = 2, "nanites" = 3)
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
						/datum/reagent/consumable/nutriment/vitamin = 6,
						/datum/reagent/uranium/radium = 6)

/obj/item/food/meat/roachmeat/benzin
	name = "Benzin meat"
	desc = "A slab of sickly-green meat cut from a benzin roach. Stinks of welding fuel. Delicious!"
	// food_reagents = list("protein" = 4, "blattedin" = 6, "fuel" = 30)
	food_reagents = list(/datum/reagent/consumable/nutriment = 4,
						/datum/reagent/consumable/nutriment/vitamin = 6,
						/datum/reagent/uranium/radium = 6)
