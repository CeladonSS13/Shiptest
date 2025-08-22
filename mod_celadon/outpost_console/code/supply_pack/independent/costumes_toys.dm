/datum/supply_pack/faction/independent/costumes_toys
	category = "Costumes & Toys"

/datum/supply_pack/faction/independent/costumes_toys/training_toolbox
	name = "Training Toolbox Crate"
	desc = "Hone your combat abiltities with two AURUMILL-Brand Training Toolboxes! Guarenteed to count hits made against living beings!"
	cost = 100
	contains = list(/obj/item/training_toolbox,
					/obj/item/training_toolbox
					)
	crate_name = "training toolbox crate"

/datum/supply_pack/faction/independent/costumes_toys/foamforce
	name = "Foam Force Crate"
	desc = "Break out the big guns with two Foam Force shotguns!"
	cost = 200
	contains = list(/obj/item/gun/ballistic/shotgun/toy,
					/obj/item/gun/ballistic/shotgun/toy)
	crate_name = "foam force shotgun crate"

/datum/supply_pack/faction/independent/costumes_toys/foamforce/bonus
	name = "Foam Force Pistols Crate"
	desc = "No longer discontinued! Enjoy the fun Gezenan Family Tradition no matter where you are! Includes two automatic Foam Force Pistols with magazines."
	cost = 400
	contains = list(/obj/item/gun/ballistic/automatic/toy/pistol,
					/obj/item/gun/ballistic/automatic/toy/pistol,
					/obj/item/ammo_box/magazine/toy/pistol,
					/obj/item/ammo_box/magazine/toy/pistol)
	crate_name = "foam force pistol crate"

/datum/supply_pack/faction/independent/costumes_toys/lasertag
	name = "Laser Tag Crate"
	desc = "Are you tired of Foam Force? Looking for a real thrill? The new NT-Lasertag System is sure to Rock Your Socks, no cleanup required, just plain fun. The NT Way: includes enough equipment for a 3v3 laser-tag shootout."
	cost = 500
	contains = list(/obj/item/gun/energy/laser/redtag,
					/obj/item/gun/energy/laser/redtag,
					/obj/item/gun/energy/laser/redtag,
					/obj/item/gun/energy/laser/bluetag,
					/obj/item/gun/energy/laser/bluetag,
					/obj/item/gun/energy/laser/bluetag,
					/obj/item/clothing/suit/redtag,
					/obj/item/clothing/suit/redtag,
					/obj/item/clothing/suit/redtag,
					/obj/item/clothing/suit/bluetag,
					/obj/item/clothing/suit/bluetag,
					/obj/item/clothing/suit/bluetag,
					/obj/item/clothing/head/helmet/redtaghelm,
					/obj/item/clothing/head/helmet/redtaghelm,
					/obj/item/clothing/head/helmet/redtaghelm,
					/obj/item/clothing/head/helmet/bluetaghelm,
					/obj/item/clothing/head/helmet/bluetaghelm,
					/obj/item/clothing/head/helmet/bluetaghelm)
	crate_name = "laser tag crate"

/datum/supply_pack/faction/independent/costumes_toys/arcade_toys
	name = "Toy Crate"
	desc = "A bulk assortment of five toys for filling up crane machines."
	cost = 250 // or play the arcade machines ya lazy bum
	contains = list()
	crate_name = "toy crate"

/datum/supply_pack/faction/independent/costumes_toys/arcade_toys/fill(obj/structure/closet/crate/C)
	var/the_toy
	for(var/i in 1 to 5)
		if(prob(50))
			the_toy = pick_weight(GLOB.arcade_prize_pool)
		else
			the_toy = pick(subtypesof(/obj/item/toy/plush))
		new the_toy(C)

/*
MARK:	Costumes
*/

