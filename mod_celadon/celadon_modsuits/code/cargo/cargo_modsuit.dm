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
	name = "MOD mirage grenade dispenser module"
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


// MARK: NANOTRASEN
/datum/supply_pack/faction/nanotrasen/modsuits
	category = "Tech - MODsuits"
	crate_type = /obj/structure/closet/crate/secure/gear


// MARK: Plating
/datum/supply_pack/faction/nanotrasen/modsuits/plating
	category = "Tech - MOD plating design disk"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/nanotrasen/modsuits/plating/safeguard
	name = "Safeguard MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Safeguard modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 1000
	contains = list(/obj/item/disk/design_disk/mod/plating/safeguard)

/datum/supply_pack/faction/nanotrasen/modsuits/plating/responsory
	name = "Responsory MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Responsory modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 2000
	contains = list(/obj/item/disk/design_disk/mod/plating/responsory)

// MARK: modules
/datum/supply_pack/faction/nanotrasen/modsuits/modules
	category = "Tech - MOD modules"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "module crate"

// MARK: armor booster + assist
/datum/supply_pack/faction/nanotrasen/modsuits/modules/armor_booster_light
	name = "MOD light armor booster Module"
	desc = "Contains an advanced armor booster module that lightly increases suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/light)

/datum/supply_pack/faction/nanotrasen/modsuits/modules/armor_booster_heavy
	name = "MOD heavy armor booster Module"
	desc = "Contains an advanced armor booster module that increases suit's protection while active at the cost of user's mobility. Manufactured by Cybersun Biodynamics."
	cost = 2000
	contains = list(/obj/item/mod/module/armor_booster/heavy)

/datum/supply_pack/faction/nanotrasen/modsuits/modules/armor_assist
	name = "MOD armor assist Module"
	desc = "Contains an advanced overdrive module that significantly increases the user's movement speed while active, at the cost of massive energy consumption. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 3000
	contains = list(/obj/item/mod/module/armor_assist)

/datum/supply_pack/faction/nanotrasen/modsuits/modules/power_kick
	name = "MOD power kick Module"
	desc = "This module uses high-power myomer to generate an incredible amount of energy, transferred into the power of a kick."
	cost = 1500
	contains = list(/obj/item/mod/module/power_kick)

/datum/supply_pack/faction/nanotrasen/modsuits/modules/mirage
	name = "MOD mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create holographic copies of the user."
	cost = 2000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage)

/datum/supply_pack/faction/nanotrasen/modsuits/modules/mirage/moving
	name = "MOD mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create moving holographic copies of the user."
	cost = 4000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage/moving)

// MARK: mod control
/datum/supply_pack/faction/nanotrasen/modsuits/complete
	category = "Tech - fully built MODsuit"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/nanotrasen/modsuits/complete/engie
	name = "Engineering MODsuit"
	desc = "Contains a protective Engineering modsuit fitted for industrial work."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/engineering)

/datum/supply_pack/faction/nanotrasen/modsuits/complete/atmos
	name = "Atmospheric MODsuit"
	desc = "Contains an insulated atmospheric modsuit, capable of enduring absurd temperatures."
	cost = 3500
	contains = list(/obj/item/mod/control/pre_equipped/atmospheric)

/datum/supply_pack/faction/nanotrasen/modsuits/complete/advanced
	name = "Advanced Engineering MODsuit"
	desc = "Contains an advanced engineering modsuit. We've put it through just about every industrial accident our engineering team could concoct, and the white finish is still untouched."
	cost = 4000
	contains = list(/obj/item/mod/control/pre_equipped/advanced)

/datum/supply_pack/faction/nanotrasen/modsuits/complete/safeguard
	name = "Safeguard MODsuit"
	desc = "Contains a well armored Safeguard modsuit, the premier of protection solutions."
	cost = 7000
	contains = list(/obj/item/mod/control/pre_equipped/safeguard/empty)

/datum/supply_pack/faction/nanotrasen/modsuits/complete/responsory
	name = "Responsory MODsuit"
	desc = "Contains an all-round Responsory modsuit, well regarded for its speed, protection and capabilties."
	cost = 10000
	contains = list(/obj/item/mod/control/pre_equipped/responsory/empty)

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
	cost = 16000
	contains = list(/obj/item/mod/control/pre_equipped/falke/empty)

// MARK: SYNDICATE
/datum/supply_pack/faction/syndicate/modsuits
	category = "Tech - MODsuits"
	crate_type = /obj/structure/closet/crate/secure/gear


