// logos and stuff
/obj/structure/sign/solfed
	name = "\improper Solar Federation Logo"
	sign_change_name = "Solar Federation Logo"
	desc = "It's the logo of the Solar Federation. Most likely, this structure belongs to the armed forces of the Solar Federation."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/fluff.dmi'
	icon_state = "sol_fed_wall_logo"
	is_editable = TRUE

/obj/structure/sign/solfed/elysium
	name = "\improper Elysium Brigade Logo"
	sign_change_name = "Elysium Brigade logo"
	desc = "The logo of the Solar Federation's Elysium Brigade. It is inscribed above the “Freedom” chevron. Most likely this ship belongs to the Elysium Brigade and is part of the Solar Federation army. The Elysium Brigade is a volunteer regiment of the Solar Federation that maintains order on the territory of the Elysium Republic."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/fluff.dmi'
	icon_state = "elysium_brigade_logo"
	is_editable = TRUE

//posters
/obj/item/poster/random_solfed
	name = "random solfed poster"
	poster_type = /obj/structure/sign/poster/solfed/random
	icon_state = "rolled_solgov"

/obj/structure/sign/poster/solfed/random
	name = "random solfed poster"
	icon_state = "random_solfed"
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/posters.dmi'
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/solfed
	random_type = POSTER_SUBTYPES

/obj/structure/sign/poster/solfed/solfed
	name = "Poster - Solar Federation"
	desc = "The flag of the Solar Federation. As the galactic hegemony, they still haven't decided to plant their flag everywhere. Or have they?"
	icon_state = "sol_fed_poster"

/obj/structure/sign/poster/solfed/mars
	name = "Poster - Mars"
	desc = "This poster shows Mars, the 4th planet in SF-2345."
	icon_state = "mars_poster"

/obj/structure/sign/poster/solfed/earth
	name = "Poster - Terra"
	desc = "This poster shows Terra, the 3th planet in SF-2345."
	icon_state = "earth_poster"
	never_random = TRUE

/obj/structure/sign/poster/solfed/earth
	name = "Poster - Luna"
	desc = "This poster shows Luna, Terra's humble moon."
	icon_state = "luna_poster"
	never_random = TRUE

/obj/structure/sign/poster/solfed/venus
	name = "Poster - Venus"
	desc = "This poster shows Venus, the 2nd planet in SF-2345."
	icon_state = "venus_poster"
	never_random = TRUE

/obj/structure/sign/poster/solfed/protect
	name = "Poster - Protect"
	desc = "This Solar Federation poster has “Protect” written all over it. The m11 helmet is common among their armed forces."
	icon_state = "protect_poster"

/obj/structure/sign/poster/solfed/help
	name = "Poster - We're help!"
	desc = "This Solar Federation poster shows the logo of the Republic of Elysium and the inscription “We're help” underneath. Probably by help they mean the presence of armed forces on the territory of the Republic."
	icon_state = "were_help_poster"

/obj/structure/sign/poster/solfed/elysium
	name = "Elysium Brigade poster"
	desc = "A poster of the Solar Federation's Elysium Brigade. The Elysium Brigade is a volunteer regiment of the Solar Federation that maintains order on the territory of the Elysium Republic. Can they be considered traitors to the homeland?"
	icon_state = "elysium_brigade_poster"
	never_random = TRUE

/obj/item/bedsheet/solfed
	name = "\improper Solar Federation bedsheet"
	desc = "It's a quilt made in the style of the Solar Federation flag. Cover yourself with it and feel the warmth of democracy."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/fluff.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/mob/sf_neck.dmi'
	icon_state = "solfed_bedsheet"
	item_state = "solfed_bedsheet"

//uniforms
/obj/item/clothing/under/solfed
	name = "Solar Federation marine fatigues"
	desc = "This is the standard uniform of the Solar Federation Marines. It's colored dark blue."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/uniforms.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/uniforms.dmi'
	icon_state = "solfed_marine"
	item_state = "solfed_marine"

/obj/item/clothing/under/solfed/assistant
	name = "SolFed basic uniform"
	desc = "A casual SolFed uniform issued to low ranking personnel."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/uniforms.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/uniforms.dmi'
	icon_state = "solfed_assistant"
	item_state = "solfed_assistant"

/obj/item/clothing/under/solfed/medical
	name = "SolFed medical uniform"
	desc = "A clean-white shirt with some blue pants for SolFed's finest doctors."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/uniforms.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/uniforms.dmi'
	icon_state = "solfed_medical"
	item_state = "solfed_medical"

