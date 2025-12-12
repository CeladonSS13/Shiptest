/datum/chemical_reaction/synthanol
	results = list(/datum/reagent/consumable/ethanol/synthanol = 3)
	required_reagents = list(/datum/reagent/toxin/plasma = 1,
							 /datum/reagent/fuel = 1) //"lube" = 1,
	mix_message = "The chemicals mix to create shiny, blue substance."
	mix_sound = 'mod_celadon/_storage_sounds/sound/drinkfizz.ogg'

/datum/chemical_reaction/synthanol/robottears
	results = list(/datum/reagent/consumable/ethanol/synthanol/robottears = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/synthanol = 1,
							/datum/reagent/fuel = 1,
							/datum/reagent/consumable/sodawater = 1) //"oil" = 1
	mix_message = "The ingredients combine into a stiff, dark goo."

/datum/chemical_reaction/synthanol/trinary
	results = list(/datum/reagent/consumable/ethanol/synthanol/trinary = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/synthanol = 1,
							/datum/reagent/consumable/limejuice = 1,
							/datum/reagent/consumable/orangejuice = 1)
	mix_message = "The ingredients mix into a colorful substance."

/datum/chemical_reaction/synthanol/servo
	results = list(/datum/reagent/consumable/ethanol/synthanol/servo = 4)
	required_reagents = list(/datum/reagent/consumable/ethanol/synthanol = 2,
							/datum/reagent/consumable/cream = 1,
							/datum/reagent/consumable/hot_coco = 1)
	mix_message = "The ingredients mix into a dark brown substance."

/datum/chemical_reaction/synthanol/uplink
	results = list(/datum/reagent/consumable/ethanol/synthanol/uplink = 5)
	required_reagents = list(/datum/reagent/consumable/ethanol/rum = 1,
							/datum/reagent/consumable/ethanol/vodka = 1,
							/datum/reagent/consumable/ethanol/tequila = 1,
							/datum/reagent/consumable/ethanol/whiskey = 1,
							/datum/reagent/consumable/ethanol/synthanol = 1)
	mix_message = "The chemicals mix to create a shiny, orange substance."

/datum/chemical_reaction/synthanol/synthnsoda
	results = list(/datum/reagent/consumable/ethanol/synthanol/synthnsoda = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/synthanol = 1,
							/datum/reagent/consumable/space_cola = 1)
	mix_message = "The chemicals mix to create a smooth, fizzy substance."

/datum/chemical_reaction/synthanol/synthignon
	results = list(/datum/reagent/consumable/ethanol/synthanol/synthignon = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/synthanol = 1,
							/datum/reagent/consumable/ethanol/wine = 1)
	mix_message = "The chemicals mix to create a fine, red substance."

/datum/chemical_reaction/bacchus_blessing
	results = list(/datum/reagent/consumable/ethanol/bacchus_blessing = 4)
	required_reagents = list(/datum/reagent/consumable/ethanol/hooch = 1,
							/datum/reagent/consumable/ethanol/absinthe = 1,
							/datum/reagent/consumable/ethanol/manly_dorf = 1,
							/datum/reagent/consumable/ethanol/syndicatebomb = 1)
	mix_message = "The mixture turns to a sickening froth."

/datum/chemical_reaction/amnesia
	results = list(/datum/reagent/consumable/ethanol/amnesia = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/hooch = 1,
							/datum/reagent/consumable/ethanol/vodka = 1)
	mix_sound = 'mod_celadon/_storage_sounds/sound/effects/drinkfizz.ogg'

/datum/chemical_reaction/suicider
	results = list(/datum/reagent/consumable/ethanol/suicider = 4)
	required_reagents = list (/datum/reagent/consumable/ethanol/vodka = 1,
							/datum/reagent/consumable/ethanol/hcider = 1,
							/datum/reagent/fuel = 1,
							/datum/reagent/medicine/epinephrine = 1)
	mix_message = "The drinks and chemicals mix together, emitting a potent smell."
	mix_sound = 'mod_celadon/_storage_sounds/sound/effects/drinkfizz.ogg'
