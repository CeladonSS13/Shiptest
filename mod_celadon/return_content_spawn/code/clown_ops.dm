//COMBAT CLOWN SHOES
//Clown shoes with combat stats and noslip. Of course they still squeak.
/obj/item/clothing/shoes/clown_shoes/combat
	name = "combat clown shoes"
	desc = "advanced clown shoes that protect the wearer and render them nearly immune to slipping on their own peels. They also squeak at 100% capacity."
	clothing_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 50, "bio" = 10, "rad" = 0, "fire" = 70, "acid" = 50)
	strip_delay = 70
	resistance_flags = NONE
	permeability_coefficient = 0.05
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes

//The super annoying version
/obj/item/clothing/shoes/clown_shoes/banana_shoes/combat
	name = "mk-honk combat shoes"
	desc = "The culmination of years of clown combat research, these shoes leave a trail of chaos in their wake. They will slowly recharge themselves over time, or can be manually charged with bananium."
	slowdown = SHOES_SLOWDOWN
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 50, "bio" = 10, "rad" = 0, "fire" = 70, "acid" = 50)
	strip_delay = 70
	resistance_flags = NONE
	permeability_coefficient = 0.05
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	always_noslip = TRUE
	var/max_recharge = 3000 //30 peels worth
	var/recharge_rate = 34 //about 1/3 of a peel per tick

/obj/item/clothing/shoes/clown_shoes/banana_shoes/combat/Initialize()
	. = ..()
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
	bananium.insert_amount_mat(max_recharge, /datum/material/hellstone)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/shoes/clown_shoes/banana_shoes/combat/process()
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
	var/bananium_amount = bananium.get_material_amount(/datum/material/hellstone)
	if(bananium_amount < max_recharge)
		bananium.insert_amount_mat(min(recharge_rate, max_recharge - bananium_amount), /datum/material/hellstone)

/obj/item/clothing/shoes/clown_shoes/banana_shoes/combat/attack_self(mob/user)
	ui_action_click(user)
