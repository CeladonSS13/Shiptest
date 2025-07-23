// /datum/crafting_recipe/food/mimanabread
// 	name = "Mimana bread"
// 	reqs = list(
// 		/datum/reagent/consumable/soymilk = 5,
// 		/obj/item/food/bread/plain = 1,
// 		/obj/item/food/tofu = 3,
// 		/obj/item/food/grown/banana/mime = 1
// 	)
// 	result = /obj/item/food/bread/mimana
// 	subcategory = CAT_BREAD

// /datum/crafting_recipe/food/ghostburger
// 	name = "Ghost burger"
// 	reqs = list(
// 		/obj/item/ectoplasm = 1,
// 		/datum/reagent/consumable/sodiumchloride = 2,
// 		/obj/item/food/bun = 1
// 	)
// 	result = /obj/item/food/burger/ghost
// 	subcategory = CAT_BURGER

// /datum/crafting_recipe/food/clownburger
// 	name = "Clown burger"
// 	reqs = list(
// 		/obj/item/clothing/mask/gas/clown_hat = 1,
// 		/obj/item/food/bun = 1
// 	)
// 	result = /obj/item/food/burger/clown
// 	subcategory = CAT_BURGER

// /datum/crafting_recipe/food/mimeburger
// 	name = "Mime burger"
// 	reqs = list(
// 		/obj/item/clothing/mask/gas/mime = 1,
// 		/obj/item/food/bun = 1
// 	)
// 	result = /obj/item/food/burger/mime
// 	subcategory = CAT_BURGER

// /datum/crafting_recipe/food/spellburger
// 	name = "Spell burger"
// 	reqs = list(
// 		/obj/item/clothing/head/wizard/fake = 1,
// 		/obj/item/food/bun = 1
// 	)
// 	result = /obj/item/food/burger/spell
// 	subcategory = CAT_BURGER

// /datum/crafting_recipe/food/spellburger2
// 	name = "Spell burger"
// 	reqs = list(
// 		/obj/item/clothing/head/wizard = 1,
// 		/obj/item/food/bun = 1
// 	)
// 	result = /obj/item/food/burger/spell
// 	subcategory = CAT_BURGER

// /datum/crafting_recipe/food/clowncake
// 	name = "clown cake"
// 	always_availible = FALSE
// 	reqs = list(
// 		/obj/item/food/cake/plain = 1,
// 		/obj/item/reagent_containers/food/snacks/sundae = 2,
// 		/obj/item/food/grown/banana = 5
// 	)
// 	result = /obj/item/food/cake/clown_cake
// 	subcategory = CAT_CAKE

/datum/crafting_recipe/food/honkdae
	name ="Honkdae"
	reqs = list(
		/datum/reagent/consumable/cream = 5,
		/obj/item/clothing/mask/gas/clown_hat = 1,
		/obj/item/food/grown/cherries = 1,
		/obj/item/food/grown/banana = 2,
		/obj/item/reagent_containers/food/snacks/icecream = 1
		///obj/item/food/icecream = 1
	)
	result = /obj/item/reagent_containers/food/snacks/honkdae
	//result = /obj/item/reagent_containers/food/snacks/honkdae
	subcategory = CAT_ICE

/datum/crafting_recipe/food/mime_sc
	name = "Mime snowcone"
	reqs = list(
		/obj/item/reagent_containers/food/drinks/sillycup = 1,
		/datum/reagent/consumable/ice = 15,
		/datum/reagent/consumable/nothing = 5
	)
	result = /obj/item/reagent_containers/food/snacks/snowcones/mime
	subcategory = CAT_ICE

// /datum/crafting_recipe/food/clown_sc	 // NEEDS_TO_FIX_ALARM!
// 	name = "Clown snowcone"
// 	reqs = list(
// 		/obj/item/reagent_containers/food/drinks/sillycup = 1,
// 		/datum/reagent/consumable/ice = 15,
// 		/datum/reagent/consumable/laughter = 5
// 	)
// 	result = /obj/item/reagent_containers/food/snacks/snowcones/clown
// 	subcategory = CAT_ICE

/datum/crafting_recipe/food/meatclown
	name = "Meat Clown"
	reqs = list(
		/obj/item/food/meat/steak/plain = 1,
		/obj/item/food/grown/banana = 1
	)
	result = /obj/item/food/meatclown
	subcategory = CAT_MEAT

/datum/crafting_recipe/food/donkpocket/honk
	time = 15
	name = "Honk-Pocket"
	reqs = list(
		/obj/item/food/pastrybase = 1,
		/obj/item/food/grown/banana = 1,
		/datum/reagent/consumable/sugar = 3
	)
	result = /obj/item/food/donkpocket/honk
	subcategory = CAT_PASTRY

/datum/crafting_recipe/food/mimetart
	name = "Mime tart"
	always_availible = FALSE
	reqs = list(
		/datum/reagent/consumable/milk = 5,
		/datum/reagent/consumable/sugar = 5,
		/obj/item/food/pie/plain = 1,
		/datum/reagent/consumable/nothing = 5
	)
	result = /obj/item/reagent_containers/food/snacks/pie/mimetart
	//result = /obj/item/food/pie/mimetart
	subcategory = CAT_PIE

/datum/crafting_recipe/food/monkeysdelight
	name = "Monkeys delight"
	reqs = list(
		/datum/reagent/consumable/flour = 5,
		/datum/reagent/consumable/sodiumchloride = 1,
		/datum/reagent/consumable/blackpepper = 1,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/food/monkeycube = 1,
		/obj/item/food/grown/banana = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/monkeysdelight
	subcategory = CAT_SALAD

/datum/crafting_recipe/food/clownstears
	name = "Clowns tears"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/food/grown/banana = 1,
		/obj/item/stack/sheet/mineral/hidden/hellstone = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/clownstears
	subcategory = CAT_SOUP

// /datum/crafting_recipe/food/spesslaw
// 	name = "Spesslaw"
// 	reqs = list(
// 		/obj/item/food/spaghetti/boiledspaghetti = 1,
// 		/obj/item/food/meatball = 4
// 	)
// 	result = /obj/item/food/spaghetti/spesslaw
// 	subcategory = CAT_SPAGHETTI
















