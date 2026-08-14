/* Это родительский класс
/area/outpost/medical
	name = "Infirmary"
	icon_state = "medbay3"
	ambientsounds = MEDICAL
	lighting_colour_tube = "#e7f8ff"
	lighting_colour_bulb = "#d5f2ff"
	lighting_colour_night = "#d5f2ff"
	min_ambience_cooldown = 90 SECONDS
	max_ambience_cooldown = 180 SECONDS
*/

/// MARK: MEDICAL

/area/outpost/medical
	name = "Medical"
	icon_state = "medical"

/area/outpost/medical/reseption
	name = "Reseption"
	icon_state = "med_reseption"

/area/outpost/medical/care_room
	name = "Care Room"
	icon_state = "care_room"

/area/outpost/medical/morgue
	name = "Morgue"
	icon_state = "morgue"

/area/outpost/medical/hall_1
	name = "Hall 1"
	icon_state = "med_hall_1"

/area/outpost/medical/hall_2
	name = "Hall 2"
	icon_state = "med_hall_2"

/area/outpost/medical/storage
	name = "Storage"
	icon_state = "med_storage_1"

/area/outpost/medical/small_storage
	name = "Small Storage"
	icon_state = "med_storage_2"

/area/outpost/medical/wc
	name = "Toilet"
	icon_state = "med_wc"

/area/outpost/medical/surgery_1
	name = "Surgery 1"
	icon_state = "surgery_1"

/area/outpost/medical/surgery_2
	name = "Surgery 2"
	icon_state = "surgery_2"

/area/outpost/medical/palata_1
	name = "Palata 1"
	icon_state = "palata_1"

/area/outpost/medical/palata_2
	name = "Palata 2"
	icon_state = "palata_2"

/area/outpost/medical/relax_room
	name = "Medical Restroom"
	icon_state = "med_restroom"

/area/outpost/medical/virology /// Вирусология
	name = "Virology Room"
	icon_state = "virology"

/area/outpost/medical/genetic
	name = "Genetics Room"
	icon_state = "genetic"

/area/outpost/medical/chemestry
	name = "Chemestry Room"
	icon_state = "chemestry"

/area/outpost/medical/cmo
	name = "Chief Medical Officer Room"
	icon_state = "cmo_room"

/// MARK:  ENGINEERING

/area/outpost/engineering/reseption ///
	name = "Engineering Reseption"
	icon_state = "eng_reseption"

/area/outpost/engineering/hall_1 ///
	name = "Engineering Hall 1"
	icon_state = "eng_hall_1"

/area/outpost/engineering/hall_2 ///
	name = "Engineering Hall 2"
	icon_state = "eng_hall_2"

/area/outpost/engineering/ce
	name = "Chief of Engineer"
	icon_state = "ce_room"

/area/outpost/engineering/storages
	name = "Storages"
	icon_state = "storages"

/area/outpost/engineering/storages/storage_1
	name = "Engineering Storage 1"
	icon_state = "eng_storage_1"

/area/outpost/engineering/storages/storage_2
	name = "Engineering Storage 2"
	icon_state = "eng_storage_2"

/area/outpost/engineering/atmos
	name = "Engineering Atmos Room"
	icon_state = "eng_atmos"

/area/outpost/engineering/smes ///
	name = "Engineering SMES Room"
	icon_state = "eng_smes"

/// MARK: LONGUE

/area/outpost/crew/lounge/hall
	name = "Lounge Hall"
	icon_state = "lounge_hall"

/area/outpost/crew/lounge/cab_1
	name = "Lounge Room 1"
	icon_state = "lounge_cab_1"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/lounge/cab_2
	name = "Lounge Room 2"
	icon_state = "lounge_cab_2"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/lounge/cab_3
	name = "Lounge Room 3"
	icon_state = "lounge_cab_3"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/outpost/crew/lounge/cab_4
	name = "Lounge Room 4"
	icon_state = "lounge_cab_4"
	sound_environment = SOUND_AREA_WOODFLOOR

/// MARK: CREW

/area/outpost/crew
	name = "Crew"
	icon_state = "crew"

/area/outpost/crew/cryo
	name = "Cryo"
	icon_state = "cryo"

/area/outpost/crew/wc_1
	name = "Toilet 1"
	icon_state = "crew_wc_1"

/area/outpost/crew/wc_2
	name = "Toilet 2"
	icon_state = "crew_wc_2"

/area/outpost/crew/wc_3
	name = "Toilet 3"
	icon_state = "crew_wc_3"

/area/outpost/crew/wc_4
	name = "Toilet 4"
	icon_state = "crew_wc_4"

