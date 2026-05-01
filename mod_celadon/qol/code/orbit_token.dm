// QOL_ORBIT_MENU - Токены для прыжков по картам
/obj/effect/landmark/centcom_orbit_token
	name = "CentComm Orbit Token"
	desc = "Маркер для добавления CentComm в список Orbit меню."
	icon_state = "x4"

/obj/effect/landmark/centcom_orbit_token/Initialize(mapload)
	. = ..()
	SSpoints_of_interest.make_point_of_interest(src)
	GLOB.centcom_orbit_tokens += src

/obj/effect/landmark/centcom_orbit_token/Destroy()
	GLOB.centcom_orbit_tokens -= src
	SSpoints_of_interest.remove_point_of_interest(src)
	return ..()

GLOBAL_LIST_EMPTY(centcom_orbit_tokens)

/obj/effect/landmark/outpost_orbit_token
	name = "Outpost Orbit Token"
	desc = "Маркер для добавления Outpost в список Orbit меню."
	icon_state = "x4"

/obj/effect/landmark/outpost_orbit_token/Initialize(mapload)
	. = ..()
	SSpoints_of_interest.make_point_of_interest(src)
	GLOB.outpost_orbit_tokens += src

/obj/effect/landmark/outpost_orbit_token/Destroy()
	GLOB.outpost_orbit_tokens -= src
	SSpoints_of_interest.remove_point_of_interest(src)
	return ..()

GLOBAL_LIST_EMPTY(outpost_orbit_tokens)
