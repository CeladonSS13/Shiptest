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
	stable_price = TRUE

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
	cost = 12000
	contains = list(/obj/item/mod/control/pre_equipped/elite/empty)
	stable_price = TRUE
