// MARK: INTEQ
/datum/supply_pack/faction/inteq/modsuits
	category = "Tech - MODsuits"
	crate_type = /obj/structure/closet/crate/secure/gear


// MARK: Plating
/datum/supply_pack/faction/inteq/modsuits/plating
	category = "Tech - MOD plating design disk"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/inteq/modsuits/plating/inteq
	name = "Inteq MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Inteq modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 1000
	contains = list(/obj/item/disk/design_disk/mod/plating/inteq)

/datum/supply_pack/faction/inteq/modsuits/plating/inteq_elite
	name = "Inteq MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Inteq modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 2000
	contains = list(/obj/item/disk/design_disk/mod/plating/inteq_elite)

// MARK: modules
/datum/supply_pack/faction/inteq/modsuits/modules
	category = "Tech - MOD modules"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "module crate"

// MARK: armor booster + assist
/datum/supply_pack/faction/inteq/modsuits/modules/armor_booster_light
	name = "MOD light armor booster Module"
	desc = "Contains an advanced armor booster module that lightly increases suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/light)

/datum/supply_pack/faction/inteq/modsuits/modules/armor_booster_heavy
	name = "MOD heavy armor booster Module"
	desc = "Contains an advanced armor booster module that increases suit's protection while active at the cost of user's mobility. Manufactured by Cybersun Biodynamics."
	cost = 2000
	contains = list(/obj/item/mod/module/armor_booster/heavy)

/datum/supply_pack/faction/inteq/modsuits/modules/armor_assist
	name = "MOD armor assist Module"
	desc = "Contains an advanced overdrive module that significantly increases the user's movement speed while active, at the cost of massive energy consumption. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 3000
	contains = list(/obj/item/mod/module/armor_assist)

/datum/supply_pack/faction/inteq/modsuits/modules/shield_inteq
	name = "MOD InteQ shield Module"
	desc = "Contains a energy-based shield module for protecting you from regular firearms or/and melee attacks. Takes a lot of power to regenerate while holstered. Otherwise it is finite."
	cost = 3000
	contains = list(/obj/item/mod/module/shield/inteq)

/datum/supply_pack/faction/inteq/modsuits/modules/dash
	name = "MOD D.A.S.H. Module"
	desc = "Contains an advanced movement module that launches MOD operator forward. Is usually used by InteQ elite operatives."
	cost = 1500 // Такая же логика, что и у армор ассиста.
	contains = list(/obj/item/mod/module/dash)

/datum/supply_pack/faction/inteq/modsuits/modules/mirage
	name = "MOD mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create holographic copies of the user."
	cost = 2000 // he-he. Оказались не очень полезными.
	contains = list(/obj/item/mod/module/dispenser/mirage)

/datum/supply_pack/faction/inteq/modsuits/modules/mirage/moving
	name = "MOD moving mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create moving holographic copies of the user."
	cost = 4000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage/moving)

// MARK: mod control
/datum/supply_pack/faction/inteq/modsuits/complete
	category = "Tech - fully built MODsuit"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/inteq/modsuits/complete/inteq
	name = "Inteq MODsuit"
	desc = "Contains an experimental Inteq modsuit."
	cost = 8500
	contains = list(/obj/item/mod/control/pre_equipped/inteq/empty)

/datum/supply_pack/faction/inteq/modsuits/complete/inteq_elite
	name = "Elite Inteq MODsuit"
	desc = "Contains an experimental Elite Inteq modsuit."
	cost = 11000 // Фича в модулях у интеков, а не в броне. Ради этого нужно больше денег, из-за чего мод дешевле.
	contains = list(/obj/item/mod/control/pre_equipped/inteq/elite/empty)
	stable_price = TRUE

