// Modularly set the correct icon file
/obj/machinery/barsign/update_icon_state()
	. = ..()
	// uses tg icon file
	if(!istype(chosen_sign, /datum/barsign/celadon) || icon_state == "empty")
		icon_state = initial(icon_state)
		return

	// uses modular icon file
	if(istype(chosen_sign, /datum/barsign/celadon/large))
		icon = 'mod_celadon/_storge_icons/icons/structures/barsigns/barsigns96x96.dmi'
	else
		icon = 'mod_celadon/_storge_icons/icons/structures/barsigns/barsigns.dmi'

/datum/barsign
	var/neon_color /// The emission color of the neon light
	var/icon_state = "Icon"

/obj/machinery/barsign // All Signs are 64 by 32 pixels, they take two tiles
	name = "bar sign"
	desc = "A bar sign which has not been initialized, somehow. Complain at a coder!"
	icon = 'mod_celadon/_storge_icons/icons/structures/barsigns/barsigns.dmi'
	icon_state = "empty"
	req_access = list(ACCESS_BAR)
	max_integrity = 500
	integrity_failure = 0.5
	// armor_type = /datum/armor/sign_barsign
	// active_power_usage = BASE_MACHINE_ACTIVE_CONSUMPTION * 0.15
	/// Selected barsign being used
	var/datum/barsign/chosen_sign
	/// Do we attempt to rename the area we occupy when the chosen sign is changed?
	var/change_area_name = FALSE
	/// What kind of sign do we drop upon being disassembled?
	// var/disassemble_result = /obj/item/wallframe/barsign

/obj/machinery/barsign/update_appearance(updates=ALL)
	. = ..()
	if(machine_stat & (NOPOWER|BROKEN))
		set_light(0)
		return
	if(chosen_sign && chosen_sign.neon_color)
		set_light(MINIMUM_USEFUL_LIGHT_RANGE, 0.7, chosen_sign.neon_color)

/// CORE CODE - START
/datum/barsign/maltesefalcon
	icon_state = "maltesefalcon"

/datum/barsign/thebark
	icon_state = "thebark"

/datum/barsign/harmbaton
	icon_state = "theharmbaton"

/datum/barsign/thesingulo
	icon_state = "thesingulo"

/datum/barsign/thedrunkcarp
	icon_state = "thedrunkcarp"

/datum/barsign/scotchservinwill
	icon_state = "scotchservinwill"

/datum/barsign/officerbeersky
	icon_state = "officerbeersky"

/datum/barsign/thecavern
	icon_state = "thecavern"

/datum/barsign/theouterspess
	icon_state = "theouterspess"

/datum/barsign/slipperyshots
	icon_state = "slipperyshots"

/datum/barsign/thegreytide
	icon_state = "thegreytide"

/datum/barsign/honkednloaded
	icon_state = "honkednloaded"

/datum/barsign/thenest
	icon_state = "thenest"

/datum/barsign/thecoderbus
	icon_state = "thecoderbus"

/datum/barsign/theadminbus
	icon_state = "theadminbus"

/datum/barsign/oldcockinn
	icon_state = "oldcockinn"

/datum/barsign/thewretchedhive
	icon_state = "thewretchedhive"

// /datum/barsign/robustacafe
// 	icon_state = "robustacafe"

/datum/barsign/emergencyrumparty
	icon_state = "emergencyrumparty"

/datum/barsign/combocafe
	icon_state = "combocafe"

/datum/barsign/vladssaladbar
	icon_state = "vladssaladbar"

/datum/barsign/theshaken
	icon_state = "theshaken"

/datum/barsign/thealenath
	icon_state = "thealenath"

/datum/barsign/hulabrews
	icon_state = "hulabrews"

/datum/barsign/thenet
	icon_state = "thenet"

/datum/barsign/maidcafe
	icon_state = "maidcafe"

/datum/barsign/jackpotbrew
	icon_state = "jackpotbrew"

/datum/barsign/the_lightbulb
	icon_state = "the_lightbulb"

/datum/barsign/goose
	icon_state = "goose"

/datum/barsign/dustydunesaloon
	icon_state = "saloon"

/datum/barsign/birdsnest
	icon_state = "birdsnest"

/datum/barsign/hiddensigns/empbarsign
	icon_state = "empbarsign"

/datum/barsign/hiddensigns/syndibarsign
	icon_state = "syndibarsign"

/datum/barsign/hiddensigns/signoff
	icon_state = "empty"

/// CORE CODE - END

/obj/structure/sign/barsign
	icon = 'mod_celadon/_storge_icons/icons/structures/barsigns/barsigns.dmi'

