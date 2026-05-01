// MARK: NT DeForest

/datum/outfit/job/cel/nanotrasen/cmo/deforest_cmo
	name = "NT DeForest - Medical Director"
	job_icon = "chiefmedicalofficer"

	id = /obj/item/card/id/cel/nanotrasen/deforest_cmo

	belt = /obj/item/pda/heads/cmo

/datum/outfit/job/cel/nanotrasen/scientist/deforest_researcher
	name = "NT DeForest - Scientist"
	job_icon = "scientist"

	belt = /obj/item/pda/scientist

	id = /obj/item/card/id/cel/nanotrasen/deforest_researcher

/datum/outfit/job/cel/nanotrasen/scientist/deforest_researcher/genetic
	name = "NT DeForest - Scientist Geneticist"

	belt = /obj/item/pda/geneticist

/datum/outfit/job/cel/nanotrasen/scientist/deforest_researcher/roboticist
	name = "NT DeForest - Scientist Roboticist"
	id_assignment = "Roboticist"
	job_icon = "roboticist"
	jobtype = /datum/job/roboticist

	uniform = /obj/item/clothing/under/nanotrasen/science/robotics
	suit = /obj/item/clothing/suit/toggle/labcoat/nanotrasen
	ears = /obj/item/radio/headset/nanotrasen
	glasses = /obj/item/clothing/glasses/welding
	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/pda/roboticist

	backpack_contents = list(/obj/item/weldingtool/hugetank)

/datum/outfit/job/cel/nanotrasen/chemist/deforest_chemist
	name = "NT DeForest - Chemist"
	job_icon = "chemist"

	id = /obj/item/card/id/cel/nanotrasen/deforest_chemist

/datum/outfit/job/cel/nanotrasen/doctor/deforest_medic
	name = "NT DeForest - Medical Doctor"
	job_icon = "medicaldoctor"

	id = /obj/item/card/id/cel/nanotrasen/deforest_medic

/datum/outfit/job/cel/nanotrasen/paramedic/deforest_medic
	name = "NT DeForest - Paramedic"
	job_icon = "medicaldoctor"

	id = /obj/item/card/id/cel/nanotrasen/deforest_medic/paramedic

/datum/outfit/job/cel/nanotrasen/assistant/deforest_assistant
	name = "NT DeForest - Assistant"
	job_icon = "assistant"

	id = /obj/item/card/id/cel/nanotrasen/deforest_assistant
