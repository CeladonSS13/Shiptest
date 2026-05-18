/obj/item/circuitboard/machine/chem_dispenser/mutagensaltpeter
	name = "Botanical Dispenser (Machine Board)"
	icon_state = "service"
	build_path = /obj/machinery/chem_dispenser/mutagensaltpeter
	req_components = list(
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stock_parts/manipulator = 2,
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stack/ore/bluespace_crystal/refined = 1,
		/obj/item/stock_parts/cell = 1,
	)

/datum/design/board/chem_dispenser/botanical
	name = "Machine Design (Botanical Portable Chem Dispenser Board)"
	desc = "The circuit board for a portable botanical chem dispenser."
	id = "botan_dispenser"
	build_path = /obj/item/circuitboard/machine/chem_dispenser/mutagensaltpeter
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
	category = list ("Service Machinery")

/datum/techweb_node/botany
	design_ids = list("diskplantgene", "portaseeder", "flora_gun", "hydro_tray", "biogenerator", "plantgenes", "seed_extractor", "botan_dispenser")

/obj/machinery/chem_dispenser/mutagensaltpeter
	flags_1 = null

	circuit = /obj/item/circuitboard/machine/chem_dispenser/mutagensaltpeter

	dispensable_reagents = list(
		/datum/reagent/toxin/mutagen,
		/datum/reagent/saltpetre,
		/datum/reagent/ammonia,
		/datum/reagent/ash,
		/datum/reagent/diethylamine,
		/datum/reagent/toxin/pestkiller,
		/datum/reagent/toxin/plantbgone/weedkiller,
		/datum/reagent/plantnutriment/eznutriment,
		/datum/reagent/plantnutriment/left4zednutriment,
		/datum/reagent/plantnutriment/robustharvestnutriment
	)

/obj/machinery/chem_dispenser/mutagensaltpeter/Initialize()
	. = ..()
	component_parts = list()
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/matter_bin(null)
	component_parts += new /obj/item/stock_parts/capacitor(null)
	component_parts += new /obj/item/stock_parts/manipulator(null)
	component_parts += new /obj/item/stack/sheet/glass(null)
	component_parts += new /obj/item/stack/ore/bluespace_crystal/refined(null)
	component_parts += new /obj/item/stock_parts/cell/upgraded(null)
	RefreshParts()
