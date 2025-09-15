/obj/item/food/pie/mimetart
	name = "mime tart"
	desc = "A thin tart mixed with... seemingly nothing."
	icon_state = "mimetart"
	food_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nothing = 10)
	tastes = list("nothing" = 3)
	foodtypes = GRAIN

/obj/item/storage/box/gum
	name = "bubblegum packet"
	desc = "The packaging is entirely in japanese, apparently. You can't make out a single word of it."
	icon_state = "bubblegum_generic"
	w_class = WEIGHT_CLASS_TINY
	illustration = null
	foldable = null
	custom_price = 5

/obj/item/storage/box/gum/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/food/chewable/bubblegum(src)

/obj/item/storage/box/gum/nicotine
	name = "nicotine gum packet"
	desc = "Designed to help with nicotine addiction and oral fixation all at once without destroying your lungs in the process. Mint flavored!"
	icon_state = "bubblegum_nicotine"
	custom_premium_price = 10

/obj/item/storage/box/gum/nicotine/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/food/chewable/bubblegum/nicotine(src)

/obj/item/storage/box/gum/happiness
	name = "HP+ gum packet"
	desc = "A seemingly homemade packaging with an odd smell. It has a weird drawing of a smiling face sticking out its tongue."
	icon_state = "bubblegum_happiness"
	custom_price = 10
	custom_premium_price = 10

/obj/item/storage/box/gum/happiness/Initialize()
	. = ..()
	if (prob(25))
		desc += "You can faintly make out the word 'Hemopagopril' was once scribbled on it."

/obj/item/storage/box/gum/happiness/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/food/chewable/bubblegum/happiness(src)

/obj/item/storage/box/gum/bubblegum
	name = "bubblegum gum packet"
	desc = "The packaging is entirely in Demonic, apparently. You feel like even opening this would be a sin."
	icon_state = "bubblegum_bubblegum"

/obj/item/storage/box/gum/bubblegum/PopulateContents()
	for(var/i in 1 to 4)
		new /obj/item/food/chewable/bubblegum(src)
