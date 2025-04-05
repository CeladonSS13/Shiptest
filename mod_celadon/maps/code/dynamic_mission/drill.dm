/datum/mission/ruin/signaled/drill/mining_base
	name = "Resume Site Operation"
	desc = "N+S Logistics has lost contact with a recently established mining base. We believe that this base is located upon an extremely lucrative hydrogen-ice vein. \
			Due to loss of contact, N+S has been unable to verify the existence of this vein. Please move to the site, locate the drilling system, and bring us our geological survey results. \
			If an N+S team is still on site, please inform them that their communications system has been damaged, and that the next supply run will be in 3 weeks."
	value = 20000
	mission_limit = 1
	faction = list(
		/datum/faction/nt/ns_logi,
	)

/obj/item/drill_readout
	layer = 4.6