/datum/supply_pack/faction/independent/costumes_toys/costume_original
	name = "Original Costume Crate"
	desc = "Reenact Solarian plays with this assortment of outfits. Contains eight different costumes!"
	cost = 500
	contains = list(/obj/item/clothing/head/snowman,
					/obj/item/clothing/suit/snowman,
					/obj/item/clothing/mask/gas/monkeymask,
					/obj/item/clothing/head/cardborg,
					/obj/item/clothing/suit/cardborg,
					/obj/item/clothing/suit/hooded/carp_costume)
	crate_name = "original costume crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/faction/independent/costumes_toys/mech_suits
	name = "Exosuit Pilot's Suit Crate"
	desc = "Suits for piloting big robots. Contains all three colors!"
	cost = 500 //state-of-the-art technology does come cheap
	contains = list(/obj/item/clothing/under/costume/mech_suit,
					/obj/item/clothing/under/costume/mech_suit/white,
					/obj/item/clothing/under/costume/mech_suit/blue)
	crate_name = "exosuit pilot's suit crate"
	crate_type = /obj/structure/closet/crate/wooden

// this is technically armor but you aren't buying it for that. it's a joke pack so it goes here
/datum/supply_pack/faction/independent/costumes_toys/justiceinbound
	name = "Standard Justice Enforcer Crate"
	desc = "This is it. The Bee's Knees. The Creme of the Crop. The Pick of the Litter. The best of the best of the best. The Crown Jewel of Nanotrasen. The Alpha and the Omega of security headwear. Guaranteed to strike fear into the hearts of each and every criminal unfortunate enough to hear its screeching wail bore into their soul. Also comes with a security gasmask."
	cost = 2000 //justice comes at a price. An expensive, noisy price.
	contains = list(/obj/item/clothing/head/helmet/justice,
					/obj/item/clothing/mask/gas)
	crate_name = "security clothing crate"

/datum/supply_pack/faction/independent/costumes_toys/collectable_hats
	name = "Collectable Hats Crate"
	desc = "Flaunt your status with three unique, highly-collectable hats!"
	cost = 250
	contains = list(/obj/item/clothing/head/collectable/chef,
					/obj/item/clothing/head/collectable/tophat,
					/obj/item/clothing/head/collectable/captain,
					/obj/item/clothing/head/collectable/beret,
					/obj/item/clothing/head/collectable/welding,
					/obj/item/clothing/head/collectable/flatcap,
					/obj/item/clothing/head/collectable/pirate,
					/obj/item/clothing/head/collectable/kitty,
					/obj/item/clothing/head/collectable/wizard,
					/obj/item/clothing/head/collectable/hardhat,
					/obj/item/clothing/head/collectable/thunderdome,
					/obj/item/clothing/head/collectable/swat,
					/obj/item/clothing/head/collectable/police)
	crate_name = "collectable hats crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/faction/independent/costumes_toys/collectable_hats/fill(obj/structure/closet/crate/C)
	var/list/L = contains.Copy()
	for(var/i in 1 to 3)
		var/item = pick_n_take(L)
		new item(C)

/datum/supply_pack/faction/independent/costumes_toys/rilena_merch
	name = "RILENA Merchandise Crate"
	desc = "A crate full of all the RILENA merch you could ever want. Except the offbrand stuff. That's not in here."
	cost = 500 //lots of loot
	contains = list(/obj/item/toy/figure/tali,
					/obj/item/toy/plush/rilena,
					/obj/item/toy/plush/tali,
					/obj/item/toy/plush/sharai,
					/obj/item/toy/plush/xader,
					/obj/item/toy/plush/mora,
					/obj/item/poster/random_rilena,
					/obj/item/poster/random_rilena,
					/obj/item/poster/random_rilena,
					/obj/item/clothing/suit/hooded/hoodie/rilena,
					/obj/item/clothing/under/dress/rilena,
					/obj/item/gun/energy/buster)
	crate_name = "collectable merchandise crate"

