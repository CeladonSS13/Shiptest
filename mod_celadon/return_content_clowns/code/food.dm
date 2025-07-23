/obj/item/food/pie/cream
	desc = "Just like back home, on clown planet! HONK!"

/obj/item/reagent_containers/food/snacks/soup/hotchili
	name = "chili con carnival"
	desc = "A delicious stew of meat, chiles, and salty, salty clown tears."
	icon_state = "clownchili"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/tomatojuice = 2, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/laughter = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/capsaicin = 1, /datum/reagent/consumable/tomatojuice = 2, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/banana = 1)
	//food_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/capsaicin = 1, /datum/reagent/consumable/tomatojuice = 2, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/banana = 1)
	tastes = list("tomato" = 1, "hot peppers" = 2, "clown feet" = 2, "kind of funny" = 2, "someone's parents" = 2)
	foodtype = VEGETABLES | MEAT
	//foodtypes = VEGETABLES | MEAT

/datum/crafting_recipe/food/clownchili
	name = "Chili con carnival"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/food/meat/cutlet = 2,
		/obj/item/food/grown/chili = 1,
		/obj/item/food/grown/tomato = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/soup/hotchili
	subcategory = CAT_SOUP
