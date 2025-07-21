/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Meteor Shield Hook
 *
 * Хук для перехвата метеоритов системой щитов.
 */

// Хук для метеоритов
/obj/effect/meteor/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(check_shield_collision))

/**
 * Проверяет столкновение метеорита со щитом
 */
/obj/effect/meteor/proc/check_shield_collision()
	var/turf/T = get_turf(src)
	if(!T)
		return

	var/area/A = get_area(T)
	if(!A)
		return

	// Ищем корабль, связанный с этой областью
	for(var/datum/overmap/O in SSovermap.overmap_objects)
		if(!istype(O, /datum/overmap/ship))
			continue
		var/datum/overmap/ship/ship = O

		// Проверяем, есть ли у корабля активные щиты
		if(!ship.shield_system || !ship.shield_system.active)
			continue

		// Проверяем, принадлежит ли область кораблю
		var/list/areas = ship.get_areas()
		if(!(A in areas))
			continue

		// Определяем урон от метеорита
		var/damage = 0
		if(istype(src, /obj/effect/meteor/dust))
			damage = 10
		else if(istype(src, /obj/effect/meteor/small))
			damage = 30
		else if(istype(src, /obj/effect/meteor/medium))
			damage = 80
		else if(istype(src, /obj/effect/meteor/big))
			damage = 200
		else if(istype(src, /obj/effect/meteor/tunguska))
			damage = 500
		else
			damage = 50

		// Пытаемся поглотить урон щитами
		var/absorbed = ship.shield_system.absorb_damage(damage, "meteor")
		if(absorbed >= damage)
			// Создаем визуальный эффект поглощения метеорита
			new /obj/effect/shield_impact(T)
			// Уничтожаем метеорит
			qdel(src)
			return

	return
