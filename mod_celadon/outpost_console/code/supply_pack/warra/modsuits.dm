// MARK: NANOTRASEN
/datum/supply_pack/faction/warra/modsuits
	category = "Tech - MODsuits"
	crate_type = /obj/structure/closet/crate/secure/gear


// MARK: Plating
/datum/supply_pack/faction/warra/modsuits/plating
	category = "Tech - MOD plating design disk"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/warra/modsuits/plating/safeguard
	name = "Safeguard MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Safeguard modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 1000
	contains = list(/obj/item/disk/design_disk/mod/plating/safeguard)

/datum/supply_pack/faction/warra/modsuits/plating/responsory
	name = "Responsory MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Responsory modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 2000
	contains = list(/obj/item/disk/design_disk/mod/plating/responsory)

// MARK: modules
/datum/supply_pack/faction/warra/modsuits/modules
	category = "Tech - MOD modules"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "module crate"

// MARK: armor booster + assist
/datum/supply_pack/faction/warra/modsuits/modules/armor_booster_light
	name = "MOD light armor booster Module"
	desc = "Contains an advanced armor booster module that lightly increases suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/light)

/datum/supply_pack/faction/warra/modsuits/modules/armor_booster_heavy
	name = "MOD heavy armor booster Module"
	desc = "Contains an advanced armor booster module that increases suit's protection while active at the cost of user's mobility. Manufactured by Cybersun Biodynamics."
	cost = 2000
	contains = list(/obj/item/mod/module/armor_booster/heavy)

/datum/supply_pack/faction/warra/modsuits/modules/armor_assist
	name = "MOD armor assist Module"
	desc = "Contains an advanced overdrive module that significantly increases the user's movement speed while active, at the cost of massive energy consumption. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 3000
	contains = list(/obj/item/mod/module/armor_assist)

/datum/supply_pack/faction/warra/modsuits/modules/power_kick
	name = "MOD power kick Module"
	desc = "This module uses high-power myomer to generate an incredible amount of energy, transferred into the power of a kick."
	cost = 1500
	contains = list(/obj/item/mod/module/power_kick)

/datum/supply_pack/faction/warra/modsuits/modules/mirage
	name = "MOD mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create holographic copies of the user."
	cost = 2000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage)

/datum/supply_pack/faction/warra/modsuits/modules/mirage/moving
	name = "MOD moving mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create moving holographic copies of the user."
	cost = 4000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage/moving)

// MARK: mod control
/datum/supply_pack/faction/warra/modsuits/complete
	category = "Tech - fully built MODsuit"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/warra/modsuits/complete/engie
	name = "Engineering MODsuit"
	desc = "Contains a protective Engineering modsuit fitted for industrial work."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/engineering)

/datum/supply_pack/faction/warra/modsuits/complete/atmos
	name = "Atmospheric MODsuit"
	desc = "Contains an insulated atmospheric modsuit, capable of enduring absurd temperatures."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/atmospheric)

/datum/supply_pack/faction/warra/modsuits/complete/advanced
	name = "Advanced Engineering MODsuit"
	desc = "Contains an advanced engineering modsuit. We've put it through just about every industrial accident our engineering team could concoct, and the white finish is still untouched."
	cost = 4000
	contains = list(/obj/item/mod/control/pre_equipped/advanced)

/datum/supply_pack/faction/warra/modsuits/complete/safeguard
	name = "Safeguard MODsuit"
	desc = "Contains a well armored Safeguard modsuit, the premier of protection solutions."
	cost = 7000
	contains = list(/obj/item/mod/control/pre_equipped/safeguard/empty)

/datum/supply_pack/faction/warra/modsuits/complete/responsory
	name = "Responsory MODsuit"
	desc = "Contains an all-round Responsory modsuit, well regarded for its speed, protection and capabilties."
	cost = 10000
	contains = list(/obj/item/mod/control/pre_equipped/responsory/empty)
	stable_price = TRUE
