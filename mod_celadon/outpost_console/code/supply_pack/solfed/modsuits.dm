// MARK: SOLFED
/datum/supply_pack/faction/solfed/modsuits
	category = "Tech - MODsuits"
	crate_type = /obj/structure/closet/crate/secure/gear


// MARK: Plating
/datum/supply_pack/faction/solfed/modsuits/plating
	category = "Tech - MOD plating design disk"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/solfed/modsuits/plating/storch
	name = "Storch MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Storch modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 1000
	contains = list(/obj/item/disk/design_disk/mod/plating/storch)

/datum/supply_pack/faction/solfed/modsuits/plating/falke
	name = "Falke MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Falke modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 2000
	contains = list(/obj/item/disk/design_disk/mod/plating/falke)

// MARK: modules
/datum/supply_pack/faction/solfed/modsuits/modules
	category = "Tech - MOD modules"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "module crate"

/datum/supply_pack/faction/solfed/modsuits/modules/kinesis
	name = "MOD kinesis module"
	desc = "A modular plug-in to the forearm, this module was presumed lost for many years, \
		despite the suits it used to be mounted on still seeing some circulation. \
		This piece of technology allows the user to generate precise anti-gravity fields, \
		letting them move objects as small as a titanium rod to as large as industrial machinery. \
		Oddly enough, it doesn't seem to work on living creatures."
	cost = 4000 // he-he
	contains = list(/obj/item/mod/module/anomaly_locked/kinesis)
/*
// Кулдаун не работает как надо. Пофикшу когда-нибудь.
/datum/supply_pack/faction/solfed/modsuits/modules/kinesis_plus
	name = "MOD advanced kinesis module"
	desc = "Секретная военная разработка безымянного правительственного оружейного концерна. Продвинутый кинезис модуль - это мощный тактический инструмент, позволяющий пользователю воздействовать на физическую природу гравитации. В отличии от своего раннего прототипа эта модель так же способна воздействовать на живые объекты. Однако, они все еще могут бороться с гравитационным захватом."
	cost = 7000 // he-he
	contains = list(/obj/item/mod/module/anomaly_locked/kinesis/plus)
*/
/datum/supply_pack/faction/solfed/modsuits/modules/mirage_moving
	name = "MOD moving mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create moving holographic copies of the user."
	cost = 4000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage/moving)
// TO-DO: сделать вариацию, которая спавнит сразу группу целую
/datum/supply_pack/faction/solfed/modsuits/modules/blood_replika
	name = "MOD blood replika module"
	desc = "When the suit is activated, it connects the user's circulatory system to a life support, \
		allowing them to remain in combat operational until their body sustains critical injuries. \n\
		It can be temporarily activated to enable the user to continue fighting until their body becomes completely useless. \
		However, deactivation causes serious damage to human tissue and is potentially lethal for injured wearer. \n\
		They don't seem to suppress pain, though."
	cost = 2000
	contains = list(/obj/item/mod/module/blood_replika)

// MARK: armor booster + assist
/datum/supply_pack/faction/solfed/modsuits/modules/armor_booster_light
	name = "MOD light armor booster Module"
	desc = "Contains an advanced armor booster module that lightly increases suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/light)

/datum/supply_pack/faction/solfed/modsuits/modules/armor_booster_heavy
	name = "MOD heavy armor booster Module"
	desc = "Contains an advanced armor booster module that increases suit's protection while active at the cost of user's mobility. Manufactured by Cybersun Biodynamics."
	cost = 2000
	contains = list(/obj/item/mod/module/armor_booster/heavy)

/datum/supply_pack/faction/solfed/modsuits/modules/armor_assist
	name = "MOD armor assist Module"
	desc = "Contains an advanced overdrive module that significantly increases the user's movement speed while active, at the cost of massive energy consumption. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 3000
	contains = list(/obj/item/mod/module/armor_assist)

// MARK: mod control
/datum/supply_pack/faction/solfed/modsuits/complete
	category = "Tech - fully built MODsuit"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/solfed/modsuits/complete/storch
	name = "STCR MODsuit"
	desc = "Contains a military-grade MODsuit."
	cost = 9000
	contains = list(/obj/item/mod/control/pre_equipped/storch/empty)

/datum/supply_pack/faction/solfed/modsuits/complete/falke
	name = "FLKR MODsuit"
	desc = "Contains a military-grade commander MODsuit."
	cost = 14500
	contains = list(/obj/item/mod/control/pre_equipped/falke/empty)
	stable_price = TRUE
