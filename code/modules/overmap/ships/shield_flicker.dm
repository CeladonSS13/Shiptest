/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Shield Flicker Effect
 *
 * Визуальный эффект мерцания щитов при низком уровне энергии.
 */

// Эффект мерцания щитов
/obj/effect/shield_flicker
	name = "shield flicker"
	icon = 'icons/effects/effects.dmi'
	icon_state = "bite"
	layer = ABOVE_MOB_LAYER
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	alpha = 0
	color = "#00FFFF" // Голубой цвет для щитов

/obj/effect/shield_flicker/Initialize(mapload)
	. = ..()
	// Создаем эффект мерцания
	animate(src, alpha = 100, time = 2)
	animate(alpha = 30, time = 3)
	animate(alpha = 80, time = 2)
	animate(alpha = 0, time = 3)
	QDEL_IN(src, 10)
