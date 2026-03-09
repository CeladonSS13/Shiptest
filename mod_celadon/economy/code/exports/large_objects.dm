// Логика расчета прожажи:
// Расчет цены: 	Цена карго / 2.5
// Инженерия РнД: 	Цена карго / 5
// Уникальное: 		Цена уникально для каждого

// MARK: Мелочевка

/datum/export/large/reagent_dispenser
	cost = 100 // +0-400 depending on amount of reagents left

/datum/export/large/reagent_dispenser/water
	unit_name = "watertank"
	export_types = list(/obj/structure/reagent_dispensers/watertank)
	cost = 200

/datum/export/large/reagent_dispenser/fuel
	unit_name = "fueltank"
	export_types = list(/obj/structure/reagent_dispensers/fueltank)
	cost = 320

/datum/export/large/reagent_dispenser/beer
	unit_name = "beer keg"
	export_types = list(/obj/structure/reagent_dispensers/beerkeg)
	cost = 500	// Эта цена просто мем

// MARK: Инженерия РнД

/datum/export/large/emitter
	unit_name = "emitter"
	export_types = list(/obj/machinery/power/emitter)
	cost = 300

/datum/export/large/field_generator
	unit_name = "field generator"
	export_types = list(/obj/machinery/field/generator)
	cost = 200

/datum/export/large/collector
	unit_name = "radiation collector"
	export_types = list(/obj/machinery/power/rad_collector)
	cost = 200

/datum/export/large/tesla_coil
	unit_name = "tesla coil"
	export_types = list(/obj/machinery/power/tesla_coil)
	cost = 125

/datum/export/large/grounding_rod
	unit_name = "grounding rod"
	export_types = list(/obj/machinery/power/grounding_rod)
	elasticity_coeff = 0.1
	cost = 350

// MARK: Уникальное

/datum/export/large/rare
	elasticity_coeff = 0

/datum/export/large/rare/supermatter
	cost = 4000
	unit_name = "supermatter shard"
	export_types = list(/obj/machinery/power/supermatter_crystal/shard)

/datum/export/large/rare/tesla_gen
	cost = 2000
	unit_name = "energy ball generator"
	export_types = list(/obj/machinery/the_singularitygen/tesla)

/datum/export/large/rare/singulo_gen
	cost = 2000
	unit_name = "gravitational singularity generator"
	export_types = list(/obj/machinery/the_singularitygen)
	include_subtypes = FALSE

/datum/export/large/rare/pa
	unit_name = "particle accelerator part"
	export_types = list(/obj/structure/particle_accelerator)
	cost = 350 // 350 * 6 = 2100

/datum/export/large/rare/pa/controls
	unit_name = "particle accelerator control console"
	export_types = list(/obj/machinery/particle_accelerator/control_box)
	cost = 500
