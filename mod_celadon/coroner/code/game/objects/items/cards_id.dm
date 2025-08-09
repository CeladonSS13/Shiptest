// Coroner ID card for outpost
/obj/item/card/id/elysium_coroner
	name = "coroner identification card"
	desc = "An identification card for the outpost coroner."
	icon = 'mod_celadon/_storge_icons/icons/items/misc/elysium_card.dmi'
	icon_state = "elysium_med"
	assignment = "Outpost Coroner"
	access = list(ACCESS_OUTPOST_MED_CORONER, ACCESS_OUTPOST_MED_MORGUE, ACCESS_OUTPOST_MED_GENERAL, ACCESS_MORGUE, ACCESS_MEDICAL, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
