/obj/item/card/id/elysium_com
	name = "\improper Elysium Central Command access card"
	desc = "An access card sourced from Elysium Central Command."
	icon = 'mod_celadon/_storge_icons/icons/obj/elysium_card.dmi'
	icon_state = "elysium_com"
	uses_overlays = FALSE
	registered_age = null

/obj/item/card/id/elysium_com/Initialize()
	access = get_all_centcom_access()+get_all_accesses_outpost()
	. = ..()

/obj/item/card/id/elysium_com/has_ship_access(datum/overmap/ship/controlled/ship)
	return TRUE

/obj/effect/mob_spawn/human/bridgeofficerelysium
	name = "Avanpost Bridge Officer Elysium"
	id_job = "Bridge Officer"
	id_access_list = list(ACCESS_CENT_CAPTAIN)
	outfit = /datum/outfit/elysiumbridgeofficercorpse

/datum/outfit/elysiumbridgeofficercorpse
	name = "Avanpost Bridge Officer Elysium"
	ears = /obj/item/radio/headset/heads/head_of_personnel
	uniform = /obj/item/clothing/under/rank/avanpost/elysium_apparel/admin
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	shoes = /obj/item/clothing/shoes/sneakers/sandals_cc/admin
	head = /obj/item/clothing/head/shemag_elysium/admin
	glasses = /obj/item/clothing/glasses/thermal/syndi/admin
	id = /obj/item/card/id/elysium_com
	belt = /obj/item/storage/belt/security/webbing/elysium/vest_black
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/melee/baseball_bat/homerun/central_command
	box = /obj/item/storage/box/survival/security
	suit_store = /obj/item/gun/ballistic/revolver/mateba
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated

	back = /obj/item/storage/backpack/security
	backpack_contents = list(/obj/item/melee/classic_baton,
							/obj/item/restraints/handcuffs = 4,
							/obj/item/ammo_box/a357 = 3)

	implants = list(/obj/item/implant/mindshield,
					/obj/item/implant/krav_maga,
					/obj/item/implant/stealth)

/obj/effect/mob_spawn/human/commanderelysium
	name = "Avanpost Commander Elysium"
	id_job = "Avanpost Commander Elysium"
	id_access_list = list(ACCESS_CENT_CAPTAIN, ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_MEDICAL, ACCESS_CENT_STORAGE)
	outfit = /datum/outfit/elysiumcommandercorpse

/datum/outfit/elysiumcommandercorpse
	name = "\improper Avanpost Private Security Commander Elysium"
	uniform = /obj/item/clothing/under/rank/avanpost/elysium_apparel/admin
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	ears = /obj/item/radio/headset/heads/captain
	glasses = /obj/item/clothing/glasses/thermal/syndi/admin
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	head = /obj/item/clothing/head/shemag_elysium/admin
	gloves = /obj/item/clothing/gloves/tackler/combat
	shoes = /obj/item/clothing/shoes/sneakers/sandals_cc/admin
	belt = /obj/item/lighter
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/melee/baseball_bat/homerun/central_command
	box = /obj/item/storage/box/survival/security
	suit_store = /obj/item/gun/ballistic/revolver/mateba
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	id = /obj/item/card/id/elysium_com

	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/melee/classic_baton,
							/obj/item/restraints/handcuffs = 4,
							/obj/item/ammo_box/a357 = 3)

	implants = list(/obj/item/implant/mindshield,
					/obj/item/implant/krav_maga,
					/obj/item/implant/stealth)

/obj/effect/mob_spawn/human/commanderelysium_alt
	name = "Avanpost Commander Elysium (Alternative)"
	id_job = "Avanpost Commander Elysium"
	id_access_list = list(ACCESS_CENT_CAPTAIN, ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_MEDICAL, ACCESS_CENT_STORAGE)
	outfit = /datum/outfit/elysiumcommandercorpse_alt

