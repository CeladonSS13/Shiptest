/datum/reagent/consumable/ethanol/frisky_kitty
	name = "Frisky Kitty"
	description = "Warm milk mixed with mint."
	color = "#FCF7D4" //(252, 247, 212)
	boozepwr = 0
	taste_description = "Warm milk and mint"
	glass_icon_state = "frisky_kitty"
	glass_name = "cup of frisky kitty"
	glass_desc = "Warm milk and some mint."

/datum/reagent/consumable/ethanol/frisky_kitty/expose_mob(mob/living/M, methods, reac_volume)
	if(istajara(M))
		quality = DRINK_FANTASTIC
	else
		quality = DRINK_GOOD
	return ..()

/datum/reagent/consumable/ethanol/zenstar
	name = "Zen Star"
	description = "A sour and bland drink, rather disappointing."
	color = rgb(51, 87, 203)
	boozepwr = 35
	quality = DRINK_NICE
	taste_description = "disappointment"
	glass_icon_state = "zenstar"
	glass_name = "glass of zen star"
	glass_desc = "You'd think something so balanced would actually taste nice... you'd be dead wrong."

/datum/reagent/consumable/milkshake
	name = "Milkshake"
	description = "So, it's milkshake."
	color = rgb(221, 221, 221)
	taste_description = "pretty milk and cream"
	glass_icon_state = "milkshake"
	glass_name = "glass of milkshake"
	glass_desc = "You'd think something so balanced milk and cream."

/datum/reagent/consumable/milkshake/expose_mob(mob/living/M, methods, reac_volume)
	if(istajara(M))
		quality = DRINK_FANTASTIC
	else
		quality = DRINK_GOOD
	return ..()

/datum/reagent/consumable/milkshake/nutella
	name = "NuTella milkshake"
	description = "This is a Nutella milkshake."
	color = rgb(80, 32, 0)
	taste_description = "pretty milk and chocolate"
	glass_icon_state = "nutellamilkshake"
	glass_name = "glass of nutella milkshake"
	glass_desc = "Cold milk and some chocolote."

