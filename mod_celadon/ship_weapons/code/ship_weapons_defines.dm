// Ship weapons system defines
#define WEAPON_TYPE_LASER "laser"
#define WEAPON_TYPE_BALLISTIC "ballistic"
#define WEAPON_TYPE_EXPLOSIVE "explosive"
#define WEAPON_TYPE_BEAM "beam"
#define WEAPON_TYPE_PLASMA "plasma"

#define WEAPON_STATE_IDLE 0
#define WEAPON_STATE_CHARGING 1
#define WEAPON_STATE_READY 2
#define WEAPON_STATE_FIRING 3
#define WEAPON_STATE_COOLDOWN 4

#define MAX_WEAPON_RANGE 30
#define MIN_WEAPON_RANGE 1

// Accuracy system
#define BASE_ACCURACY 85
#define ACCURACY_FALLOFF_PER_TILE 2
#define MIN_ACCURACY 15

// Damage types for ship weapons
#define SHIP_DAMAGE_KINETIC "kinetic"
#define SHIP_DAMAGE_ENERGY "energy"
#define SHIP_DAMAGE_EXPLOSIVE "explosive"

// Weapon classes
#define WEAPON_CLASS_LIGHT 1
#define WEAPON_CLASS_MEDIUM 2
#define WEAPON_CLASS_HEAVY 3