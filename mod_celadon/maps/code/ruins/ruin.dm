// Пример датума для руинки
// /datum/map_template/ruin/"планета"/"короткое название"
// 	id = "Айди"
// 	name = "Имя руинки для спавна"
// 	description = "Описание"
// 	suffix = "Название файла"
//  cost = "вес руинки"
//  allow_duplicates = FALSE
//  ruin_tags = list("ДЕФАЙНЫ_ТЭГОВ")

// Где: вес может быть в диапазоне от 1 до 5. По умолчанию все руины = 1
// 1 - (Common) — очень распространённая
// 2 - (Scarce) — нечастая
// 3 - (Rare) — редкая
// 4 - (Very Rare) — очень редкая
// 5 - (Extremely Rare) — уникальная

// ruin_tags должен включать 1 тэг из категории сложности
// второй из категории количества лута
// третий и последедующие может быть, а может и нет
// Список всех тэгов code/__DEFINES/ruins.dm
// Пример:
// ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_HAZARDOUS)
// allow_duplicates = FALSE - по умолчанию TRUE. FALSE делает руинку 1 раз спавнящуюся в раунд

//							///
//		MARK: Beach
//							///
/datum/map_template/ruin/beachplanet/fishinghut
	id = "fishinghut"
	name = "Fishing Hut"
	description = "A small fishing hut floating on the ocean."
	suffix = "beach_fishing_hut.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_HARD_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/beachplanet/colony
	id = "beach_colony"
	name = "Abandoned Beachside Colony"
	description = "A abandoned colony. It seems that this colony was abandoned, for a reason or another"
	suffix = "beach_colony.dmm"
	cost = 1

/datum/map_template/ruin/beachplanet/ancient
	id = "beach_ancient"
	name = "Ancient Danger"
	description = "As you draw near the ancient wall, a sense of foreboding overcomes you. You aren't sure why, but you feel this dusty structure may contain great dangers."
	suffix = "beach_ancient_ruin.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/beachplanet/town
	id = "beach_town"
	name = "Beachside Town"
	description = "A fresh town on a lovely coast, where its inhabitants are is unknown."
	suffix = "beach_ocean_town.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_NO_COMBAT, RUIN_TAG_MINOR_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/beachplanet/scrapvillage
	id = "beach_pirate"
	name = "Pirate Village"
	description = "A small pirate outpost formed from the remains of a wrecked shuttle."
	suffix = "beach_pirate_crash.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)
	ruin_mission_types = list(/datum/mission/ruin/signaled/kill/frontiersmen)

/datum/map_template/ruin/beachplanet/treasurecove
	id = "beach_treasure_cove"
	name = "Treasure Cove"
	description = "A abandoned colony. It seems that this colony was abandoned, for a reason or another"
	suffix = "beach_treasure_cove.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)
	ruin_mission_types = list(/datum/mission/ruin/signaled/kill/frontiersmen)

/datum/map_template/ruin/beachplanet/crashedengie
	id = "beach_crashed_engineer"
	name = "Crashed Engineer Ship"
	description = "An abandoned camp built by a crashed engineer"
	suffix = "beach_crashed_engineer.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(/datum/mission/ruin/lost_axe)

/datum/map_template/ruin/beachplanet/floatresort
	id = "beach_float_resort"
	name = "Floating Beach Resort"
	description = "A hidden paradise on the beach"
	suffix = "beach_float_resort.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_NO_COMBAT, RUIN_TAG_MINOR_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/beachplanet/fallenstar
	id = "crashed_star"
	name = "Crashed Starwalker"
	description = "A Crashed Starwalker Class Pirate Ship. It's Crew is Long-Dead."
	suffix = "beach_crashed_starwalker.dmm"
	cost = 2

/datum/map_template/ruin/beachplanet/knight
	id = "knights_rest"
	name = "Knight's Rest"
	description = "An small castle holding the grave of a renowned warrior"
	suffix = "beach_knights_rest.dmm"
	cost = 1

/datum/map_template/ruin/beachplanet/frontiersmen_depot	// NEW
	name = "Frontiersmen Depot"
	id = "beach_bunkers"
	description = "A poorly constructed jumble of bunkers, currently held by the Frontiersmen Fleet for usage as a supply depot."
	suffix = "beach_bunkers.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)
	ruin_mission_types = list(
		/datum/mission/ruin/data_retrieval,
		/datum/mission/ruin/signaled/kill/frontiersmen,
		/datum/mission/ruin/multiple/moonshine_crates
	)

//							///
//		MARK: Icemoon
//							///
/datum/map_template/ruin/icemoon/cultbaroncrash
	id = "cultbaroncrash"
	name = "Cult Baron Crashsite"
	description = "Crashed shuttle of occult nobility"
	suffix = "icemoon_cultbaroncrash.dmm"
	cost = 3

/datum/map_template/ruin/icemoon/hydroponicslab
	id = "hydroponicslab"
	name = "Hydroponics Lab"
	description = "An abandoned hydroponics research facility containing hostile plant fauna."
	suffix = "icemoon_hydroponics_lab.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/icemoon/abandonedvillage
	id = "abandonedvillage"
	name = "Abandoned Village"
	description = "Who knows what lies within?"
	suffix = "icemoon_underground_abandoned_village.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MINOR_LOOT, RUIN_TAG_INHOSPITABLE)
	ruin_mission_types = list(
		/datum/mission/ruin/data_retrieval,
		/datum/mission/ruin/signaled/drill
	)

