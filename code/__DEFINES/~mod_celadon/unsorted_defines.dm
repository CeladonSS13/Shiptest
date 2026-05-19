//#define NOOVERMAP //uncomment this to load centcom and runtime station and thats it.
//#define MINIMAL //uncomment this to load a smaller centcomm and smaller runtime station, only works together with NOOVERMAP

#ifdef MINIMAL
#define NOOVERMAP
#endif

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
#define MEDAL_CLOWNCARKING "Round and Full"
#define MEDAL_THANKSALOT "The Best Driver"
// [/CELADON-ADD]

#define CINEMATIC_NUKE_CLOWNOP 12 // [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
#define CLOWNMUT /datum/mutation/human/clumsy	// [CELADON-ADD] - RETURN_CONTENT - CLOWN_RETURN_CONTENT

// [CELADON-ADD] - CELADON_STRUCTURES - Барикады
#define PASSSTRUCTURE (1<<10)
#define	PASSMACHINE (1<<11)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_FIX_TAIL
#define HIDETAIL (1<<12)
// [/CELADON-ADD]

// [CELADON-ADD] - TAJARA
#define TAJARA_VARIATION (1<<8)
// [CELADON-ADD] - CELADON_RIOL
#define RIOL_VARIATION (1<<9)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
#define isclown(A) (istype(A, /mob/living/simple_animal/hostile/retaliate/clown))
// [/CELADON-ADD]

#define ZTRAIT_SCAN_DISRUPT "Scanning Disruption" // [CELADON-EDIT] - CELADON_SURVEY_HANDHELD

// [CELADON-ADD] - TAJARA
#define BODYTYPE_TAJARA (1<<9) //Fluffy Ass
// [CELADON-ADD] - RIOL
#define BODYTYPE_RIOL (1<<10)
// [/CELADON-ADD]

// [CELADON-ADD] - CELADON_STRUCTURES - Барикады
#define IGNORE_DENSITY (1<<15) 				//! Can we ignore density when building on this object? (for example, directional windows and grilles)
#define BLOCKS_CONSTRUCTION (1<<16) 				//! Does this object prevent things from being built on it?
#define BLOCKS_CONSTRUCTION_DIR (1<<17)					//! Does this object prevent same-direction things from being built on it?
// [/CELADON-ADD]

// [CELADON-ADD]
#define NO_ROTATE_RANDOM_THROW (1<<17) //if throwed, it wont have a randomized transform
// [/CELADON-ADD]

#define RADIO_KEY_WIDEBAND "w"
#define RADIO_TOKEN_WIDEBAND ":w"	//WS End

#define SPAN_CLOWN "clown"	// [CELADON-ADD] - RETURN_CONTENT - CLOWN_RETURN_CONTENT
#define SFX_CLOWN_STEP "clown_step" // [CELADON-ADD] - RETURN_CONTENT - CLOWN_RETURN_CONTENT
#define span_clown(str) ("<span class='clown'>" + str + "</span>") // [CELADON-ADD] - RETURN_CONTENT - CLOWN_RETURN_CONTENT
#define BB_MONKEY_WEAPON_PICKUP_COOLDOWN "BB_monkey_weapon_pickup_cooldown"	// [CELADON-ADD] - FIXES_MONKEY_STOPPED_SPEEDUP
#define CLOWN_NUKE_TRAIT "clown-nuke"	// [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS

// [CELADON-ADD] - CELADON_STRUCTURES - Барикады
/// All armors, preferable in the order as seen above
#define ARMOR_LIST_ALL(...) list(MELEE, BULLET, LASER, ENERGY, BOMB, BIO, RAD, FIRE, ACID, MAGIC, WOUND)

#define RAD "rad"
#define MAGIC "magic"
// [/CELADON-ADD]

#define CART_CLOWN (1<<23)
#define CART_MIME (1<<22)

#define TREE_ATTACK_SOUNDS list(\
	'mod_celadon/_storage_sounds/sound/trees/treechop1.ogg', \
	'mod_celadon/_storage_sounds/sound/trees/treechop2.ogg', \
	'mod_celadon/_storage_sounds/sound/trees/treechop3.ogg', \
)

#define INSANE_CLOWN 5

// tgui .scss themes
#define THEME_SYNDICATE "syndicate"
#define THEME_INTEQ "inteq"
#define THEME_SOLFED "solfed"
#define THEME_INDEPENDENT "independent"
#define THEME_NT "nt"

#define CELADON_BELT_OVERLAYS_ICON 'mod_celadon/_storage_icons/icons/items/clothing/belt/belt_overlays.dmi'
#define CELADON_VOX_ACCESSORY_PATH 'mod_celadon/_storage_icons/icons/species/vox/accessory_vox.dmi'

//[CELADON-ADD] - CELADON_OUTPOST_CONSOLE
#define ACCOUNT_FAC "FAC"
#define ACCOUNT_FAC_NAME "Faction Budget"
#define ACCOUNT_SYN "SYN"
#define ACCOUNT_SYN_NAME "Syndicate Budget"
#define ACCOUNT_INT "INT"
#define ACCOUNT_INT_NAME "InteQ Budget"
#define ACCOUNT_SLF "SLF"
#define ACCOUNT_SLF_NAME "SolFed Budget"
#define ACCOUNT_NTN "NTN"
#define ACCOUNT_NTN_NAME "Nanotrasen Budget"
#define ACCOUNT_IND "IND"
#define ACCOUNT_IND_NAME "Independent Budget"
#define ACCOUNT_IND_1 "IND_1"
#define ACCOUNT_IND_1_NAME "Independent 1 Budget"
#define ACCOUNT_IND_2 "IND_2"
#define ACCOUNT_IND_2_NAME "Independent 2 Budget"
#define ACCOUNT_IND_3 "IND_3"
#define ACCOUNT_IND_3_NAME "Independent 3 Budget"
#define ACCOUNT_IND_4 "IND_4"
#define ACCOUNT_IND_4_NAME "Independent 4 Budget"
//[/CELADON-ADD]