/datum/barsign/celadon/topmen
	name = "Top Men"
	icon_state = "topmen"
	neon_color = "#C2AACA"

// /datum/barsign/celadon/spaceballgrille
// 	name = "Spaceball Grille"
// 	icon_state = "spaceballgrille"
// 	neon_color = "#827973"

/datum/barsign/celadon/clubee
	name = "Club Bee"
	icon_state = "clubee"
	neon_color = "#F2EEEE"

/datum/barsign/celadon/thesun
	name = "The Sun"
	icon_state = "thesun"
	neon_color = "#F8F0B8"

/datum/barsign/celadon/limbo
	name = "The Limbo"
	icon_state = "limbo"
	desc = "A popular haunt for lost souls. The mood lighting is killer!"
	neon_color = "#777777"

/datum/barsign/celadon/meadbay
	name = "Meadbay"
	icon_state = "meadbay"
	neon_color = "#EBB823"

/datum/barsign/celadon/cindikate
	name = "Cindi Kate's"
	icon_state = "cindikate"
	neon_color = "#FF3403"

/datum/barsign/celadon/theclownshead
	name = "The Clown's Head"
	icon_state = "theclownshead"
	desc = "Home of Headdy, the honking clown head!"
	neon_color = "#FFD800"

/datum/barsign/celadon/theorchard
	name = "The Orchard"
	icon_state = "theorchard"
	neon_color = "#CFFF47"

/datum/barsign/celadon/thesaucyclown
	name = "The Saucy Clown"
	icon_state = "thesaucyclown"
	desc = "A known gathering site for the annual clown courtship rituals."
	neon_color = "#FF66CC"

/datum/barsign/celadon/thedamnwall
	name = "The Damn Wall"
	icon_state = "thedamnwall"
	desc = "When you're up against a wall, it's best to have stout friends and stout liquor right there beside you."
	neon_color = "#CC3333"

// /datum/barsign/celadon/whiskeyimplant
// 	name = "Whiskey Implant"
// 	icon_state = "whiskeyimplant"
// 	neon_color = "#E9F517"

/datum/barsign/celadon/carpecarp
	name = "Carpe Carp"
	icon_state = "carpecarp"
	neon_color = "#C717FE"

/datum/barsign/celadon/robustroadhouse
	name = "Robust Roadhouse"
	icon_state = "robustroadhouse"
	neon_color = "#F7A804"

/datum/barsign/celadon/theredshirt
	name = "The Redshirt"
	icon_state = "theredshirt"
	neon_color = "#FF92E0"

/datum/barsign/celadon/maltesefalconmk2
	name = "Maltese Falcon MK2"
	icon_state = "maltesefalconmk2"
	desc = "The Maltese Falcon mark two, now extra hard boiled."
	neon_color = "#E30000"

/datum/barsign/celadon/thecavernmk2
	name = "The Cavern MK2"
	icon_state = "thecavernmk2"
	desc = "Fine drinks while listening to some fine tunes."
	neon_color = "#AA9393"

/datum/barsign/celadon/lv426
	name = "LV-426"
	icon_state = "lv426"
	desc = "Drinking with fancy facemasks is clearly more important than going to medbay."
	neon_color = "#00F206"

/datum/barsign/celadon/zocalo
	name = "Zocalo"
	icon_state = "zocalo"
	desc = "Anteriormente ubicado en Spessmerica."
	neon_color = "#E5AF1C"

/datum/barsign/celadon/fourtheemprah
	name = "4 The Emprah"
	icon_state = "4theemprah"
	desc = "Enjoyed by fanatics, heretics, and brain-damaged patrons alike."
	neon_color = "#E5AF1C"

/datum/barsign/celadon/ishimura
	name = "Ishimura"
	icon_state = "ishimura"
	desc = "Well known for their quality brownstar and delicious crackers."
	neon_color = "#FF0000"

/datum/barsign/celadon/tardis
	name = "Tardis"
	icon_state = "tardis"
	desc = "This establishment has been through at least 5,343 iterations."
	neon_color = "#2739AA"

/datum/barsign/celadon/quarks
	name = "Quark's"
	icon_state = "quarks"
	desc = "Frequenters of this establishment are often seen wearing meson scanners; how quaint."
	neon_color = "#10E500"

/datum/barsign/celadon/tenforward
	name = "Ten Forward"
	icon_state = "tenforward"
	neon_color = "#E5AF1C"

/datum/barsign/celadon/theprancingpony
	name = "The Prancing Pony"
	icon_state = "theprancingpony"
	desc = "Ok, we don't take to kindly to you short folk pokin' round looking for some ranger scum."
	neon_color = "#FF9100"

