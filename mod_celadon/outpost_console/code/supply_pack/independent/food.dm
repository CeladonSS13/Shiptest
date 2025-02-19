/datum/supply_pack/faction/independent/food
	group = "Food & Agricultural"

/datum/supply_pack/faction/independent/food/ration_mre
	name = "MRE set"
	desc = "6 expanded MRE sets. Spices included!"
	cost = 500
	contains = list(/obj/item/storage/ration/vegan_chili,
					/obj/item/storage/ration/shredded_beef,
					/obj/item/storage/ration/pork_spaghetti,
					/obj/item/storage/ration/fried_fish,
					/obj/item/storage/ration/beef_strips,
					/obj/item/storage/ration/chili_macaroni
	)
	crate_name = "IRP set"
	crate_type = /obj/structure/closet/crate/secure/weapon

/*
	MARK:	Готовая еда
*/
/datum/supply_pack/faction/independent/food/donkpockets
	name = "Donk Pocket Variety Crate"
	desc = "Featuring a line up of Donk Co.'s most popular pastry!"
	cost = 400
	contains = list(/obj/item/storage/box/donkpockets/donkpocketspicy,
					/obj/item/storage/box/donkpockets/donkpocketteriyaki,
					/obj/item/storage/box/donkpockets/donkpocketpizza,
					/obj/item/storage/box/donkpockets/donkpocketberry,
					/obj/item/storage/box/donkpockets/donkpockethonk)
	crate_name = "donk pocket crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/independent/food/ration
	name = "Ration Crate"
	desc = "6 standard issue rations. For your inner jarhead."
	cost = 900
	contains = list(/obj/effect/spawner/random/food_or_drink/ration,
					/obj/effect/spawner/random/food_or_drink/ration,
					/obj/effect/spawner/random/food_or_drink/ration,
					/obj/effect/spawner/random/food_or_drink/ration,
					/obj/effect/spawner/random/food_or_drink/ration,
					/obj/effect/spawner/random/food_or_drink/ration)
	crate_name = "ration crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/faction/independent/food/pizza
	name = "Pizza Crate"
	desc = "Best prices on this side of the galaxy. All deliveries are guaranteed to be 99.5% anomaly-free!"
	cost = 2000
	contains = list(/obj/item/pizzabox/margherita,
					/obj/item/pizzabox/mushroom,
					/obj/item/pizzabox/meat,
					/obj/item/pizzabox/vegetable,
					/obj/item/pizzabox/pineapple)
	crate_name = "pizza crate"
	crate_type = /obj/structure/closet/crate/freezer


/**
	MARK: Ингредиенты
 */
/datum/supply_pack/faction/independent/food/ingredients_basic
	name = "Basic Ingredients Crate"
	desc = "Get things cooking with this crate full of useful ingredients! Contains a dozen eggs, some enzyme, two slabs of meat, some flour, some rice, a few bottles of milk, a bottle of soymilk, and a bag of sugar."
	cost = 650
	contains = list(/obj/item/reagent_containers/condiment/flour,
					/obj/item/reagent_containers/condiment/flour,
					/obj/item/reagent_containers/condiment/rice,
					/obj/item/reagent_containers/condiment/milk,
					/obj/item/reagent_containers/condiment/milk,
					/obj/item/reagent_containers/condiment/soymilk,
					/obj/item/reagent_containers/condiment/sugar,
					/obj/item/storage/fancy/egg_box,
					/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/condiment/enzyme)
	crate_name = "food crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/independent/food/ingredients_condiments
	name = "Condiments Crate"
	desc = "A variety of garnishes for topping off your dish with a little extra pizzaz. Contains a bottle of enzyme, a salt shaker, a pepper mill, a bottle of ketchup, a bottle of hot sauce, a bottle of BBQ sauce, and a bottle of cream."
	cost = 300
	contains = list(/obj/item/reagent_containers/condiment/saltshaker,
					/obj/item/reagent_containers/condiment/peppermill,
					/obj/item/reagent_containers/condiment/ketchup,
					/obj/item/reagent_containers/condiment/hotsauce,
					/obj/item/reagent_containers/food/drinks/bottle/cream,
					/obj/item/reagent_containers/condiment/mayonnaise,
					/obj/item/reagent_containers/condiment/bbqsauce,
					/obj/item/reagent_containers/condiment/soysauce)
	crate_name = "condiments crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/independent/food/sugar
	name = "Sugar Crate"
	desc = "A crate with a few bags of sugar. Good for cake shops and amateur chemists."
	cost = 150
	contains = list(/obj/item/reagent_containers/condiment/sugar,
					/obj/item/reagent_containers/condiment/sugar,
					/obj/item/reagent_containers/condiment/sugar
	)
	crate_name = "sugar crate"
	crate_type = /obj/structure/closet/crate

