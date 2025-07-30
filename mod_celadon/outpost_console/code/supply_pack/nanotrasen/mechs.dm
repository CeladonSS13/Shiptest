/datum/supply_pack/faction/nanotrasen/mech
	category = "Exosuit Construction"

/datum/supply_pack/faction/nanotrasen/mech/mpgygax_parts
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

/datum/supply_pack/faction/nanotrasen/mech/gygaxnt
	name = "NT Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gygax combat exoskeleton into the specialized NanoTrasen combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/gygaxnt)
	cost = 500
