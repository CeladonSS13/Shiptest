/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Anomaly Shield Hook
 *
 * Хук для перехвата аномалий системой щитов.
 */

// Хук для аномалий
/obj/effect/anomaly/Initialize(mapload)
	. = ..()
	// Проверяем, защищена ли область щитами
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

		// Определяем урон от аномалии
		var/damage = 100 // Базовый урон от аномалии

		// Пытаемся поглотить урон щитами
		var/absorbed = ship.shield_system.absorb_damage(damage, "anomaly")
		if(absorbed >= damage)
			// Создаем визуальный эффект поглощения аномалии
			// Создаем эффект на месте аномалии
			new /obj/effect/shield_impact(T)
			// Уничтожаем аномалию
			qdel(src)
			return
