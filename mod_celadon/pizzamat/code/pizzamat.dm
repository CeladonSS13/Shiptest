/obj/machinery/vending/pizzamat
	name = "PizzaMat Rin'Daar&Co"
	desc = "Если вы хотите вкуснейшую, сочную, мясную пиццу, то вы просто должны попробовать!"
	product_slogans = "Пицца - лучшее, что придумало человечество!"
	product_ads = "Совершенно точно свежая и вкусная пицца. Таярские эксперты не стали бы обманывать!"
	icon = 'mod_celadon/_storge_icons/icons/machinery/pizzamat.dmi'
	icon_state = "pizzamat"
	products = list(
		/obj/item/food/pizza/meat/rinmeat = 3,
		/obj/item/food/pizza/margherita = 3,
		/obj/item/food/pizza/sassysage = 3,
		/obj/item/food/pizza/pineapple/rinapple = 3)

	refill_canister = /obj/item/vending_refill/pizzamat
	default_price = 75
	extra_price = 150
	// payment_department = ACCOUNT_SRV
	light_mask = "cigs-light-mask"

/obj/item/vending_refill/pizzamat
	machine_name = "Rin'Daar&Co"
	icon = 'mod_celadon/_storge_icons/icons/machinery/pizzamat.dmi'
	icon_state = "refill_pizza"

/obj/item/food/pizza/meat/rinmeat
	name = "Elite Meat pizza"
	desc = "Greasy pizza with delicious meat, with special seasonings."
	slice_type = /obj/item/food/pizzaslice/meat
	food_reagents = list(/datum/reagent/consumable/nutriment = 40, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/drug/space_drugs = 10)

/obj/item/food/pizza/pineapple/rinapple
	name = "\improper Hawaiian pizza"
	desc = "Pizza is the equivalent of Einstein's riddle, but something seems wrong with it..."
	slice_type = /obj/item/food/pizzaslice/pineapple
	food_reagents = list(/datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 3, /datum/reagent/yuck = 10)
