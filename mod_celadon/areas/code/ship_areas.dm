/// GENERAL
/area/ship/general
	name = "General"
	icon_state = "general"

/// COMMAND CREW
/area/ship/general/command_crew
	name = "Captain room"
	icon_state = "captain_room"

/area/ship/general/command_crew/hos
	name = "Head of Security"
	icon_state = "hos"

/area/ship/general/command_crew/hop
	name = "Head of Personal"
	icon_state = "hop"

/area/ship/general/command_crew/ce
	name = "CE"
	icon_state = "ce"

/area/ship/general/command_crew/rd
	name = "Research of Directory"
	icon_state = "rd"

/area/ship/general/command_crew/cmo
	name = "CMO"
	icon_state = "cmo_ship"

/// ENGINEERING
/area/ship/general/engineering
	name = "Engineering"
	icon_state = "eng"
	ambientsounds = AMBIENCE_ENGI
	lighting_colour_tube = "#ffce93"
	lighting_colour_bulb = "#ffbc6f"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/ship/general/engineering/engineering_1
	name = "Engineering 1"
	icon_state = "eng_1"

/area/ship/general/engineering/engineering_2
	name = "Engineering 2"
	icon_state = "eng_2"

/// SCIENCE
/area/ship/general/science
	name = "R&D 1"
	icon_state = "rnd_1"
	lighting_colour_tube = "#f0fbff"
	lighting_colour_bulb = "#e4f7ff"

/area/ship/general/science/rnd
	name = "R&D 2"
	icon_state = "rnd_2"

/// MEDICAL
/area/ship/general/medical
	name = "Medbay 1"
	icon_state = "med_1"
	ambientsounds = AMBIENCE_MEDICAL
	lighting_colour_tube = "#e7f8ff"
	lighting_colour_bulb = "#d5f2ff"
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS

/area/ship/general/medical/medbay
	name = "Medbay 2"
	icon_state = "med_2"

/// CARGO
/area/ship/general/cargo
	name = "Cargo 1"
	icon_state = "cargo_1"
	lighting_colour_tube = "#ffe3cc"
	lighting_colour_bulb = "#ffdbb8"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/ship/general/cargo/cargo_bay
	name = "Cargo 2"
	icon_state = "cargo_2"

/// OTHER SHUTTLE
/area/ship/general/other
	name = "Other Shuttle 1"
	icon_state = "osz_1"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/ship/general/other/zone_2
	name = "Other Shuttle 2"
	icon_state = "osz_2"

/area/ship/general/other/zone_3
	name = "Other Shuttle 3"
	icon_state = "osz_3"

/area/ship/general/other/zone_4
	name = "Other Shuttle 4"
	icon_state = "osz_4"

/// Hallways ///
/area/ship/hallway/starboard_fore
	name = "Starboard Fore Hallway"
	icon_state = "starforehallway"

/area/ship/hallway/port_fore
	name = "Port Fore Hallway"
	icon_state = "portforehallway"

/// Security ///
/area/ship/security/weapons_control
	name = "Weapons Control Room"
	icon_state = "weaponscontrolroom"
