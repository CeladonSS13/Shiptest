/datum/overmap/event
	name = "event"

	var/safe_speed = 3
	var/list/meteor_types = list(
		/obj/effect/meteor/dust=3,
		/obj/effect/meteor/medium=8,
		/obj/effect/meteor/big=1,
		/obj/effect/meteor/irradiated=3
	)
	var/primary_ores = list(\
		/obj/item/stack/ore/plasma,
		/obj/item/stack/ore/hematite,
		/obj/item/stack/ore/malachite,
		)

/datum/overmap/event/alter_token_appearance()
	icon_suffix = "[rand(1, 4)]"
	..()

	var/orestext
	if(primary_ores)
		orestext += span_boldnotice("\nInitial scans show a high concentration of the following ores:\n")
		for(var/obj/ore as anything in primary_ores)
			var/hex = ORES_TO_COLORS_LIST[ore]
			orestext += "<font color='[hex]'>	- [ore.name]\n</font>"
		desc += orestext

		token.desc += span_notice("\nYou could land within the [src] if you were to [span_bold("Dock to Empty Space")] while flying over...\n")

	if(safe_speed)
		token.desc += span_notice("\nYou can safely navigate through this if your ship is travelling under [span_bold("[safe_speed] Gm/s")].")

	if(current_overmap.override_object_colors)
		token.color = current_overmap.hazard_primary_color
	current_overmap.post_edit_token_state(src)

/datum/overmap/event/apply_effect()
	for(var/datum/overmap/ship/controlled/Ship in get_nearby_overmap_objects())
		if(Ship.get_speed() > safe_speed)
			var/how_fast =  (Ship.get_speed() - safe_speed)
			if(prob(chance_to_affect + how_fast))
				affect_ship(Ship)

/datum/overmap/event/affect_ship(datum/overmap/ship/controlled/Ship)
	spawn_meteor(meteor_types, Ship.shuttle_port.get_virtual_level(), 0, Ship.shuttle_port)

/datum/mission/outpost/research/meteor
	objective_type = /datum/overmap/event/meteor

/datum/mission/outpost/research/carp
	objective_type = /datum/overmap/event/carp

/datum/mission/outpost/research/dust
	objective_type = /datum/overmap/event/dust

/datum/overmap/event/carp	// вынесено в mod_celadon/fixes/code/research_mission.dm, оставлено дял того чтобы не удалять кучу зависимостей
	name = "carp migration (moderate)"
	desc = "A migratory school of space carp. They travel at high speeds, and flying through them may cause them to impact your ship"
	base_icon_state = "carp_medium_"
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	// default_color = "#7b1ca8"
	// [/CELADON-REMOVE]
	chance_to_affect = 15
	spread_chance = 50
	chain_rate = 4
	safe_speed = 5
	interference_power = 0
	meteor_types = list(
		/obj/effect/meteor/carp = 16,
		/obj/effect/meteor/carp/big = 1, //numbers I pulled out of my ass
	)
	primary_ores = null

/datum/overmap/event/carp/alter_token_appearance()
	icon_suffix = "[rand(1, 4)]"
	..()
	if(current_overmap.override_object_colors)
		token.color = current_overmap.hazard_primary_color
	current_overmap.post_edit_token_state(src)

/datum/overmap/event/carp/minor
	name = "carp migration (minor)"
	base_icon_state = "carp_minor_"
	chance_to_affect = 5
	spread_chance = 25
	chain_rate = 4
	meteor_types = list(
		/obj/effect/meteor/carp=8
	)


/datum/overmap/event/carp/major
	name = "carp migration (major)"
	base_icon_state = "carp_major_"
	chance_to_affect = 25
	spread_chance = 25
	chain_rate = 4
	meteor_types = list(
		/obj/effect/meteor/carp=7,
		/obj/effect/meteor/carp/big=1,
	)

// dust clouds throw dust if you go Way Fast

/datum/overmap/event/dust	// вынесено в mod_celadon/fixes/code/research_mission.dm, оставлено дял того чтобы не удалять кучу зависимостей
	name = "dust cloud"
	desc = "A cloud of spaceborne dust. Relatively harmless, unless you're travelling at relative speeds"
	base_icon_state = "dust"
	// [CELADON-REMOVE] - CELADON_OVERMAP_ICON - спрайты некросивые получаюца
	// default_color = "#506469"
	// [/CELADON-REMOVE]
	chance_to_affect = 90
	spread_chance = 50
	chain_rate = 4
	safe_speed = 7
	interference_power = 5
	meteor_types = list(
		/obj/effect/meteor/dust=3,
	)
	primary_ores = null

/datum/overmap/event/dust/alter_token_appearance()
	icon_suffix = "[rand(1, 4)]"
	..()
	if(current_overmap.override_object_colors)
		token.color = current_overmap.hazard_secondary_color
	current_overmap.post_edit_token_state(src)
