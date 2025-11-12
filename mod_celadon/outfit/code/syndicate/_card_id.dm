/obj/item/card/id/cel/syndicate
	desc = "An access card widely utilized by Coalition splinters in the frontier."
	icon_state = "syndie"
	access = list(ACCESS_SYNDICATE)
	uses_overlays = FALSE

//MARK: SYNDICATE

/obj/item/card/id/cel/syndicate/admiral
	assignment = "Admiral"
	icon_state = "idsyndicate_admiral"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS, ACCESS_ARMORY, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/captain
	assignment = "Captain"
	icon_state = "idsyndicate_captain"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS, ACCESS_ARMORY, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_rd
	assignment = "Research Director"
	icon_state = "idsyndicate_command"
	access = list(ACCESS_SYNDICATE, ACCESS_ROBOTICS, ACCESS_RD, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_ce
	assignment = "Chief Engineer"
	icon_state = "idsyndicate_command"
	access = list(ACCESS_SYNDICATE, ACCESS_ENGINE, ACCESS_CE,  ACCESS_CONSTRUCTION, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_cmo
	assignment = "Medical Director"
	icon_state = "idsyndicate_command"
	access = list(ACCESS_SYNDICATE, ACCESS_MEDICAL, ACCESS_CMO, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_hop
	assignment = "Bridge Officer"
	icon_state = "idsyndicate_command"
	access = list(ACCESS_SYNDICATE, ACCESS_HOP, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_hos
	assignment = "Head Of Security"
	icon_state = "idsyndicate_command"
	access = list(ACCESS_SYNDICATE, ACCESS_SECURITY, ACCESS_HOS, ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/command_qm
	assignment = "Quartermaster"
	icon_state = "idsyndicate_command"
	access = list(ACCESS_SYNDICATE, ACCESS_CARGO, ACCESS_QM,ACCESS_SYNDICATE_LEADER)

/obj/item/card/id/cel/syndicate/crew
	assignment = "Operative"
	icon_state = "idsyndicate_crew"

/obj/item/card/id/cel/syndicate/crew/security
	assignment = "Operative"
	icon_state = "idsyndicate_crew"
	access = list(ACCESS_SYNDICATE, ACCESS_SECURITY)

/obj/item/card/id/cel/syndicate/crew/bartender
	assignment = "Bartender"
	access = list(ACCESS_SYNDICATE, ACCESS_BAR)

/obj/item/card/id/cel/syndicate/crew/botanist
	assignment = "Botanist"
	access = list(ACCESS_SYNDICATE, ACCESS_HYDROPONICS)

/obj/item/card/id/cel/syndicate/crew/chemist
	assignment = "Chemist"
	access = list(ACCESS_SYNDICATE, ACCESS_CHEMISTRY)

/obj/item/card/id/cel/syndicate/crew/cargo_tech
	assignment = "Cargo Tech"
	access = list(ACCESS_SYNDICATE, ACCESS_CARGO)

/obj/item/card/id/cel/syndicate/crew/miner
	assignment = "Miner"
	access = list(ACCESS_SYNDICATE, ACCESS_MINING)

/obj/item/card/id/cel/syndicate/crew/doctor
	assignment = "Medical Doctor"
	access = list(ACCESS_SYNDICATE, ACCESS_MEDICAL)

/obj/item/card/id/cel/syndicate/crew/doctor/paramedic
	assignment = "Paramedic"

/obj/item/card/id/cel/syndicate/crew/doctor/psychologist
	assignment = "Psychologist"

/obj/item/card/id/cel/syndicate/crew/scientist
	assignment = "Scientist"
	access = list(ACCESS_SYNDICATE, ACCESS_RESEARCH, ACCESS_CONSTRUCTION)

/obj/item/card/id/cel/syndicate/crew/engineer
	assignment = "Engineer"
	access = list(ACCESS_SYNDICATE, ACCESS_ENGINE, ACCESS_CONSTRUCTION)

/obj/item/card/id/cel/syndicate/crew/atmos
	assignment = "Atmospheric Technician"
	access = list(ACCESS_SYNDICATE, ACCESS_ENGINE, ACCESS_ATMOSPHERICS)

/obj/item/card/id/cel/syndicate/crew/medic
	assignment = "Medic"
	access = list(ACCESS_SYNDICATE, ACCESS_MEDICAL)

/obj/item/card/id/cel/syndicate/crew/lieutenant
	assignment = "Lieutenant"
	access = list(ACCESS_SYNDICATE, ACCESS_ARMORY)

/obj/item/card/id/cel/syndicate/assistant
	assignment = "Assistant"
	icon_state = "idsyndicate_assistant"

//MARK: GEC

/obj/item/card/id/cel/syndicate/captain/gec
	icon_state = "idgec_captain"

/obj/item/card/id/cel/syndicate/command_rd/gec
	icon_state = "idgec_command"

/obj/item/card/id/cel/syndicate/command_ce/gec
	assignment = "Chief Engineer (GEC)"
	icon_state = "idgec_captain"

/obj/item/card/id/cel/syndicate/crew/gec
	icon_state = "idgec_crew"

/obj/item/card/id/cel/syndicate/crew/engineer/gec
	assignment = "Ship Engineer (GEC)"
	icon_state = "idgec_crew"

/obj/item/card/id/cel/syndicate/crew/miner/gec
	assignment = "Shaft Miner (GEC)"
	icon_state = "idgec_crew"

/obj/item/card/id/cel/syndicate/crew/chemist/gec
	assignment = "Chemist (GEC)"
	icon_state = "idgec_crew"

/obj/item/card/id/cel/syndicate/crew/atmos/gec
	assignment = "Atmospheric Technician (GEC)"
	icon_state = "idgec_crew"

/obj/item/card/id/cel/syndicate/assistant/gec
	icon_state = "idgec_assistant"

//MARK: DonkCo

/obj/item/card/id/cel/syndicate/captain/donkco
	icon_state = "iddc_captain"

/obj/item/card/id/cel/syndicate/command_rd/donkco
	icon_state = "iddc_command"

/obj/item/card/id/cel/syndicate/command_qm/donkco
	assignment = "Manager (Donk)"
	icon_state = "iddc_captain"

/obj/item/card/id/cel/syndicate/crew/donkco
	icon_state = "iddc_crew"

/obj/item/card/id/cel/syndicate/crew/cargo_tech/donkco
	assignment = "Customer Associate (Donk)"
	icon_state = "iddc_crew"

/obj/item/card/id/cel/syndicate/assistant/donkco
	icon_state = "iddc_assistant"

//MARK: CyberSun

/obj/item/card/id/cel/syndicate/captain/cybersun
	icon_state = "idcs_captain"

/obj/item/card/id/cel/syndicate/command_rd/cybersun
	assignment = "Research and Development Team Leader (Cybersun)"
	icon_state = "idcs_command"

/obj/item/card/id/cel/syndicate/command_cmo/cybersun
	assignment = "Medical Director (Cybersun)"
	icon_state = "idcs_command"

/obj/item/card/id/cel/syndicate/command_hop/cybersun
	assignment = "Intelligence Officer (Cybersun)"
	icon_state = "idcs_command"

/obj/item/card/id/cel/syndicate/crew/cybersun
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/crew/engineer/cybersun
	assignment = "Engineer (Cybersun)"
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/crew/miner/cybersun
	assignment = "Field Agent (Cybersun)"
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/crew/doctor/cybersun
	assignment = "Medical Doctor (Cybersun)"
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/crew/scientist/cybersun
	assignment = "Scientist (Cybersun)"
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/crew/doctor/paramedic/cybersun
	assignment = "Paramedic (Cybersun)"
	icon_state = "idcs_crew"

/obj/item/card/id/cel/syndicate/assistant/cybersun
	icon_state = "idcs_assistant"

//MARK: Gorlex

/obj/item/card/id/cel/syndicate/captain/gorlex
	icon_state = "idgorlex_captain"

/obj/item/card/id/cel/syndicate/command_rd/gorlex
	icon_state = "idgorlex_command"

/obj/item/card/id/cel/syndicate/command_ce/gorlex
	assignment = "Chief Engineer (Gorlex)"
	icon_state = "idgorlex_command"

/obj/item/card/id/cel/syndicate/command_hos/gorlex
	assignment = "Sergeant (Hardliner)"
	icon_state = "idgorlex_command"

/obj/item/card/id/cel/syndicate/crew/gorlex
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/crew/engineer/gorlex
	assignment = "Mechanic (Hardliner)"
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/crew/miner/gorlex
	assignment = "Wrecker (Hardliner)"
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/crew/security/gorlex
	assignment = "Trooper (Hardliner)"
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/crew/security/gorlex/pilot
	assignment = "Pilot (Hardliner)"

/obj/item/card/id/cel/syndicate/crew/doctor/gorlex
	assignment = "Medical Doctor (Hardliner)"
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/crew/doctor/paramedic/gorlex
	assignment = "Paramedic (Gorlex)"
	icon_state = "idgorlex_crew"

/obj/item/card/id/cel/syndicate/assistant/gorlex
	icon_state = "idgorlex_assistant"

//MARK: SUNS

/obj/item/card/id/cel/syndicate/captain/suns
	icon_state = "idsuns_captain"

/obj/item/card/id/cel/syndicate/command_rd/suns
	icon_state = "idsuns_command"

/obj/item/card/id/cel/syndicate/command_cmo/suns
	assignment = "Medical Director (SUNS)"
	icon_state = "idsuns_command"

/obj/item/card/id/cel/syndicate/command_hop/suns
	assignment = "Academic Staff (SUNS)"
	icon_state = "idsuns_command"

/obj/item/card/id/cel/syndicate/command_hos/suns
	assignment = "Senior Peacekeeper (SUNS)"
	icon_state = "idsuns_command"

/obj/item/card/id/cel/syndicate/command_hos/suns/alt
	assignment = "Senior Peacekeeper Alt (SUNS)"

/obj/item/card/id/cel/syndicate/command_hos/suns/twink
	assignment = "Redshield Officer (Twinkleshine, SUNS)"

/obj/item/card/id/cel/syndicate/crew/suns
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/security/suns
	assignment = "Peacekeeper (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/security/suns/alternate
	assignment = "Peacekeeper - Casual(SUNS)"

/obj/item/card/id/cel/syndicate/crew/miner/suns
	assignment = "Miner (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/bartender/suns
	assignment = "Student Mixologist (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/botanist/suns
	assignment = "Botanist-Chemist (SUNS)"
	icon_state = "idsuns_crew"
	access = list(ACCESS_SYNDICATE, ACCESS_HYDROPONICS, ACCESS_CHEMISTRY)

/obj/item/card/id/cel/syndicate/crew/doctor/suns
	assignment = "Medical Doctor (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/doctor/psychologist/suns
	assignment = "Psychologist (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/engineer/suns
	assignment = "Ship Engineer (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/crew/scientist/suns
	assignment = "Scientist (SUNS)"
	icon_state = "idsuns_crew"

/obj/item/card/id/cel/syndicate/assistant/suns
	assignment = "Freshman (SUNS)"
	icon_state = "idsuns_assistant"

/obj/item/card/id/cel/syndicate/assistant/suns/janitor
	assignment = "Junior (SUNS)"

/obj/item/card/id/cel/syndicate/assistant/suns/graduate
	assignment = "Graduate (SUNS)"

/obj/item/card/id/cel/syndicate/patient_suns
	icon_state = "idsuns_patient"
	assignment = "Patient"
	access = list()