/datum/barsign/celadon/vault13
	name = "Vault 13"
	icon_state = "vault13"
	desc = "Coincidence is intentional."
	neon_color = "#FFA800"

/datum/barsign/celadon/thehive
	name = "The Hive"
	icon_state = "thehive"
	desc = "A wildly known, high class eridanian cocktail bar chain."
	neon_color = "#FFC62A"

/datum/barsign/celadon/cantina
	name = "Chalmun's Cantina"
	icon_state = "cantina"
	desc = "The bar was founded on the principles of originality; they have the same music playing 24/7."
	neon_color = "#0078FF"

/datum/barsign/celadon/milliways42
	name = "Milliways 42"
	icon_state = "milliways42"
	desc = "It's not really the end; it's the beginning, meaning, and answer for all your beverage needs."
	neon_color = "#FF00F6"

/datum/barsign/celadon/timeofeve
	name = "The Time of Eve"
	icon_state = "thetimeofeve"
	desc = "Vintage drinks from 2453!."
	neon_color = "#EB52F8"

/datum/barsign/celadon/spaceasshole
	name = "Space Asshole"
	icon_state = "spaceasshole"
	desc = "Open since 2125, Not much has changed since then; the engineers still release the singulo and the damn miners still are more likely to cave your face in that deliver ores."
	neon_color = "#FF0000"

/datum/barsign/celadon/birdcage
	name = "The Bird Cage"
	icon_state = "birdcage"
	desc = "Caw."
	neon_color = "#FFD21E"

/datum/barsign/celadon/narsie
	name = "Narsie Bistro"
	icon_state = "narsiebistro"
	desc = "The last pub before the World's End."
	neon_color = "#FF0000"

/datum/barsign/celadon/fallout
	name = "The Booze Bunker"
	icon_state = "boozebunker"
	desc = "Never duck for cover without a drink!"
	neon_color = "#FCC41B"

/datum/barsign/celadon/brokendreams
	name = "The Cafe of Broken Dreams"
	icon_state = "brokendreams"
	desc = "Try our new dogmeat sliders!"
	neon_color = "#E8E8A5"

/datum/barsign/celadon/toolboxtavern
	name = "Toolbox Tavern"
	icon_state = "toolboxtavern"
	desc = "Free lodging with every Screwdriver purchased!"
	neon_color = ""

/datum/barsign/celadon/blueoyster
	name = "The Blue Oyster"
	icon_state = "blueoyster"
	desc = "The totally heterosexual bar for totally heterosexual men, just come inside and see."
	neon_color = ""

/datum/barsign/celadon/foreign
	name = "Foreign Food Sign"
	icon_state = "foreign"
	desc = "A sign written in some dead language advertising some non-descript foreign food."
	neon_color = ""

/datum/barsign/celadon/commie
	name = "Prole's Preferred"
	icon_state = "commie"
	desc = "The only bar you will ever need, comrade!"
	neon_color = "#E46F6F"

/datum/barsign/celadon/brokenheros
	name = "The Bar of Broken Heros"
	icon_state = "brokenheros"
	desc = "Do you enjoy hurting other people?"
	neon_color = ""

/datum/barsign/celadon/sociallubricator
	name = "The Social Lubricator"
	icon_state = "sociallubricator"
	desc = "The perfect thing to make you like people you hate."
	neon_color = ""

/datum/barsign/celadon/chemlab
	name = "The Chem Lab"
	icon_state = "chemlab"
	desc = "Try our new plasma martinis!"
	neon_color = ""

/datum/barsign/celadon/mime
	name = "Moonshine Mime"
	icon_state = "mime"
	desc = "Silent, not stirred."
	neon_color = ""

/datum/barsign/celadon/clown
	name = "Honking Clown"
	icon_state = "clown"
	desc = "Bananas not included."
	neon_color = ""

/datum/barsign/celadon/progressive
	name = "A Modern and Progressive Tavern"
	icon_state = "progressive"
	desc = "Whatever that means."
	neon_color = "#DB9B9A"

/datum/barsign/celadon/va11halla
	name = "VA-11 HALL-A"
	icon_state = "va11halla"
	desc = "Not as dangerous as N1-RV Ann-A."
	neon_color = "#FB3F7D"

/datum/barsign/celadon/squatopia
	name = "Squatopia"
	icon_state = "squatopia"
	desc = "The crystal belonged to my father. He was murdered."
	neon_color = "#CC0033"

