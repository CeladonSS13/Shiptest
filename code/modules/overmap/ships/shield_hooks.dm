/**	// [CELADON] - CELADON_SHIP_SHIELD - Перенести потом
 * # Shield Hooks
 *
 * Хуки для интеграции системы щитов с другими системами игры.
 */

// Хук для метеоритов
/obj/effect/meteor/Initialize(mapload)
	. = ..()
	// Добавляем компонент для проверки щитов
	AddComponent(/datum/component/shield_check)

// Компонент для проверки щитов
/datum/component/shield_check
	// Флаг, указывающий, что объект уже проверен на щиты
	var/shield_checked = FALSE

/datum/component/shield_check/Initialize()
	. = ..()
	if(!istype(parent, /obj/effect/meteor))
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(check_shields))

// Проверяет, защищен ли турф щитами
/datum/component/shield_check/proc/check_shields()
	var/obj/effect/meteor/M = parent
	if(!M || shield_checked)
		return

	var/turf/T = get_turf(M)
	if(!T)
		return

	var/datum/ship_shield/shield = SSship_shields.is_turf_shielded(T)
	if(shield)
		// Определяем урон от метеорита
		var/damage = 0
		if(istype(M, /obj/effect/meteor/dust))
			damage = 10
		else if(istype(M, /obj/effect/meteor/small))
			damage = 30
		else if(istype(M, /obj/effect/meteor/medium))
			damage = 80
		else if(istype(M, /obj/effect/meteor/big))
			damage = 200
		else if(istype(M, /obj/effect/meteor/tunguska))
			damage = 500
		else
			damage = 50

		// Пытаемся поглотить урон щитами
		var/absorbed = shield.absorb_damage(damage, "meteor")
		if(absorbed >= damage)
			// Создаем визуальный эффект поглощения метеорита
			new /obj/effect/shield_impact(T)
			// Помечаем, что метеорит проверен
			shield_checked = TRUE
			// Уничтожаем метеорит
			qdel(M)
			return

// Добавляем сигнал для движущихся объектов
#define COMSIG_MOVABLE_MOVED "movable_moved"
