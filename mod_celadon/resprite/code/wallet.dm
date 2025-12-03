/obj/item/storage/wallet
	icon = 'mod_celadon/_storage_icons/icons/resprite/wallet.dmi'

/obj/item/storage/wallet/proc/get_wallet_overlay_state()
	return "wallet_overlay"

/obj/item/storage/wallet/black
	name = "black wallet"
	icon_state = "bwallet"

/obj/item/storage/wallet/black/get_wallet_overlay_state()
	return "bwallet_overlay"

/obj/item/storage/wallet/white
	name = "white wallet"
	icon_state = "wwallet"

/obj/item/storage/wallet/white/get_wallet_overlay_state()
	return "wwallet_overlay"
