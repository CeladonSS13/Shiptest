/datum/mission/ruin/lost_axe
	name = "Axe Retrieval"
	desc = "I recently lost a heirloom axe - produced by a very fine Syebenaltch Guild. I was unable to retrieve it when my vessel crashed, and I was rescued. Please bring it home to me."
	mission_limit = 1
	setpiece_item = /obj/item/melee/axe/fire

/datum/mission/ruin/fallen_montagne
	name = "dark signal investigation"
	desc = "A hunting lodge located on an ice-world in system has recently ceased communication. We suspect they may have been assulted by pirates. If this is the case, and they have fallen, bring the Montague's corpse, so they may be buried properly."
	value = 3000
	mission_limit = 1
	mission_reward = /obj/structure/fermenting_barrel/trickwine
	faction = /datum/faction/srm
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/daughter
	name = "find our daughter!"
	desc = "Our daughter was recently deployed out to the Frontier - and we haven't heard from her, or the Minutemen - or anyone in weeks! Please find her and make sure she's okay..."
	value = 4000
	mission_limit = 1
	author = "Concerned Parents"
	faction = /datum/faction/clip
	mission_reward = /obj/item/gun/ballistic/automatic/smg/cm5/compact
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/nt_files
	name = "Discrete Asset Recovery"
	desc = "Look- long story short, I need this folder retrieved. You don't ask why, I make sure you get paid."
	value = 2500
	mission_limit = 1
	mission_reward = list(
		/obj/item/gun/energy/e_gun/old,
		/obj/item/gun/energy/laser/retro,
	)
	faction = /datum/faction/nt
	setpiece_item = /obj/item/documents/nanotrasen

/datum/mission/ruin/nt_files/generate_mission_details()
	. = ..()
	author = "Captain [random_species_name()]"

/datum/mission/ruin/icw_documents
	name = "Syndicate Battleplans Retrieval"
	desc = "Our Final Project for the ICW-Era Preservation is to find a new piece of ICW history and preserve it. My group has gotten word that Syndicate Battleplans can be found at this site. Please see if they're there, and retrieve them for us."
	faction = /datum/faction/syndicate/suns
	author = "HIS455 \"ICW-era Preservation\""
	mission_limit = 1
	setpiece_item = /obj/item/folder/documents/syndicate/red

/datum/mission/ruin/nanotrasen_docs
	name = "Nanotrasen Asset Recovery Program."
	author = "Nanotrasen Recovery Program"
	desc = "We've recently lost contact with a processing facility within the purview of this outpost. Nanotrasen is interested in the retrieval of sensitive assets located within the facility."
	faction = list(
		/datum/faction/nt,
		/datum/faction/syndicate/cybersun
	)
	value = 3500
	mission_limit = 1
	setpiece_item = /obj/item/documents/nanotrasen

/datum/mission/ruin/nanotrasen_docs/generate_mission_details()
	. = ..()
	if(faction == /datum/faction/nt)
		name = "Nanotrasen Asset Recovery Program"
		author = "Nanotrasen Recovery Program"
		desc = "Nanotrasen Corporate has recently lost contact with a processing facility within the purview of this outpost. Nanotrasen is interested in the retrieval of sensitive assets located within the facility."
	if(faction == /datum/faction/syndicate/cybersun)
		name = "Cybersun Capture Program"
		author = "Cybersun Virtual Solutions"
		desc = "Cybersun VS is extremely interested in the contents of a documents package located at a Nanotrasen facility recently hit by the Ramzi Clique. Retrieve it for us, and we'll pay handsomely."

/datum/mission/ruin/captain_medal
	name = "Recover War Medal"
	desc = "A few months back, I lost my medal for \"Valiant Command Under Fire\". I've managed to track it down to a world in this system, and I'd like it retrieved."
	faction = /datum/faction/nt
	value = 2250
	mission_limit = 1
	setpiece_item = /obj/item/clothing/accessory/medal/gold/captain

/datum/mission/ruin/brainchip
	name = "Nanotrasen Asset Recovery Program"
	author = "Nanotrasen Recovery Program"
	desc = "Retrieve an implant from cargo technician who has failed to report proper usage of the system as stipulated by contract."
	faction = /datum/faction/nt
	mission_limit = 1
	setpiece_item = /mob/living/carbon/human