/datum/outfit/elysiumcommandercorpse_alt
	name = "\improper Avanpost Private Security Commander Elysium"
	uniform = /obj/item/clothing/under/rank/avanpost/elysium_apparel_long/admin
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	ears = /obj/item/radio/headset/heads/captain
	glasses = /obj/item/clothing/glasses/thermal/syndi/admin
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	head = /obj/item/clothing/head/turban_elysium/admin
	gloves = /obj/item/clothing/gloves/tackler/combat
	shoes = /obj/item/clothing/shoes/sneakers/sandals_cc/admin
	l_pocket = /obj/item/melee/baseball_bat/homerun/central_command
	r_pocket = /obj/item/lighter
	id = /obj/item/card/id/elysium_com

	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/melee/classic_baton,
							/obj/item/restraints/handcuffs = 4,
							/obj/item/ammo_box/a357 = 3)

	implants = list(/obj/item/implant/mindshield,
					/obj/item/implant/krav_maga,
					/obj/item/implant/stealth)

/obj/effect/mob_spawn/human/commanderelysium/alive
	death = FALSE
	roundstart = FALSE
	mob_name = "\improper Avanpost Elysium Commander"
	name = "sleeper"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	short_desc = "You are a Avanpost Elysium Commander!"

/obj/effect/mob_spawn/human/elysiumsoldier/alive
	death = FALSE
	roundstart = FALSE
	mob_name = "Avanpost Elysium Private Security Officer"
	name = "sleeper"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	faction = (FACTION_PLAYER_ELYSIUM)
	short_desc = "You are a Avanpost Elysium Private Security Officer!"

/datum/outfit/avanpost
	name = "Avanpost Elysium"
	uniform = /obj/item/clothing/under/rank/avanpost/elysium_apparel/admin
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	ears = /obj/item/radio/headset/heads/captain
	glasses = /obj/item/clothing/glasses/thermal/syndi/admin
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	gloves = /obj/item/clothing/gloves/tackler/combat
	shoes = /obj/item/clothing/shoes/sneakers/sandals_cc/admin
	l_pocket = /obj/item/melee/baseball_bat/homerun/central_command
	r_pocket = /obj/item/lighter
	id = /obj/item/card/id/elysium_com

	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/melee/classic_baton,
							/obj/item/restraints/handcuffs = 4,
							/obj/item/ammo_box/a357 = 3)

	implants = list(/obj/item/implant/mindshield,
					/obj/item/implant/krav_maga,
					/obj/item/implant/stealth)

/datum/outfit/avanpost/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_MINDSHIELD, "status_effect")
	H.faction |= list(FACTION_ELYSIUM)

	var/obj/item/card/id/W = H.wear_id
	W.access = get_all_accesses()+get_all_accesses_outpost()
	W.access += get_centcom_access("Avanpost Elysium")
	W.assignment = "Avanpost Elysium"
	W.registered_name = H.real_name
	W.update_label()
	..()

/datum/outfit/avanpost/commander
	name = "Avanpost Elysium Commander"
	uniform = /obj/item/clothing/under/rank/avanpost/elysium_apparel/admin
	suit = /obj/item/clothing/suit/armor/vest/bulletproof
	shoes = /obj/item/clothing/shoes/sneakers/sandals_cc/admin
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/thermal/syndi/admin
	mask = /obj/item/clothing/mask/cigarette/cigar/cohiba
	head = /obj/item/clothing/head/turban_elysium/admin
	belt = /obj/item/gun/ballistic/revolver/mateba
	r_pocket = /obj/item/lighter
	l_pocket = /obj/item/melee/baseball_bat/homerun/central_command
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id/elysium_com

	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/melee/classic_baton,
							/obj/item/restraints/handcuffs = 4,
							/obj/item/ammo_box/a357 = 3)

	implants = list(/obj/item/implant/mindshield,
					/obj/item/implant/krav_maga,
					/obj/item/implant/stealth)

