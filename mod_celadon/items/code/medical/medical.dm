/obj/item/stack/medical/suture/advanced
	name = "medicated suture"
	desc = "Advanced sterile sutures used to seal up severe cuts and lacerations and stop stronger bleeding."
	singular_name = "medicated suture"
	gender = PLURAL
	icon_state = "suture_purp"
	heal_brute = 15
	stop_bleeding = 0.85
	grind_results = list(/datum/reagent/medicine/spaceacillin = 2)
	merge_type = /obj/item/stack/medical/suture/advanced

/obj/item/stack/medical/suture/advanced/five
	amount = 5
