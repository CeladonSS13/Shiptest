/datum/design/board/shuttle/engine/electric/tech1
	name = "Machine Design (Ion Thruster Board) 1st generation"
	desc = "The circuit board for an 1st generation ion thruster."
	id = "engine_ion_t1"
	materials = list(/datum/material/glass = 1000, /datum/material/silver = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/circuitboard/machine/shuttle/engine/electric/tech1
	category = list ("Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/electric/tech2
	name = "Machine Design (Ion Thruster Board) 2nd generation"
	desc = "The circuit board for an 2nd generation ion thruster."
	id = "engine_ion_t2"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000, /datum/material/bluespace = 1000, /datum/material/silver = 2000)
	build_path = /obj/item/circuitboard/machine/shuttle/engine/electric/tech2
	category = list ("Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/board/shuttle/engine/electric/tech3
	name = "Machine Design (Ion Thruster Board) 3nd generation"
	desc = "The circuit board for an 3nd generation ion thruster."
	id = "engine_ion_t3"
	materials = list(/datum/material/glass = 1000, /datum/material/gold = 2000, /datum/material/bluespace = 1000, /datum/material/silver = 2000,/datum/material/diamond = 1500)
	build_path = /obj/item/circuitboard/machine/shuttle/engine/electric/tech3
	category = list ("Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/techweb_node/t1_shuttle_tech
	id = "t1_ion"
	display_name = "First generation ion Propulsion"
	description = "Pioneer space travel with First Gen ion engines—where it all began."
	prereq_ids = list("basic_shuttle")
	design_ids = list("engine_ion_t1")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/techweb_node/t2_shuttle_tech
	id = "t2_ion"
	display_name = "Second generation ion Propulsion"
	description = "Upgrade to Second Gen ion engines for advanced cosmic navigation."
	prereq_ids = list("t1_ion")
	design_ids = list("engine_ion_t2")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)
	export_price = 7500

/datum/techweb_node/t3_shuttle_tech
	id = "t3_ion"
	display_name = "Third generation ion Propulsion"
	description = "Unleash ultimate exploration with Third Gen ion propulsion."
	prereq_ids = list("t2_ion")
	design_ids = list("engine_ion_t3")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 10000
