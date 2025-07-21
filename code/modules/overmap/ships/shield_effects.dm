/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Shield Effects
 *
 * Визуальные эффекты для системы щитов корабля.
 */

/**
 * Визуальный эффект щитов при поглощении урона
 */
/obj/effect/shield_impact
	name = "shield impact"
	icon = 'icons/effects/effects.dmi'
	icon_state = "emp"
	layer = ABOVE_MOB_LAYER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	color = "#00FFFF" // Голубой цвет для щитов

/obj/effect/shield_impact/Initialize(mapload)
	. = ..()
	playsound(src, 'sound/weapons/emitter2.ogg', 25, TRUE)
	QDEL_IN(src, 10)

/**
 * Эффект мерцания щитов
 */
/obj/effect/shield_flicker
	name = "shield flicker"
	icon = 'icons/effects/effects.dmi'
	icon_state = "emp"
	layer = ABOVE_MOB_LAYER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	color = "#4169E1" // Синий цвет для мерцания щитов

/obj/effect/shield_flicker/Initialize(mapload)
	. = ..()
	playsound(src, 'sound/effects/empulse.ogg', 15, TRUE)
	QDEL_IN(src, 8)