/datum/map_template/ruin/icemoon/crashed_cap_pod
	id = "crushpod"
	name = "Crush Pod"
	description = "Small wrecked shuttle."
	suffix = "icemoon_crashed_cap_pod.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_HARD_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/icemoon/brazillian_lab
	id = "brazillian-lab"
	name = "Barricaded Compound"
	description = "A conspicuous compound in the middle of the cold wasteland. What goodies are inside?"
	suffix = "icemoon_underground_brazillianlab.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_INHOSPITABLE)

/datum/map_template/ruin/icemoon/crashed_holemaker
	id = "crashed_holemaker"
	name = "Crashed Holemaker"
	description = "Safety records for early Nanotrasen Spaceworks vessels were, and always have been, top of their class. Absolutely no multi-billion credit projects have been painstakingly erased from history. (Citation Needed)"
	suffix = "icemoon_crashed_holemaker.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MINOR_LOOT, RUIN_TAG_SHELTER)
	ruin_mission_types = list(/datum/mission/ruin/data_retrieval)

/datum/map_template/ruin/icemoon/engioutpost
	id = "engioutpost"
	name = "Engineer Outpost"
	description = "Blown up by an unfortunate accident."
	suffix = "icemoon_surface_engioutpost.dmm"
	cost = 2

/datum/map_template/ruin/icemoon/corpreject
	id = "corpreject"
	name = "NT Security Solutions Site Gamma"
	description = "Nanotrasen Corporate Security Solutions vault site Gamma."
	suffix = "icemoon_surface_corporate_rejects.dmm"
	cost = 4

/datum/map_template/ruin/icemoon/syndicate_outpost
	id = "syndicate-outpost-icemoon"
	name = "Abandoned Syndicate Outpost"
	description = "A outpost that used to be a staging area for nuclear operatives. The Syndicate have moved to another location, but this still remains."
	suffix = "icemoon_underground_abandoned_newcops.dmm"
	cost = 4

/datum/map_template/ruin/icemoon/drakelair
	id = "drake-lair"
	name = "Dragon's Lair"
	description = "\"First the creature's Flame breathed from beneath the stone, Hot battle-fumes, and the earth rumbled.\""
	suffix = "icemoon_underground_drakelair.dmm"
	cost = 4

/datum/map_template/ruin/icemoon/icemoon_raided_cargobase
	id = "raided_cargobase"
	suffix = "icemoon_raided_cargobase.dmm"
	name = "Raided Cargo Outpost"
	description = "A cargo outpost that got raided by some space pirates"
	cost = 3

/datum/map_template/ruin/icemoon/icemoon_solfed
	id = "solfed_prison"
	name = "Solar Federation Prison"
	suffix = "icemoon_underground_solfed_prison.dmm"
	description = "The prison is a temporary detention outpost for criminals awaiting sentencing or transfer to the main prison."
	cost = 2

/datum/map_template/ruin/icemoon/hydroponicsla
	id = "teslalab"
	name = "Tesla Lab"
	suffix = "icemoon_tesla_lab.dmm"
	description = "The destroyed SolFed laboratory for the development of a new type of engine."
	cost = 5
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(
		/datum/mission/ruin/blackbox,
		/datum/mission/ruin/daughter
	)

