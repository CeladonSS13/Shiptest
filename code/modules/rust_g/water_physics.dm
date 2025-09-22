// Интерфейс для физики воды через Rust-G
#define rustg_water_simulate(water_data) call(RUST_G, "water_simulate")("[water_data]")
#define rustg_water_spread(x, y, z, volume, spread_rate) call(RUST_G, "water_spread")("[x],[y],[z],[volume],[spread_rate]")
#define rustg_water_get_level(x, y, z) text2num(call(RUST_G, "water_get_level")("[x],[y],[z]"))

// Глобальная карта воды для Rust-G
GLOBAL_VAR_INIT(water_physics_enabled, TRUE)
GLOBAL_LIST_EMPTY(water_simulation_queue)

// Быстрая физика воды через Rust-G
/obj/effect/water_overlay/process(seconds_per_tick)
	if(!GLOB.water_physics_enabled)
		return ..()
	
	if(water_volume <= 0)
		STOP_PROCESSING(SSprocessing, src)
		return
	
	// Добавляем в очередь симуляции
	var/turf/T = get_turf(src)
	if(T)
		GLOB.water_simulation_queue["[T.x],[T.y],[T.z]"] = water_volume

// Обработчик симуляции воды
/proc/process_water_physics()
	if(!GLOB.water_physics_enabled || !length(GLOB.water_simulation_queue))
		return
	
	// Отправляем данные в Rust-G для симуляции
	var/water_data = json_encode(GLOB.water_simulation_queue)
	var/result = rustg_water_simulate(water_data)
	
	if(result)
		var/list/updates = json_decode(result)
		apply_water_updates(updates)
	
	GLOB.water_simulation_queue.Cut()

/proc/apply_water_updates(list/updates)
	for(var/coord in updates)
		var/list/coord_data = splittext(coord, ",")
		var/x = text2num(coord_data[1])
		var/y = text2num(coord_data[2]) 
		var/z = text2num(coord_data[3])
		var/new_volume = updates[coord]
		
		var/turf/T = locate(x, y, z)
		if(!T) continue
		
		var/obj/effect/water_overlay/water = locate(/obj/effect/water_overlay) in T
		if(new_volume <= 0)
			if(water)
				qdel(water)
		else
			if(!water)
				water = new(T, new_volume)
			else
				water.water_volume = new_volume
				water.update_water_appearance()