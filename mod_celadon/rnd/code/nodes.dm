/datum/techweb_node/comptech
	id = "comptech"
	display_name = "Computer Consoles"
	description = "Computers and how they work."
	prereq_ids = list("datatheory")
	design_ids = list(
		"comconsole",
		"crewconsole",
		"idcard",
		"idcardconsole",
		"libraryconsole",
		"mining",
		"rdcamera",
		"seccamera",
		"design_disk_super",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)
	export_price = 5000

// Убран "survey-handheld-elite", что дублируется в ноде "Computerized Recordkeeping"
