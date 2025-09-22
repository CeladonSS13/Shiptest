// Турфы воды, основанные на эффектах
// Эти турфы только визуальные, вся логика воды работает через /obj/effect/water_overlay

/turf/open/floor/water_base
	name = "water floor"
	desc = "A floor that looks like water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "water"
	baseturfs = /turf/open/floor/plating
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

// Турф с полной водой (500 литров)
/turf/open/floor/water_base/full
	name = "deep water"
	desc = "Deep water that completely submerges everything."
	var/obj/effect/water_overlay/water_effect

/turf/open/floor/water_base/full/Initialize(mapload, inherited_virtual_z)
	. = ..(mapload, inherited_virtual_z)
	// Создаем водный эффект с полным объемом (5000L)
	water_effect = new /obj/effect/water_overlay/full(src)
	return .

/turf/open/floor/water_base/full/Destroy()
	if(water_effect)
		QDEL_NULL(water_effect)
	return ..()

// Турф с мелкой водой (100 литров)
/turf/open/floor/water_base/shallow
	name = "shallow water"
	desc = "Shallow water that reaches your ankles."
	var/obj/effect/water_overlay/water_effect

/turf/open/floor/water_base/shallow/Initialize(mapload, inherited_virtual_z)
	. = ..(mapload, inherited_virtual_z)
	// Создаем водный эффект с малым объемом
	water_effect = new /obj/effect/water_overlay/ankle_deep(src)
	return .

/turf/open/floor/water_base/shallow/Destroy()
	if(water_effect)
		QDEL_NULL(water_effect)
	return ..()

// Турф со средней водой (200 литров)
/turf/open/floor/water_base/waist
	name = "water"
	desc = "Water that reaches your waist."
	var/obj/effect/water_overlay/water_effect

/turf/open/floor/water_base/waist/Initialize(mapload, inherited_virtual_z)
	. = ..(mapload, inherited_virtual_z)
	// Создаем водный эффект со средним объемом
	water_effect = new /obj/effect/water_overlay/waist_deep(src)
	return .

/turf/open/floor/water_base/waist/Destroy()
	if(water_effect)
		QDEL_NULL(water_effect)
	return ..()

// Турф с глубокой водой (300 литров)
/turf/open/floor/water_base/chest
	name = "deep water"
	desc = "Water that reaches your chest."
	var/obj/effect/water_overlay/water_effect

/turf/open/floor/water_base/chest/Initialize(mapload, inherited_virtual_z)
	. = ..(mapload, inherited_virtual_z)
	// Создаем водный эффект с большим объемом
	water_effect = new /obj/effect/water_overlay/chest_deep(src)
	return .

/turf/open/floor/water_base/chest/Destroy()
	if(water_effect)
		QDEL_NULL(water_effect)
	return ..()