/datum/map_template/ruin/icemoon/ice_lodge	// NEW
	name = "Ice Lodge"
	id = "ice_lodge"
	description = "Records show this settlement as belonging to the SRM, but no one has heard from them as of late. I wonder what happened?"
	suffix = "icemoon_ice_lodge.dmm"
	cost = 4
	ruin_tags = list(RUIN_TAG_HARD_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(/datum/mission/ruin/fallen_montagne)

//							///
//		MARK: Jungle
//							///
/datum/map_template/ruin/jungle/oldntobservatory
	id = "oldntobservatory"
	name = "Elysium Reclaimed Observatory"
	description = "Old NT Observatory, not owned by Elysium Pseudoscientists."
	suffix = "jungle_observatory.dmm"
	cost = 3

/datum/map_template/ruin/jungle/syndicate
	id = "syndicatebunkerjungle"
	name = "Jungle Syndicate Bunker"
	description = "A small bunker owned by the Syndicate."
	suffix = "jungle_syndicate.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)
	ruin_mission_types = list(
		/datum/mission/ruin/nt_files,
		/datum/mission/ruin/signaled/kill/jerry
	)

/datum/map_template/ruin/jungle/interceptor
	id = "crashedcondor"
	name = "Old Crashed Interceptor"
	description = "An overgrown crashed Condor Class, a forgotten remnant of the Corporate Wars."
	suffix = "jungle_interceptor.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_NO_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/jungle/paradise
	id = "paradise"
	name = "Hidden paradise"
	description = "a crashed shuttle, and a hidden beautiful lake."
	suffix = "jungle_paradise.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/jungle/airbase
	id = "airbase"
	name = "Bombed Airbase"
	description = "A bombed out airbase from the ICW, taken back over by nature"
	suffix = "jungle_bombed_starport.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_HAZARDOUS, RUIN_TAG_LIVEABLE)
	ruin_mission_types = list(
		/datum/mission/ruin/signaled/kill/ramzi/airbase,
		/datum/mission/ruin/icw_documents
	)

/datum/map_template/ruin/jungle/medtech
	id = "medtech-facility"
	name = "MedTech facility"
	description = "A MedTech pharmaceutical manufacturing plant where something went terribly wrong."
	suffix = "jungle_medtech_outbreak.dmm"
	cost = 4
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/jungle/cavecrew
	id = "cavecrew"
	name = "Frontiersmen Cave"
	description = "A frontiersmen base, hidden within a cave. They don't seem friendly"
	suffix = "jungle_cavecrew.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_HAZARDOUS, RUIN_TAG_LIVEABLE, RUIN_TAG_MAJOR_LOOT)
	ruin_mission_types = list(
		/datum/mission/ruin/signaled/kill/frontiersmen,
		/datum/mission/ruin/data_retrieval
	)

/datum/map_template/ruin/jungle/library
	id = "abandoned-library"
	name = "Abandoned Library"
	description = "A forgotten library, with a few angry monkeys."
	suffix = "jungle_abandoned_library.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/jungle/jungle_botany_ruin
	id = "jungle_botany-ruin"
	name = "Ruined Botany Research Facility"
	description = "A research facility of great botany discoveries. Long since abandoned, willingly or not..."
	suffix = "jungle_botany.dmm"
	cost = 1

/datum/map_template/ruin/jungle/ai_ikea
	id = "ikea-ai"
	name = "Space Ikea AI Shipment"
	description = "A Space Ikea Brand AI Core and Necessities Crate, it seems to have missed its intended target."
	suffix = "jungle_surface_ikea_ai.dmm"
	cost = 2

/datum/map_template/ruin/jungle/coffinpirate
	id = "coffinpirate"
	name = "Coffin-Shaped Pirate Hut"
	description = "An odd coffin shaped pirate hut that the inhabitant of died in."
	suffix = "jungle_surface_coffinpirate.dmm"
	cost = 1

//far more tasteful than its predecessor...
/datum/map_template/ruin/jungle/lessonintrickery
	id = "bombmakers-cabin"
	name = "Bombmaker's Cabin"
	description = "Playing with bombs again, are we?"
	suffix = "jungle_surface_bombmakers_cabin.dmm"
	cost = 1

/datum/map_template/ruin/jungle/weedshack
	id = "weed-shack"
	name = "Stoner's Cabin"
	description = "The Industrial Revolution and its consequences have been a disaster for the human race."
	suffix = "jungle_surface_weed_shack.dmm"
	cost = 1

//vae's jungle ruins from bungalowstation
/datum/map_template/ruin/jungle/pizzawave
	id = "pizzawave"
	name = "Jungle Pizzawave"
	description = "Get some pizza my dude."
	suffix = "jungle_pizzawave.dmm"
	cost = 1

/datum/map_template/ruin/jungle/nest
	id = "xenonestjungle"
	name = "Jungle Xenonest"
	description = "A Xeno nest crammed into the Jungle."
	suffix = "jungle_nest.dmm"
	cost = 2

/datum/map_template/ruin/jungle/seedling
	id = "seedling"
	name = "Seedling ruin"
	description = "A rare seedling plant."
	suffix = "jungle_seedling.dmm"
	cost = 1

/datum/map_template/ruin/jungle/hangar
	id = "hangar"
	name = "Abandoned Hangar"
	description = "An abandoned hangar containing exosuits."
	suffix = "jungle_hangar.dmm"
	cost = 2

/datum/map_template/ruin/jungle/pirate
	id = "piratejungle"
	name = "Jungle Pirates"
	description = "A group of pirates on a small ship in the jungle."
	suffix = "jungle_pirate.dmm"
	cost = 2

/datum/map_template/ruin/jungle/vamplab
	id = "vamp-lab"
	name = "Vampire laboratory"
	description = "A Laboratory for the development of the drug 'Vita-Null+X', which will help cure vampirism, or not.."
	suffix = "jungle_vamplab.dmm"
	cost = 5
	allow_duplicates = FALSE

/datum/map_template/ruin/jungle/roommates
	id = "roommates"
	name = "Roommates"
	description = "A shack once inhabited by a clown and a mime... and they were roommates."
	suffix = "jungle_surface_roommates.dmm"
	cost = 1

/datum/map_template/ruin/jungle/ninjashrine
	id = "ninjashrine"
	name = "Ninja Shrine"
	description = "A ninja shrine."
	suffix = "jungle_surface_ninjashrine.dmm"
	cost = 2

//							///
//		MARK: Lavaland
//							///
/datum/map_template/ruin/lavaland/funmaze
	name = "fun maze"
	id = "funmaze"
	description = "very fanny maze."
	suffix = "lavaland_fun_maze.dmm"
	cost = 4

/datum/map_template/ruin/lavaland/bubble_outpost
	id = "bubble-outpost"
	name = "Distress Outpost"
	description = "This mining outpost started transfering distress signal just a moment ago."
	suffix = "lavaland_surface_bubbleOutpost.dmm"
	cost = 3

/datum/map_template/ruin/lavaland/biodome/winter
	id = "biodome-winter"
	name = "Solarian Winter Biodome"
	description = "A Solarian frontier research facility created by the Pionierskompanien \
	This one seems to simulate the wintery climate of the northern provinces, including a sauna!"
	suffix = "lavaland_surface_biodome_winter.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MINOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/lavaland/buried_shrine
	id = "buried_shrine"
	name = "Buried Shrine"
	description = "An ancient temple belonging to some long-gone inhabitants, wrecked and buried by the volcanic activity of it's home planet."
	suffix = "lavaland_surface_buried_shrine.dmm"
	cost = 2
	ruin_mission_types = list(/datum/mission/ruin/signaled/kill/elite)

/datum/map_template/ruin/lavaland/lava_canyon
	id = "lava_canyon"
	name = "Lava Canyon"
	description = "Tectonic activity has gouged a large fissure into the surface of the planet here. Tucked in the crevasse, the remains of an ashwalker village lay in ashes."
	suffix = "lavaland_surface_lava_canyon.dmm"
	cost = 2

/datum/map_template/ruin/lavaland/wrecked_factory
	id = "wreck_factory"
	name = "Wrecked Factory"
	description = "A  Nanotrasen processing facility, assaulted by a pirate raid that has killed most of the staff. The offices however, remain unbreached for now."
	suffix = "lavaland_surface_wrecked_factory.dmm"
	cost = 4
	ruin_mission_types = list(
		/datum/mission/ruin/nanotrasen_docs,
		/datum/mission/ruin/captain_medal,
		/datum/mission/ruin/brainchip
	)

/datum/map_template/ruin/lavaland/fallenstar
	id = "crashed_star"
	name = "Crashed Starwalker"
	description = "A crashed pirate ship. It would seem that it's crew died a while ago."
	suffix = "lavaland_crashed_starwalker.dmm"
	cost = 2
	ruin_mission_types = list(/datum/mission/ruin/blackbox)

/datum/map_template/ruin/lavaland/hierophant
	id = "hierophant"
	name = "Hierophant's Arena"
	description = "A strange, square chunk of metal of massive size. Inside awaits only death and many, many squares."
	suffix = "lavaland_surface_hierophant.dmm"
	allow_duplicates = FALSE
	cost = 3

/datum/map_template/ruin/lavaland/xeno_nest
	id = "xeno-nest"
	name = "Xenomorph Nest"
	description = "These xenomorphs got bored of horrifically slaughtering people on space stations, and have settled down on a nice lava-filled hellscape to focus on what's really important in life. \
	Quality memes."
	suffix = "lavaland_surface_xeno_nest.dmm"
	cost = 3

/datum/map_template/ruin/lavaland/pizza
	id = "pizza"
	name = "Ruined Pizza Party"
	description = "Little Timmy's birthday pizza bash took a turn for the worse when a bluespace anomaly passed by."
	suffix = "lavaland_surface_pizzaparty.dmm"
	cost = 2
	allow_duplicates = FALSE

/datum/map_template/ruin/lavaland/hermit
	id = "hermitcave"
	name = "Makeshift Shelter"
	description = "A place of shelter for a lone hermit, scraping by to live another day."
	suffix = "lavaland_surface_hermit.dmm"
	cost = 4
	allow_duplicates = FALSE

/datum/map_template/ruin/lavaland/comm_outpost
	id = "commoutpost"
	name = "Syndicate Comm Outpost"
	description = "A forgotten outpost home to only a tragic tale."
	suffix = "lavaland_surface_comm_outpost.dmm"
	cost = 1
	allow_duplicates = FALSE

/datum/map_template/ruin/lavaland/dwarffortress
	id = "dwarffortress"
	name = "Legion infested Dwarf Fortress"
	description = "A forgotten fortress home to only a tragic tale and infested corpses."
	suffix = "lavaland_surface_dwarffortress.dmm"
	cost = 1
	allow_duplicates = FALSE

/datum/map_template/ruin/lavaland/spookycrash
	id = "spooky_crash"
	name = "Spooky Crash"
	description = "A spooky looking crash."
	suffix = "lavaland_surface_SPOOKYCRASH.dmm"
	cost = 1

/datum/map_template/ruin/lavaland/crashedpinnance
	id = "crashed_pinnance"
	name = "Crashed Research Pinnance"
	description = "A crashed shuttlecraft, looks like the pilot didn't make it."
	suffix = "lavaland_surface_crashed_pinnance.dmm"
	cost = 1

/datum/map_template/ruin/lavaland/codelab
	id = "codelab"
	name = "Nanotrasen Genetic Research Facility"
	description = "A Nanotrasen genetic research facility, abandoned and ripe for looting. Whats that goo over there?"
	suffix = "lavaland_surface_codelab.dmm"
	cost = 1

/datum/map_template/ruin/lavaland/falling_heron
	id = "crashed_heron"
	name = "Crashed Heron"
	description = "A crashed nanotrasen ship Heron-class. It would seem that it's crew died a while ago."
	suffix = "lavaland_crashed_heron.dmm"
	cost = 5
	allow_duplicates = FALSE

/datum/map_template/ruin/lavaland/abandonedlisteningpost	// NEW
	name = "Abandoned Listening Post"
	id = "abandonedlistening"
	description = "An abandoned Cybersun listening post. Seems like the Ramzi Clique has an interest in the site."
	suffix = "lavaland_abandonedlisteningpost.dmm"
	cost = 2
	ruin_mission_types = list(/datum/mission/ruin/blackbox)

//							///
//		MARK: Rockplanet
//							///
/datum/map_template/ruin/rockplanet/harmfactory
	id = "rockplanet_harmfactory"
	name = "Harm Factory"
	description = "A factory made for HARM and AGONY."
	suffix = "rockplanet_harmfactory.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/rockplanet/budgetcuts
	id = "rockplanet_budgetcuts"
	name = "Budgetcuts"
	description = "Nanotrasen's gotta lay off some personnel, and this facility hasn't been worth the effort so far"
	suffix = "rockplanet_budgetcuts.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_HARD_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/rockplanet/shippingdock
	id = "rockplanet_shippingdock"
	name = "Abandoned Shipping Dock"
	description = "An abandoned shipping dock used by small cargo freighters and smugglers alike. Some malicious group seems to have trapped the place to eliminate scavengers."
	suffix = "rockplanet_shippingdock.dmm"
	cost = 2
	ruin_mission_types = list(
		/datum/mission/ruin/bitch_wife,
	)

/datum/map_template/ruin/rockplanet/nomadcrash
	id = "rockplanet_nomadcrash"
	name = "Nomad Crash"
	description = "A Crashed Arrow & Axe Interceptor. A long forgotten Crew. They tried their best to survive..."
	suffix = "rockplanet_nomadcrash.dmm"
	cost = 1

/datum/map_template/ruin/rockplanet/heirophant
	id = "rockheiro"
	name = "Ancient Heirophant"
	description = "something dangerous"
	suffix = "rockplanet_heirophant.dmm"
	cost = 4

/datum/map_template/ruin/rockplanet/mining_expedition
	id = "expedition"
	name = "Mining Expedition"
	description = "A mining operation gone wrong."
	suffix = "rockplanet_miningexpedition.dmm"
	cost = 2

/datum/map_template/ruin/rockplanet/mining_base
	id = "rockplanet_mining_base"
	name = "N+S Mining Installation"
	description = "A N+S mining installation recently fallen prey to a band of Ramzi pirates."
	suffix = "rockplanet_mining_installation.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)
	ruin_mission_types = list(
		/datum/mission/ruin/signaled/drill/mining_base,
		/datum/mission/ruin/ns_manager,
	)

/datum/map_template/ruin/rockplanet/boxsci
	id = "abandonedscience"
	name = "Abandoned science wing"
	description = "A chunk of a station that broke off.."
	suffix = "rockplanet_boxsci.dmm"
	cost = 2

/datum/map_template/ruin/rockplanet/crash_cult
	id = "crash_cult"
	name = "Crashed Exploration Clipper"
	description = "A crashed exploration vessel. Hivebots are taking this ship apart for scrap."
	suffix = "rockplanet_crash.dmm"
	cost = 1

/datum/map_template/ruin/rockplanet/saloon
	id = "rockplanet_saloon"
	name = "Abandoned saloon"
	description = "For whatever reason, someone decided to make a colony with a indie style."
	suffix = "rockplanet_saloon.dmm"
	cost = 2

/datum/map_template/ruin/rockplanet/distillery
	id = "rockplanet_distillery"
	name = "Frontiersman Distillery"
	description = "A former pre-ICW era Nanotrasen outpost converted into a moonshine distillery by Frontiersman bootleggers."
	suffix = "rockplanet_distillery.dmm"
	cost = 3
	ruin_mission_types = list(
		/datum/mission/ruin/signaled/kill/frontiersmen,
		/datum/mission/ruin/multiple/moonshine_crates/distillery
	)

/datum/map_template/ruin/rockplanet/lasttemplar
	id = "lasttemplar"
	name = "Last Templar"
	description = "A containment zone built around a certain creature..."
	suffix = "rockplanet_lasttemplar.dmm"
	cost = 3

/datum/map_template/ruin/rockplanet/rust_base	// NEW
	id = "rockplanet_rustbase"
	name = "ISV Rust Base"
	description = "A crashed Ramzi Clique vessel that has since become an isolated pirate outpost."
	suffix = "rockplanet_rustbase.dmm"
	cost = 1
	ruin_mission_types = list(
		/datum/mission/ruin/signaled/kill/bright,
		/datum/mission/ruin/signaled/kill/amuro,
	)

//							///
//		MARK: Space
//							///
/datum/map_template/ruin/space/bigderelict1
	id = "bigderelict1"
	name = "Derelict Tradepost"
	description = "A once-bustling tradestation that handled imports and exports from nearby stations now lays eerily dormant. \
	The last received message was a distress call from one of the on-board officers, but we had no success in making contact again."
	suffix = "bigderelict1.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/astraeus
	id = "astraeus"
	name = "Astraeus Ruin"
	description = "This vessel served a lengthy period in the Nanotrasen fleet, before an accident in the munitions bay caused to to be destroyed while in active combat."
	suffix = "astraeus.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_INHOSPITABLE)

/datum/map_template/ruin/space/singularitylab
	id = "singularitylab"
	name = "Singularity Lab"
	description = "An overgrown facility, home to an unstarted singularity and many plants"
	suffix = "singularity_lab.dmm"
	cost = 5
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/spacemall
	id = "spacemall"
	name = "Space Mall"
	description = "An old shopping centre, owned by a former member of Nanotrasen's board of directors.."
	suffix = "spacemall.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/vaporwave
	id = "vaporwave"
	name = "Aesthetic Outpost"
	description = "Pause and remember-- You are unique.You are special. Every mistake, trial, and hardship has helped to sculpt your real beauty. \
	Stop hating yourself and start appreciating and loving yourself!"
	suffix = "vaporwave.dmm"
	cost = 1

/datum/map_template/ruin/space/hellfactory
	id = "hellfactory"
	name = "Heck Brewery"
	description = "An abandoned warehouse and brewing facility, which has been recently rediscovered. Reports claim that the security system entered an ultra-hard lockdown, but these reports are inconclusive."
	suffix = "hellfactory.dmm"
	cost = 1

/datum/map_template/ruin/space/cryocontainment
	id = "cryocontainment"
	name = "Cryogenic Containment Facility"
	description = "Some old facility where they stored something in a cryotube to experiement on, obviously it got out and now the only thing it contains is Space Carps."
	suffix = "cryocontainment.dmm"
	cost = 2

/datum/map_template/ruin/space/dangerous_research
	id = "dangerous_research"
	name = "Occult Research Station"
	description = "This station was deemed unsuitable for continued experiments, and quickly abandoned."
	suffix = "dangerous_research.dmm"
	cost = 2

/datum/map_template/ruin/space/macspace
	id = "fast_food"
	name = "Mac Space Restaurant"
	description = "A fast food reataurant in space."
	suffix = "Fast_Food.dmm"
	cost = 1

/datum/map_template/ruin/space/scav_mining
	id = "mining_asteroid"
	name = "Mining asteroid"
	description = "An abandoned mining operation on an asteroid that now has new ocupants that is not happy to se you"
	suffix = "scav_mining.dmm"
	cost = 1

/datum/map_template/ruin/space/transport18
	id = "transport18"
	name = "Booze Cruise"
	description = "A freighter, damaged beyond repair and surrounded by a cloud of aluminium and... beer foam?"
	suffix = "transport18.dmm"
	cost = 2

/datum/map_template/ruin/space/fueldepot
	id = "fueldepot"
	name = "Fuel Depot"
	description = "An orbital refueling station with the remains of a ship lodged among the debris."
	suffix = "fueldepot.dmm"
	cost = 1

/datum/map_template/ruin/space/ntfacility
	id = "ntfacility"
	name = "Abandoned Facility"
	description = "A NT research station. Something has gone horribly wrong here."
	suffix = "ntfacility.dmm"
	cost = 4

/datum/map_template/ruin/space/syndicircle
	id = "provinggrounds"
	name = "Syndicate Battle Sphere"
	description = "The Syndicate Battle Sphere, complete with guns!"
	suffix = "provinggrounds.dmm"
	cost = 4

/datum/map_template/ruin/space/oldstation
	id = "oldstation"
	name = "Old Station"
	description = "The old destroyed network of stations Alpha, Beta, Charlie, Tetta"
	suffix = "oldstation.dmm"
	cost = 5
	allow_duplicates = FALSE

/datum/map_template/ruin/space/scrapstation
	id = "scrapstation"
	suffix = "scrapstation.dmm"
	name = "Ramzi Scrapping Station"
	description = "A Syndicate FOB dating back to the ICW, now home to the Ramzi Clique and their latest haul."
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)
	ruin_mission_types = list(
		/datum/mission/ruin/pgf_captain,
		/datum/mission/ruin/signaled/kill/foreman
	)