/**
	MARK: 	Рандом. ингредиенты
 */
/datum/supply_pack/faction/independent/food/ingredients_randomized
	name = "Exotic Meat Crate"
	desc = "The best cuts in the whole sector. Probably."
	cost = 900
	contains = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/slime,
					/obj/item/reagent_containers/food/snacks/meat/slab/killertomato,
					/obj/item/reagent_containers/food/snacks/meat/slab/bear,
					/obj/item/reagent_containers/food/snacks/meat/slab/xeno,
					/obj/item/reagent_containers/food/snacks/meat/slab/spider,
					/obj/item/reagent_containers/food/snacks/meat/slab/penguin,
					/obj/item/reagent_containers/food/snacks/spiderleg,
					/obj/item/reagent_containers/food/snacks/fishmeat/carp,
					/obj/item/reagent_containers/food/snacks/meat/slab/human
	)
	crate_name = "exotic meat crate"
	crate_type = /obj/structure/closet/crate/freezer
	var/items = 7

/datum/supply_pack/faction/independent/food/ingredients_randomized/fill(obj/structure/closet/crate/C)
	for(var/i in 1 to items)
		var/item = pick(contains)
		new item(C)

/datum/supply_pack/faction/independent/food/ingredients_randomized/meat
	name = "Standard Meat Crate"
	desc = "Less interesting, yet filling cuts of meat."
	cost = 500
	contains = list(/obj/item/reagent_containers/food/snacks/meat/slab,
					/obj/item/reagent_containers/food/snacks/meat/slab/chicken,
					/obj/item/reagent_containers/food/snacks/meat/slab/synthmeat,
					/obj/item/reagent_containers/food/snacks/meat/rawbacon,
					/obj/item/reagent_containers/food/snacks/meatball
	)
	crate_name = "meat crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/independent/food/ingredients_randomized/vegetables
	name = "Vegetables Crate"
	desc = "Grown in the finest hydroponic vats."
	cost = 100
	contains = list(/obj/item/reagent_containers/food/snacks/grown/chili,
					/obj/item/reagent_containers/food/snacks/grown/corn,
					/obj/item/reagent_containers/food/snacks/grown/tomato,
					/obj/item/reagent_containers/food/snacks/grown/potato,
					/obj/item/reagent_containers/food/snacks/grown/carrot,
					/obj/item/reagent_containers/food/snacks/grown/mushroom/chanterelle,
					/obj/item/reagent_containers/food/snacks/grown/onion,
					/obj/item/reagent_containers/food/snacks/grown/pumpkin
	)
	crate_name = "vegetables crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/independent/food/ingredients_randomized/fruits
	name = "Fruit Crate"
	desc = "Rich of vitamins, may contain oranges."
	cost = 100
	contains = list(/obj/item/reagent_containers/food/snacks/grown/citrus/lime,
					/obj/item/reagent_containers/food/snacks/grown/citrus/orange,
					/obj/item/reagent_containers/food/snacks/grown/citrus/lemon,
					/obj/item/reagent_containers/food/snacks/grown/watermelon,
					/obj/item/reagent_containers/food/snacks/grown/apple,
					/obj/item/reagent_containers/food/snacks/grown/berries,
					/obj/item/reagent_containers/food/snacks/grown/banana
	)
	crate_name = "fruit crate"
	crate_type = /obj/structure/closet/crate/freezer

/datum/supply_pack/faction/independent/food/ingredients_randomized/grains
	name = "Grains Crate"
	desc = "A crate full of various grains. How interesting."
	cost = 100
	contains = list(/obj/item/reagent_containers/food/snacks/grown/wheat,
					/obj/item/reagent_containers/food/snacks/grown/wheat,
					/obj/item/reagent_containers/food/snacks/grown/wheat,
					/obj/item/reagent_containers/food/snacks/grown/oat,
					/obj/item/reagent_containers/food/snacks/grown/rice,
					/obj/item/reagent_containers/food/snacks/grown/soybeans
	)
	crate_name = "grains crate"
	crate_type = /obj/structure/closet/crate/freezer
	items = 10

/datum/supply_pack/faction/independent/food/ingredients_randomized/bread
	name = "Bread Crate"
	desc = "A crate full of various breads. Bready to either be eaten or made into delicious meals."
	cost = 250
	contains = list(/obj/item/food/bread/plain,
					/obj/item/food/breadslice/plain,
					/obj/item/food/breadslice/plain,
					/obj/item/food/breadslice/plain,
					/obj/item/reagent_containers/food/snacks/bun,
					/obj/item/reagent_containers/food/snacks/tortilla,
					/obj/item/reagent_containers/food/snacks/pizzabread
	)
	crate_name = "bread crate"
	crate_type = /obj/structure/closet/crate/freezer

