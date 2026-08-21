// Hats //

/obj/item/clothing/head/nanotrasen
	name = "blue flatcap"
	desc = "A simple blue flat cap with a Nanotrasen logo on the side. Not standard uniform, but occasionally worn by Nanotrasen office workers."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/head.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	icon_state = "com_flatcap"
	item_state = "bluecloth"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35,"energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 20)

/obj/item/clothing/head/nanotrasen/beret
	name = "fancy blue beret"
	desc = "A well-made beret in Nanotrasen Blue with a corporate logo on the side, often seen topping the heads of Nanotrasen Corporation managerial staff."
	icon_state = "beret_blue"
	item_state = "bluecloth"

/obj/item/clothing/head/nanotrasen/beret/affairs
	name = "fancy green beret"
	desc = "A well-made beret in Nanotrasen Green with a corporate logo on the side, shows quiet authority and an allegiance with CentCom itself."
	icon_state = "beret_green"
	item_state = "greencloth"

/obj/item/clothing/head/nanotrasen/beret/security
	name = "fancy red beret"
	desc = "A cherry-red beret issued to Vigilitas security officers for formal occasions. Vigilitas Interstellar's 'VI' logo is stitched into the side."
	icon_state = "beret_red"
	item_state = "redcloth"

/obj/item/clothing/head/nanotrasen/beret/security/command
	name = "fancy black beret"
	desc = "A deep black beret with a Vigilitas Interstellar 'VI' badge on the front. An unmistakeable hallmark of Vigilitas managerial staff."
	icon_state = "beret_black"
	item_state = "blackcloth"

/obj/item/clothing/head/nanotrasen/surgical
	name = "white surgical cap"
	desc = "A white surgical cap with a Nanotrasen Blue stripe down the middle."
	icon_state = "surgical_white"
	item_state = "whitecloth"

/obj/item/clothing/head/nanotrasen/surgical/blue
	name = "blue surgical cap"
	desc = "A DeForest Blue surgical cap with a white stripe down the middle, issued to DeForest Medical directors as the last line of recognizability, should their uniforms, coats, and unflappable nature ever fail."
	icon_state = "surgical_blue"
	item_state = "bluecloth"

/obj/item/clothing/head/nanotrasen/cap // Base type, do not use
	name = "generic cap"
	desc = "You don't belong here."

/obj/item/clothing/head/nanotrasen/cap/security
	name = "red softcap"
	desc = "A cherry red cap with a white 'VI' logo embroidered on the front. Issued to Vigilitas security guards as casual wear and low-threat workwear. Surprisingly durable, and very popular among current and retired employees."
	icon_state = "cap_red"
	item_state = "redcloth"

/obj/item/clothing/head/helmet/m10/nanotrasen
	name = "\improper Vigilitas Helmet"
	desc = "A classic protective helmet utilized by Vigilitas, utilizing a M-10 pattern helmet with their color scheme!"
	icon_state = "nt_m10helm"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/head.dmi'
	unique_reskin = null

/obj/item/clothing/head/helmet/bulletproof/x11/nanotrasen
	name = "\improper Bulletproof Vigilitas Helmet"
	desc = "A bulky bulletproof helmet in the X-11 pattern, utilized by Vigilitas and NT loss prevention!"
	icon_state = "nt_x11helm"
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/head.dmi'
	unique_reskin = null

/obj/item/clothing/head/helmet/bulletproof/x11/nanotrasen/sechud
	name = "Vigilitas Visor Helmet"
	desc = "A commonly seen helmet among low and medium ranks of Vigilitas Interstellar private security forces. Provides decent protection against most common threats and has an inbuilt security hud. The red stripe reminds you of something..."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/head.dmi'
	icon_state = "nt_x11helm_sechud"
	item_state = "nt_x11helm_sechud"
	var/hud_type = DATA_HUD_SECURITY_ADVANCED
	var/hud_trait = TRAIT_SECURITY_HUD
	dog_fashion = null
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/helmet
	content_overlays = TRUE
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/bulletproof/x11/nanotrasen/sechud/equipped(mob/living/carbon/human/user, slot)
	..()
	if(slot != ITEM_SLOT_HEAD)
		return
	if(hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.add_hud_to(user)
	if(hud_trait)
		ADD_TRAIT(user, hud_trait, GLASSES_TRAIT)

/obj/item/clothing/head/helmet/bulletproof/x11/nanotrasen/sechud/dropped(mob/living/carbon/human/user)
	..()
	if(hud_type)
		var/datum/atom_hud/H = GLOB.huds[hud_type]
		H.remove_hud_from(user)
	if(hud_trait)
		REMOVE_TRAIT(user, hud_trait, GLASSES_TRAIT)

/obj/item/clothing/head/helmet/riot/nanotrasen
	name = "\improper Vigilitas Riot Helmet"
	desc = "A resistant riot helmet produced for security detail in Vigilitas, often deployed to quell rioters in corporate grounds."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/head.dmi'
	icon_state = "riot_nt"
	base_icon_state = "riot_nt"
	unique_reskin = null

/obj/item/clothing/head/nanotrasen/cap/supply
	name = "brown softcap"
	desc = "A brown cap with N+S Logistics' compass rose logo on the front. Issued to almost every N+S employee, although its wear is optional."
	icon_state = "cap_brown"
	item_state = "browncloth"

/obj/item/clothing/head/nanotrasen/cap/janitor
	name = "purple softcap"
	desc = "A rich purple soft cap with a Nanotrasen logo on the front. For some reason, this peculiar shade of purple is only used by custodial personnel instead of the Nanotrasen Blue used by every other division. It's already slightly stained."
	icon_state = "cap_purple"
	item_state = "purplecloth"

/obj/item/clothing/head/nanotrasen/cap/medical
	name = "blue medical softcap"
	desc = "A soft cap in soft DeForest Blue, with a large white cross on the front marking the wearer as a trained medical worker. Wearing this without medical training is a violation of Nanotrasen Corporation employee guidelines."
	icon_state = "cap_blue"
	item_state = "bluecloth"

/obj/item/clothing/head/nanotrasen/officer
	name = "officer's hat"
	desc = "A blue peaked hat with red silk decoration and an embroidered Nanotrasen logo, worn exclusively by management."
	icon_state = "officer_peaked"
	item_state = "bluecloth"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION

/obj/item/clothing/head/nanotrasen/officer/fedora
	name = "officer's fedora"
	desc = "A fedora in a violent shade of Nanotrasen Blue, with a red silk band."
	icon_state = "officer_fedora"
	item_state = "bluecloth"

/obj/item/clothing/head/nanotrasen/captain
	name = "captain's broad hat"
	desc = "It's good to be the king."
	icon_state = "com_hat"
	item_state = "bluecloth"

/obj/item/clothing/head/nanotrasen/captain/peaked
	name = "captain's peaked cap"
	desc = "A decorated blue peaked cap, rife with laurels and gold thread, with a large badge on the front displaying the Nanotrasen Corporation logo. This hat practically oozes authority."
	icon_state = "com_peaked"
	item_state = "bluecloth"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION

/obj/item/clothing/head/hardhat/nanotrasen //TODO: inhands for hardhats
	name = "black heavy-duty hat"
	desc = "A tough plastic helmet with a suspension rig, designed to protect against blunt impacts. This one is a sober shade of black, with a N+S Logistics logo on the front."
	icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/head.dmi'
	lefthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_lefthand.dmi'
	righthand_file = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/inhands/nanotrasen_righthand.dmi'
	icon_state = "hardhat_black"
	item_state = "blackcloth"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION

/obj/item/clothing/head/hardhat/nanotrasen/blue
	name = "blue heavy-duty hat"
	desc = "A tough plastic helmet with suspension rig, designed to protect against blunt impacts. This one is brightly colored in Nanotrasen Blue, with the company logo on the front."
	icon_state = "hardhat_blue"
	item_state = "bluecloth"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION

/obj/item/clothing/head/hardhat/nanotrasen/yellow
	name = "yellow heavy-duty hat"
	desc = "A tough plastic helmet with suspension rig, designed to protect against blunt impacts. This one is brightly yellow colored, uncannily resembling the general yellow hardhat. Property of Nakamura Engineering."
	icon_state = "hardhat_yellow"
	item_state = "yellowcloth"

/obj/item/clothing/head/hardhat/nanotrasen/white
	name = "white heavy-duty hat"
	desc = "An extremely tough plastic helmet with suspension rig, designed to protect against blunt impacts. This one is colored bright white, typical of managerial staff, and has a Nakamura Engineering logo on the front."
	icon_state = "hardhat_white"
	item_state = "graycloth"
	vox_override_icon = 'mod_celadon/_storage_icons/icons/items/clothing/faction/nanotrasen/onmob/vox.dmi'
	supports_variations = VOX_VARIATION
