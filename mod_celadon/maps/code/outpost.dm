/*
	/// MARK:Elysium Asteroid
*/
/datum/map_template/outpost/elevator_asteroid
	name = "elevator_asteroid"

/datum/map_template/outpost/elysium_asteroid
	name = "elysium_asteroid"

/datum/map_template/outpost/hangar/elysium_asteroid_20x20
	name = "hangar/elysium_asteroid_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_asteroid_40x20
	name = "hangar/elysium_asteroid_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_asteroid_40x40
	name = "hangar/elysium_asteroid_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/elysium_asteroid_56x20
	name = "hangar/elysium_asteroid_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_asteroid_56x40
	name = "hangar/elysium_asteroid_56x40"
	dock_width = 56
	dock_height = 40

/datum/overmap/outpost/elysium_asteroid
	token_icon_state = "station_3"
	main_template = /datum/map_template/outpost/elysium_asteroid
	elevator_template = /datum/map_template/outpost/elevator_asteroid
	hangar_templates = list(
		/datum/map_template/outpost/hangar/elysium_asteroid_20x20,
		/datum/map_template/outpost/hangar/elysium_asteroid_40x20,
		/datum/map_template/outpost/hangar/elysium_asteroid_40x40,
		/datum/map_template/outpost/hangar/elysium_asteroid_56x20,
		/datum/map_template/outpost/hangar/elysium_asteroid_56x40
	)

/*
	/// MARK:Elysium Ice
*/
/datum/map_template/outpost/elysium_ice
	name = "elysium_ice"

/datum/map_template/outpost/hangar/elysium_ice_20x20
	name = "hangar/elysium_ice_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_ice_40x20
	name = "hangar/elysium_ice_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_ice_40x40
	name = "hangar/elysium_ice_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/elysium_ice_56x20
	name = "hangar/elysium_ice_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_ice_56x40
	name = "hangar/elysium_ice_56x40"
	dock_width = 56
	dock_height = 40

/datum/overmap/outpost/elysium_ice
	token_icon_state = "station_asteroid_0"
	main_template = /datum/map_template/outpost/elysium_ice
	elevator_template = /datum/map_template/outpost/elevator_ice
	hangar_templates = list(
		/datum/map_template/outpost/hangar/elysium_ice_20x20,
		/datum/map_template/outpost/hangar/elysium_ice_40x20,
		/datum/map_template/outpost/hangar/elysium_ice_40x40,
		/datum/map_template/outpost/hangar/elysium_ice_56x20,
		/datum/map_template/outpost/hangar/elysium_ice_56x40
	)

/*
	/// MARK:Rock Planet
	//ROCK AND STONE!
*/
/datum/map_template/outpost/elysium_rock
	name = "elysium_rock"

/datum/map_template/outpost/hangar/elysium_rock_20x20
	name = "hangar/elysium_rock_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_rock_40x20
	name = "hangar/elysium_rock_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_rock_40x40
	name = "hangar/elysium_rock_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/elysium_rock_56x20
	name = "hangar/elysium_rock_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_rock_56x40
	name = "hangar/elysium_rock_56x40"
	dock_width = 56
	dock_height = 40

// /datum/overmap/outpost/elysium_rock		// Отключаем. Надо переделывать под фракционные карго
// 	token_icon_state = "station_1"
// 	main_template = /datum/map_template/outpost/elysium_rock
// 	elevator_template = /datum/map_template/outpost/elevator_rock
// 	hangar_templates = list(
// 		/datum/map_template/outpost/hangar/elysium_rock_20x20,
// 		/datum/map_template/outpost/hangar/elysium_rock_40x20,
// 		/datum/map_template/outpost/hangar/elysium_rock_40x40,
// 		/datum/map_template/outpost/hangar/elysium_rock_56x20,
// 		/datum/map_template/outpost/hangar/elysium_rock_56x40
// 	)

/*
	/// MARK:Independent Space Outpost
*/
/datum/map_template/outpost/elevator_space
	name = "elevator_space"

/datum/map_template/outpost/elysium_space
	name = "elysium_space"

/datum/map_template/outpost/hangar/elysium_space_20x20
	name = "hangar/elysium_space_20x20"
	dock_width = 20
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_space_40x20
	name = "hangar/elysium_space_40x20"
	dock_width = 40
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_space_40x40
	name = "hangar/elysium_space_40x40"
	dock_width = 40
	dock_height = 40

/datum/map_template/outpost/hangar/elysium_space_56x20
	name = "hangar/elysium_space_56x20"
	dock_width = 56
	dock_height = 20

/datum/map_template/outpost/hangar/elysium_space_56x40
	name = "hangar/elysium_space_56x40"
	dock_width = 56
	dock_height = 40

// /datum/overmap/outpost/elysium_space		// Отключаем. Надо переделывать под фракционные карго
// 	token_icon_state = "station_1"
// 	main_template = /datum/map_template/outpost/elysium_space
// 	elevator_template = /datum/map_template/outpost/elevator_space
// 	hangar_templates = list(
// 		/datum/map_template/outpost/hangar/elysium_space_20x20,
// 		/datum/map_template/outpost/hangar/elysium_space_40x20,
// 		/datum/map_template/outpost/hangar/elysium_space_40x40,
// 		/datum/map_template/outpost/hangar/elysium_space_56x20,
// 		/datum/map_template/outpost/hangar/elysium_space_56x40
// 	)
/*
	/// MARK:No main level
*/
/datum/overmap/outpost/no_main_level // For example and adminspawn.
	main_template = null
	elevator_template = /datum/map_template/outpost/elevator_test
	// Uses "test" hangars.
