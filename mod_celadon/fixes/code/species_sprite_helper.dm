/obj/item
	/// Per-species sprite offsets. Format: list("species_id" = list("NORTH" = list("x" = 0, "y" = 0), "SOUTH" = ..., etc.))
	var/list/species_offsets
	/* EXAMPLE:
	species_offsets = list(
		SPECIES_KEPORI = list(
			"[NORTH]" = list("x" = 10, "y" = -2),
			"[EAST]" = list("x" = 12, "y" = -1),
			"[SOUTH]" = list("x" = 10, "y" = -2),
			"[WEST]" = list("x" = -10, "y" = -1)
		)
	)
	*/

/**
 * Helper proc to get species-specific sprite offsets for worn clothing
 * Checks item-specific offsets first, then falls back to species layer offsets
 *
 * Arguments:
 * * layer - The layer the item is being worn on
 * * mob_species - The species datum of the wearer
 *
 * Returns: List of directional offsets, or null if none apply
 */
/obj/item/proc/get_species_worn_offsets(layer, datum/species/mob_species)
	// Item-specific offsets take priority
	if(species_offsets && (mob_species.id in species_offsets))
		return species_offsets[mob_species.id]

	// Fall back to species layer offsets
	if("[layer]" in mob_species.offset_clothing)
		return mob_species.offset_clothing["[layer]"]

	return null