/datum/supply_pack/faction/independent/costumes_toys/wedding
	name = "Wedding Crate"
	desc = "Tie the knot IN SPACE! Hold your own extravagant wedding with this crate of suits and bridal gowns. Complete with champagne, cake, and the luxurious cost you would expect for an event to remember."
	cost = 3000 // weddings are absurdly expensive and so is this crate
	contains = list(/obj/item/clothing/under/suit/black_really, //we don't actually need suits since you can vend them but the crate should feel "complete"
					/obj/item/clothing/under/suit/black_really,
					/obj/item/clothing/under/suit/charcoal,
					/obj/item/clothing/under/suit/charcoal,
					/obj/item/clothing/under/suit/navy,
					/obj/item/clothing/under/suit/navy,
					/obj/item/clothing/under/suit/burgundy,
					/obj/item/clothing/under/suit/burgundy, // A pair of each "fancy suit" color for variety
					/obj/item/clothing/under/suit/white,
					/obj/item/clothing/under/suit/white, // white is a weird color for a groom but some people are weird
					/obj/item/clothing/under/dress/wedding,
					/obj/item/clothing/under/dress/wedding, // this is what you actually bought the crate for. You can't get these anywhere else.
					/obj/item/clothing/under/dress/wedding/orange,
					/obj/item/clothing/under/dress/wedding/orange,
					/obj/item/clothing/under/dress/wedding/purple,
					/obj/item/clothing/under/dress/wedding/purple,
					/obj/item/clothing/under/dress/wedding/blue,
					/obj/item/clothing/under/dress/wedding/blue,
					/obj/item/clothing/under/dress/wedding/red,
					/obj/item/clothing/under/dress/wedding/red, // two of each
					/obj/item/reagent_containers/food/drinks/bottle/champagne, //appropriate booze for a wedding
					/obj/item/food/cake/vanilla_cake, // we don't have a full wedding cake but this will do
					// /obj/item/storage/fancy/ringbox/silver,
					// /obj/item/storage/fancy/ringbox/silver немного текстурка пошла по одному месту, но работает
					/obj/item/clothing/gloves/ring/diamond,
					/obj/item/clothing/gloves/ring/silver) //diamond rings cost the same price as this crate via cargo so we're not giving you two for free. Wedding rings are traditionally less valuable anyway.
	crate_name = "wedding crate"

/datum/supply_pack/faction/independent/costumes_toys/formalwear
	name = "Formalwear Crate"
	desc = "You're gonna like the way you look, I guaranteed it. Contains an asston of fancy clothing."
	cost = 3000 //Lots of very expensive items. You gotta pay up to look good!
	contains = list(/obj/item/clothing/under/dress/blacktango,
					/obj/item/clothing/under/misc/assistantformal,
					/obj/item/clothing/under/misc/assistantformal,
					/obj/item/clothing/under/rank/civilian/lawyer/bluesuit,
					/obj/item/clothing/suit/toggle/lawyer,
					/obj/item/clothing/under/rank/civilian/lawyer/purpsuit,
					/obj/item/clothing/suit/toggle/lawyer/purple,
					/obj/item/clothing/suit/toggle/lawyer/black,
					/obj/item/clothing/accessory/waistcoat,
					/obj/item/clothing/neck/tie/blue,
					/obj/item/clothing/neck/tie/red,
					/obj/item/clothing/neck/tie/black,
					/obj/item/clothing/head/fedora,
					/obj/item/clothing/head/flatcap,
					/obj/item/clothing/head/beret,
					/obj/item/clothing/head/that,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/under/suit/charcoal,
					/obj/item/clothing/under/suit/navy,
					/obj/item/clothing/under/suit/burgundy,
					/obj/item/clothing/under/suit/checkered,
					/obj/item/clothing/under/suit/tan,
					/obj/item/lipstick/random)
	crate_name = "formalwear crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/faction/independent/costumes_toys/costume
	name = "Standard Costume Crate"
	desc = "Supply the sector's entertainers with the equipment of their trade with these hilarious costumes! Contains a full clown and mime outfit, along with a bike horn and a bottle of nothing."
	cost = 1000
	contains = list(/obj/item/storage/backpack/clown,
					/obj/item/clothing/shoes/clown_shoes,
					/obj/item/clothing/mask/gas/clown_hat,
					/obj/item/clothing/under/rank/civilian/clown,
					/obj/item/bikehorn,
					/obj/item/clothing/under/rank/civilian/mime,
					/obj/item/clothing/shoes/sneakers/black,
					/obj/item/clothing/gloves/color/white,
					/obj/item/clothing/mask/gas/mime,
					/obj/item/clothing/head/frenchberet,
					/obj/item/clothing/suit/toggle/suspenders,
					/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing,
					/obj/item/storage/backpack/mime)
	crate_name = "standard costume crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/faction/independent/costumes_toys/costume_original
	contains = list(/obj/item/clothing/head/snowman,
					/obj/item/clothing/suit/snowman,
					/obj/item/clothing/head/chicken,
					/obj/item/clothing/suit/chickensuit,
					/obj/item/clothing/mask/gas/monkeymask,
					/obj/item/clothing/suit/monkeysuit,
					/obj/item/clothing/head/cardborg,
					/obj/item/clothing/suit/cardborg,
					/obj/item/clothing/head/xenos,
					/obj/item/clothing/suit/xenos,
					/obj/item/clothing/suit/hooded/ian_costume,
					/obj/item/clothing/suit/hooded/carp_costume,
					/obj/item/clothing/suit/hooded/bee_costume)

