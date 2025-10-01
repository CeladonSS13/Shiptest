/obj/item/card/id/cel/syndicate
	desc = "An access card widely utilized by Coalition splinters in the frontier."
	icon_state = "syndie"
	access = list(ACCESS_SYNDICATE)
	uses_overlays = FALSE

//MARK: SYNDICATE

/obj/item/card/id/cel/syndicate/admiral
	icon_state = "idsyndicate_admiral"
	assignment = "Admiral"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS, ACCESS_ARMORY, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/captain
	icon_state = "idsyndicate_captain"
	assignment = "Captain"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS, ACCESS_ARMORY, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_rd
	icon_state = "idsyndicate_command"
	assignment = "Research Director"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/crew
	icon_state = "idsyndicate_crew"
	assignment = "Operative"

/obj/item/card/id/cel/syndicate/crew/engeneer
	assignment = "Engineer"
	access = list(ACCESS_SYNDICATE, ACCESS_ENGINE, ACCESS_CONSTRUCTION)

/obj/item/card/id/cel/syndicate/crew/medic
	assignment = "Medic"
	access = list(ACCESS_SYNDICATE, ACCESS_MEDICAL)

/obj/item/card/id/cel/syndicate/crew/lieutenant
	assignment = "Lieutenant"
	access = list(ACCESS_SYNDICATE, ACCESS_ARMORY)

/obj/item/card/id/cel/syndicate/assistant
	icon_state = "idsyndicate_assistant"
	assignment = "Assistant"

//MARK: GEC

/obj/item/card/id/cel/syndicate/captain/gec
	icon_state = "idgec_captain"

/obj/item/card/id/cel/syndicate/command_rd/gec
	icon_state = "idgec_command"

/obj/item/card/id/cel/syndicate/crew/gec
	icon_state = "idgec_crew"

/obj/item/card/id/cel/syndicate/assistant/gec
	icon_state = "idgec_assistant"

//MARK: DonkCo

/obj/item/card/id/cel/syndicate/captain/donkco
	icon_state = "iddc_captain"

/obj/item/card/id/cel/syndicate/command_rd/donkco
	icon_state = "iddc_command"

/obj/item/card/id/cel/syndicate/crew/donkco
	icon_state = "iddc_crew"

/obj/item/card/id/cel/syndicate/assistant/donkco
	icon_state = "iddc_assistant"

//MARK: CyberSun

/obj/item/card/id/cel/syndicate/captain/cybersun
	icon_state = "idcs_captain"

/obj/item/card/id/cel/syndicate/command_rd/cybersun
	icon_state = "idcs_command"

/obj/item/card/id/cel/syndicate/crew/cybersun
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/assistant/cybersun
	icon_state = "idcs_assistant"

//MARK: Gorlex

/obj/item/card/id/cel/syndicate/captain/gorlex
	icon_state = "idgorlex_captain"

/obj/item/card/id/cel/syndicate/command_rd/gorlex
	icon_state = "idgorlex_command"

/obj/item/card/id/cel/syndicate/crew/gorlex
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/assistant/gorlex
	icon_state = "idgorlex_assistant"

//MARK: SUNS

/obj/item/card/id/cel/syndicate/captain/suns
	icon_state = "idsuns_captain"

/obj/item/card/id/cel/syndicate/command_rd/suns
	icon_state = "idsuns_command"

/obj/item/card/id/cel/syndicate/crew/suns
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/assistant/suns
	icon_state = "idsuns_assistant"

/obj/item/card/id/cel/syndicate/patient
	icon_state = "idsuns_patient"
	assignment = "Patient"
	access = list()
