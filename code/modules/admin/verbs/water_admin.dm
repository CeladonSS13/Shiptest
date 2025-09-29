// // Админские команды для работы с водой

// /client/proc/create_water()
// 	set category = "Admin.Events"
// 	set name = "Create Water"
// 	set desc = "Create dynamic water on selected turfs"

// 	if(!check_rights(R_ADMIN))
// 		return

// 	var/amount = input("Water amount (0-500 liters):", "Water Creation", 100) as num|null
// 	if(!amount)
// 		return

// 	amount = clamp(amount, 0, WATER_MAX_VOLUME)

// 	var/list/turfs_to_flood = list()
// 	var/turf/center = get_turf(mob)

// 	var/range = input("Range from your position:", "Water Creation", 3) as num|null
// 	if(!range)
// 		return

// 	range = clamp(range, 1, 10)

// 	for(var/turf/T in range(range, center))
// 		if(istype(T, /turf/open) && !istype(T, /turf/open/space))
// 			turfs_to_flood += T

// 	if(!length(turfs_to_flood))
// 		to_chat(src, span_warning("No valid turfs found to flood!"))
// 		return

// 	for(var/turf/T in turfs_to_flood)
// 		var/turf/open/water/dynamic/water_turf
// 		if(istype(T, /turf/open/water/dynamic))
// 			water_turf = T
// 		else
// 			water_turf = T.ChangeTurf(/turf/open/water/dynamic, flags = CHANGETURF_INHERIT_AIR)
// 			water_turf.baseturfs = T.type

// 		if(water_turf)
// 			water_turf.add_water(amount)

// 	log_admin("[key_name(src)] created water with amount [amount] in range [range] at [AREACOORD(center)]")
// 	message_admins("[key_name_admin(src)] created water with amount [amount] in range [range] at [AREACOORD(center)]")

// /client/proc/remove_water()
// 	set category = "Admin.Events"
// 	set name = "Remove Water"
// 	set desc = "Remove water from selected area"

// 	if(!check_rights(R_ADMIN))
// 		return

// 	var/turf/center = get_turf(mob)
// 	var/range = input("Range from your position:", "Water Removal", 5) as num|null
// 	if(!range)
// 		return

// 	range = clamp(range, 1, 20)

// 	var/removed_count = 0
// 	for(var/turf/open/water/dynamic/water_turf in range(range, center))
// 		water_turf.remove_water(water_turf.water_volume)
// 		removed_count++

// 	to_chat(src, span_notice("Removed water from [removed_count] turfs."))
// 	log_admin("[key_name(src)] removed water in range [range] at [AREACOORD(center)]")
// 	message_admins("[key_name_admin(src)] removed water in range [range] at [AREACOORD(center)]")
