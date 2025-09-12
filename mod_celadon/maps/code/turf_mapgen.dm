// MARK: Рандомные Чазмы

/turf/open/floor/fakepit/random
	var/static/list/random = list(/turf/open/chasm, /turf/open/floor/fakepit/unknown)

/turf/open/floor/fakepit/unknown
	name = "chasm"
	desc = "Watch your step."

/turf/open/floor/fakepit/unknown/examine(mob/user)
	. = ..()
	. += span_warning("You WILL fucking die if you step on this!!!")

/turf/open/floor/fakepit/random/Initialize(mapload)
	. = ..()
	var/static/list/random_turfs = list(
		/turf/open/chasm,
		/turf/open/floor/fakepit/unknown
	)
	var/turf_type = pick(random_turfs)
	ChangeTurf(turf_type, flags = CHANGETURF_INHERIT_AIR)
