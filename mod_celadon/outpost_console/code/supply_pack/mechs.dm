/datum/supply_pack/mech
	category = "Tech - Mech Exosuit"

/datum/supply_pack/mech/ripley
	cost = 4000

/datum/supply_pack/mech/ripley_parts
	cost = 5000

/datum/supply_pack/mech/equipment/diamond_drill
	cost = 1500

/datum/supply_pack/mech/equipment/ripley_upgrade/clip
	available = FALSE

/datum/supply_pack/mech/equipment/paladin_upgrade
	available = FALSE

/datum/supply_pack/mech/weapon/carbine
	name = "Downpour kit"
	desc = "A rapid fire energy carbine designed for combat usage."
	cost = 1000
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/carbine)

/datum/supply_pack/mech/weapon/biglaser
	name = "Solaris kit"
	desc = "A heavy beam sniper cannon designed for combat usage."
	cost = 2000
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser)

/datum/supply_pack/mech/weapon/missile_rack
	name = "BRM-6 kit"
	desc = "Contains a low-explosive missile launcher, excellent for breaching through obstacles."
	cost = 3000
	contains = list(/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching)

/datum/supply_pack/mech/ammo/scattershot_ammo
	cost = 500

/datum/supply_pack/mech/ammo/lmg_ammo
	cost = 500

/datum/supply_pack/mech/ammo/missile_rack_ammo
	name = "BRM-6 missile box"
	desc = "Contains a box of six breaching missiles designed to explode upon striking hard surfaces."
	cost = 1000
	contains = list(/obj/item/mecha_ammo/missiles_br)

/datum/supply_pack/mech/equipment/conversions
	name = "Mecha Conversion kits"
	desc = "Mecha conversion kits desing disk."
	cost = 500
	contains = list(/obj/item/disk/design_disk/pub_mechs)

/datum/supply_pack/mech/flames_red
	name = "Flames Ripley MK-II RedConversion Kit"
	desc = "A custom-made kit for converting the Ripley MK-II."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/flames_red)
	cost = 500

/datum/supply_pack/mech/aluminizer
	name = "Aluminizer Ripley MK-II Conversion Kit"
	desc = "A custom-made kit for converting the Ripley MK-II."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/aluminizer)
	cost = 500

/datum/supply_pack/mech/earth
	name = "Ripley Ripley MK-II Earth Conversion Kit"
	desc = "A custom-made kit for converting the Ripley MK-II."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/earth)
	cost = 500

/datum/supply_pack/mech/ripley_zairjah
	name = "Zairjah Ripley MK-II Conversion Kit"
	desc = "A custom-made kit for converting the Ripley MK-II."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/ripley_zairjah)
	cost = 500

/datum/supply_pack/mech/titan
	name = "Titan Ripley MK-II Conversion Kit"
	desc = "A custom-made kit for converting the Ripley MK-II."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/titan)
	cost = 500

/datum/supply_pack/mech/proto
	name = "Prototype Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gygax combat exoskeleton into a specialized combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/proto)
	cost = 500

/datum/supply_pack/mech/sarathi
	name = "Sarathi Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/sarathi)
	cost = 500

/datum/supply_pack/mech/shire
	name = "Shire Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/shire)
	cost = 500

/datum/supply_pack/mech/executor
	name = "Executor Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/executor)
	cost = 500

/datum/supply_pack/mech/dollhouse
	name = "Dollhouse Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/dollhouse)
	cost = 500

/datum/supply_pack/mech/gygax_nt
	name = "NT-501p-MP construction kit"
	desc = "A set of parts for the NT-501p-MP exosuit model, dervived from the original Cybersun designs and modified for mass production. The armor plating was reduced to cut costs for mass production, but the lighter weight allows the NT-501p-MP's modified servos to perform swift moderate distance charges without heavily taxing the power supply. "
	cost = 20000
	contains = list(
		/obj/item/mecha_parts/chassis/mp_gygax,
		/obj/item/mecha_parts/part/gygax_head,
		/obj/item/mecha_parts/part/gygax_torso,
		/obj/item/mecha_parts/part/gygax_left_arm,
		/obj/item/mecha_parts/part/gygax_right_arm,
		/obj/item/mecha_parts/part/gygax_left_leg,
		/obj/item/mecha_parts/part/gygax_right_leg,
		/obj/item/mecha_parts/part/mpgygax_armor,
		/obj/item/circuitboard/mecha/gygax/peripherals,
		/obj/item/circuitboard/mecha/gygax/main,
		/obj/item/circuitboard/mecha/gygax/targeting
	)
	crate_name = "NT-501p-MP Construction Kit"
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/mech/gygax_nt_conversion
	name = "NT Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gygax combat exoskeleton into the specialized NanoTrasen combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/gygaxnt)
	cost = 500
	faction = /datum/faction/nt
	faction_locked = TRUE

/datum/supply_pack/mech/odysseus_parts
	cost = 10000
	faction_locked = TRUE

/datum/supply_pack/mech/gygax_parts
	name = "501p construction kit"
	desc = "An agile combat exosuit sold across the galaxy by Cybersun. Or at least the parts to it."
	cost = 20000
	contains = list(
		/obj/item/mecha_parts/chassis/gygax,
		/obj/item/mecha_parts/part/gygax_head,
		/obj/item/mecha_parts/part/gygax_torso,
		/obj/item/mecha_parts/part/gygax_left_arm,
		/obj/item/mecha_parts/part/gygax_right_arm,
		/obj/item/mecha_parts/part/gygax_left_leg,
		/obj/item/mecha_parts/part/gygax_right_leg,
		/obj/item/mecha_parts/part/gygax_armor,
		/obj/item/circuitboard/mecha/gygax/peripherals,
		/obj/item/circuitboard/mecha/gygax/main,
		/obj/item/circuitboard/mecha/gygax/targeting,
	)
	crate_name = "501p Construction Kit"
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/mech/murdysseus
	name = "Murdysseus Odysseus Conversion Kit"
	desc = "A custom-made kit for converting the Odysseus into the Syndicate medical exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/murdysseus)
	cost = 500
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/mech/gygax_black
	name = "Black Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gigax combat exoskeleton into the specialized Syndicate combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/gygaxblack)
	cost = 500
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/mech/durand_dark
	name = "Dark Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton into the specialized Syndicate combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/duranddark)
	cost = 500
	faction = /datum/faction/syndicate
	faction_locked = TRUE

/datum/supply_pack/mech/hermes
	name = "Hermes Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gygax combat exoskeleton into the specialized InteQ combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/hermes)
	cost = 500
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/mech/ares
	name = "Ares Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton into the specialized InteQ combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/ares)
	cost = 500
	faction = /datum/faction/inteq
	faction_locked = TRUE

/datum/supply_pack/mech/zeus
	name = "Zeus Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton into the specialized Solar Federation combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/zeus)
	cost = 500
	faction = /datum/faction/solgov
	faction_locked = TRUE
