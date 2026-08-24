//server
/obj/machinery/telecomms/server/presets/nanotrasen
	id = "Nanotrasen Server"
	freq_listening = list(FREQ_WARRA, FREQ_COMMON)
	autolinkers = list("nanotrasen", "broadcasterA")

//relay
/obj/machinery/telecomms/relay/preset/nanotrasen
	freq_listening = list(FREQ_EMERGENCY, FREQ_WARRA)
	id = "Nanotrasen Relay"
	network = "nanotrasen_commnet"

//key
/obj/item/encryptionkey/nanotrasen
	name = "Nanotrasen encryption key"
	icon_state = "hop_cypherkey"
	channels = list(RADIO_CHANNEL_WARRA = 1)
