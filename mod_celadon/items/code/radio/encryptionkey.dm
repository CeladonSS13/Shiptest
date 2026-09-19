// MARK: Encryption Keys
// Переопределено из code/game/objects/items/devices/radio/encryptionkey.dm
/obj/item/encryptionkey/wideband

/obj/item/encryptionkey/heads/captain
	icon_state = "cap_cypherkey"
	channels = list(RADIO_CHANNEL_EMERGENCY = 1) //WS edit - Wideband radio

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1, RADIO_CHANNEL_WIDEBAND = 1)

/obj/item/encryptionkey/solgov
	name = "\improper SolFed encryption key"
	icon_state = "solfed_cypherkey"
	channels = list(RADIO_CHANNEL_SOLFED = 1)

/obj/item/encryptionkey/ramzi
	name = "ramzi encryption key"
	icon_state = "cmm_cypherkey"
	channels = list(RADIO_CHANNEL_RAMZI = 1)

/obj/item/encryptionkey/elysium
	name = "elysium encryption key"
	icon_state = "bin_cypherkey"
	channels = list(RADIO_CHANNEL_ELYSIUM = 1)

/obj/item/encryptionkey/pirate
	name = "unidentified encryption key"
	icon_state = "pirate_cypherkey"
	channels = list(RADIO_CHANNEL_PIRATE = 1)

// -- Новые Encryption Keys --
/obj/item/encryptionkey/syndicate/captain
	channels = list(RADIO_CHANNEL_SYNDICATE = 1, RADIO_CHANNEL_SYNDICATE_LONG = 1)

/obj/item/encryptionkey/syndicate/suns/captain
	channels = list(RADIO_CHANNEL_SUNS = 1, RADIO_CHANNEL_SYNDICATE_LONG = 1)

/obj/item/encryptionkey/nanotrasen
	name = "Nanotrasen encryption key"
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_NANOTRASEN = 1)

/obj/item/encryptionkey/nanotrasen/captain
	channels = list(RADIO_CHANNEL_NANOTRASEN = 1, RADIO_CHANNEL_NANOTRASEN_LONG = 1)

/obj/item/encryptionkey/inteq/captain
	channels = list(RADIO_CHANNEL_INTEQ = 1, RADIO_CHANNEL_INTEQ_LONG = 1)

/obj/item/encryptionkey/solgov/captain
	name = "\improper SolFed encryption key"
	icon_state = "solfed_cypherkey"
	channels = list(RADIO_CHANNEL_SOLFED = 1, RADIO_CHANNEL_SOLFED_LONG = 1)

/obj/item/encryptionkey/vox
	name = "vox encryption key"
	icon_state = "vox_cypherkey"
	channels = list(RADIO_CHANNEL_VOX = 1)
