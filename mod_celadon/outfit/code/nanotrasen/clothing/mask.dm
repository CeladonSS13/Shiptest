// Mask //

/obj/item/clothing/mask/gas/vigilitas
	name = "Vigilitas gas mask"
	desc = "A protective gas mask designed for first response, specialist operations, and counter terrorism by Vigilitas Interstellar officers. It features a wide scratch resistant visor, ports for connecting an oxygen supply, and secure, comfortable straps."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/mask.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/mask.dmi'
	kepori_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/mask_kepori.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	icon_state = "vigi_gas_mask"
	item_state = "vigi_gas_mask"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	resistance_flags = FIRE_PROOF | ACID_PROOF
	supports_variations = KEPORI_VARIATION | VOX_VARIATION
	unique_death = list('mod_celadon/_storage_sounds/sound/items/gasmask/sec_die.ogg')	// [CELADON-ADD] - SFX-Die
	item_state = "blackcloth"
