// Дополнение к code/__DEFINES/DNA.dm
// #define DNA_SKIN_TONE_NOSE_BLOCK 3

// #define SKINNOSECOLORS 1001
#define SKINRIOLCOLORS 1008
#define EARSRIOLCOLORS 1009
#define HEADRIOLCOLORS 1010
#define NOSERIOLCOLORS 1011
#define CHESTRIOLCOLORS 1012
#define BODYRIOLCOLORS 1013
#define TAILRIOLCOLORS 1014

// Дополнение к code/__DEFINES/contracts.dm
#define BAN_HURTRIOL "hurtriol"


// Хелпер как в code/__DEFINES/is_helpers.dm
#define isriol(A) (is_species(A, /datum/species/riol))


// Дополнение к code/__DEFINES/mobs.dm
#define SPECIES_RIOL "riol"


// Дополнение к code/__DEFINES/preferences.dm
// #define RANDOM_SKIN_TONE_NOSE "random_skin_tone_nose"
#define RANDOM_SKIN_TONE_RIOL "random_skin_tone_riol"


// Дополнение к code/__DEFINES/species_clothing_defines.dm
#define RIOL_MASK_PATH 'mod_celadon/_storge_icons/icons/items/clothing/mask/overlay/onmob_mask_riol.dmi'
#define RIOL_HEAD_PATH 'mod_celadon/_storge_icons/icons/items/clothing/head/overlay/onmob_head_riol.dmi'
#define RIOL_SUIT_PATH 'mod_celadon/_storge_icons/icons/items/clothing/suit/overlay/onmob_suit_riol.dmi'

/// The natural temperature for a body
#define RIOL_BODYTEMP_NORMAL 313.15

// Делает снифф риолов риольскими
#define OLFACTION_RIOL /datum/mutation/human/olfaction/riol
