/obj/machinery/limbgrower/Initialize(mapload)
	categories += SPECIES_TAJARAN
	return ..()

/datum/design/tajaran_tail
	name = "Tajara Tail"
	id = "tajaralong"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tail/tajaran/fake
	category = list("initial",SPECIES_TAJARAN)

/datum/design/tajaran_tongue
	name = "Forked Tongue"
	id = "tajaratongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/tajaran
	category = list("initial",SPECIES_TAJARAN)
