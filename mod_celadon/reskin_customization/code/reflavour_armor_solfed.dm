//under

/obj/item/clothing/under/clip
	name = "\improper SolFed deck worker jumpsuit"
	desc = "A jumpsuit worn by non-Solfed workers in SolFed's vessels."

	icon = 'icons/obj/clothing/faction/clip/uniforms.dmi'
	mob_overlay_icon = 'icons/mob/clothing/faction/clip/uniforms.dmi'
	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'

/obj/item/clothing/under/clip/minutemen
	name = "\improper Solar Federation combat fatigues"
	desc = "The distinctive blue uniform of the Solar Federation Solar Federation, worn during field work and battle. Smells faintly of blueberries."

	icon_state = "clip_minuteman"

/obj/item/clothing/under/clip/formal
	name = "\improper SolFed service uniform"
	desc = "A formal outfit consisting of SolFed-issued navy slacks and white dress shirt. Commonly seen on white-collar SolFed's bureaucrats, but also worn by minutemen outside of combat."

	icon_state = "clip_formal"

/obj/item/clothing/under/clip/formal/alt
	desc = "A formal outfit consisting of a SolFed-issued navy skirt and white dress shirt. Commonly seen on white-collar SolFed's bureaucrats, but also worn by minutemen outside of combat."

	icon_state = "clip_formal_skirt"

/obj/item/clothing/under/clip/formal/with_shirt/alt //because of how fucking skirt code works...
	desc = "A formal outfit consisting of a SolFed-issued navy skirt and white dress shirt. Commonly seen on white-collar SolFed's bureaucrats, but also worn by minutemen outside of combat."

	icon_state = "clip_formal_skirt"

/obj/item/clothing/under/clip/medic
	name = "\improper SolFed medic uniform"
	desc = "A Solar Federation uniform with navy slacks and a blue button-down shirt, embroidered with white shoulder patches. The patches feature a medical cross, denoting the wearer as medical personnel. "

	icon_state = "clip_medic"

/obj/item/clothing/under/clip/officer
	name = "\improper Solar Federation officer service uniform"
	desc = "The brown service uniform used by officers of the Solar Federation's."

	icon_state = "clip_officer"
	item_state = "g_suit"

/obj/item/clothing/under/clip/officer/alt
	desc = "The brown service uniform used by officers of the Solar Federation's. This variant has a pencil skirt!"

	icon_state = "clip_officer_skirt"

//suit
/obj/item/clothing/suit/toggle/lawyer/clip
	name = "\improper SolFed officer suit jacket"
	desc = "A fancy buttoned dress jacket issued to officers of Solar Federation's."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "suitjacket_clip"
	item_state = "suitjacket_navy"

/obj/item/clothing/suit/toggle/lawyer/clip/command
	name = "\improper SolFed senior officer suit jacket"
	desc = "A fancy buttoned dress jacket issued to senior officers of Solar Federation's."

	icon_state = "suitjacket_clip_command"
	item_state = "suitjacket_clip_command"

//armor

/obj/item/clothing/suit/armor/vest/capcarapace/clip
	name = "Solar Federation general coat"
	desc = "This flamboyant overwear is employed by the field generals of the Solar Federation's."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "clip_general"
	item_state = "clip_general"

/obj/item/clothing/suit/armor/vest/capcarapace/clip/admiral
	name = "Solar Federation admiral trenchcoat"
	desc = "A very fancy trenchcoat used by naval admirals of the Solar Federation's."

	icon_state = "clip_admiral"
	item_state = "clip_admiral"

/obj/item/clothing/suit/armor/riot/clip
	name = "black riot suit"
	desc = "A charcoal-painted suit of bulky, heavy armor designed for close-quarters fighting and riot control. The armor of choice for SolFed-BARD members, but used universally by SolFed. Helps the wearer resist shoving in close quarters."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "riot_clip"

/obj/item/clothing/suit/armor/clip_trenchcoat
	name = "\improper SolFed trenchcoat"
	desc = "A trenchcoat in Solar Federation colors. Despite its reputation as a military officer coat, it's used by all divisions within SolFed. Has a lot of pockets."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "clip_trenchcoat"
	item_state = "trenchcoat_solgov"

/obj/item/clothing/suit/armor/clip_capcoat
	name = "Solar Federation captain's coat"
	desc = "The coat issued to all Solar Federation's officers worthy of the rank of Captain. Features thick padding which, while protective, does not replace proper armor."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "clip_captaincoat"
	item_state = "clip_captaincoat"

/obj/item/clothing/suit/armor/vest/clip_correspondent
	name = "\improper correspondent armor vest"
	desc = "A slim Type I armored vest that provides decent protection against most types of damage. The white letters on the front read \"PRESS\" in SolFed - Kalixcian."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'
	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'

	icon_state = "armor_correspondant"
	item_state = "armor_correspondant"

// biosuits

/obj/item/clothing/suit/bio_suit/bard
	name = "BARD-440 bio suit"
	desc = "The iconic biosuit of SolFed-BARD agents on the frontier and elsewhere."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "armor_correspondant"
	item_state = "armor_correspondant"

