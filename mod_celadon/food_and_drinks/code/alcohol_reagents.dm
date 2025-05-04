// ROBOT ALCOHOL PAST THIS POINT
// WOOO!
// /obj/structure/aquarium
// 	icon = 'mod_celadon/_storge_icons/icons/food_and_drinks/drinks.dmi'

/obj/item/reagent_containers/food/drinks
	icon = 'mod_celadon/_storge_icons/icons/food_and_drinks/drinks.dmi'

#define REAGENT_TOUCH 1
#define REAGENT_INGEST 2

/datum/reagent/consumable/ethanol/synthanol
	name = "Synthanol"
	description = "A runny liquid with conductive capacities. Its effects on synthetics are similar to those of alcohol on organics."
	reagent_state = LIQUID
	color = "#1BB1FF"
	process_flags = ORGANIC | SYNTHETIC
	boozepwr = 5
	glass_icon_state = "synthanolglass"
	glass_name = "Glass of Synthanol"
	glass_desc = "The equivalent of alcohol for synthetic crewmembers. They'd find it awful if they had tastebuds too."
	taste_description = "motor oil"

/datum/reagent/consumable/ethanol/synthanol/on_mob_life(mob/living/carbon/M)
	metabolization_rate = REAGENTS_METABOLISM
	if(!(M.dna.species.reagent_tag & PROCESS_SYNTHETIC))
		metabolization_rate += 9 * REAGENTS_METABOLISM //gets removed from organics very fast
		if(prob(25))
			metabolization_rate += 40 * REAGENTS_METABOLISM
			// M.fakevomit()
	return ..()
/*
/datum/reagent/consumable/ethanol/synthanol/reaction_mob(mob/living/carbon/M, method=REAGENT_TOUCH, volume)
	if(M.dna.species.reagent_tag & PROCESS_SYNTHETIC)
		return
	if(method == REAGENT_INGEST)
		to_chat(M, pick("<span class = 'danger'>That was awful!"), "<span class = 'danger'>Yuck!")))
*/
/datum/reagent/consumable/ethanol/synthanol/robottears
	name = "Robot Tears"
	description = "An oily substance that an IPC could technically consider a 'drink'."
	color = "#363636"
	boozepwr = 25
	glass_icon_state = "robottearsglass"
	glass_name = "Glass of Robot Tears"
	glass_desc = "No robots were hurt in the making of this drink."
	taste_description = "existential angst"


/datum/reagent/consumable/ethanol/synthanol/trinary
	name = "Trinary"
	description = "A fruit drink meant only for synthetics, however that works."
	color = "#adb21f"
	boozepwr = 2
	glass_icon_state = "trinaryglass"
	glass_name = "Glass of Trinary"
	glass_desc = "Colorful drink made for synthetic crewmembers. It doesn't seem like it would taste well."
	taste_description = "modem static"

/datum/reagent/consumable/ethanol/synthanol/servo
	name = "Servo"
	description = "A drink containing some organic ingredients, but meant only for synthetics."
	color = "#5b3210"
	boozepwr = 25
	glass_icon_state = "servoglass"
	glass_name = "Glass of Servo"
	glass_desc = "Chocolate - based drink made for IPCs. Not sure if anyone's actually tried out the recipe."
	taste_description = "motor oil and cocoa"

/datum/reagent/consumable/ethanol/synthanol/uplink
	name = "Uplink"
	description = "A potent mix of alcohol and synthanol. Will only work on synthetics."
	color = "#e7ae04"
	boozepwr = 15
	glass_icon_state = "uplinkglass"
	glass_name = "Glass of Uplink"
	glass_desc = "An exquisite mix of the finest liquoirs and synthanol. Meant only for synthetics."
	taste_description = "a GUI in visual basic"

/datum/reagent/consumable/ethanol/synthanol/synthnsoda
	name = "Synth and Soda"
	description = "The classic drink adjusted for a robot's tastes."
	color = "#7204e7"
	boozepwr = 25
	glass_icon_state = "synthnsodaglass"
	glass_name = "Glass of Synth 'n Soda"
	glass_desc = "Classic drink altered to fit the tastes of a robot. Bad idea to drink if you're made of carbon."
	taste_description = "fizzy motor oil"

/datum/reagent/consumable/ethanol/synthanol/synthignon
	name = "Synthignon"
	description = "Someone mixed wine and alcohol for robots. Hope you're proud of yourself."
	color = "#d004e7"
	boozepwr = 25
	glass_icon_state = "synthignonglass"
	glass_name = "Glass of Synthignon"
	glass_desc = "Someone mixed good wine and robot booze. Romantic, but atrocious."
	taste_description = "fancy motor oil"

/datum/reagent/consumable/ethanol/bacchus_blessing //An EXTREMELY powerful drink. Smashed in seconds, dead in minutes.
	name = "Bacchus' Blessing"
	description = "Unidentifiable mixture. Unmeasurably high alcohol content."
	reagent_state = LIQUID
	color = "#331303" //Sickly brown
	// dizzy_adj = 42 SECONDS
	boozepwr = 300 //I warned you
	glass_icon_state = "bacchusblessing"
	glass_name = "Bacchus' Blessing"
	glass_desc = "You didn't think it was possible for a liquid to be so utterly revolting. Are you sure about this...?"
	taste_description = "a wall of bricks"

/datum/reagent/consumable/ethanol/amnesia
	name = "Star Amnesia"
	description = "Is it just a bottle of medical alcohol?"
	reagent_state = LIQUID
	color = "#6b0059"
	boozepwr = 73 ////Ethanol and Hooch
	glass_icon_state = "amnesia"
	glass_name = "Star Amnesia"
	glass_desc = "Is it just a bottle of medical alcohol?"
	taste_description = "disco amnesia"

/datum/reagent/consumable/ethanol/suicider //otherwise known as "I want to get so smashed my liver gives out and I die from alcohol poisoning".
	name = "Suicider"
	description = "An unbelievably strong and potent variety of Cider."
	reagent_state = LIQUID
	color = "#CF3811"
	boozepwr = 100 //because that's a thing it's supposed to do, I guess
	glass_icon_state = "suicider"
	glass_name = "Suicider"
	glass_desc = "You've really hit rock bottom now... your liver packed its bags and left last night."
	taste_description = "approaching death"

/*
/datum/chemical_reaction/synthanol
	name = "Synthanol"
	id = "synthanol"
	result = "synthanol"
	required_reagents = list("lube" = 1, "plasma" = 1, "fuel" = 1)
	result_amount = 3
	mix_message = "The chemicals mix to create shiny, blue substance."
	mix_sound = 'sound/goonstation/misc/drinkfizz.ogg'
*/
