//	Syndicate
/datum/outfit/job/cel/syndicate/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	H.faction |= list(FACTION_PLAYER_SYNDICATE)

//	Nanotrasen
/datum/outfit/job/cel/nanotrasen/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	H.faction |= list(FACTION_PLAYER_NANOTRASEN, FACTION_PLAYER_SOLFED)

//	SolFed
/datum/outfit/job/cel/solfed/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	H.faction |= list(FACTION_PLAYER_SOLFED, FACTION_PLAYER_NANOTRASEN)

//	InteQ
/datum/outfit/job/cel/inteq/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	H.faction |= list(FACTION_PLAYER_INTEQ)

/datum/faction/elysium
	name = FACTION_ELYSIUM
	prefixes = list("EUSM", "EUSQ", "EUSF", "EUSR", "ESV")
	color = "#006400"

/datum/faction/pirate
	name = FACTION_PIRATES
	prefixes = list("PIRATE", "RSV")
	color = "#504c4c"

/datum/faction/nanotrasen
	name = FACTION_NANOTRASEN
	prefixes = list("NTSV", "NTBSV", "NTASV", "NTSSV", "NTTSV", "NTMSV", "NTLSV", "NTDSV", "NTSPSV", "NTESV", "NTRSV")
	color = "#2945c5"

/datum/faction/inteq
	prefixes = list("IRMV", "IQMSSV", "BIQSV", "LIQSV", "SPIQSV")
	color = "#914E01"

/datum/faction/solgov
	prefixes = list("SFSV", "BSFSV", "ASFSV", "SSFSV", "MDSFSV", "LSFSV", "MSFSV", "SPSFSV")
	color = "#721ed3"

/datum/faction/syndicate
	prefixes = list("SEV", "SSV", "SMMV", "PCAC", "SSASV", "SSSV", "SOSSV", "TSSV", "SABSV", "BSSV", "ASSV", "MSSV", "LSSV", "DSSV", "RSSV",)
	color = "#B22C20"