/area/outpost/crew/library
	name = "Library"
	icon_state = "library"

/area/outpost/crew/church
	name = "Church"
	icon_state = "church"

/area/outpost/crew/shop_1
	name = "Shop 1"
	icon_state = "shop_1"

/area/outpost/crew/shop_2
	name = "Shop 2"
	icon_state = "shop_2"

/area/outpost/crew/dop_zone_1
	name = "Dop Zone 1"
	icon_state = "dop_zone_1"

/area/outpost/crew/dop_zone_2
	name = "Dop Zone 2"
	icon_state = "dop_zone_2"

/area/outpost/crew/dop_zone_3
	name = "Dop Zone 3"
	icon_state = "dop_zone_3"

/// MARK: BAR

/area/outpost/crew/bar/vip_elysium_zone
	name = "VIP Elysium Zone"
	icon_state = "vip_elysium"
	lighting_colour_tube = "#e5ffd6"
	lighting_colour_bulb = "#c1ffc7"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/crew/bar/vip_zone
	name = "VIP Zone"
	icon_state = "vip"
	lighting_colour_tube = "#f3d6ff"
	lighting_colour_bulb = "#f0c1ff"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/crew/bar/theatre
	name = "Theatre"
	icon_state = "theatre"
	lighting_colour_tube = "#ffd6d6"
	lighting_colour_bulb = "#ffc1c1"

/area/outpost/crew/bar/central_bar
	name = "Central Bar"
	icon_state = "central_bar"
	lighting_colour_tube = "#d6feff"
	lighting_colour_bulb = "#c1ffff"

/area/outpost/crew/bar/bar_zone
	name = "Bar zone"
	icon_state = "zone_bar"

/// MARK: SERVICE

/area/outpost/service
	name = "Service"
	icon_state = "service"

/area/outpost/service/janitor /// Уборщик
	name = "Janitor Room"
	icon_state = "janitor"

/area/outpost/service/barthender /// Бармен
	name = "Barthender Room"
	icon_state = "barthender"

/area/outpost/service/kitchen /// Кухня
	name = "Kitchen"
	icon_state = "kitchen"

/area/outpost/service/freezer /// Холодильник
	name = "Freezer"
	icon_state = "freezer"

/area/outpost/service/bar /// Бар
	name = "Bar"
	icon_state = "bar"

/area/outpost/service/second_bar /// Второй бар
	name = "Second Bar"
	icon_state = "bar_2"

/area/outpost/service/bar_cabin_1 /// Кабинка бара 1
	name = "Bar Cabin 1"
	icon_state = "bar_cabin_1"

/area/outpost/service/bar_cabin_2 /// Кабинка бара 1
	name = "Bar Cabin 2"
	icon_state = "bar_cabin_2"

/area/outpost/service/cafe /// Кафетерий
	name = "Cafe"
	icon_state = "cafe"

/area/outpost/service/hall_1 /// Коридор обслуживания 1
	name = "Service Hall 1"
	icon_state = "service_hall_1"

/area/outpost/service/hall_2 /// Коридор обслуживания 2
	name = "Service Hall 2"
	icon_state = "service_hall_2"

/area/outpost/service/hall_3 /// Коридор обслуживания 3
	name = "Service Hall 3"
	icon_state = "service_hall_3"


/// MARK: SECURITY

/area/outpost/security
	name = "Security"
	icon_state = "sec"

/area/outpost/security/bay
	name = "Bay"
	icon_state = "sec_bay"

/area/outpost/security/detective
	name = "Office detective"
	icon_state = "sec_detectiv"

/area/outpost/security/sb_armory
	name = "SB Armory"
	icon_state = "sec_armory"

/area/outpost/security/armory ///
	name = "Security Armory"
	icon_state = "sec_armory"

/area/outpost/security/hall
	name = "Hall"
	icon_state = "sec_hall"

/area/outpost/security/hall_1///
	name = "Security Hall 1"
	icon_state = "sec_hall_1"

/area/outpost/security/hall_2///
	name = "Security Hall 2"
	icon_state = "sec_hall_2"

/area/outpost/security/reseption///
	name = "Security Reseption"
	icon_state = "sec_reseption"

/area/outpost/security/cells ///
	name = "Security Cells"
	icon_state = "sec_cells"

/area/outpost/security/briefing_room///
	name = "Security Briefing Room"
	icon_state = "sec_brief"

/area/outpost/security/locker_room ///
	name = "Security Locker Room"
	icon_state = "sec_lockers"

/area/outpost/security/ert ///
	name = "Emergency Responce Team Room"
	icon_state = "ert_room"

