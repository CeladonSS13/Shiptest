/datum/supply_pack/faction/syndicate/spacesuit
	category = "Spacesuits"

/datum/supply_pack/faction/syndicate/spacesuit/armored_engi_spacesuit
	name = "Coalition Engineering Space Suit Crate"
	desc = "Contains one lightly armored engineering spacesuit. Generic enough to be manufactured by most ex-Coalition groups."
	cost = 1000
	contains = list(/obj/item/clothing/suit/space/syndicate/black/engie,
					/obj/item/clothing/head/helmet/space/syndicate/black/engie)

/datum/supply_pack/faction/syndicate/spacesuit/armored_spacesuit
	name = "Armored Space Suit Crate"
	desc = "Contains one armored spacesuit. Generic enough to be manufactured and distributed by most ex-Coalition groups."
	cost = 1500
	contains = list(/obj/item/clothing/suit/space/syndicate/black,
					/obj/item/clothing/head/helmet/space/syndicate/black)

/datum/supply_pack/faction/syndicate/spacesuit/cmt_hardsuit
	name = "CMT Hardsuit Crate"
	desc = "A reconfiguring of the Neutron Star hardsuit resulted in the CMT, or Cybersun Medical Technician hardsuit. The CMT protects against biological hazards, light weaponsfire, and the usual hazards of space."
	cost = 2000
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/cybersun/paramed)
	crate_name = "neutron star hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/spacesuit/neutron_hardsuit
	name = "Neutron Star Hardsuit Crate"
	desc = "Cybersuns premier offering in the field of combat hardsuits, the Neutron Star is incredibly effective against lasers, but lacks against ballistic weaponry. "
	cost = 3000
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/cybersun)
	crate_name = "neutron star hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/spacesuit/hardsuitrust
	name = "Rust-Red Hardsuit Crate"
	desc = "A classic and ineffective dual-mode gorlex marauders hardsuit. Old and weak, normally used by syndicate-like pirates. Good choice if you are on a budget"
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/ramzi)
	cost = 4000

/datum/supply_pack/faction/syndicate/spacesuit/hardsuit
	name = "Blood-Red Hardsuit Crate"
	desc = "A classic and effective dual-mode gorlex marauders hardsuit. Provides excellent combat protection"
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi)
	cost = 5000

/datum/supply_pack/faction/syndicate/spacesuit/white_red_hardsuit
	name = "White-Red Hardsuit Crate"
	desc = "Cybersun Biodynamics's proudly manufactured modification to the original production of Blood Red Hardsuits. Excellent protect, excellent mobility, and only a questionable sense in coloration."
	cost = 5000
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/hl)
	crate_name = "white-red hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear

/datum/supply_pack/faction/syndicate/spacesuit/beige_red_hardsuit
	name = "Beige-Red Hardsuit Crate"
	desc = "A widely producted variation on the classic Blood-Red hardsuit produced by factories with in the New Gorlex Republic. This suit protects the wearer with thick plates and stylish colors."
	cost = 5000
	contains = list(/obj/item/clothing/suit/space/hardsuit/syndi/ngr)
	crate_name = "beige-red hardsuit crate"
	crate_type = /obj/structure/closet/crate/secure/gear