/datum/supply_pack/faction/independent/costumes_toys/formalwear
	contains = list(/obj/item/clothing/under/dress/blacktango,
					/obj/item/clothing/under/misc/assistantformal,
					/obj/item/clothing/under/misc/assistantformal,
					/obj/item/clothing/under/rank/civilian/lawyer/bluesuit,
					/obj/item/clothing/suit/toggle/lawyer,
					/obj/item/clothing/under/rank/civilian/lawyer/purpsuit,
					/obj/item/clothing/suit/toggle/lawyer/purple,
					/obj/item/clothing/suit/toggle/lawyer/black,
					/obj/item/clothing/accessory/waistcoat,
					/obj/item/clothing/neck/tie/blue,
					/obj/item/clothing/neck/tie/red,
					/obj/item/clothing/neck/tie/black,
					/obj/item/clothing/head/bowler,
					/obj/item/clothing/head/fedora,
					/obj/item/clothing/head/flatcap,
					/obj/item/clothing/head/beret,
					/obj/item/clothing/head/that,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/shoes/laceup,
					/obj/item/clothing/under/suit/charcoal,
					/obj/item/clothing/under/suit/navy,
					/obj/item/clothing/under/suit/burgundy,
					/obj/item/clothing/under/suit/checkered,
					/obj/item/clothing/under/suit/tan,
					/obj/item/lipstick/random)

/datum/supply_pack/faction/independent/costumes_toys/collectable_hats
	contains = list(/obj/item/clothing/head/collectable/chef,
					/obj/item/clothing/head/collectable/paper,
					/obj/item/clothing/head/collectable/tophat,
					/obj/item/clothing/head/collectable/captain,
					/obj/item/clothing/head/collectable/beret,
					/obj/item/clothing/head/collectable/welding,
					/obj/item/clothing/head/collectable/flatcap,
					/obj/item/clothing/head/collectable/pirate,
					/obj/item/clothing/head/collectable/kitty,
					/obj/item/clothing/head/collectable/rabbitears,
					/obj/item/clothing/head/collectable/wizard,
					/obj/item/clothing/head/collectable/hardhat,
					/obj/item/clothing/head/collectable/HoS,
					/obj/item/clothing/head/collectable/HoP,
					/obj/item/clothing/head/collectable/thunderdome,
					/obj/item/clothing/head/collectable/swat,
					/obj/item/clothing/head/collectable/slime,
					/obj/item/clothing/head/collectable/police,
					/obj/item/clothing/head/collectable/xenom,
					/obj/item/clothing/head/collectable/petehat)
