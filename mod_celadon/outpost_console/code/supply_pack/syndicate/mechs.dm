/datum/supply_pack/faction/syndicate/mech
	category = "Exosuit Construction"

/datum/supply_pack/faction/syndicate/mech/odysseus_parts
	name = "202r construction kit"
	desc = "Cybersun Biodynamics' premier solution to on-the-go medical treatment. Some assembly required."
	cost = 10000
	contains = list(
		/obj/item/mecha_parts/chassis/odysseus,
		/obj/item/mecha_parts/part/odysseus_head,
		/obj/item/mecha_parts/part/odysseus_torso,
		/obj/item/mecha_parts/part/odysseus_left_arm,
		/obj/item/mecha_parts/part/odysseus_left_arm,
		/obj/item/mecha_parts/part/odysseus_right_arm,
		/obj/item/mecha_parts/part/odysseus_left_leg,
		/obj/item/mecha_parts/part/odysseus_right_leg,
		/obj/item/circuitboard/mecha/odysseus/peripherals,
		/obj/item/circuitboard/mecha/odysseus/main
		)
	crate_name = "202r Construction Kit"

/datum/supply_pack/faction/syndicate/mech/gygax_parts
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
		/obj/item/circuitboard/mecha/gygax/targeting
	)
	crate_name = "501p Construction Kit"

/datum/supply_pack/faction/syndicate/mech/murdysseus
	name = "Murdysseus Odysseus Conversion Kit"
	desc = "A custom-made kit for converting the Odysseus into the Syndicate medical exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/murdysseus)
	cost = 500

/datum/supply_pack/faction/syndicate/mech/gygaxblack
	name = "Black Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gigax combat exoskeleton into the specialized Syndicate combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/gygaxblack)
	cost = 500

/datum/supply_pack/faction/syndicate/mech/duranddark
	name = "Dark Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton into the specialized Syndicate combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/duranddark)
	cost = 500

/datum/supply_pack/faction/syndicate/mech/equipment/dark_upgrade
	name = "515 EX upgrade kit"
	desc = "Contains a military grade conversion kit for a 501p combat exosuit, to convert it to the fearsome 515 EX models. Features a much stronger set of leg actuators."
	cost = 500
	contains = list(
		/obj/item/mecha_parts/mecha_equipment/conversion_kit/dark_gygax
	)
