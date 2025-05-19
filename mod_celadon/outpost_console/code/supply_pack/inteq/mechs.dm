/datum/supply_pack/faction/inteq/mech
	group = "Exosuit Construction"

/datum/supply_pack/faction/inteq/mech/equipment/basenji_upgrade
	name = "IRMG Basenji upgrade kit"
	desc = "Contains an IRMG-custom conversion kit for a 501p combat exosuit, to convert it to the specialized Basenji breaching exosuit. The upgrade will overclock the Gygax's leg actuators, allowing for short ranged charges capable of smashing through most obstacles."
	cost = 500
	contains = list(
		/obj/item/mecha_parts/mecha_equipment/conversion_kit/inteq_gygax
	)

/datum/supply_pack/faction/inteq/mech/hermes
	name = "Hermes Gygax Conversion Kit"
	desc = "A custom-made kit for converting the Gygax combat exoskeleton into the specialized InteQ combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/hermes)
	cost = 2500

/datum/supply_pack/faction/inteq/mech/ares
	name = "Ares Durand Conversion Kit"
	desc = "A custom-made kit for converting the Durand combat exoskeleton into the specialized InteQ combat exoskeleton."
	contains = list(/obj/item/mecha_parts/mecha_equipment/conversion_kit/ares)
	cost = 2500
