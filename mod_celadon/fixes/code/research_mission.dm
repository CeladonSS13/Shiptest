// /datum/mission/research/meteor
// 	objective_type = /datum/overmap/event/meteor

// /datum/mission/research/carp
// 	objective_type = /datum/overmap/event/carp

// /datum/mission/research/dust
// 	objective_type = /datum/overmap/event/dust


/datum/overmap/event
	var/safe_speed = 1
	var/list/meteor_types = list()

//Carp "meteors" - throws carp at the ship
/datum/overmap/event/carp
	name = "carp migration (moderate)"
	desc = "A migratory school of space carp. They travel at high speeds, and flying through them may cause them to impact your ship"
	token_icon_state = "carp_moderate1"
	chance_to_affect = 15
	spread_chance = 50
	chain_rate = 4
	safe_speed = 2
	meteor_types = list(
		/obj/effect/meteor/carp = 16,
		/obj/effect/meteor/carp/big = 1, //numbers I pulled out of my ass
	)

/datum/overmap/event/carp/Initialize(position, ...)
	. = ..()
	token.icon_state = "carp_moderate[rand(1, 2)]"
	switch(type) //woop! this picks one of two icon states for the severity of the storm in overmap.dmi
		if(/datum/overmap/event/carp/minor)
			token.icon_state = "carp_minor[rand(1, 2)]"
		if(/datum/overmap/event/carp)
			token.icon_state = "carp_moderate[rand(1, 2)]"
		if(/datum/overmap/event/carp/major)
			token.icon_state = "carp_major[rand(1, 2)]"
		else
			token.icon_state = "carp_moderate1"
	//token.icon_state = "carp[rand(1, 4)]"
	//token.color = "#7b1ca8"
	//token.light_color = "#7b1ca8"
	token.update_icon()

/datum/overmap/event/carp/apply_effect()
	for(var/datum/overmap/ship/controlled/Ship in get_nearby_overmap_objects())
		if(Ship.get_speed() > safe_speed)
			var/how_fast =  (Ship.get_speed() - safe_speed)
			if(prob(chance_to_affect + how_fast))
				affect_ship(Ship)

/datum/overmap/event/carp/affect_ship(datum/overmap/ship/controlled/Ship)
	spawn_meteor(meteor_types, Ship.shuttle_port.get_virtual_level(), 0)

/datum/overmap/event/carp/minor
	name = "carp migration (minor)"
	chance_to_affect = 5
	spread_chance = 25
	chain_rate = 4
	meteor_types = list(
		/obj/effect/meteor/carp = 8
	)


/datum/overmap/event/carp/major
	name = "carp migration (major)"
	chance_to_affect = 25
	spread_chance = 25
	chain_rate = 4
	meteor_types = list(
		/obj/effect/meteor/carp = 7,
		/obj/effect/meteor/carp/big = 1,
	)

// dust clouds throw dust if you go Way Fast

/datum/overmap/event/dust
	name = "dust cloud"
	desc = "A cloud of spaceborne dust. Relatively harmless, unless you're travelling at relative speeds"
	token_icon_state = "carp1"
	chance_to_affect = 30
	spread_chance = 50
	chain_rate = 4
	safe_speed = 7
	meteor_types = list(
		/obj/effect/meteor/dust = 3,
	)

/datum/overmap/event/dust/Initialize(position, ...)
	. = ..()
	token.icon_state = "dust[rand(1, 4)]"
	token.color = "#506469" //we should make these defines
	token.light_color = "#506469"
	token.update_icon()

/datum/overmap/event/dust/apply_effect()
	for(var/datum/overmap/ship/controlled/Ship in get_nearby_overmap_objects())
		if(Ship.get_speed() > safe_speed)
			var/how_fast =  (Ship.get_speed() - safe_speed)
			if(prob(chance_to_affect + how_fast))
				affect_ship(Ship)

/datum/overmap/event/dust/affect_ship(datum/overmap/ship/controlled/Ship)
	spawn_meteor(meteor_types, Ship.shuttle_port.get_virtual_level(), 0)