//							///
//		MARK: WastePlanet
//							///
/datum/map_template/ruin/wasteplanet/pandora
	id = "pandora_arena"
	name = "Pandora Arena"
	description = "Some... thing has settled here."
	suffix = "wasteplanet_pandora.dmm"
	cost = 4
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_MEGAFAUNA, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/wasteplanet/radiation
	id = "wasteplanet_radiation"
	name = "Honorable deeds storage"
	description = "A dumping ground for nuclear waste."
	suffix = "wasteplanet_unhonorable.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/wasteplanet/abandoned_mechbay
	id = "abandoned_mechbay"
	name = "Abandoned Mech Bay"
	description = "A military base formerly used for staging 4 mechs and crew. God knows what's in it now."
	suffix = "wasteplanet_abandoned_mechbay.dmm"
	cost = 4
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(
		/datum/mission/ruin/data_retrieval,
		/datum/mission/ruin/my_mech
	)

/datum/map_template/ruin/wasteplanet/fortress
	id = "solitude"
	name = "Fortress of Solitide"
	description = "A fortress, although one you are probably more familiar with."
	suffix = "wasteplanet_fortress_of_solitide.dmm"
	cost = 3

/datum/map_template/ruin/wasteplanet/oreprocess
	id = "oreprocess"
	name = "Ore Processing Facility"
	description = "A fortress, although one you are probably more familiar with.."
	suffix = "wasteplanet_ore_proccessing_facility.dmm"
	cost = 3

