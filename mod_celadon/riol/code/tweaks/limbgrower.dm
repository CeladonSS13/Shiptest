/obj/machinery/limbgrower/Initialize(mapload)
	categories += SPECIES_RIOL
	return ..()

/datum/design/riol_tail
	name = "Riol Tail"
	id = "riollong"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tail/riol/fake
	category = list("initial", SPECIES_RIOL)

/datum/design/riol_tongue
	name = "Forked Tongue"
	id = "rioltongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/riol
	category = list("initial", SPECIES_RIOL)
