// MARK: Captain

/datum/outfit/job/cel/nanotrasen/captain/nslogistics
	name = "NT N+S Logistics - Captain"
	job_icon = "captain"

	id = /obj/item/card/id/cel/nanotrasen/nslogistics_captain

// MARK: Command

/datum/outfit/job/cel/nanotrasen/rd/nslogistics
	name = "NT N+S Logistics - Science Director"
	job_icon = "researchdirector"

	id = /obj/item/card/id/cel/nanotrasen/nslogistics_rd

	belt = /obj/item/pda/heads/rd

/datum/outfit/job/cel/nanotrasen/quartermaster/nslogistics
	name = "NT N+S Logistics - Supply Director"
	job_icon = "quartermaster"

	id = /obj/item/card/id/cel/nanotrasen/nslogistics_quartermaster

	belt = /obj/item/pda/quartermaster

// MARK: Crew

/datum/outfit/job/cel/nanotrasen/miner/nslogistics
	name = "NT N+S Logistics - Shaft Miner"
	job_icon = "shaftminer"

	id = /obj/item/card/id/cel/nanotrasen/nslogistics_miner

	belt = /obj/item/pda/shaftminer

/datum/outfit/job/cel/nanotrasen/cargo_tech/nslogistics
	name = "NT N+S Logistics - Cargo Tech"
	jobtype = /datum/job/cargo_tech
	job_icon = "cargotechnician"

	id = /obj/item/card/id/cel/nanotrasen/nslogistics_cargo_tech
	belt = /obj/item/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	head = /obj/item/clothing/head/nanotrasen/cap/supply
	uniform = /obj/item/clothing/under/nanotrasen/supply
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/cargo
	backpack_contents = list(/obj/item/modular_computer/tablet/preset/cargo=1)

// MARK: Assistant

/datum/outfit/job/cel/nanotrasen/assistant/nslogistics
	name = "NT N+S Logistics - Assistant"
	job_icon = "assistant"

	id = /obj/item/card/id/cel/nanotrasen/nslogistics_assistant