/obj/item/clothing/head/bio_hood/bard
	name = "BARD-434 bio hood"
	desc = "A simple but effective and lightweight hood for use with SolFed-BARD's biosuits."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	icon_state = "clip_bard_biosuit"

/obj/item/clothing/head/bio_hood/bard/armored
	name = "BARD-434 armored bio hood"
	desc = "An M10 surplus helmet placed over a blue bio hood for use with SolFed-BARD's biosuits."

	icon_state = "clip_bard_bio_armored"

/obj/item/clothing/suit/bio_suit/bard/medium
	name = "BARD-434-2 combat bio suit"
	desc = "A special model of bio suit, made to specific SolFed-BARD certification and issued to teams expecting combat against dangerous xenofauna. Cumbersome."

	icon_state = "clip_bard_biosuit_medium"

/obj/item/clothing/suit/bio_suit/bard/heavy
	name = "BARD-434-3 heavy combat bio suit"
	desc = "A special model of bio suit, made to specific SolFed-BARD certification and issued to teams expecting combat against dangerous xenofauna. Cumbersome."

	icon_state = "clip_bard_biosuit_heavy"

//spacesuits
/obj/item/clothing/suit/space/clip
	name = "SolFed space suit"
	desc = "A popular suit manufactured by the colonial league, rated for hazardous, low-pressure environments and high temperature alike. Often worn by various workers and civilians hired by the league."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "space-clip"
	item_state = "space-clip"

/obj/item/clothing/head/helmet/space/clip
	name = "SolFed space helmet"
	desc = "A space helmet manufactured by the colonial league, rated for hazardous, low pressure environments and minor impacts. Often worn by various workers and civilians hired by the league."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	icon_state = "space-clip"
	item_state = "space-clip"

/obj/item/clothing/suit/space/clip/armored
	name = "SolFed armored space suit"
	desc = "An armored variant of the Solar Federation spacesuit, swapping fabrics and adding more plating. Often issued out to miners in hazardous locations, police forces, or reservists."

	icon_state = "space-clip-armor"
	item_state = "space-clip-armor"

/obj/item/clothing/head/helmet/space/clip/armored
	name = "SolFed armored space helmet"
	desc = "An armored variant of the Solar Federation space helmet, swapping plating types. Often issued out to miners in hazardous locations, police forces, or reservists."

	icon_state = "space-clip-armor"
	item_state = "space-clip-armor"

/obj/item/clothing/suit/space/hardsuit/clip_patroller
	name = "\improper CM-410 'Patroller' EVA Hardsuit"
	desc = "An older-issue SolFed hardsuit, adapted from an even older design. Widely utilized in reconnaissance duty and skirmishing due to its lightweight construction."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "hardsuit-clip-patrol"
	hardsuit_type = "hardsuit-clip-patrol"

/obj/item/clothing/head/helmet/space/hardsuit/clip_patroller
	name = "\improper CM-410 'Patroller' EVA Hardsuit helmet"
	desc = "The helmet for the Patroller hardsuit. The wide visor allows for higher visibility than afforded to standard combat hardsuits."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	icon_state = "hardsuit0-clip-patrol"
	hardsuit_type = "clip-patrol"

/obj/item/clothing/suit/space/hardsuit/clip_spotter
	name = "CM-490 'Spotter' Combat Hardsuit"
	desc = "SolFed's newer, standard-issue extra-vehicular combat hardsuit. The heavy plating is uncomfortable, and slows the wearer down."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "clip_spotter"
	hardsuit_type = "clip_spotter"

/obj/item/clothing/head/helmet/space/hardsuit/clip_spotter
	name = "CM-490 'Spotter' Combat Hardsuit Helmet"
	desc = "The helmet for the Spotter hardsuit. Features a very distinctive 'Spider-Eyes' visor."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	icon_state = "hardsuit0-clip_spotter"
	hardsuit_type = "clip_spotter"

/obj/item/clothing/suit/space/hardsuit/bomb/clip
	name = "CMM EOD hardsuit"

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/suits.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/suits.dmi'

	icon_state = "hardsuit-clipeod"
	hardsuit_type = "clipeod"

/obj/item/clothing/head/helmet/space/hardsuit/bomb/clip
	name = "CMM EOD hardsuit helmet"

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	icon_state = "clip_cap"
	item_state = "bluecloth"

//hats
/obj/item/clothing/head/clip
	name = "\improper Solar Federation service cap"
	desc = "A service cap commonly seen on Solar Federation of all ranks while off-duty, but more daring soldiers may choose to wear it during combat. The design dates back to the uniform used by the deserting forces of the Zohil Republic, who were the first citizens of SolFed."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'
	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'

	icon_state = "clip_mediccap"
	item_state = "whitecloth"

/obj/item/clothing/head/clip/corpsman
	name = "\improper Solar Federation medic cap"
	desc = "A service cap seen on Solar Federation who choose medicine as their profession. The design dates back to the uniform used by the deserting forces of the Zohil Republic, who were the first citizens of SolFed."

	icon_state = "clip_slouch_hat"

