/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Meteor Shield Hook
 *
 * Хук для перехвата метеоритов системой щитов.
 */

// Хук для метеоритов
/obj/effect/meteor/Initialize(mapload, target)
	// Проверяем, не направлен ли метеорит на корабль с активными щитами
	if(target && isturf(target))
		var/area/target_area = get_area(target)
		if(target_area)
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
				if(!(target_area in areas))
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
					// Создаем визуальный эффект поглощения метеорита на границе щита
					var/turf/shield_edge = get_edge_target_turf(target, get_dir(src, target))
					new /obj/effect/shield_impact(shield_edge)
					
					// Специальная обработка для карпов
					if(istype(src, /obj/effect/meteor/carp) || istype(src, /obj/effect/meteor/carp/big))
						// Создаем мертвого карпа на границе щита
						var/mob/living/simple_animal/hostile/carp/dead_carp
						if(istype(src, /obj/effect/meteor/carp/big))
							dead_carp = new /mob/living/simple_animal/hostile/carp/megacarp(shield_edge)
						else
							dead_carp = new /mob/living/simple_animal/hostile/carp(shield_edge)
						
						// Убиваем карпа и делаем его гибом
						dead_carp.death()
						dead_carp.gib()
						
					// Создаем эффект на корабле
					ship.create_shield_effects_on_ship(1)
					// Уничтожаем метеорит до того, как он достигнет корабля
					return INITIALIZE_HINT_QDEL

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
			
			// Специальная обработка для карпов
			if(istype(src, /obj/effect/meteor/carp) || istype(src, /obj/effect/meteor/carp/big))
				// Создаем мертвого карпа на месте столкновения
				var/mob/living/simple_animal/hostile/carp/dead_carp
				if(istype(src, /obj/effect/meteor/carp/big))
					dead_carp = new /mob/living/simple_animal/hostile/carp/megacarp(T)
				else
					dead_carp = new /mob/living/simple_animal/hostile/carp(T)
				
				// Убиваем карпа и делаем его гибом
				dead_carp.death()
				dead_carp.gib()
			
			// Уничтожаем метеорит
			qdel(src)
			return

	return
