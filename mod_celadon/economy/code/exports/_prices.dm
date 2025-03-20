/datum/export/New(...)
	cost = rand(cost * PRICES_EXPORT_GENERAL_MIN,
				cost * PRICES_EXPORT_GENERAL_MAX)
	return ..()
