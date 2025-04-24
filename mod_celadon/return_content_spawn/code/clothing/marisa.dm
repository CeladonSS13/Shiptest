/obj/item/clothing/head/wizard/marisa
	name = "witch hat"
	desc = "Strange-looking hat-wear. Makes you want to cast fireballs."
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/marisa_obj.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/onmob_head_tajara.dmi'
	icon_state = "marisa_hat"
	item_state = "marisa_hat"
	dog_fashion = null

/obj/item/clothing/suit/wizrobe/marisa
	name = "witch robe"
	desc = "Magic is all about the spell power, ZE!"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/marisa_obj.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/onmob_suit_tajara.dmi'
	icon_state = "marisa_suit"
	item_state = "marisa_suit"

/obj/item/clothing/shoes/wizrobe/marisa
	desc = "A pair of magic black shoes."
	name = "magic shoes"
	desc = "Magic is all about the spell power, ZE!"
	icon = 'mod_celadon/_storge_icons/icons/clothing/obj/marisa_obj.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/clothing/overlay/marisa_mob.dmi'
	icon_state = "marisa_shoes"
	item_state = "marisa_shoes"
	resistance_flags = FIRE_PROOF |  ACID_PROOF
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.5)
	strip_delay = 5
	equip_delay_other = 50
	permeability_coefficient = 0.9
	can_be_tied = FALSE

/obj/item/clothing/head/wizard/marisa/fake
	name = "witch hat"
	desc = "Strange-looking hat-wear, makes you want to cast fireballs."
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = FLAMMABLE

/obj/item/clothing/suit/wizrobe/marisa/fake
	name = "witch robe"
	desc = "Magic is all about the spell power, ZE!"
	gas_transfer_coefficient = 1
	permeability_coefficient = 1
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = FLAMMABLE
