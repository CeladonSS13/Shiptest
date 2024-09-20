#define SPACEPOD_EMPTY 1
#define SPACEPOD_WIRES_LOOSE 2
#define SPACEPOD_WIRES_SECURED 3
#define SPACEPOD_CIRCUIT_LOOSE 4
#define SPACEPOD_CIRCUIT_SECURED 5
#define SPACEPOD_CORE_LOOSE 6
#define SPACEPOD_CORE_SECURED 7
#define SPACEPOD_BULKHEAD_LOOSE 8
#define SPACEPOD_BULKHEAD_SECURED 9
#define SPACEPOD_BULKHEAD_WELDED 10
#define SPACEPOD_ARMOR_LOOSE 11
#define SPACEPOD_ARMOR_SECURED 12
#define SPACEPOD_ARMOR_WELDED 13

#define SPACEPOD_SLOT_CARGO "cargo"
#define SPACEPOD_SLOT_MISC "misc"
#define SPACEPOD_SLOT_WEAPON "weapon"
#define SPACEPOD_SLOT_LOCK "lock"

///from base of atom/attackby(): (/obj/item, /mob/living, params)
#define COMSIG_ATOM_ATTACKBY "atom_attackby"
///from base of [/atom/proc/update_integrity]: (old_value, new_value)
#define COMSIG_ATOM_INTEGRITY_CHANGED "atom_integrity_changed"
/// from /atom/proc/atom_break: (damage_flag)
#define COMSIG_ATOM_BREAK "atom_break"

// Helpers for checking whether a z-level conforms to a specific requirement
#define is_mining_level(atom) atom.virtual_level_trait(ZTRAIT_MINING)

#define isspacepod(A) (istype(A, /obj/spacepod))

#define VEHICLE_LAYER 3.9

/// Bright light used by default in tubes and bulbs
#define LIGHT_COLOR_DEFAULT "#F3FFFA"
/// Warm but extremely diluted red. rgb(250, 130, 130)
#define LIGHT_COLOR_RED "#FA8282"
