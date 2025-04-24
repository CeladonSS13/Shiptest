/obj/item/borg/upgrade/transform/drake
	name = "Test"
	desc = "If you see this, screenshot and send to codders"
	icon = 'mod_celadon/_storge_icons/icons/drake.dmi'
	icon_state = "drake_upg"

/obj/item/borg/upgrade/transform/drake/med
	name = "Medical Drake Hologramm"
	desc = "Makes your medical cyborg look like drake"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/medical)
	new_module = /obj/item/robot_module/drake/medical


/obj/item/borg/upgrade/transform/drake/engi
	name = "Engineer Drake Hologramm"
	desc = "Makes your engineer cyborg look like drake"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/engineering)
	new_module = /obj/item/robot_module/drake/engineering

/obj/item/borg/upgrade/transform/drake/sec
	name = "Security Drake Hologramm"
	desc = "Makes your security cyborg look like drake"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/security)
	new_module = /obj/item/robot_module/drake/security

/obj/item/borg/upgrade/transform/drake/jani
	name = "Janitor Drake Hologramm"
	desc = "Makes your janitor cyborg look like drake"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/janitor)
	new_module = /obj/item/robot_module/drake/janitor

/obj/item/borg/upgrade/transform/drake/peace
	name = "Peacemaker Drake Hologramm"
	desc = "Makes your peacemaker cyborg look like drake"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/peacekeeper)
	new_module = /obj/item/robot_module/drake/peacekeeper

/obj/item/borg/upgrade/transform/drake/mine
	name = "Miner Drake Hologramm"
	desc = "Makes your miner cyborg look like drake"
	require_module = TRUE
	module_type = list(/obj/item/robot_module/miner)
	new_module = /obj/item/robot_module/drake/miner

/datum/techweb_node/cyborg_upg_drake_hologramm
	id = "cyborg_upg_drake_hologramm"
	display_name = "Cyborg Upgrades: Hologramms"
	description = "Hologramms for your cyborgs."
	prereq_ids = list("cyborg_upg_util")
	design_ids = list("borg_upgrade_hologramm_drake_med", "borg_upgrade_hologramm_drake_engi", "borg_upgrade_hologramm_drake_sec", "borg_upgrade_hologramm_drake_jani", "borg_upgrade_hologramm_drake_peace", "borg_upgrade_hologramm_drake_mine")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 2500

/datum/design/borg_upgrade_hologramm_drake_med
	name = "Cyborg Upgrade (Medical Drake Hologramm)"
	id = "borg_upgrade_hologramm_drake_med"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/drake/med
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_hologramm_drake_engi
	name = "Cyborg Upgrade (Engineer Drake Hologramm)"
	id = "borg_upgrade_hologramm_drake_engi"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/drake/engi
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_hologramm_drake_sec
	name = "Cyborg Upgrade (Security Drake Hologramm)"
	id = "borg_upgrade_hologramm_drake_sec"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/drake/sec
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_hologramm_drake_jani
	name = "Cyborg Upgrade (Janitor Drake Hologramm)"
	id = "borg_upgrade_hologramm_drake_jani"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/drake/jani
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_hologramm_drake_peace
	name = "Cyborg Upgrade (Peacemaker Drake Hologramm)"
	id = "borg_upgrade_hologramm_drake_peace"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/drake/peace
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")

/datum/design/borg_upgrade_hologramm_drake_mine
	name = "Cyborg Upgrade (Miner Drake Hologramm)"
	id = "borg_upgrade_hologramm_drake_mine"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/transform/drake/mine
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1000, /datum/material/gold = 500, /datum/material/bluespace = 200)
	construction_time = 80
	category = list("Cyborg Upgrade Modules")


/obj/item/borg/upgrade/rped
	module_type = list(/obj/item/robot_module/engineering, /obj/item/robot_module/saboteur, /obj/item/robot_module/drake/engineering, /obj/item/robot_module/meka/engineering,)

/obj/item/borg/upgrade/pinpointer
	module_type = list(/obj/item/robot_module/medical, /obj/item/robot_module/syndicate_medical, /obj/item/robot_module/drake/medical, /obj/item/robot_module/meka/medical)

/obj/item/borg/upgrade/circuit_app
	module_type = list(/obj/item/robot_module/engineering, /obj/item/robot_module/saboteur, /obj/item/robot_module/drake/engineering, /obj/item/robot_module/meka/engineering)

/obj/item/borg/upgrade/beaker_app
	module_type = list(/obj/item/robot_module/medical, /obj/item/robot_module/drake/medical, /obj/item/robot_module/meka/medical)

/obj/item/borg/upgrade/disablercooler
	module_type = list(/obj/item/robot_module/security, /obj/item/robot_module/drake/security, /obj/item/robot_module/meka/security)

/obj/item/borg/upgrade/ddrill
	module_type = list(/obj/item/robot_module/miner, /obj/item/robot_module/drake/miner, /obj/item/robot_module/meka/miner)

/obj/item/borg/upgrade/soh
	module_type = list(/obj/item/robot_module/miner, /obj/item/robot_module/drake/miner, /obj/item/robot_module/meka/miner)

/obj/item/borg/upgrade/tboh
	module_type = list(/obj/item/robot_module/janitor, /obj/item/robot_module/drake/janitor, /obj/item/robot_module/meka/janitor)

/obj/item/borg/upgrade/amop
	module_type = list(/obj/item/robot_module/janitor, /obj/item/robot_module/drake/janitor, /obj/item/robot_module/meka/janitor)

/obj/item/borg/upgrade/lavaproof
	module_type = list(/obj/item/robot_module/miner, /obj/item/robot_module/drake/miner, /obj/item/robot_module/meka/miner)

/obj/item/borg/upgrade/hypospray
	module_type = list(/obj/item/robot_module/medical, /obj/item/robot_module/drake/medical, /obj/item/robot_module/meka/medical)

/obj/item/borg/upgrade/defib
	module_type = list(/obj/item/robot_module/medical, /obj/item/robot_module/drake/medical, /obj/item/robot_module/meka/medical)

/obj/item/borg/upgrade/processor
	module_type = list(/obj/item/robot_module/medical, /obj/item/robot_module/syndicate_medical, /obj/item/robot_module/drake/medical, /obj/item/robot_module/meka/medical)

/obj/item/borg/upgrade/expand
	module_type = list(/obj/item/robot_module/standard, /obj/item/robot_module/medical, /obj/item/robot_module/engineering, /obj/item/robot_module/security, /obj/item/robot_module/peacekeeper, /obj/item/robot_module/janitor, /obj/item/robot_module/clown, /obj/item/robot_module/butler, /obj/item/robot_module/miner, /obj/item/robot_module/drake, /obj/item/robot_module/meka)

/obj/item/borg/upgrade/modkit/cooldown
	module_type = list(/obj/item/robot_module/miner, /obj/item/robot_module/drake/miner, /obj/item/robot_module/meka/miner)


/obj/item/borg/upgrade/modkit/damage
	module_type = list(/obj/item/robot_module/miner, /obj/item/robot_module/drake/miner, /obj/item/robot_module/meka/miner)


/obj/item/borg/upgrade/modkit/range
	module_type = list(/obj/item/robot_module/miner, /obj/item/robot_module/drake/miner, /obj/item/robot_module/meka/miner)