/obj/item/clothing/head/clip/slouch
	name = "\improper Solar Federation officer's slouch hat"
	desc = "A commanding slouch hat, issued to senior enlisted and junior officers of the Solar Federation."

	icon_state = "clip_officer_hat"

/obj/item/clothing/head/clip/slouch/officer
	name = "\improper Solar Federation senior officer's slouch hat"
	desc = "A commanding slouch hat with a white badge, given to higher-ranking officers of the Solar Federation."

	icon_state = "clip_boonie"

/obj/item/clothing/head/clip/boonie
	name = "\improper Solar Federation boonie hat"
	desc = "A wide brimmed cap in Solar Federation colors to keep oneself cool during blistering hot weather."

	icon_state = "clip_general_hat"

/obj/item/clothing/head/clip/bicorne
	name = "\improper Solar Federation General bicorne"
	desc = "A large, flashy bicorne used by generals of the Solar Federation's."

/obj/item/clothing/head/helmet/bulletproof/x11/clip
	name = "\improper Solar Federation CM-11 Helmet"
	desc = "A large, bulky bulletproof helmet in the distinctive blue coloring of the Solar Federation. Features a little attachment rail on the side where you can mount a flashlight."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'
	kepori_override_icon = 'icons/mob/clothing/faction/clip/kepori.dmi'

	lefthand_file = 'icons/mob/inhands/faction/clip/clip_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/faction/clip/clip_righthand.dmi'

	icon_state = "clip_x11_blank"
	item_state = "clip_x11"

	unique_reskin = list(
		"Standard Medic" = "clip_x11",
		"Blank" = "clip_x11_blank",
		"White Stripe" = "clip_x11_stripe"
		)

/obj/item/clothing/head/helmet/m10/clip
	name = "\improper Solar Federation CM-10 Helmet"
	desc = "A cheap, but comfortable and light helmet painted in Solar Federation colors, often seen in the hands of the reserves or Solar Federation in the backline. Features a little attachment rail on the side where you can mount a flashlight."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'

	icon_state = "clip_m10_blank"

	unique_reskin = list(
		"Standard Medic" = "clip_m10",
		"Blank" = "clip_m10_blank",
		"Triple Column" = "clip_m10_triple"
		)

/obj/item/clothing/head/helmet/m10/clip_vc
	name = "\improper Solar Federation CM-12 Helmet"
	desc = "A special, lightweight and padded helmet issued to Vehicle Crewmen of the Solar Federation. Features noise-reducing technology and a microphone that automatically connects with worn headsets. Hopefully protects you from bumpy rides."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'
	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'

	icon_state = "clip_m10_vc"

/obj/item/clothing/head/helmet/m10/clip_correspondent
	name = "SolFed war correspondent M10 Helmet"
	desc = "A lightweight bulletproof helmet given to war correspondents of SolFed. Features a little attachment rail on the side where you can mount a flashlight. Keep your head down!"

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'
	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'

	icon_state = "clip_m10_correspondant"
	item_state = "clip_m10_correspondant"

/obj/item/clothing/head/helmet/riot/clip
	name = "\improper Solar Federation CM-13 Riot Helmet"
	desc = "A sturdy blue helmet, made with crowd control in mind. The foldable protective visor makes it SolFed-BARD's preferred helmet against hostile xenofauna."

	icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/head.dmi'
	mob_overlay_icon = 'mod_celadon/_storage_icons/icons/resprite/clip_armor/overlay/head.dmi'
	vox_override_icon = 'icons/mob/clothing/faction/clip/vox.dmi'

// SolFed-GOLD

/obj/item/clothing/head/fedora/det_hat/clip
	name = "\improper SolFed-GOLD fedora"
	desc = "A rare sight in the frontier, issued to members of the SolFed-GOLD division. Designed to look more casual, but still as fashionable as the average SolFed attire."

/obj/item/clothing/head/flatcap/clip
	name = "\improper SolFed-GOLD flatcap"
	desc = "A flatcap issued to members of the SolFed-GOLD division. An office worker's hat."

//gloves
//boots
//belt
/obj/item/storage/belt/military/clip
	name = "\improper Solar Federation chest rig"
	desc = "This rig features many large pouches colored in Solar Federation blue. The bulk of the pouches makes it only slightly uncomfortable to wear."

/obj/item/storage/belt/military/clip/alt
	name = "\improper Solar Federation belt rig"
	desc = "This belt features many large pouches colored in Solar Federation blue. The bulk of the pouches makes it only slightly uncomfortable to wear."

/obj/item/storage/belt/medical/webbing/clip
	name = "SolFed medical webbing"
	desc = "A variation on the standard Minuteman rig, colored white and instead designed to hold various medical supplies."

//back
/obj/item/storage/backpack/security/clip
	name = "SolFed backpack"
	desc = "It's a very blue backpack, branded with the stars of the Solar Federation."

/obj/item/storage/backpack/satchel/sec/clip
	name = "SolFed satchel"
	desc = "It's a very blue satchel, branded with the stars of the Solar Federation."

//neck
//accessories

/obj/item/clothing/accessory/clip_formal_overshirt
	name = "\improper SolFed overshirt"
	desc = "A fancy blue shirt intended to be worn over the SolFed service uniform's undershirt."