/datum/barsign/celadon/bug
	name = "The Hungry Bug"
	icon_state = "hungrybug"
	desc = "Stop by and enjoy some of the Hole's famous gyoza!"
	neon_color = "#E2B001"

// 96x96 signs

/datum/barsign/celadon/large/cyberslyph
	name = "Cyberslyph"
	icon_state = "cyberslyph"
	neon_color = "#00FFFF"

// 220
/datum/barsign/evahumanspace
	name = "EVA Human in Space"
	icon_state = "evahumanspace"
	desc = "Безопасность - это привелегия."

// /datum/barsign/warpsurf
// 	name = "SS220 Warp Surf"
// 	icon_state = "warpsurf"
// 	desc = "Welcome to the club, buddy!"

// /datum/barsign/papacafe
// 	name = "SS220 Space Daddy's Cafe"
// 	icon_state = "papacafe"
// 	desc = "Уважай своего Космического Папу!"

// /datum/barsign/wycctide
// 	name = "SS220 Wycctide"
// 	icon_state = "wycctide"
// 	desc = "О нет, он близится!"

// /datum/barsign/shitcur
// 	name = "SS220 Shitcur"
// 	icon_state = "shitcur"
// 	desc = "Невиновность ничего не доказывает."

/datum/barsign/pourndot
	name = "Pour and that's it"
	icon_state = "pourndot"
	desc = "Нальют и Точка. Тяжёлые времена приближаются."

// /datum/barsign/moonipub
// 	name = "SS220 Mooniverse pub"
// 	icon_state = "mooni"
// 	desc = "Совершенно новый паб."

// 3
/datum/barsign/whiskey_implant
	name = "Whiskey Implant"
	icon_state = "Whiskey Implant"
	desc = "A hit on modern extensive augmentations."

// /datum/barsign/the_drunk_carp
// 	name = "The Drunk Carp"
// 	icon_state = "The Drunk Carp"
// 	desc = "A depiction of a stylized space carp drinking a beer."

/datum/barsign/the_outer_spess
	name = "The Outer Spess"
	icon_state = "The Outer Spess"
	desc = "A long running joke between spacemen, which never gets old."

/datum/barsign/officer_beersky
	name = "Officer Beersky"
	icon_state = "Officer Beersky"
	desc = "To remember the hero, lost along the way, Officer Beepsky."

/datum/barsign/hearts_of_plasteel
	name = "Hearts of Plasteel"
	icon_state = "Hearts of Plasteel"
	desc = "The sign of a diner from a famous TV show."

// /datum/barsign/chem_lab
// 	name = "Chem Lab"
// 	icon_state = "Chem Lab"
// 	desc = "Chem Labs are the unofficial name given to some eridanian bars."

/datum/barsign/meow_mix
	name = "Meow Mix"
	icon_state = "Meow Mix"
	desc = "A sign with a selection of some of the SCC's much beloved pets."

// /datum/barsign/the_hive
// 	name = "The Hive"
// 	icon_state = "The Hive"
// 	desc = "A wildly known, high class eridanian cocktail bar chain."

// /datum/barsign/mead_bay
// 	name = "Mead Bay"
// 	icon_state = "Mead Bay"
// 	desc = "The Mead Bay is the alternative for visiting an actual Medbay."

// /datum/barsign/toolbox_tavern
// 	name = "Toolbox Tavern"
// 	icon_state = "Toolbox Tavern"
// 	desc = "A popular bar at an Hepheastus Industries shipyard."

/datum/barsign/maltese_falcon
	name = "Maltese Falcon"
	icon_state = "Maltese Falcon"
	desc = "A recreation of the famous Maltese Falcon bar sign."

/datum/barsign/old_cock_inn
	name = "Old Cock Inn"
	icon_state = "Old Cock Inn"
	desc = "The sign of a formerly well-known discotheque."

// /datum/barsign/event_horizon // Start of the kitchen signs. Don't mix it up.
// 	name = "Event Horizon"
// 	icon_state = "Event Horizon"
// 	desc = "The SCCV Horizon's kitchen franchise sign."

// /datum/barsign/paradise_sands
// 	name = "Paradise Sands"
// 	icon_state = "Paradise Sands"
// 	desc = "A take on the sign of one of Silversun's most popular cafe and bistro owned by Idris Incorporated."

// /datum/barsign/city_alive
// 	name = "City Alive"
// 	icon_state = "City Alive"
// 	desc = "City Alive is another popular restaurant chain, originating from Eridani I. It is famous for its light shows."

// 5
/datum/barsign/alohasnackbar
	name = "The Aloha Snackbar"
	icon_state = "alohasnackbar"
	desc = "A tasteful, inoffensive tiki bar sign."

