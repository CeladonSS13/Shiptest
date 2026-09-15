// MARK: Telecomms
// Переопределено из code/game/machinery/telecomms/machines/relay.dm
/obj/machinery/telecomms/relay/preset/minutemen
	freq_listening = list(FREQ_EMERGENCY, FREQ_RAMZI)
	id = "Ramzi Relay"
	network = "ramzi_commnet"

/obj/machinery/telecomms/relay/preset/solgov
	freq_listening = list(FREQ_EMERGENCY, FREQ_SOLFED)
	id = "SolFed Relay"
	network = "solfed_commnet"

/obj/machinery/telecomms/relay/preset/frontiersmen
	freq_listening = list(FREQ_EMERGENCY, FREQ_PIRATE)
	id = "Unidentified Relay"
	network = "unidentified_commnet"

/obj/machinery/telecomms/relay/preset/pgf
	freq_listening = list(FREQ_EMERGENCY, FREQ_ELYSIUM)
	id = "Elysium Relay"
	network = "elysium_commnet"

// -- Новые телекомы --

/obj/machinery/telecomms/relay/preset/vox
	freq_listening = list(FREQ_EMERGENCY, FREQ_VOX)
	id = "Raider Relay"
	network = "raider_commnet"

/obj/machinery/telecomms/relay/preset/suns
	freq_listening = list(FREQ_EMERGENCY, FREQ_SUNS)
	id = "SUNS Relay"
	network = "suns_commnet"

/obj/machinery/telecomms/relay/preset/nanotrasen
	freq_listening = list(FREQ_EMERGENCY, FREQ_WARRA)
	id = "Nanotrasen Relay"
	network = "nanotrasen_commnet"

// MARK: Bus
// Переопределено из code/game/machinery/telecomms/machines/bus.dm
/obj/machinery/telecomms/bus/preset_five
	id = "Ramzi Communications Bus"
	network = "tcommsat"
	freq_listening = list(FREQ_RAMZI, FREQ_COMMON)
	autolinkers = list("processor5", "ramzi", "messaging")

/obj/machinery/telecomms/bus/preset_seven
	id = "SolFed Communications Bus"
	network = "tcommsat"
	freq_listening = list(FREQ_SOLFED, FREQ_COMMON)
	autolinkers = list("processor7", "solfed", "receiverA", "messaging")

// MARK: Server
// Переопределено из code/game/machinery/telecomms/machines/server.dm
/obj/machinery/telecomms/server/presets/solgov
	id = "SolFed Server"
	freq_listening = list(FREQ_SOLFED, FREQ_COMMON)
	autolinkers = list("solfed", "broadcasterA")

/obj/machinery/telecomms/server/presets/minutemen
	id = "Ramzi Server"
	freq_listening = list(FREQ_RAMZI, FREQ_COMMON)
	autolinkers = list("ramzi", "broadcasterA")

	/obj/machinery/telecomms/server/presets/pirate
	id = "Unidentified Server"
	freq_listening = list(FREQ_PIRATE, FREQ_COMMON)
	autolinkers = list("unidentified", "broadcasterB")

// -- Новые серверы --

/obj/machinery/telecomms/server/presets/vox
	id = "Raider Server"
	freq_listening = list(FREQ_VOX, FREQ_COMMON)
	autolinkers = list("raider", "broadcasterB")

/obj/machinery/telecomms/server/presets/suns
	id = "SUNS Server"
	freq_listening = list(FREQ_SUNS, FREQ_COMMON)
	autolinkers = list("suns", "broadcasterB")

/obj/machinery/telecomms/server/presets/nanotrasen
	id = "Nanotrasen Server"
	freq_listening = list(FREQ_WARRA, FREQ_COMMON)
	autolinkers = list("nanotrasen", "broadcasterA")
