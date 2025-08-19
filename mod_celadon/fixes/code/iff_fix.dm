//By Chituka09
//Лишь анробасты будут это ревертить

/datum/overmap/ship/controlled/alter_token_appearance()
	if(!source_template)
		return ..()
	desc = {"[span_boldnotice("IFF is reporting the following:")]
	[span_bold("Affiliation: ")][source_template.faction.name]
	[span_bold("Velocity: ")][round(get_speed(), 0.1)] Gm/s"}
	return ..()