/datum/map_template/ruin/wasteplanet/tradepost	// NEW
	id = "wasteplanet_tradepost"
	name = "Ruined Tradepost"
	description = "Formerly a functioning, if not thriving tradepost. Now a graveyard of Inteq soldiers and hivebots."
	suffix = "wasteplanet_tradepost.dmm"
	cost = 2
	ruin_mission_types = list(
		/datum/mission/ruin/dead_vanguard
	)

/datum/map_template/ruin/wasteplanet/tarpit
	id = "tarpit"
	name = "Tar pit"
	description = "A facility once constructed over a asphalt deposit."
	suffix = "wasteplanet_tarpit.dmm"
	cost = 2

/datum/map_template/ruin/wasteplanet/crash_kitchen
	id = "crash_kitchen"
	name = "Crashed Kitchen"
	description = "A crashed part of some unlucky ship."
	suffix = "wasteplanet_crash_kitchen.dmm"
	cost = 1

/datum/map_template/ruin/wasteplanet/crahsed_abductor_ship
	id = "crash_abductor_ship"
	name = "Crashed Abductor Ship"
	description = "A crashed abductor ship with something horrible goi'n inside."
	suffix = "wasteplanet_ruined_abductor_ship.dmm"
	cost = 3

/datum/map_template/ruin/wasteplanet/abondoned_containment
	id = "claw_waste"
	name = "Abandoned containment area"
	description = "A containment zone that contains an unknown creature called 'Claws'. For some unknown reason, there is a crashed ship called 'Dareсt' near the containment zone."
	suffix = "wasteplanet_claw_ruin.dmm"
	cost = 5

