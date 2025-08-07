// ОПТИМИЗАЦИЯ КОНФИГУРАЦИИ AUXMOS
// Настройки для улучшения производительности AUXMOS

// 1. НАСТРОЙКИ КОМПИЛЯЦИИ AUXMOS
// В tools/ci/build_auxmos.sh добавить флаги оптимизации:
/*
export RUSTFLAGS="-C target-cpu=native -C opt-level=3"
cargo build --release --features "all_gases,katmos"
*/

// 2. ПЕРЕМЕННЫЕ ОКРУЖЕНИЯ ДЛЯ AUXMOS
// В config.txt или через переменные среды:
/*
AUXMOS_THREAD_COUNT=4           // Количество потоков (по числу ядер CPU)
AUXMOS_MAX_PROCESSING_TIME=15   // Максимальное время обработки в мс
AUXMOS_TURF_LIMIT=10000        // Лимит тайлов за цикл
AUXMOS_EXCITED_GROUP_LIMIT=500  // Лимит excited groups
*/

// 3. ОПТИМИЗАЦИЯ ГАЗОВЫХ РЕАКЦИЙ
/datum/controller/subsystem/air/proc/optimize_gas_reactions()
	// Отключить редкие/дорогие реакции на время высокой нагрузки
	var/high_load = (cost_turfs + cost_groups) > 40
	
	for(var/reaction in gas_reactions)
		var/datum/gas_reaction/R = reaction
		if(high_load && R.priority < 0) // Низкоприоритетные реакции
			R.enabled = FALSE
		else
			R.enabled = TRUE

// 4. ДИНАМИЧЕСКОЕ УПРАВЛЕНИЕ КАЧЕСТВОМ
/datum/controller/subsystem/air
	var/performance_mode = 0 // 0=normal, 1=economy, 2=performance
	
/datum/controller/subsystem/air/proc/set_performance_mode(mode)
	performance_mode = mode
	switch(mode)
		if(0) // Нормальный режим
			wait = 0.5 SECONDS
			equalize_turf_limit = 50
			share_max_steps = 4
			
		if(1) // Экономичный режим  
			wait = 1 SECONDS
			equalize_turf_limit = 30
			share_max_steps = 3
			
		if(2) // Производительный режим
			wait = 1.5 SECONDS  
			equalize_turf_limit = 20
			share_max_steps = 2

// 5. МОНИТОРИНГ ПРОИЗВОДИТЕЛЬНОСТИ
/datum/controller/subsystem/air/proc/performance_monitor()
	var/total_cost = cost_turfs + cost_groups + cost_equalize + cost_pipenets
	
	// Автоматическое переключение режимов
	if(total_cost > 80 && performance_mode < 2)
		set_performance_mode(performance_mode + 1)
		message_admins("Атмосфера переключена в режим производительности [performance_mode]")
		
	else if(total_cost < 30 && performance_mode > 0)
		set_performance_mode(performance_mode - 1)
		message_admins("Атмосфера переключена в режим качества [performance_mode]")

// 6. ОПТИМИЗАЦИЯ ПАМЯТИ ГАЗОВЫХ СМЕСЕЙ
/datum/controller/subsystem/air/proc/cleanup_gas_mixtures()
	// Периодическая очистка неиспользуемых газовых смесей
	var/cleaned = 0
	for(var/datum/gas_mixture/GM in world)
		if(!GM.loc && GM.total_moles() < 0.01)
			qdel(GM)
			cleaned++
	
	if(cleaned > 0)
		log_debug("Очищено [cleaned] неиспользуемых газовых смесей")

// 7. ПРОФИЛИРОВАНИЕ AUXMOS
/datum/controller/subsystem/air/proc/profile_auxmos()
	var/list/profile_data = list()
	profile_data["turfs_processed"] = num_group_turfs_processed
	profile_data["equalize_processed"] = num_equalize_processed  
	profile_data["gas_mixtures"] = get_amt_gas_mixes()
	profile_data["max_gas_mixtures"] = get_max_gas_mixes()
	profile_data["thread_wait"] = thread_wait_ticks
	
	return profile_data