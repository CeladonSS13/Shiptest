// Дополнение к code/__DEFINES/DNA.dm
#define DNA_SKIN_TONE_NOSE_BLOCK 3

#define SKINNOSECOLORS 1001
#define SKINTAJARACOLORS 1002
#define EARSTAJARACOLORS 1003
#define HEADTAJARACOLORS 1004
#define NOSETAJARACOLORS 1005
#define CHESTTAJARACOLORS 1006
#define BODYTAJARACOLORS 1007

// Дополнение к code/__DEFINES/contracts.dm
#define BAN_HURTTAJARA "hurttajara"


// Хелпер как в code/__DEFINES/is_helpers.dm
#define istajaran(A) (is_species(A, /datum/species/tajaran))


// Дополнение к code/__DEFINES/mobs.dm
#define SPECIES_TAJARA "tajaran"


// Дополнение к code/__DEFINES/preferences.dm
#define RANDOM_SKIN_TONE_NOSE "random_skin_tone_nose"
#define RANDOM_SKIN_TONE_TAJARA "random_skin_tone_tajara"


// Дополнение к code/__DEFINES/species_clothing_defines.dm
#define TAJARAN_MASK_PATH 'mod_celadon/_storage_icons/icons/items/clothing/mask/overlay/onmob_mask_tajara.dmi'
#define TAJARAN_HEAD_PATH 'mod_celadon/_storage_icons/icons/items/clothing/head/overlay/onmob_head_tajara.dmi'
#define TAJARAN_SUIT_PATH 'mod_celadon/_storage_icons/icons/items/clothing/suit/overlay/onmob_suit_tajara.dmi'

/// The natural temperature for a body
#define TAJARAN_BODYTEMP_NORMAL 311.15