// MARK: Plating
/datum/supply_pack/faction/syndicate/modsuits/plating
	category = "Tech - MOD plating design disk"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/modsuits/plating/syndicate
	name = "Syndicate MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental Syndicate modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 1000
	contains = list(/obj/item/disk/design_disk/mod/plating/syndicate)

/datum/supply_pack/faction/syndicate/modsuits/plating/syndicate_elites
	name = "Elite MODsuit plating design disk"
	desc = "Contains a design disk for plating for experimental syndicate modsuit. WARNING:  REQUIRES A POWER ARMOR COMPONENT THAT CAN BE RESEARCHED IN RND TO COMPLETE IT. ."
	cost = 2000
	contains = list(/obj/item/disk/design_disk/mod/plating/syndicate_elite)

// MARK: modules
/datum/supply_pack/faction/syndicate/modsuits/modules
	category = "Tech - MOD modules"
	crate_type = /obj/structure/closet/crate/secure/gear
	crate_name = "module crate"

/datum/supply_pack/faction/syndicate/modsuits/modules/mirage
	name = "MOD mirage grenade dispenser module"
	desc = "This module can create mirage grenades at the user's liking. These grenades create holographic copies of the user."
	cost = 2000 // he-he
	contains = list(/obj/item/mod/module/dispenser/mirage)

/datum/supply_pack/faction/syndicate/modsuits/modules/storage
	name = "MOD syndicate storage module"
	desc = "Contains a very high-class storage module to put all of your most precious savings in!"
	cost = 1000 // duffelbag
	contains = list(/obj/item/mod/module/storage/syndicate)

/datum/supply_pack/faction/syndicate/modsuits/modules/chameleon
	name = "MOD chameleon Module"
	desc = "Contains a module that can disguise your MOD control into something different while deactivated."
	cost = 1000
	contains = list(/obj/item/mod/module/chameleon)

/datum/supply_pack/faction/syndicate/modsuits/modules/stealth_military
	name = "MOD military cloak Module"
	desc = "Contains a module that can cloak your body while active. Requires military capacitor later to be completed."
	cost = 8000 // 6000 + 2000 from capacitor
	contains = list(/obj/item/mod/module/stealth/military,
					/obj/item/military_tech/capacitor)


// MARK: armor booster
/datum/supply_pack/faction/syndicate/modsuits/modules/armor_booster_light
	name = "MOD light armor booster Module"
	desc = "Contains an advanced armor booster module that lightly increases suit's protection while active. Manufactured by Cybersun Biodynamics."
	cost = 1500
	contains = list(/obj/item/mod/module/armor_booster/light)

/datum/supply_pack/faction/syndicate/modsuits/modules/armor_booster_heavy
	name = "MOD heavy armor booster Module"
	desc = "Contains an advanced armor booster module that increases suit's protection while active at the cost of user's mobility. Manufactured by Cybersun Biodynamics."
	cost = 2000
	contains = list(/obj/item/mod/module/armor_booster/heavy)

/datum/supply_pack/faction/syndicate/modsuits/modules/armor_assist
	name = "MOD armor assist Module"
	desc = "Contains an advanced overdrive module that significantly increases the user's movement speed while active, at the cost of massive energy consumption, which is increased with the suit slowdown. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 1000 // дешевле т.к. синдикат должен поставляться этим изначально в какой-то мере
	contains = list(/obj/item/mod/module/armor_assist)

/datum/supply_pack/faction/syndicate/modsuits/modules/armor_assist_advanced
	name = "MOD advanced armor assist Module"
	desc = "Contains an way more advanced overdrive module that significantly increases the user's movement speed while active, at the cost of high energy consumption, which is not increased with the suit slowdown. Manufactured by Cybersun Biodynamics for PMCs. \n\
			WARNING: using it with armor assist is extreme for the suit's power grid."
	cost = 3000
	contains = list(/obj/item/mod/module/armor_assist/advanced)

// MARK: mod control
/datum/supply_pack/faction/syndicate/modsuits/complete
	category = "Tech - fully built MODsuit"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/modsuits/complete/syndicate
	name = "Syndicate MODsuit"
	desc = "Contains an experimental Syndicate modsuit."
	cost = 8500
	contains = list(/obj/item/mod/control/pre_equipped/syndicate/empty)

/datum/supply_pack/faction/syndicate/modsuits/complete/syndicate_elite
	name = "Elite MODsuit"
	desc = "Contains an experimental Elite modsuit."
	cost = 13000
	contains = list(/obj/item/mod/control/pre_equipped/elite/empty)