/datum/map_template/ruin/wasteplanet/yard	// NEW
	id = "wasteplanet_yard"
	name = "Abandoned Miskilamo salvage yard"
	description = "An abandonded shipbreaking yard."
	suffix = "wasteplanet_yard.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/wasteplanet/icwbase	// NEW
	id = "wasteplanet_icwbase"
	name = "ICW Era Comms and Medical base."
	description = "A former Syndicate Coalition base during the ICW, left to waste. It seems it has some new residents.."
	suffix = "wasteplanet_icwbase.dmm"
	cost = 4
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(
		/datum/mission/ruin/multiple/notes,
		/datum/mission/ruin/signaled/kill/kitt
	)

//							///
//		MARK: Whitesand
//							///
/datum/map_template/ruin/whitesands/medipen_plant
	id = "medipenplant"
	name = "Abandoned Medipen Factory"
	description = "A once prosperous autoinjector manufacturing plant."
	suffix = "whitesands_surface_medipen_plant.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_NO_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/whitesands/pubbyslopcrash
	id = "ws-pubbyslopcrash"
	name = "Pubby Slop Crash"
	description = "A failed attempt of the Nanotrasen nutrional replacement program"
	suffix = "whitesands_surface_pubbyslopcrash.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER)

//////////OUTSIDE SETTLEMENTS/RUINS//////////
/datum/map_template/ruin/whitesands/survivors/saloon
	id = "ws-saloon"
	name = "Hermit Saloon"
	description = "A western style saloon, most popular spot for the hermits to gather planetside"
	suffix = "whitesands_surface_camp_saloon.dmm"
	cost = 4
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_INHOSPITABLE)