/datum/outfit/avanpost/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_MINDSHIELD, "status_effect")
	H.faction |= list(FACTION_ELYSIUM)

	var/obj/item/card/id/W = H.wear_id
	W.access = get_all_accesses()+get_all_accesses_outpost()
	W.access += get_centcom_access("Avanpost Elysium Commander")
	W.assignment = "Avanpost Elysium Commander"
	W.registered_name = H.real_name
	W.update_label()
	..()


/datum/outfit/avanpost/cmo

	name = "Avanpost Chief Medical Officer"

	id = /obj/item/card/id/silver/elysium_cmo
	belt = /obj/item/pda/heads/cmo
	l_pocket = /obj/item/pinpointer/crew
	ears = /obj/item/radio/headset/headset_com
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo
	l_hand = /obj/item/storage/firstaid/medical
	suit_store = /obj/item/flashlight/pen
	back = /obj/item/storage/backpack/duffelbag/med
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1,
							/obj/item/storage/backpack/medic = 1,
							/obj/item/storage/backpack/satchel/med = 1,
							/obj/item/storage/backpack/messenger/med = 1,
							/obj/item/clothing/suit/hooded/wintercoat/medical = 1,
							/obj/item/clothing/suit/toggle/labcoat/mad = 1,
							/obj/item/clothing/under/rank/medical/doctor/blue = 1)

	box = /obj/item/storage/box/survival/medical

	chameleon_extras = list(/obj/item/gun/syringe, /obj/item/stamp/cmo)

/datum/outfit/debug/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	H.faction |= list(FACTION_PLAYER_SYNDICATE,
					FACTION_PLAYER_NANOTRASEN,
					FACTION_PLAYER_SOLFED,
					FACTION_PLAYER_NANOTRASEN,
					FACTION_PLAYER_INTEQ,
					FACTION_ELYSIUM,
					FACTION_PIRATES,
					FACTION_PLAYER_FRONTIERSMEN,
					FACTION_PLAYER_MINUTEMAN,
					FACTION_PLAYER_SOLCON,
					FACTION_PLAYER_ROUMAIN,
					FACTION_PLAYER_GEZENA,
					FACTION_ANTAG_SYNDICATE,
					FACTION_ANTAG_FRONTIERSMEN
					)
	ADD_TRAIT(H, TRAIT_MINDSHIELD, "status_effect")

/datum/job/outpost/cmo
	name = "Chief Medical Officer"
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	minimal_player_age = 7
	officer = TRUE
	wiki_page = "Chief_Medical_Officer"

	outfit = /datum/outfit/avanpost/cmo

	access = list(ACCESS_MEDICAL, ACCESS_PSYCHOLOGY, ACCESS_MORGUE, ACCESS_GENETICS, ACCESS_CLONING, ACCESS_PHARMACY, ACCESS_HEADS, ACCESS_MINERAL_STOREROOM, ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_CMO, ACCESS_SURGERY, ACCESS_RC_ANNOUNCE, ACCESS_MECH_MEDICAL, ACCESS_KEYCARD_AUTH, ACCESS_SEC_DOORS, ACCESS_MAINT_TUNNELS, ACCESS_OUTPOST_MED_CMO, ACCESS_OUTPOST_MED_HIRURG, ACCESS_OUTPOST_MED_STORAGE, ACCESS_OUTPOST_MED_GENETIC, ACCESS_OUTPOST_MED_CHEMISTRY, ACCESS_OUTPOST_MED_MORGUE, ACCESS_OUTPOST_MED_GENERAL,)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_PSYCHOLOGY, ACCESS_MORGUE, ACCESS_GENETICS, ACCESS_PHARMACY, ACCESS_HEADS, ACCESS_MINERAL_STOREROOM, //WS edit - Gen/Sci Split
			ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_CMO, ACCESS_SURGERY, ACCESS_RC_ANNOUNCE, ACCESS_MECH_MEDICAL,
			ACCESS_KEYCARD_AUTH, ACCESS_SEC_DOORS, ACCESS_MAINT_TUNNELS)

	display_order = JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER
