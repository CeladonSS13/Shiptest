
/obj/item/clothing/shoes/space_ninja
	name = "ninja shoes"
	desc = "A pair of running shoes. Excellent for running and even better for smashing skulls."
	icon_state = "s-ninja"
	item_state = "secshoes"
	permeability_coefficient = 0.01
	clothing_flags = NOSLIP
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	armor = list("melee" = 60, "bullet" = 50, "laser" = 30,"energy" = 15, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 100, "acid" = 100, "wound" = 40)  // [CELADON-EDIT] - CELADON_BALANCE
	strip_delay = 120
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT

// [CELADON-ADD] - Logic Ninja
/obj/item/clothing/shoes/space_ninja/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_FEET)
		ADD_TRAIT(user, TRAIT_SILENT_FOOTSTEPS, SHOES_TRAIT)

/obj/item/clothing/shoes/space_ninja/dropped(mob/living/carbon/human/user)
	REMOVE_TRAIT(user, TRAIT_SILENT_FOOTSTEPS, SHOES_TRAIT)
	return ..()
// [/CELADON-ADD]
