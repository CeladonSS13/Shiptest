/datum/chemical_reaction/drink/pinkmilk
	results = list(/datum/reagent/consumable/pinkmilk = 2)
	required_reagents = list(/datum/reagent/consumable/berryjuice = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/consumable/sugar = 1)

/datum/chemical_reaction/drink/frisky_kitty
	results = list(/datum/reagent/consumable/ethanol/frisky_kitty = 2)
	required_reagents = list(/datum/reagent/consumable/mint_tea = 1,  /datum/reagent/consumable/milk = 1)
	required_temp = 296 //Just above room temp (22.85'C)

/datum/chemical_reaction/drink/mint_tea
	results = list(/datum/reagent/consumable/mint_tea = 10)
	required_reagents = list(/datum/reagent/consumable/tea = 5, /datum/reagent/pax/mint = 2)

/datum/chemical_reaction/drink/zenstar
	results = list(/datum/reagent/consumable/ethanol/zenstar = 5)
	required_reagents = list(/datum/reagent/consumable/ethanol/triple_sec = 2, /datum/reagent/consumable/lemonjuice = 2, /datum/reagent/consumable/grenadine = 1)

/datum/chemical_reaction/drink/milkshake
	results = list(/datum/reagent/consumable/milkshake = 5)
	required_reagents = list(/datum/reagent/consumable/cream = 1, /datum/reagent/consumable/ice = 2, /datum/reagent/consumable/milk = 2)

/datum/chemical_reaction/drink/ntella_shake
	results = list(/datum/reagent/consumable/milkshake/nutella = 6)
	required_reagents = list(/datum/reagent/consumable/milkshake = 5, /datum/reagent/consumable/coco = 1)