/datum/map_template/ruin/whitesands/survivors/combination //combined extra large ruin of several other whitesands survivor ruins
	id = "ws-combination"
	name = "Wasteland Survivor Village"
	description = "A small encampment of nomadic survivors of the First Colony, and their descendants. By all accounts, feral and without allegance to anyone but themselves."
	suffix = "whitesands_surface_camp_combination.dmm"
	cost = 3
	allow_duplicates = FALSE
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_INHOSPITABLE, RUIN_TAG_HAZARDOUS)

/datum/map_template/ruin/whitesands/starfury_crash
	id = "starfurycrash"
	name = "Starfury Crash"
	description = "The remains of an unidentified syndicate battleship has crashed here."
	suffix = "whitesands_surface_starfurycrash.dmm"
	cost = 3
	allow_duplicates = FALSE

/datum/map_template/ruin/whitesands/assaultpodcrash
	id = "ws-assaultpodcrash"
	name = "Crashed Syndicate Assault Drop Pod"
	description = "The fauna of desert planets can be deadly even to equipped Syndicate Operatives."
	suffix = "whitesands_surface_assaultpodcrash.dmm"
	cost = 2

/datum/map_template/ruin/whitesands/conveniencestore
	id = "ws-conveniencestore"
	name = "Conveniently Abandoned Convenience Store"
	description = "Pretty convenient that they have a convenience store out here, huh?"
	suffix = "whitesands_surface_conveniencestore.dmm"
	cost = 1

/datum/map_template/ruin/whitesands/onlyaspoonful
	id = "ws-onlyaspoonful"
	name = "Abandoned Spoon Factory"
	description = "Literally a fucking spoon factory"
	suffix = "whitesands_surface_onlyaspoonful.dmm"
	cost = 5

/datum/map_template/ruin/whitesands/chokepoint
	id = "ws-chokepoint"
	name = "Chokepoint"
	description = "Some sort of survivors, brandishing old nanotrasen security gear."
	suffix = "whitesands_surface_chokepoint.dmm"
	cost = 1

/datum/map_template/ruin/whitesands/survivors/drugstore
	id = "ws-drugstore"
	name = "Abandoned Store"
	description = "A store that once sold a variety of items and equipment."
	suffix = "whitesands_surface_camp_drugstore.dmm"
	cost = 3

/datum/map_template/ruin/whitesands/e11_manufactory
	id = "ws-e11manufactory"
	name = "E-11 Manufacturing Plant"
	description = "An old Eoehoma Firearms manufacturing plant dedicated to assembly of the beloved-by-many E-11 rifle."
	suffix = "whitesands_surface_e11_manufactory.dmm"
	cost = 3
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(/datum/mission/ruin/multiple/e11_stash)

/datum/map_template/ruin/whitesands/ruinsofweh
	id = "ws-ruinsofweh"
	name = "Ruins of Weh"
	description = "Ancient shrine which was rediscovered many times, yet every expedition turn into a disaster, it still holds many secrets within its walls."
	suffix = "whitesands_surface_ruinsofweh.dmm"
	cost = 4

/datum/map_template/ruin/whitesands/cave_base	// NEW
	name = "Abandoned Cave Base"
	id = "cave_base"
	description = "The former home of a poor sod on observation duty. Now a cunning trap."
	suffix = "whitesands_cave_base.dmm"
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/whitesands/brazillian_lab	// NEW
	name = "Hermit Weapons-Testing Compound"
	id = "brazillian-lab"
	description = "A conspicuous compound in the middle of the sandy wasteland. What goodies are inside?"
	suffix = "whitesands_brazillianlab.dmm"
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_INHOSPITABLE)

//							///
//		MARK: Plasma
//							///
/datum/map_template/ruin/plasma_gaint/oldminer
	id = "ps-oldminer"
	name = "oldminer"
	description = "The base of an old and experienced miner"
	suffix = "oldminer.dmm"
	cost = 2

/datum/map_template/ruin/plasma_gaint/dragon
	id = "ps-dragon"
	name = "dragon"
	description = "An ancient and terrible dragon that lived for several centuries and ate hundreds of souls."
	suffix = "dragon.dmm"
	cost = 5
	allow_duplicates = FALSE

//							///
//		MARK: EarthSand
//							///
/datum/map_template/ruin/earth_sand/el_town
	id = "el_town"
	name = "eltown"
	description = "Town of Elysium"
	suffix = "el_town.dmm"
	cost = 0

/datum/map_template/ruin/earth_sand/el_citadel
	id = "el_citadel"
	name = "elcitadel"
	description = "Fortress of Elysium"
	suffix = "el_citadel.dmm"
	cost = 0

//							///
//		MARK: Anima
//							///
/datum/map_template/ruin/anima/abondoned_containment
	id = "claw_anima"
	name = "Abandoned containment area"
	description = "A containment zone that contains an unknown creature called 'Claws'. For some unknown reason, there is a crashed ship called 'Dareсt' near the containment zone."
	suffix = "anima_claw_ruin.dmm"
	cost = 4

