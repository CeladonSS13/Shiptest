/datum/supply_pack/spacesuits
	category = "Equipment - Spacesuits"

/datum/supply_pack/spacesuits/spacesuit
	name = "Space Suit"

/datum/supply_pack/spacesuits/pilot_spacesuit
	name = "Pilot Space Suit"

/datum/supply_pack/spacesuits/engi_spacesuit
	name = "Engineering Space Suit"

/datum/supply_pack/spacesuits/mining_hardsuits_indie
	name = "Mining Hardsuit"

/datum/supply_pack/spacesuits/sec_hardsuit_bundle
	name = "Security Hardsuit"

/datum/supply_pack/spacesuits/med_hardsuit
	name = "Medical Hardsuit"

/datum/supply_pack/spacesuits/mining_hardsuit_heavy
	name = "Heavy Mining Hardsuit"

/datum/supply_pack/spacesuits/eod_hardsuit
	name = "EOD Hardsuit"

/datum/supply_pack/spacesuits/atmos_hardsuit
	name = "Atmospherics Hardsuit"
	cost = 2000
	faction_locked = FALSE

/datum/supply_pack/spacesuits/patroller_hardsuit
	available = FALSE

/datum/supply_pack/spacesuits/spotter_hardsuit
	available = FALSE

/datum/supply_pack/spacesuits/engineering_hardsuit
	name = "Engineering Hardsuit"
	faction_locked = TRUE

/datum/supply_pack/spacesuits/security_hardsuit
	name = "Nanotrasen Security Hardsuit"
	desc = "A cheap spare security hardsuit used on NT's stations by the sec department. Provides weak protection against most damage types. Using it for combat in the frontier region of space is not recommended"
	contains = list(/obj/item/clothing/suit/space/hardsuit/security)
	cost = 3500
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/spacesuits/swat_hardsuit
	name = "Nanotrasen MK2 SWAT hardsuit"
	desc = "Advanced MK2 SWAT hardsuit used by elite corporate assets. While it is bulky, slow and is missing a built in flashlight, it provides excellent protection against almost any weapon and is great for work in hazardous environments"
	contains = list(/obj/item/clothing/suit/space/hardsuit/swat/captain)
	cost = 8000
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/spacesuits/pointman_hardsuit
	name = "Pointman Hardsuit"

/datum/supply_pack/spacesuits/inteq_hardsuit
	name = "Inteq Hardsuit"

/datum/supply_pack/spacesuits/spacesuit/inteq
	name = "Inteq Space Suit"

/datum/supply_pack/spacesuits/spacesuit/solgov
	name = "Solarian Vacsuit"

/datum/supply_pack/spacesuits/solar_hardsuit
	name = "Solarian Hardsuit"

/datum/supply_pack/spacesuits/armored_engi_spacesuit
	name = "Coalition Engineering Space Suit"

/datum/supply_pack/spacesuits/syndicate_space_suit
	name = "Syndicate Armored Space Suit"
	desc = "Contains one armored spacesuit. Generic enough to be manufactured and distributed by most ex-Coalition groups."
	cost = 1500
	contains = list(
		/obj/item/clothing/suit/space/syndicate,
		/obj/item/clothing/head/helmet/space/syndicate,
	)
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/spacesuits/cmt_hardsuit
	name = "CMT Hardsuit"

/datum/supply_pack/spacesuits/neutron_hardsuit
	name = "Neutron Star Hardsuit"

/datum/supply_pack/spacesuits/syndicate_hardsuit
	name = "Blood-Red Hardsuit"
	desc = "A classic and effective dual-mode gorlex marauders hardsuit. Provides excellent combat protection"
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi)
	cost = 5000
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/spacesuits/white_red_hardsuit
	name = "White-Red Hardsuit"

/datum/supply_pack/spacesuits/beige_red_hardsuit
	name = "Beige-Red Hardsuit"

/datum/supply_pack/spacesuits/armored_spacesuit
	available = FALSE

/datum/supply_pack/spacesuits/clip_armored
	available = FALSE

/datum/supply_pack/spacesuits/clip
	available = FALSE