/obj/item/clothing/under/solfed/industrial
	name = "SolFed industrial uniform"
	desc = "Gray pants, blue shirt and some solar golden sprayed on top for SolFed's engineers and alike. For some folk its even hard to consider this 'Industrial'"
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/uniforms.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/uniforms.dmi'
	icon_state = "solfed_engineer"
	item_state = "solfed_engineer"

/obj/item/clothing/under/solfed/camo
	name = "Solar Federation's camouflaged uniform"
	desc = "This is a special uniform providing camouflage to SolFed's marines. Im not sure why would they need blue camo in space tho."
	icon_state = "solfed_camo"
	item_state = "solfed_camo"

/obj/item/clothing/under/solfed/camo/elysium
	name = "Elysium brigade's camouflaged uniform"
	desc = "This is a special uniform that provides camouflage to Elysium brigade's marines. This one atleast makes sense."
	icon_state = "elysium_brigade_camo"
	item_state = "elysium_brigade_camo"

/obj/item/clothing/under/solfed/formal
	name = "SolFed formal uniform"
	desc = "A really neat uniform used by Federation's high-ranking officials. Fancy."
	icon_state = "solfed_formal"
	item_state = "solfed_formal"
	can_adjust = FALSE

/obj/item/clothing/under/solfed/formal/elysium
	name = "Elysium Brigade formal uniform"
	desc = "Formal uniforms worn by members of the Solar Federation Elysium Brigade. It features the Solar Federation flag on the shoulder. It is usually worn by brigade's Captains or when you want to look more dressy."
	icon_state = "elysium_brigade_formal"
	item_state = "elysium_brigade_formal"

//belts
/obj/item/storage/belt/military/solfed
	name = "Solar Federation chest rig"
	desc = "These are the military webbing of the Solar Federation. It has the Solar Federation logo on the back."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/belt.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/belt.dmi'
	icon_state = "solfed_webbing"
	item_state = "solfed_webbing"
	resistance_flags = FIRE_PROOF
	unique_reskin = null

/obj/item/storage/belt/military/solfed/medical
	name = "Solar Federation chest rig"
	desc = "These are the military webbing of the Solar Federation. It has the Solar Federation logo on the back."
	icon_state = "solfed_webbing_med"
	item_state = "solfed_webbing_med"
	resistance_flags = FIRE_PROOF

/obj/item/storage/belt/military/solfed/elysium
	name = "Elysium Brigade chest rig"
	desc = "These are the military webbing of the Solar Federation Elysium Brigade. It has the Solar Federation logo on the back."
	icon_state = "elysium_brigade_webbing"
	item_state = "elysium_brigade_webbing"
	resistance_flags = FIRE_PROOF

//helmets & hats
/obj/item/clothing/head/solfed/beret
	name = "SolFed Formal beret"
	desc = "This is beret is used by Solar Federation's officers. It's colored dark blue. It has the Solar Federation flag on the front."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "solfed_beret"
	item_state = "solfed_beret"

/obj/item/clothing/head/solfed/beret/elysium
	name = "Elysium Brigade beret"
	desc = "This is a beret of the Solar Federation's Elysium Brigade. It's made in a dark green color. It has the Solar Federation flag on the front."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "elysium_brigade_beret"
	item_state = "elysium_brigade_beret"

/obj/item/clothing/head/solfed/elysium
	name = "Elysium Brigade turban"
	desc = "This is the dark green turban of the Solar Federation Elysium Brigade. Initially, the Solar Federation's leadership was against the wearing of turbans, but citing the SolFed's commitment to allow the cultural practices of its citizens, the turban was allowed to be worn on duty."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "elysium_brigade_turban"
	item_state = "elysium_brigade_turban"

/obj/item/clothing/head/solfed/cap
	name = "SolFed softcap"
	desc = "A soft cap with some SolFed symbolics on it, marking the person wearing it as a part of federation's navy."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "cap_solfed"
	item_state = "cap_solfed"

/obj/item/clothing/head/solfed/surgical
	name = "SolFed surgical cap"
	desc = "A perhaps unnecessarily fancy surgical cap issued to almost every certified doctor aboard SolFed's navy vessels."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "surgical_solfed"
	item_state = "surgical_solfed"

/obj/item/clothing/head/hardhat/solfed
	name = "SolFed industrial hardhat"
	desc = "A neat hardhat used by SolFed's engineers and alike. Provides good protection against darkness and head impacts."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "hardhat_solfed"
	item_state = "hardhat_solfed"

/obj/item/clothing/head/helmet/solfed/m11
	name = "Solar Federation M11 helmet"
	desc = "It's an M11 helmet in Solar Federation coloring. On its left side you can see the flag of the Solar Federation. It is usually worn by Solar Federation soldiers."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/head.dmi'
	icon_state = "solfed_m11"
	item_state = "solfed_m11"

/obj/item/clothing/head/helmet/solfed/m11/elysium
	name = "Elysium Brigade M11 helmet"
	desc = "It's an m11 helmet in Solar Federation in desert coloring. On its left side you can see the flag of the Solar Federation. It is usually worn by Solar Federation soldiers."
	icon_state = "elysium_brigade_m11"
	item_state = "elysium_brigade_m11"

/obj/item/clothing/head/helmet/solfed/m11/elysium/wraps
	name = "Elysium brigade m11 wraps helmet"
	desc = "This is a Solar Federation M11 helmet in desert coloring. It has the Solar Federation flag on the left side of the helmet. This particular helmet is wrapped in green cloth to have better facial protection. It is usually worn by the Solar Federation Elysium Brigade."
	icon_state = "elysium_brigade_m10_wraps"
	item_state = "elysium_brigade_m10_wraps"

//oversuits
/obj/item/clothing/suit/armor/solfed/formal
	name = "SolFed formal coat"
	desc = "The dark-blue formal coat of the Solar Federation. It has a SolFed armband on the shoulder."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/suits.dmi'
	icon_state = "solfed_coat"
	item_state = "solfed_coat"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|ARMS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	resistance_flags = NONE
	armor = list("melee" = 30, "bullet" = 25, "laser" = 25, "energy" = 30, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)

/obj/item/clothing/suit/armor/solfed/formal/elysium
	name = "Elysium Brigade formal coat"
	desc = "The dark-green formal coat of the Solar Federation's Elysium Brigade. It has a SolFed armband on the shoulder."
	icon_state = "elysium_brigade_coat"
	item_state = "elysium_brigade_coat"

//gloves
/obj/item/clothing/gloves/combat/solfed
	name = "SolFed marine gloves"
	desc = "These comfy gloves provide protection to SolFed's marines and keep their hands warm. They are dark-blue colored."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/hands.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/hands.dmi'
	icon_state = "sfmarinegloves"
	item_state = "sfmarinegloves"
	armor = list("melee" = 15, "bullet" = 10, "laser" = 15, "energy" = 15, "bomb" = 65, "bio" = 100, "rad" = 75, "fire" = 75, "acid" = 75)

/obj/item/clothing/gloves/combat/solfed/captain
	name = "SolFed captain gloves"
	desc = "These fancy gloves provide protection to SolFed's high-ranking officers and keep their hands warm. Wow! They really are fancy!."
	icon_state = "sfcaptaingloves"
	item_state = "sfcaptaingloves"

//masks
/obj/item/clothing/mask/gas/solfed/elysium
	name = "Elysium Brigade gas mask"
	desc = "A green-colored gas mask used by SolFed's elysium brigade. Can you feel freedom filling the air?"
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/mask.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/mask.dmi'
	icon_state = "elysium-gasmask"
	item_state = "elysium-gasmask"
	resistance_flags = FIRE_PROOF | ACID_PROOF

//spacesuits
/obj/item/clothing/head/helmet/space/hardsuit/solfed/elysium
	name = "Elysium Brigade hardsuit helmet"
	desc = "This is the hardsuit helmet of the Solar Federation Elysium Brigade. It's a dark green color, and its panes glow green."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/spacesuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/spacesuits_head.dmi'
	icon_state = "hardsuit0-ebrigadehelm"
	item_state = "hardsuit0-ebrigadehelm"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 50, "bio" = 100, "rad" = 75, "fire" = 75, "acid" = 75)
	actions_types = list()
	hardsuit_type = "elysium"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/space/hardsuit/solfed/elysium
	name = "Elysium Brigade hardsuit"
	desc = "This is a hardsuit of the Solar Federation Elysium Brigade. It is in dark green colors and has the Solar Federation flag on its back."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/spacesuits.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/spacesuits.dmi'
	icon_state = "hardsuit0-ebrigade"
	item_state = "hardsuit0-ebrigade"
	hardsuit_type = "elysium"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 30, "bomb" = 40, "bio" = 100, "rad" = 75, "fire" = 75, "acid" = 75)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/solfed/elysium
	resistance_flags = FIRE_PROOF

//backpacks
/obj/item/storage/backpack/satchel/solfed

	name = "solfed satchel"
	desc = "A democratic-looking satchel with extra pockets."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/backpacks.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/backpacks.dmi'
	icon_state = "satchel-sf"
	item_state = "satchel-sf"

/obj/item/storage/backpack/solfed
	name = "solfed backpack"
	desc = "A militaristic looking backpack. Has a stylish sol star on it."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/backpacks.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/backpacks.dmi'
	icon_state = "solfedpack"
	item_state = "solfedpack"

/obj/item/storage/backpack/duffelbag/solfed
	name = "solfed duffel bag"
	desc = "A large duffel bag for holding extra freedom-enforcing supplies."
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/backpacks.dmi'
	mob_overlay_icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/mob/backpacks.dmi'
	icon_state = "duffel-solfed"
	item_state = "duffel-solfed"

//idcards
/obj/item/card/id/solfed
	name = "\improper SolFed keycard"
	desc = "A SolFed keycard with no proper access to speak of."
	assignment = "Navy member"
	icon = 'mod_celadon/_storge_icons/icons/solfed/clothing/obj/card.dmi'
	icon_state = "solfed"
	uses_overlays = FALSE

/obj/item/card/id/solfed/commander
	name = "\improper SolFed high-ranking keycard"
	desc = "A SolFed keycard with no proper access to speak of. This one indicates an Official."
	assignment = "Official"

//bureaucracy and stuff
/obj/item/desk_flag/solfed
	name = "SolFed desk flag"
	desc = "A white-blue flag with a SolFed flag on it."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/bureaucracy.dmi'
	icon_state = "solfed"

/obj/item/folder/solfed
	desc = "A blue folder with a SolFed coat of arms emblem."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/bureaucracy.dmi'
	icon_state = "folder_solfed"

/obj/item/folder/documents/solfed
	document = /obj/item/documents/solfed
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/bureaucracy.dmi'
	icon_state = "folder_solfed"
	name = "folder- 'TOP SECRET'"
	desc = "A folder stamped \"Top Secret - Property of the Solar Federation. Unauthorized distribution is punishable by death.\""

/obj/item/documents/solfed
	desc = "\"TOP SECRET\" SolFed documents, filled with complex logistical diagrams withing the republics, terraforming projects and navy routes."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/bureaucracy.dmi'
	icon_state = "docs_gold"

/obj/item/pen/solfed
	name = "\improper SolFed pen"
	desc = "A fancy gold-blue pen used by SolFed's bureaucrats."
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/bureaucracy.dmi'
	icon_state = "pen-sf"

//Fancy eknifes!!

/obj/item/melee/energy/sword/saber/knife
	name = "energy kampfmesser"
	desc = "Nanotrasen eswords are failing to properly deliver solarian freedom? Try this!"
	icon = 'mod_celadon/_storge_icons/icons/solfed/obj/energy.dmi'
	icon_state = "eknife"
	base_icon_state = "eknife"
	lefthand_file = 'mod_celadon/_storge_icons/icons/solfed/mob/eknifes_lefthand.dmi'
	righthand_file = 'mod_celadon/_storge_icons/icons/solfed/mob/eknifes_righthand.dmi'
	armour_penetration = 20 //good armorpen
	block_chance = 0 //no block chances
	active_force = 15 //lower damage
	light_range = 1

/obj/item/melee/energy/sword/saber/knife/red
	possible_colors = list("red" = COLOR_SOFT_RED)

/obj/item/melee/energy/sword/saber/knife/blue
	possible_colors = list("blue" = LIGHT_COLOR_LIGHT_CYAN)

/obj/item/melee/energy/sword/saber/knife/green
	possible_colors = list("green" = LIGHT_COLOR_GREEN)

/obj/item/melee/energy/sword/saber/knife/purple
	possible_colors = list("purple" = LIGHT_COLOR_LAVENDER)

/obj/item/melee/energy/sword/saber/knife/yellow
	possible_colors = list("yellow" = COLOR_YELLOW)

/obj/item/melee/energy/sword/saber/knife/on_transform(obj/item/source, mob/user, active)
	. = ..()
	playsound(user, active ? 'sound/weapons/SolGov_sword_arm.ogg' : 'sound/weapons/saberoff.ogg', 35, TRUE)
	to_chat(user, "<span class='notice'>[src] [active ? "is now active":"can now be concealed"].</span>")
	return COMPONENT_NO_DEFAULT_MESSAGE

/obj/item/melee/energy/sword/saber/knife/melee_attack_chain(mob/user, atom/target, params)
	. = ..()
	user.changeNext_move(CLICK_CD_RANGE) //double the attack speed