/datum/map_template/ruin/anima/ice_drake
	id = "ice_drake_anima"
	name = "Dragon's Lair"
	description = "\"First the creature's Flame breathed from beneath the stone, Hot battle-fumes, and the earth rumbled.\""
	suffix = "anima_dragon_ice.dmm"
	cost = 4

/datum/map_template/ruin/anima/plasma_drake
	id = "plasma_dragon_anima"
	name = "Large Dragon's Lair"
	description = "An ancient and terrible dragon that lived for several centuries and ate hundreds of souls."
	suffix = "anima_dragon_plasma.dmm"
	cost = 5
	allow_duplicates = FALSE

/datum/map_template/ruin/anima/heirophant
	id = "heirophant_anima"
	name = "Ancient Heirophant"
	description = "something dangerous"
	suffix = "anima_heirophant.dmm"
	cost = 3

/datum/map_template/ruin/anima/old_miner
	id = "old_miner_anima"
	name = "Old Miner"
	description = "The base of an old and experienced miner"
	suffix = "anima_oldminer.dmm"
	cost = 2

/datum/map_template/ruin/anima/pandora
	id = "pandora_arena_anima"
	name = "Pandora Arena"
	description = "Some... thing has settled here."
	suffix = "anima_pandora.dmm"
	cost = 4

/datum/map_template/ruin/anima/crahsed_abductor_ship
	id = "crash_abductor_ship_anima"
	name = "Crashed Abductor Ship"
	description = "A crashed abductor ship with something horrible goi'n inside."
	suffix = "anima_ruined_abductor_ship.dmm"
	cost = 1

//							///
//		MARK: Asteroid
//							///
/datum/map_template/ruin/asteroid/asteroid_crashed_ship
	id = "asteroid_crashed_ship"
	name = "Crashed Asteroid Ship"
	description = "A crashed syndicate ship"
	suffix = "asteroid_crashed_ship.dmm"
	cost = 2

/datum/map_template/ruin/asteroid/abandoned_remora
	id = "abandoned_remora"
	name = "Destroyed Remora Ship"
	description = "A very old syndie ship, abandoned and destroyed by Nanotrasen."
	suffix = "abandoned_remora.dmm"
	cost = 4

/datum/map_template/ruin/asteroid/corporate_mining
	id = "corporate_mining"
	name = "Corporate Mining Module"
	description = "An old and rusty mining facility, with big ore potential."
	suffix = "corporate_mining.dmm"
	cost = 1
	ruin_tags = list(RUIN_TAG_NO_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER)
/datum/map_template/ruin/asteroid/onehalf
	id = "onehalf"
	name = "DK Excavator 453"
	description = "Formerly a thriving planetary mining outpost, now a bit of an exploded mess. One has to wonder how it got here"
	suffix = "onehalf.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_INHOSPITABLE)

/datum/map_template/ruin/asteroid/power_puzzle
	id = "power_puzzle"
	name = "Power Puzzle"
	description = "an abandoned secure storage location. there is no power left in the batteries and the former ocupants locked it pretty tight before leaving.\
	You will have to power areas to raise the bolts on the doors. look out for secrets."
	suffix = "power_puzzle.dmm"
	cost = 2
	ruin_tags = list(RUIN_TAG_MINOR_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER, RUIN_TAG_HAZARDOUS)
	ruin_mission_types = list(/datum/mission/ruin/data_retrieval)

/datum/map_template/ruin/asteroid/singularitylab
	id = "singularitylab"
	name = "Singularity Lab"
	description = "An overgrown facility, home to an unstarted singularity and many plants"
	suffix = "singularity_lab.dmm"
	cost = 5
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)
	ruin_mission_types = list(/datum/mission/ruin/oh_fuck)

/datum/map_template/ruin/asteroid/excavator_DK
	id = "Excavator-DK"
	name = "Excavator DK Class"
	description = "A heavily damaged DK class excavator"
	suffix = "excavator_DK.dmm"
	cost = 1

/datum/map_template/ruin/asteroid/glade
	id = "dark_glade"
	name = "Dark Glade"
	description = "It's always dark in the ancient glade."
	suffix = "dark_glade.dmm"
	cost = 1

/datum/map_template/ruin/asteroid/asteroid_wrecker_outpost
	id = "asteroid_wrecker_outpost"
	name = "Wrecker Outpost"
	description = "A wrecker outpost with wreck ships around it."
	suffix = "asteroid_wrecker_outpost.dmm"
	cost = 3

//							///
//		MARK: Reebe
//							///
/datum/map_template/ruin/reebe
	prefix = "_maps/_mod_celadon/RandomRuins/ReebeRuins/"
	allow_duplicates = FALSE
	cost = 5
	ruin_type = RUINTYPE_YELLOW

/datum/map_template/ruin/reebe/clockwork_arena
	name = "Clockcult Arena"
	id = "clockcultarena"
	description = "A abandoned base, once belonging to clock cultists."
	suffix = "reebe_arena.dmm"
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/reebe/island
	name = "Island Cache"
	id = "islandcache"
	description = "Reebe is full of these things. Something is hidden within here."
	suffix = "reebe_floating_island.dmm"
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MINOR_LOOT, RUIN_TAG_LIVEABLE)

/datum/map_template/ruin/reebe/sm
	name = "Decayed Supermatter"
	id = "smdecay"
	description = "It seems whoever left here was so nice they left very vauluable items behind. How thoughtful."
	suffix = "reebe_decayed_sm.dmm"
	ruin_tags = list(RUIN_TAG_NO_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_LIVEABLE, RUIN_TAG_HAZARDOUS)
