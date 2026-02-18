/**
 * Helper proc to get species-specific sprite offsets for worn clothing
 * Uses species-level offset definitions
 *
 * Arguments:
 * * layer - The layer the item is being worn on (may be negative for rendering order)
 * * mob_species - The species datum of the wearer
 *
 * Returns: List of directional offsets, or null if none apply
 */

/obj/item/proc/get_species_worn_offsets(layer, datum/species/mob_species)
	// Use absolute value since some layers are passed as negative
	var/abs_layer = abs(layer)

	// Check species layer offsets
	if("[abs_layer]" in mob_species.offset_clothing)
		return mob_species.offset_clothing["[abs_layer]"]

	return null
