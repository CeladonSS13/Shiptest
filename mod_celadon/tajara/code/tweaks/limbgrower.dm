/obj/machinery/limbgrower/Initialize(mapload)
	categories += SPECIES_TAJARA
	return ..()

/datum/design/tajara_tail
	name = "Tajara Tail"
	id = "tajaralong"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 20)
	build_path = /obj/item/organ/tail/tajara/fake
	category = list("initial",SPECIES_TAJARA)

/datum/design/tajara_tongue
	name = "Forked Tongue"
	id = "tajaratongue"
	build_type = LIMBGROWER
	reagents_list = list(/datum/reagent/medicine/synthflesh = 10)
	build_path = /obj/item/organ/tongue/tajara
	category = list("initial",SPECIES_TAJARA)