/area/outpost/security/storage ///
	name = "Security Storage"
	icon_state = "sec_storage"

/area/outpost/security/restroom ///
	name = "Security Restroom"
	icon_state = "sec_restroom"

/area/outpost/security/wc ///
	name = "Security Toilet"
	icon_state = "sec_wc"

/area/outpost/security/medical ///
	name = "Security Medical Room"
	icon_state = "sec_medic"

/area/outpost/security/shuttle ///
	name = "ERT Shuttle"
	icon_state = "ert_shuttle"

/area/outpost/security/interrogation  ///
	name = "Security Interrogation "
	icon_state = "sec_interrogation"

/area/outpost/security/checkpoint_1 ///
	name = "Security Checkpoint 1"
	icon_state = "sec_checkpoint_1"

/area/outpost/security/checkpoint_2 ///
	name = "Security Checkpoint 2"
	icon_state = "sec_checkpoint_2"

/area/outpost/security/checkpoint_3 ///
	name = "Security Checkpoint 3"
	icon_state = "sec_checkpoint_3"

/area/outpost/security/checkpoint_4 ///
	name = "Security Checkpoint 4"
	icon_state = "sec_checkpoint_4"

/area/outpost/security/hos ///
	name = "Head of Security Room"
	icon_state = "hos_room"

/area/outpost/operations/outpost_command
	name = "Outpost Command"
	icon_state = "outpost_command"

/// MARK: ADMINISTRATION

/area/outpost/command/center ///
	name = "Administration Bridge"
	icon_state = "command_bridge"

/area/outpost/command/conference ///
	name = "Administration Conference Room"
	icon_state = "command_conference"

/area/outpost/command/captain ///
	name = "Administration Captain"
	icon_state = "command_captain"

/area/outpost/command/desk ///
	name = "Administration Desk"
	icon_state = "command_desk"

/area/outpost/command/hall_1 ///
	name = "Administration Hall 1"
	icon_state = "command_hall_1"

/area/outpost/command/hall_2 ///
	name = "Administration Hall 2"
	icon_state = "command_hall_2"

/// MARK: VACANT

/area/outpost/vacant_rooms/trash_factory
	name = "Trash Factory"
	icon_state = "trash_factory"

/// MARK: CUSTOM

/area/outpost/custom/extra_room_1 ///
	name = "Extra Room 1"
	icon_state = "extra_room_1"

/area/outpost/custom/extra_room_2 ///
	name = "Extra Room 2"
	icon_state = "extra_room_2"

/area/outpost/custom/extra_room_3 ///
	name = "Extra Room 3"
	icon_state = "extra_room_3"

/area/outpost/custom/extra_room_4 ///
	name = "Extra Room 4"
	icon_state = "extra_room_4"

/area/outpost/custom/extra_room_5 ///
	name = "Extra Room 5"
	icon_state = "extra_room_5"

/area/outpost/custom/extra_room_6 ///
	name = "Extra Room 6"
	icon_state = "extra_room_6"

/area/outpost/custom/stadion ///
	name = "Stadion"
	icon_state = "stadion"

/area/outpost/custom/stadion_arena ///
	name = "Stadion Arena"
	icon_state = "stadion_arena"

/area/outpost/custom/stadion_blue ///
	name = "Stadion Blue Team Room"
	icon_state = "stadion_blue"

/area/outpost/custom/stadion_red ///
	name = "Stadion Red Team Room"
	icon_state = "stadion_red"

/area/outpost/custom/stadion_medical ///
	name = "Stadion Medical Room"
	icon_state = "stadion_med"

/area/outpost/custom/stadion_sec ///
	name = "Stadion Security Room"
	icon_state = "stadion_sec"

/area/outpost/custom/stadion_poker ///
	name = "Stadion Poker Room"
	icon_state = "stadion_poker"

/area/outpost/custom/stadion_fight ///
	name = "Stadion Fight Room"
	icon_state = "stadion_fight"

/area/outpost/custom/stadion_storage ///
	name = "Stadion Storage"
	icon_state = "stadion_storage"

/// MARK: FRACTIONS

/area/outpost/fraction
	name = "Fraction"
	icon_state = "fraction"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/fraction/syndi
	name = "Faction Syndicate"
	icon_state = "faction_syndicate"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/fraction/syndi/room
	name = "Elite Syndicate Room"
	icon_state = "syndie_elite"