/datum/barsign/armoksbargrill
	name = "Armok's Bar and Grill"
	icon_state = "armokbar"
	desc = ""

/datum/barsign/brokendrum
	name = "The Broken Drum"
	icon_state = "brokendrum"
	desc = ""

/datum/barsign/drunkengod
	name = "Church of the Drunken God"
	icon_state = "drunkengod"
	desc = "The drunk answers only to Beer, for his mouth consumes His body."

/datum/barsign/cavern
	name = "The Cavern"
	icon_state = "cavern"
	desc = ""

// /datum/barsign/clownshead
// 	name = "The Clown's Head"
// 	icon_state = "clownshead"
// 	desc = ""

/datum/barsign/coderbus
	name = "The Coderbus"
	icon_state = "coderbus"
	desc = "A very controversial bar known for its wide variety of constantly-changing drinks."

// /datum/barsign/damnwall
// 	name = "The Damn Wall"
// 	icon_state = "damnwall"
// 	desc = ""

// /datum/barsign/drunkcarp
// 	name = "The Drunk Carp"
// 	icon_state = "drunkcarp"
// 	desc = "Don't drink and swim."

/datum/barsign/magmasea
	name = "The Magma Sea"
	icon_state = "magmasea"
	desc = ""

// /datum/barsign/orchard
// 	name = "The Orchard"
// 	icon_state = "orchard"
// 	desc = ""

/datum/barsign/pinkflamingo
	name = "The Pink Flamingo"
	icon_state = "pinkflamingo"
	desc = ""

/datum/barsign/rustyaxe
	name = "The Rusty Axe"
	icon_state = "rustyaxe"
	desc = ""

// /datum/barsign/saucyclown
// 	name = "The Saucy Clown"
// 	icon_state = "saucyclown"
// 	desc = ""

/datum/barsign/shaken
	name = "The Shaken"
	icon_state = "shaken"
	desc = "This establishment does not serve stirred drinks."

/datum/barsign/shotscrapspints
	name = "Shots, Craps, Pints"
	icon_state = "shotscrapspints"
	desc = "The Foundation's Finest."

// Hidden barsigns

/datum/barsign/hiddensigns/scp078
	name = "Too Late to Die Young"
	icon_state = "toolate"
	desc = "A pink neon sign approximately one and a half meters long that displays the phrase \"TOO LATE TO DIE YOUNG\""

// 6
/datum/barsign/thealohasnackbar
	name = "The Aloha Snackbar"
	icon_state = "alohasnackbar"
	desc = "A tasteful, inoffensive tiki bar sign."

// Невошедшее
/datum/barsign/maltroach
	name = "_Moths_"
	icon_state = "maltroach"
	desc = "It's moths drinks..."

/datum/barsign/rockbottom
	name = "_Rock Bottom_"
	icon_state = "rock-bottom"

/datum/barsign/chalkboard_menu
	name = "_Chalkboard menu_"
	icon_state = "chalkboard_menu"

/datum/barsign/orangejuice
	name = "_Orange Juice_"
	icon_state = "orangejuice"

/datum/barsign/le_cafe_silencieux
	name = "_Le Cafe Silencieux_"
	icon_state = "le_cafe_silencieux"

/datum/barsign/the_assembly_line
	name = "_The Assembly Line_"
	icon_state = "the-assembly-line"

/datum/barsign/little_treats
	name = "_Little Treats_"
	icon_state = "little_treats"

/datum/barsign/bargonia
	name = "_Bargonia_"
	icon_state = "bargonia"

/datum/barsign/cult_cove
	name = "_Cult Cove_"
	icon_state = "cult-cove"

/datum/barsign/neon_flamingo
	name = "_Neon Flamingo_"
	icon_state = "neon-flamingo"
	neon_color = "#FF66CC"

/datum/barsign/no_neon_flamingo
	name = "_Neon No Flamingo_"
	icon_state = "neon-flamingo"

/datum/barsign/slowdive
	name = "_Slow Dive_"
	icon_state = "slowdive"

/datum/barsign/therune
	name = "_The Rune_"
	icon_state = "therune"

/datum/barsign/the_red_mons
	name = "_The Red Mons_"
	icon_state = "the-red-mons"

/datum/barsign/the_wizard
	name = "_The Wizard_"
	icon_state = "the-wizard"

/datum/barsign/moths_moths_moths
	name = "_Moths Moths Moths_"
	icon_state = "moths-moths-moths"

/datum/barsign/thesmallrounyinn
	name = "_The Small Rounyinn_"
	icon_state = "thesmallrounyinn"
