// Миссия на изучение и поиск ионного шторма
// Все миссии тут code/modules/overmap/missions/research_mission.dm
/datum/mission/research/ion
	name = "Ion storm research mission"
	desc = "We require data on the behavior of ion storms in the system for an ongoing study. \
			Please anchor the attached sensor array to your ship and fly it through the storms. \
			It must be powered to collect the data."
	value = 3500
	// objective_type = /datum/overmap/event/emp // NEEDS_TO_FIX_ALARM!

// Сам Ионный шторм
// Остальные ивенты тут code/modules/overmap/objects/event_datum.dm
///ION STORM - explodes your IPCs
/datum/overmap/event/emp
	name = "ion storm (moderate)"
	desc = "A heavily ionized area of space, prone to causing electromagnetic pulses in ships"
	token_icon_state = "ion_moderate1"
	spread_chance = 10
	chain_rate = 2
	chance_to_affect = 10
	var/strength = 4

/datum/overmap/event/emp/minor
	name = "ion storm (minor)"
	chain_rate = 1
	strength = 1
	chance_to_affect = 5

/datum/overmap/event/emp/major
	name = "ion storm (major)"
	chance_to_affect = 15
	chain_rate = 4
	strength = 4

/datum/overmap/event/emp/Initialize(position, ...)
	. = ..()
	token.icon_state = "ion_moderate[rand(1, 2)]"
	switch(type) //woop! this picks one of two icon states for the severity of the storm in overmap.dmi
		if(/datum/overmap/event/emp/minor)
			token.icon_state = "ion_minor[rand(1, 2)]"
		if(/datum/overmap/event/emp)
			token.icon_state = "ion_moderate[rand(1, 2)]"
		if(/datum/overmap/event/emp/major)
			token.icon_state = "ion_major[rand(1, 2)]"
		else
			token.icon_state = "ion_moderate1"
	//token.color = "#7cb4d4"
	//token.light_color = "#7cb4d4"
	token.update_appearance()

/datum/overmap/event/emp/affect_ship(datum/overmap/ship/controlled/S)
	var/area/source_area = pick(S.shuttle_port.shuttle_areas)
	source_area.set_fire_alarm_effect()
	var/source_object = pick(source_area.contents)
	empulse(get_turf(source_object), round(rand(strength / 2, strength)), rand(strength, strength * 2))
	for(var/mob/M as anything in GLOB.player_list)
		if(S.shuttle_port.is_in_shuttle_bounds(M))
			M.playsound_local(S.shuttle_port, 'sound/weapons/ionrifle.ogg', strength)
