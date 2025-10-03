// MARK: Survival box
// Меняет обычный бокс на пиратскую тему, и меняем им фоны
/datum/outfit/job/tmi
	job_icon = "assistant"
	name = "TMI - Base Outfit"
	// faction = FACTION_PLAYER_TMI	// Нету такой подфракции, но будет
	// faction_icon = "bg_tmi"	// Нету такой подфракции, но будет

	id = /obj/item/card/id/cel/tmi
	// box = /obj/item/storage/box/survival/tmi	// Нету такой подфракции, но будет

// MARK: Captain

/datum/outfit/job/tmi/captain
	name = "TMI - Captain Outfit"
	jobtype = /datum/job/captain
	job_icon = "captain"

	id = /obj/item/card/id/cel/tmi/captain

// MARK: Command

/datum/outfit/job/tmi/command
	name = "TMI - Command Outfit"
	// jobtype = /datum/job/ce	// тут нужна конкретная роль
	// job_icon = "captain"	// тут нужна конкретная роль

	id = /obj/item/card/id/cel/tmi/command

// MARK: Crew

/datum/outfit/job/tmi/crew
	name = "TMI - Crew Outfit"
	// jobtype = /datum/job/ce	// тут нужна конкретная роль
	// job_icon = "captain"	// тут нужна конкретная роль

	id = /obj/item/card/id/cel/tmi/crew

// MARK: Assistant

/datum/outfit/job/tmi/assistant
	name = "TMI - Assistant Outfit"
	jobtype = /datum/job/assistant
	job_icon = "assistant"

	id = /obj/item/card/id/cel/tmi/assistant