/area/outpost/fraction/syndi/donkco_shop
	name = "Donk Co Shop"
	icon_state = "syndi_shop"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/outpost/fraction/nanotrasen
	name = "Faction Nanotrasen"
	icon_state = "faction_nanotrasen"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/fraction/solfed
	name = "Faction Solar Federation"
	icon_state = "faction_solfed"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/fraction/inteq
	name = "Faction InteQ"
	icon_state = "faction_inteq"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/outpost/fraction/separatist
	name = "Faction Separatists"
	icon_state = "faction_separatist"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/// MARK: CARGO

/area/outpost/cargo
	name = "Cargo"
	icon_state = "cargo"

/area/outpost/cargo/hall_1 /// Коридор карго 1
	name = "Cargo Hall 1"
	icon_state = "cargo_hall_1"

/area/outpost/cargo/hall_2 /// Коридор карго 2
	name = "Cargo Hall 2"
	icon_state = "cargo_hall_2"

/area/outpost/cargo/lift_area_1 ///
	name = "Lifts 1"
	icon_state = "lifts_1"

/area/outpost/cargo/lift_area_2 ///
	name = "Lifts 2"
	icon_state = "lifts_2"

/area/outpost/cargo/lift_area_3 ///
	name = "Lifts 3"
	icon_state = "lifts_3"

/area/outpost/cargo/lift_area_4 ///
	name = "Lifts 4"
	icon_state = "lifts_4"

/area/outpost/cargo/lift_hall ///
	name = "Lifts Hall"
	icon_state = "lifts_hall"

/area/outpost/cargo/buy_1 ///
	name = "Cargo Buying Room 1 "
	icon_state = "cargo_buy_1"

/area/outpost/cargo/buy_2 ///
	name = "Cargo Buying Room 2 "
	icon_state = "cargo_buy_2"

/area/outpost/cargo/buy_3 ///
	name = "Cargo Buying Room 3 "
	icon_state = "cargo_buy_3"

/area/outpost/cargo/buy_4 ///
	name = "Cargo Buying Room 4 "
	icon_state = "cargo_buy_4"

/area/outpost/cargo/storage_1 ////
	name = "Main Storage"
	icon_state = "cargo_storage_1"

/area/outpost/cargo/storage_2 ////
	name = "Second Storage"
	icon_state = "cargo_storage_2"

/area/outpost/cargo/storage_3 ////
	name = "Storage 3"
	icon_state = "cargo_storage_3"

/area/outpost/cargo/storage_4 ////
	name = "Storage 4"
	icon_state = "cargo_storage_4"

/area/outpost/cargo/sell_rooms_1 ///
	name = "Selling Room 1"
	icon_state = "sell_1"

/area/outpost/cargo/sell_rooms_2 ///
	name = "Selling Room 2"
	icon_state = "sell_2"

/area/outpost/cargo/qm ///
	name = "Quartermaster Room"
	icon_state = "qm_room"


/// MARK: CARGO FACTION

/area/outpost/cargo/faction
	name = "Cargo faction"
	icon_state = "cargo_bay_faction"
	lighting_colour_tube = "#ffe3cc"
	lighting_colour_bulb = "#ffdbb8"

/area/outpost/cargo/faction/all
	name = "Cargo All"
	icon_state = "cargo_bay_all"

/area/outpost/cargo/faction/all/zone_1
	name = "Cargo All zone 1"
	icon_state = "cargo_bay_1"

/area/outpost/cargo/faction/all/zone_2
	name = "Cargo All zone 2"
	icon_state = "cargo_bay_2"

/area/outpost/cargo/faction/all/zone_3
	name = "Cargo All zone 3"
	icon_state = "cargo_bay_3"

/area/outpost/cargo/faction/all/zone_4
	name = "Cargo All zone 4"
	icon_state = "cargo_bay_4"

/area/outpost/cargo/faction/syndicate
	name = "Cargo Syndi"
	icon_state = "cargo_bay_syndicate"
	lighting_colour_tube = "#f16464"
	lighting_colour_bulb = "#f16464"

/area/outpost/cargo/faction/solfed
	name = "Cargo SolFed"
	icon_state = "cargo_bay_solfed"
	lighting_colour_tube = "#f7ef7c"
	lighting_colour_bulb = "#f7ef7c"

/area/outpost/cargo/faction/inteq
	name = "Cargo InteQ"
	icon_state = "cargo_bay_inteq"
	lighting_colour_tube = "#c0845d"
	lighting_colour_bulb = "#c0845d"

/area/outpost/cargo/faction/nanotrasen
	name = "Cargo Nanotrasen"
	icon_state = "cargo_bay_nt"
	lighting_colour_tube = "#384e68"
	lighting_colour_bulb = "#384e68"