/*
	MARK:	Ботаника
*/
/datum/supply_pack/faction/independent/food/hydrotank
	name = "Hydroponics Backpack Crate"
	desc = "Bring on the flood with this high-capacity backpack crate. Contains 500 units of life-giving H2O."
	cost = 750
	contains = list(/obj/item/watertank)
	crate_name = "hydroponics backpack crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/faction/independent/food/gardening
	name = "Gardening Crate"
	desc = "Supplies for growing a great garden! Contains two bottles of ammonia, two Plant-B-Gone spray bottles, a hatchet, cultivator, plant analyzer, as well as a pair of leather gloves and a botanist's apron."
	cost = 500
	contains = list(/obj/item/reagent_containers/spray/plantbgone,
					/obj/item/reagent_containers/spray/plantbgone,
					/obj/item/reagent_containers/glass/bottle/ammonia,
					/obj/item/reagent_containers/glass/bottle/ammonia,
					/obj/item/hatchet,
					/obj/item/cultivator,
					/obj/item/plant_analyzer,
					/obj/item/clothing/gloves/botanic_leather,
					/obj/item/clothing/suit/apron,
					/obj/item/storage/box/disks_plantgene)
	crate_name = "gardening crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/faction/independent/food/ethanol
	name = "Ethanol Crate"
	desc = "Five small bottles of ethanol for the aspiring botanist or amateur chemist."
	cost = 500
	contains = list(/obj/item/reagent_containers/glass/bottle/ethanol,
					/obj/item/reagent_containers/glass/bottle/ethanol,
					/obj/item/reagent_containers/glass/bottle/ethanol,
					/obj/item/reagent_containers/glass/bottle/ethanol,
					/obj/item/reagent_containers/glass/bottle/ethanol
					)
	crate_name = "gardening crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/faction/independent/food/weedcontrol
	name = "Weed Control Crate"
	desc = "Contains a scythe, gasmask, and two anti-weed defoliant grenades, for when your garden grows out of control."
	cost = 200
	contains = list(/obj/item/scythe,
					/obj/item/clothing/mask/gas,
					/obj/item/grenade/chem_grenade/antiweed,
					/obj/item/grenade/chem_grenade/antiweed)
	crate_name = "weed control crate"
	crate_type = /obj/structure/closet/crate/secure/hydroponics

/datum/supply_pack/faction/independent/food/seeds
	name = "Seeds Crate"
	desc = "Big things have small beginnings. Contains fourteen different seeds."
	cost = 150
	contains = list(/obj/item/seeds/chili,
					/obj/item/seeds/cotton,
					/obj/item/seeds/berry,
					/obj/item/seeds/corn,
					/obj/item/seeds/eggplant,
					/obj/item/seeds/tomato,
					/obj/item/seeds/soya,
					/obj/item/seeds/wheat,
					/obj/item/seeds/wheat/rice,
					/obj/item/seeds/carrot,
					/obj/item/seeds/sunflower,
					/obj/item/seeds/chanter,
					/obj/item/seeds/potato,
					/obj/item/seeds/sugarcane)
	crate_name = "seeds crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/datum/supply_pack/faction/independent/food/exoticseeds
	name = "Exotic Seeds Crate"
	desc = "Any entrepreneuring botanist's dream. Contains eleven different seeds, including two mystery seeds!"
	cost = 1000
	contains = list(/obj/item/seeds/nettle,
					/obj/item/seeds/plump,
					/obj/item/seeds/liberty,
					/obj/item/seeds/amanita,
					/obj/item/seeds/reishi,
					/obj/item/seeds/bamboo,
					/obj/item/seeds/eggplant/eggy,
					/obj/item/seeds/rainbow_bunch,
					/obj/item/seeds/rainbow_bunch,
					/obj/item/seeds/random,
					/obj/item/seeds/random)
	crate_name = "exotic seeds crate"
	crate_type = /obj/structure/closet/crate/hydroponics

/**
	MARK: Кухонные принадлежности
 */
/datum/supply_pack/faction/independent/food/kitchen_knife
	name = "Kitchen Knife Crate"
	desc = "Need a new knife to cut something hard? Try out this stamped steel knife, straight from The New Gorlex Republic's factories."
	cost = 100
	contains = list(/obj/item/melee/knife/kitchen)
	crate_name = "kitchen knife crate"
	crate_type = /obj/structure/closet/crate/wooden
