// АТМОСФЕРНЫЕ ОПТИМИЗАЦИИ ПРОИЗВОДИТЕЛЬНОСТИ
// Применить эти изменения в code/controllers/subsystem/air.dm

// 1. УВЕЛИЧИТЬ ИНТЕРВАЛ ОБНОВЛЕНИЯ
// Изменить: wait = 0.5 SECONDS
// На:      wait = 1 SECONDS  // Снижает нагрузку в 2 раза

// 2. УВЕЛИЧИТЬ ЛИМИТЫ ОБРАБОТКИ
// Изменить существующие значения на:
/*
equalize_turf_limit = 100           // Увеличено с 30
equalize_hard_turf_limit = 5000     // Увеличено с 2000  
share_max_steps = 5                 // Увеличено с 3
excited_group_pressure_goal = 2     // Увеличено с 1
*/

// 3. ОПТИМИЗИРОВАТЬ ПЛАНЕТАРНУЮ АТМОСФЕРУ
// Изменить: planet_share_ratio = 0.25
// На:      planet_share_ratio = 0.15  // Снижает вычисления

// 4. ДОБАВИТЬ АДАПТИВНЫЕ ЛИМИТЫ
/datum/controller/subsystem/air
	var/adaptive_processing = TRUE
	var/max_cost_threshold = 50  // мс
	var/min_cost_threshold = 10  // мс

/datum/controller/subsystem/air/proc/adjust_performance()
	if(!adaptive_processing)
		return
		
	var/avg_cost = (cost_turfs + cost_groups + cost_equalize) / 3
	
	if(avg_cost > max_cost_threshold)
		// Снижаем нагрузку
		equalize_turf_limit = max(20, equalize_turf_limit - 10)
		share_max_steps = max(2, share_max_steps - 1)
		
	else if(avg_cost < min_cost_threshold)
		// Увеличиваем качество
		equalize_turf_limit = min(150, equalize_turf_limit + 5)
		share_max_steps = min(7, share_max_steps + 1)

// 5. ОПТИМИЗАЦИЯ ГАЗОВЫХ СМЕСЕЙ
/datum/gas_mixture/proc/is_processing_worthy()
	// Не обрабатывать смеси с минимальными изменениями
	if(total_moles() < 0.1)
		return FALSE
	if(abs(return_temperature() - T20C) < 5)
		return FALSE
	return TRUE

// 6. КЭШИРОВАНИЕ СМЕЖНОСТИ
/turf/var/adjacency_cache_time = 0
/turf/var/cached_adjacent_turfs

/turf/proc/get_cached_adjacent_turfs()
	if(world.time - adjacency_cache_time > 50) // Обновлять каждые 5 секунд
		cached_adjacent_turfs = get_atmos_adjacent_turfs()
		adjacency_cache_time = world.time
	return cached_adjacent_turfs

// 7. ПРОПУСК НЕАКТИВНЫХ ТАЙЛОВ
/turf/open/var/last_significant_change = 0

/turf/open/proc/needs_processing()
	if(!air)
		return FALSE
	if(world.time - last_significant_change > 100) // 10 секунд без изменений
		return FALSE
	if(air.total_moles() < 0.05)
		return FALSE
	return TRUE