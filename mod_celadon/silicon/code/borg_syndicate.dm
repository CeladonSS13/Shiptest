/obj/item/borg/upgrade/transform/syndicate_random
	name = "unknown syndicate cyborg module"
	desc = "A module picking system, capable of using stored matter to build itself out into a fresh cyborg configuration. This one has no serial number, just a syndicate identification mark."
	var/static/list/possible_modules = list(
		/obj/item/robot_module/syndicate,
		/obj/item/robot_module/syndicate_medical,
		/obj/item/robot_module/saboteur
	)

/obj/item/borg/upgrade/transform/syndicate_random/Initialize(mapload)
	. = ..()
	new_module = pick(possible_modules)
