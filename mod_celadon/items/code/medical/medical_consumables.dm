/datum/chemical_reaction/medsuture
	required_reagents = list(/datum/reagent/cellulose = 20, /datum/reagent/toxin/formaldehyde = 20, /datum/reagent/medicine/polypyr = 10)
	mob_react = FALSE

/datum/chemical_reaction/medsuture/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i in 1 to created_volume)
		new /obj/item/stack/medical/suture/advanced(location)

/datum/chemical_reaction/medsuture/ash
	required_reagents = list(/datum/reagent/ash_fibers = 20, /datum/reagent/toxin/formaldehyde = 20, /datum/reagent/medicine/polypyr = 10)
