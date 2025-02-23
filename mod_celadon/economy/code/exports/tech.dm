/datum/techweb_node/t1_shuttle_tech
	// id = "t1_ion"
	// display_name = "First generation ion Propulsion"
	// description = "Pioneer space travel with First Gen ion engines—where it all began."
	// prereq_ids = list("basic_shuttle")
	// design_ids = list("engine_ion_t1")
	// research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 1000

/datum/techweb_node/t2_shuttle_tech
	// id = "t2_ion"
	// display_name = "Second generation ion Propulsion"
	// description = "Upgrade to Second Gen ion engines for advanced cosmic navigation."
	// prereq_ids = list("t1_ion")
	// design_ids = list("engine_ion_t2")
	// research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)
	export_price = 2500

/datum/techweb_node/t3_shuttle_tech
	// id = "t3_ion"
	// display_name = "Third generation ion Propulsion"
	// description = "Unleash ultimate exploration with Third Gen ion propulsion."
	// prereq_ids = list("t2_ion")
	// design_ids = list("engine_ion_t3")
	// research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 5000
