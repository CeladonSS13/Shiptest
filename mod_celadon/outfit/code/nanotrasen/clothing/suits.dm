// Suits //

/obj/item/clothing/suit/nanotrasen //Base type, do not use
	name = "Suit"
	desc = "You shouldn't be here."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/suits.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'

	equip_sound = 'sound/items/equip/cloth_equip.ogg'
	equipping_sound = EQUIP_SOUND_SHORT_GENERIC
	unequipping_sound = UNEQUIP_SOUND_SHORT_GENERIC
	equip_delay_self = EQUIP_DELAY_COAT
	equip_delay_other = EQUIP_DELAY_COAT * 1.5
	strip_delay = EQUIP_DELAY_COAT * 1.5

/obj/item/clothing/suit/nanotrasen/medical_smock
	name = "surgical smock"
	desc = "A thick fluid-repelling smock rendered in what is unmistakeably Nanotrasen Blue. The tag on the inside declares it property of the DeForest Medical Company."
	icon_state = "med_smock"
	item_state = "bluecloth"
	allowed = MEDICAL_SUIT_ALLOWED_ITEMS

/obj/item/clothing/suit/nanotrasen/suitjacket
	name = "fancy black suit jacket"
	desc = "A fine black linen suit jacket with blue markings and a Nanotrasen lapel pin. It has a strangely menacing aura."
	icon_state = "suit_jacket"
	item_state = "blackcloth"
	supports_variations = VOX_VARIATION

/obj/item/clothing/suit/nanotrasen/vest
	name = "black hazard vest"
	desc = "A thin black vest with reflective markings, worn to guarantee visibility when operating around industrial equipment or in dark or dusty conditions. Property of N+S Logistics."
	icon_state = "mining_vest"
	item_state = "blackcloth"
	supports_variations = VOX_VARIATION

/obj/item/clothing/suit/nanotrasen/vest/yellow
	name = "yellow hazard vest"
	desc = "A thin yellow vest with reflective markings, worn to guarantee visibility when operating around industrial equipment. Property of Nakamura Engineering."
	icon_state = "engi_vest"
	item_state = "yellowcloth"
	supports_variations = VOX_VARIATION

/obj/item/clothing/suit/nanotrasen/vest/blue
	name = "blue hazard vest"
	desc = "A thin vest with reflective stripes, worn to guarantee visibility in dangerous conditions. The vest itself is an offensively bright shade of Nanotrasen Blue. Property of the Nanotrasen Atmospheric Corps."
	icon_state = "atmos_vest"
	item_state = "bluecloth"
	supports_variations = VOX_VARIATION

/obj/item/clothing/suit/toggle/nanotrasen
	name = "officer's coat"
	desc = "A smart blue uniform jacket with red silk accents and a large buckle with an engraved Nanotrasen logo. Standard wear for command officers aboard Nanotrasen ships."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/suits.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	icon_state = "officer_formal"
	item_state = "bluecloth"

/obj/item/clothing/suit/toggle/labcoat/nanotrasen
	name = "corporate labcoat"
	desc = "A standardized white labcoat used by Nanotrasen-associated medical and science personnel. A simplified Nanotrasen logo is stitched on the front."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/suits.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	icon_state = "labcoat"
	item_state = "whitecloth"

/obj/item/clothing/suit/toggle/labcoat/nanotrasen/blue
	name = "medical director's labcoat"
	desc = "A well-made, fitted labcoat, crafted from high-quality materials and sporting blue markings around the arms and hem. A DeForest Medical logo is neatly embroidered on the front. Stylish, practical, and exceptionally professional."
	icon_state = "med_labcoat"
	item_state = "whitecloth"

/obj/item/clothing/suit/toggle/labcoat/nanotrasen/black
	name = "science director's labcoat"
	desc = "An overdesigned and rather intimidating black labcoat with a very high collar, as impervious to lab hazards as one can get without a full-body suit. The Nanotrasen logo is proudly emblazoned on the chest."
	icon_state = "black_labcoat"
	item_state = "blackcloth"

/obj/item/clothing/suit/toggle/labcoat/nanotrasen/paramedic
	name = "bright blue paramedic jacket"
	desc = "A thick, protective blue jacket with reflective visibility stripes and a DeForest Medical logo stitched into the chest. Safe against all manner of scrapes and splashes."
	icon_state = "med_jacket"
	item_state = "bluecloth"

/obj/item/clothing/suit/toggle/chorejacket/nanotrasen
	name = "supply chore jacket"
	desc = "A loose fitting jacket designed for N+S Logistics' labourers, featuring deep pockets and large buttons to enable easy access in work conditions."
	icon = 'icons/obj/clothing/suits/toggle.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suits/toggle.dmi'
	kepori_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/mask_kepori.dmi'
	icon_state = "chorejacketns"
	item_state = "chorejacketns"
	unique_reskin = null


/obj/item/clothing/under/nanotrasen/supply/qm
	name = "supply director slacks"
	desc = "Crisp slacks and a pressed brown shirt that any supply director could be proud of. N+S Logistics' compass rose logo is embossed on every button."
	icon_state = "supply_director"
	item_state = "browncloth"



/obj/item/clothing/suit/armor/nanotrasen
	name = "armor vest"
	desc = "A sturdy vest designed to protect Vigilitas Interstellar officers from a variety of basic threats. Sports a stylish red stripe down the front."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/suits.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	icon_state = "armor"
	item_state = "blackcloth"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/nanotrasen/slim
	name = "slim armor vest"
	icon_state = "armor_slim"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION

/obj/item/clothing/suit/armor/nanotrasen/sec_director
	name = "security director's overcoat"
	desc = "A tailored black overcoat, made from cutting-edge ballistic fabrics and composites. Vigilitas's 'VI' logo is embossed on every button. Intimidating and profoundly stylish."
	icon_state = "command_coat"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90, "wound" = 10)
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION

/obj/item/clothing/suit/armor/nanotrasen/captain
	name = "captain's jacket"
	desc = "A sturdy jacket in Nanotrasen Blue, accentuated with gold thread and lined with a layer of ballistic fabric. Its large, shiny belt buckle is embossed with Nanotrasen's corporate logo."
	icon_state = "armor_captain"
	item_state = "bluecloth"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 50, "bullet" = 40, "laser" = 50, "energy" = 50, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 90, "wound" = 10)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/nanotrasen/captain/parade
	name = "ostentatious captain's coat"
	desc = "An exquisitely-decorated fine blue jacket, suitable for especially formal situations, or for a commanding officer who wants to flaunt their status even more than usual. Richly decorated with gold thread and embroidered Nanotrasen logos."
	icon_state = "captain_formal"
	item_state = "bluecloth"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 30, "bullet" = 0, "laser" = 30, "energy" = 20, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 90, "wound" = 10)

//other related stuff
/obj/item/clothing/suit/hooded/wintercoat/centcom
	name = "centcom winter coat"
	desc = "A luxurious winter coat woven in the bright green and gold colours of Central Command. It has a small pin in the shape of the Nanotrasen logo for a zipper."
	icon_state = "coatcentcom"
	item_state = "coatcentcom"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/centcom

/obj/item/clothing/suit/hooded/explorer
	name = "explorer suit"
	desc = "A light, armor-plated softsuit, designed for exploration of dangerous planetary enviroments. A Nanotrasen design by origin, later reappropriated by EXOCOM for mass retail production."
	icon_state = "explorer"
	item_state = "explorer"
