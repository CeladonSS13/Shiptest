/obj/item/borg/upgrade/transform/meka
	name = "Test"
	desc = "If you see this, screenshot and send to coders"

/obj/item/borg/upgrade/transform/meka/medical
	name = "Medical Meka Body"
	desc = "Makes your medical cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/medical)
	new_module = /obj/item/robot_module/meka/medical


/obj/item/borg/upgrade/transform/meka/engineering
	name = "Engineer Meka Body"
	desc = "Makes your engineer cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/engineering)
	new_module = /obj/item/robot_module/meka/engineering

/obj/item/borg/upgrade/transform/meka/security
	name = "Security Meka Body"
	desc = "Makes your security cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/security)
	new_module = /obj/item/robot_module/meka/security

/obj/item/borg/upgrade/transform/meka/janitor
	name = "Janitor Meka Body"
	desc = "Makes your janitor cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/janitor)
	new_module = /obj/item/robot_module/meka/janitor

/obj/item/borg/upgrade/transform/meka/peacekeeper
	name = "Peacemaker Meka Body"
	desc = "Makes your peacemaker cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/peacekeeper)
	new_module = /obj/item/robot_module/meka/peace

/obj/item/borg/upgrade/transform/meka/miner
	name = "Miner Meka Body"
	desc = "Makes your miner cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/miner)
	new_module = /obj/item/robot_module/meka/miner

/obj/item/borg/upgrade/transform/meka/butler
	name = "Service Meka Body"
	desc = "Makes your miner cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/butler)
	new_module = /obj/item/robot_module/meka/butler

/obj/item/borg/upgrade/transform/meka/syndicate_medical
	name = "Syndicate Medical Meka Body"
	desc = "Makes your syndicate medical cyborg look like Meka"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/syndicate_medical)
	new_module = /obj/item/robot_module/meka/syndicate_medical

/datum/techweb_node/cyborg_upg_meka
	id = "cyborg_upg_meka"
	display_name = "Cyborg Upgrades: Meka Body"
	description = "New, humanised body for your cyborgs."
	prereq_ids = list("cyborg_upg_util")
	design_ids = list("borg_upgrade_meka_medical", "borg_upgrade_meka_engineering", "borg_upgrade_meka_security", "borg_upgrade_meka_janitor", "borg_upgrade_meka_peacekeeper", "borg_upgrade_meka_miner", "borg_upgrade_meka_butler", "borg_upgrade_meka_syndicate_medical")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
	export_price = 1000

/datum/design/borg_upgrade_meka_medical
	name = "Cyborg Upgrade (Medical Meka Body)"
	id = "borg_upgrade_meka_medical"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/medical
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_engineering
	name = "Cyborg Upgrade (Engineer Meka Body)"
	id = "borg_upgrade_meka_engineering"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/engineering
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_security
	name = "Cyborg Upgrade (Security Meka Body)"
	id = "borg_upgrade_meka_security"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/security
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_janitor
	name = "Cyborg Upgrade (Janitor Meka Body)"
	id = "borg_upgrade_meka_janitor"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/janitor
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_peacekeeper
	name = "Cyborg Upgrade (Peacemaker Meka Body)"
	id = "borg_upgrade_meka_peacekeeper"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/peacekeeper
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_miner
	name = "Cyborg Upgrade (Miner Meka Body)"
	id = "borg_upgrade_meka_miner"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/miner
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_butler
	name = "Cyborg Upgrade (Service Meka Body)"
	id = "borg_upgrade_meka_butler"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/butler
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_meka_syndicate_medical
	name = "Cyborg Upgrade (Syndicate Medical Meka Body)"
	id = "borg_upgrade_meka_syndicate_medical"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/meka/syndicate_medical
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")
