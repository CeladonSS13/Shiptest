// MARK: Radio

// [CELADON-ADD] - FACTION_RADIO
/obj/item/radio/transceiver
	name = "transceiver"
	desc = "A tactical communications device for those times when you need it."
	icon = 'mod_celadon/_storage_icons/icons/items/misc/radio.dmi'
	icon_state = "walkietalkiesec"
	item_state = "walkietalkiesec"
	freerange = TRUE
	frequency = FREQ_EMERGENCY
	freqlock = TRUE

// MARK: Фракционные рации
// Можно купить в карго
/obj/item/radio/transceiver/nanotrasen
	name = "nanotrasen transceiver"
	icon_state = "walkietalkie_nt"
	frequency = FREQ_NANOTRASEN
	keyslot = /obj/item/encryptionkey/nanotrasen

/obj/item/radio/transceiver/syndicate
	name = "syndicate transceiver"
	icon_state = "walkietalkie_syndi"
	frequency = FREQ_SYNDICATE
	keyslot = /obj/item/encryptionkey/syndicate

/obj/item/radio/transceiver/solfed
	name = "solfed transceiver"
	icon_state = "walkietalkie_sf"
	frequency = FREQ_SOLFED
	keyslot = /obj/item/encryptionkey/solgov

/obj/item/radio/transceiver/inteq
	name = "inteq transceiver"
	icon_state = "walkietalkie_inteq"
	frequency = FREQ_INTEQ
	keyslot = /obj/item/encryptionkey/inteq

// Не встречаются в игре, нельзя найти
/obj/item/radio/transceiver/pirate
	name = "unidentified transceiver"
	icon_state = "walkietalkie_pirate"
	frequency = FREQ_PIRATE
	keyslot = /obj/item/encryptionkey/pirate

/obj/item/radio/transceiver/elysium
	name = "elysium transceiver"
	icon_state = "walkietalkie_eusm"
	frequency = FREQ_ELYSIUM
	keyslot = /obj/item/encryptionkey/elysium

/obj/item/radio/transceiver/ramzi
	name = "ramzi transceiver"
	icon_state = "walkietalkie_ramzi"
	frequency = FREQ_RAMZI
	keyslot = /obj/item/encryptionkey/ramzi

/obj/item/radio/transceiver/vox
	name = "raider transceiver"
	icon_state = "walkietalkie_vox"
	frequency = FREQ_VOX
	keyslot = /obj/item/encryptionkey/vox

/obj/item/radio/transceiver/suns
	name = "suns transceiver"
	icon_state = "walkietalkie_suns"
	frequency = FREQ_SUNS
	keyslot = /obj/item/encryptionkey/syndicate/suns

// MARK: Intercoms
// Переопределено из code\game\objects\items\devices\radio\intercom.dm
/obj/item/radio/intercom
	var/faction = FALSE

/obj/item/radio/intercom/faction
	name = "internal intercom"
	desc = "A internal intercom. Faction radio included!"
	icon = 'mod_celadon/_storage_icons/icons/machinery/intercoms_maphelp.dmi'
	icon_state = "intercom"
	keyslot = new /obj/item/encryptionkey/wideband
	frequency = FREQ_EMERGENCY
	freqlock = TRUE
	independent = TRUE
	freerange = TRUE
	faction = TRUE
	var/stripe_color = null		/// What color is this machine's stripe? Leave null to not have a stripe.

/obj/item/radio/intercom/faction/Initialize(mapload, ndir, building)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)
	set_frequency(frequency)
	freqlock = TRUE

/obj/item/radio/intercom/faction/screwdriver_act(mob/living/user, obj/item/tool)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/radio/intercom/faction/update_overlays()
	. = ..()
	if(unscrewed)
		. += "intercom-open"
	if(!stripe_color)
		return

	var/mutable_appearance/stripe = mutable_appearance(icon, "intercom-offline")
	if(on)
		stripe.icon_state = "intercom-active"
		stripe.color = stripe_color
	. += stripe

/obj/item/radio/intercom/faction/syndicate
	keyslot = new /obj/item/encryptionkey/syndicate
	frequency = FREQ_SYNDICATE
	stripe_color = "#fd5454"
	icon_state = "intercom-syndicate"

/obj/item/radio/intercom/faction/syndicate/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_SYNDICATE_LONG
	icon_state = "intercom-syndicate-c"

/obj/item/radio/intercom/faction/suns
	keyslot = new /obj/item/encryptionkey/syndicate/suns
	frequency = FREQ_SUNS
	stripe_color = "#b162ff"
	icon_state = "intercom-suns"

/obj/item/radio/intercom/faction/suns/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_SUNS_LONG
	icon_state = "intercom-suns-c"

/obj/item/radio/intercom/faction/inteq
	keyslot = new /obj/item/encryptionkey/inteq
	frequency = FREQ_INTEQ
	stripe_color = "#ffb92d"
	icon_state = "intercom-inteq"

/obj/item/radio/intercom/faction/inteq/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_INTEQ_LONG
	icon_state = "intercom-inteq-c"

/obj/item/radio/intercom/faction/elysium
	keyslot = new /obj/item/encryptionkey/elysium
	frequency = FREQ_ELYSIUM
	stripe_color = "#29ff29"
	icon_state = "intercom-elysium"

/obj/item/radio/intercom/faction/elysium/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_ELYSIUM_LONG
	icon_state = "intercom-elysium-c"

/obj/item/radio/intercom/faction/nanotrasen
	keyslot = new /obj/item/encryptionkey/nanotrasen
	frequency = FREQ_NANOTRASEN
	stripe_color = "#5fafff"
	icon_state = "intercom-nanotrasen"

/obj/item/radio/intercom/faction/nanotrasen/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_NANOTRASEN_LONG
	icon_state = "intercom-nanotrasen-c"

/obj/item/radio/intercom/faction/solfed
	keyslot = new /obj/item/encryptionkey/solgov
	frequency = FREQ_SOLFED
	stripe_color = "#4fe2ff"
	icon_state = "intercom-solfed"

/obj/item/radio/intercom/faction/solfed/command
	name = "command long-range intercom"
	log = TRUE
	frequency = FREQ_SOLFED_LONG
	icon_state = "intercom-solfed-c"

/obj/item/radio/intercom/faction/ramzi
	keyslot = new /obj/item/encryptionkey/ramzi
	frequency = FREQ_RAMZI
	stripe_color = "#ca9d6f"
	icon_state = "intercom-ramzi"

/obj/item/radio/intercom/faction/pirate
	keyslot = new /obj/item/encryptionkey/pirate
	frequency = FREQ_PIRATE
	stripe_color = "#777777"
	icon_state = "intercom-pirate"

MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/syndicate, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/syndicate/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/suns, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/suns/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/inteq, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/inteq/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/elysium, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/elysium/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/nanotrasen, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/nanotrasen/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/solfed, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/solfed/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/ramzi, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/ramzi/command, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/pirate, 31)
MAPPING_DIRECTIONAL_HELPERS(/obj/item/radio/intercom/faction/pirate/command, 31)
