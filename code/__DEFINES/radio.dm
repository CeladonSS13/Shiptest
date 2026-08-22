// Radios use a large variety of predefined frequencies.

//say based modes like binary are in living/say.dm

#define RADIO_CHANNEL_COMMON "Common"
#define RADIO_KEY_COMMON ";"

#define RADIO_CHANNEL_EMERGENCY "Emergency"
#define RADIO_KEY_EMERGENCY "c"
#define RADIO_TOKEN_EMERGENCY ":c"

// [CELADON-EDIT] - FACTION_RADIO
#define RADIO_CHANNEL_SYNDICATE "Syndicate"
#define RADIO_CHANNEL_SYNDICATE_LONG "Syndicate (Long-Range)"
#define RADIO_KEY_SYNDICATE "t"
#define RADIO_TOKEN_SYNDICATE ":t"

#define RADIO_CHANNEL_CYBERSUN "Cybersun"
#define RADIO_KEY_CYBERSUN "c"
#define RADIO_TOKEN_CYBERSUN ":c"

#define RADIO_CHANNEL_NGR "New Gorlex"
#define RADIO_KEY_NGR "f"
#define RADIO_TOKEN_NGR ":f"

#define RADIO_CHANNEL_SUNS "SUNS"
#define RADIO_CHANNEL_SUNS_LONG "SUNS (Long-Range)"
#define RADIO_KEY_SUNS "d"
#define RADIO_TOKEN_SUNS ":d"

#define RADIO_CHANNEL_CENTCOM "CentCom"
#define RADIO_KEY_CENTCOM "e"
#define RADIO_TOKEN_CENTCOM ":e"

#define RADIO_CHANNEL_SOLGOV "SolGov"
#define RADIO_KEY_SOLGOV "s"
#define RADIO_TOKEN_SOLGOV ":s"

#define RADIO_CHANNEL_SOLFED "SolFed"
#define RADIO_CHANNEL_SOLFED_LONG "SolFed (Long-Range)"
#define RADIO_KEY_SOLFED "s"
#define RADIO_TOKEN_SOLFED ":s"

#define RADIO_CHANNEL_WARRA "Makosso-Warra"
#define RADIO_KEY_WARRA "mw"
#define RADIO_TOKEN_WARRA ":mw"

#define RADIO_CHANNEL_MINUTEMEN "Minutemen"
#define RADIO_KEY_MINUTEMEN "m"
#define RADIO_TOKEN_MINUTEMEN ":m"

#define RADIO_CHANNEL_PGF "PGF"
#define RADIO_KEY_PGF "g"
#define RADIO_TOKEN_PGF ":g"

#define RADIO_CHANNEL_VOX "Raider"
#define RADIO_KEY_VOX "v"
#define RADIO_TOKEN_VOX ":v"

// [CELADON-ADD]
#define RADIO_CHANNEL_NANOTRASEN "Nanotrasen"
#define RADIO_CHANNEL_NANOTRASEN_LONG "Nanotrasen (Long-Range)"
#define RADIO_KEY_NANOTRASEN "n"
#define RADIO_TOKEN_NANOTRASEN ":n"

#define RADIO_CHANNEL_ELYSIUM "Elysium"
#define RADIO_CHANNEL_ELYSIUM_LONG "Elysium (Long-Range)"
#define RADIO_KEY_ELYSIUM "e"
#define RADIO_TOKEN_ELYSIUM ":e"
// [/CELADON-ADD]

#define RADIO_CHANNEL_INTEQ "Inteq"
#define RADIO_CHANNEL_INTEQ_LONG "Inteq (Long-Range)"
#define RADIO_KEY_INTEQ "q"
#define RADIO_TOKEN_INTEQ ":q"

#define RADIO_CHANNEL_RAMZI "Ramzi"
#define RADIO_KEY_RAMZI "r"
#define RADIO_TOKEN_RAMZI ":r"

#define RADIO_CHANNEL_PIRATE "Unidentified"
#define RADIO_KEY_PIRATE "p"
#define RADIO_TOKEN_PIRATE ":p"
// [/CELADON-EDIT]

#define RADIO_CHANNEL_WIDEBAND "Wideband"
#define RADIO_KEY_WIDEBAND "w"
#define RADIO_TOKEN_WIDEBAND ":w"	//WS End

#define RADIO_CHANNEL_CTF_RED "Red Team"
#define RADIO_CHANNEL_CTF_BLUE "Blue Team"


#define MIN_FREE_FREQ 1201 // -------------------------------------------------
// Frequencies are always odd numbers and range from 1201 to 1599.

// [CELADON-EDIT] - FACTION_RADIO
#define FREQ_CENTCOM 1237 // NT-CentCom comms frequency, gray

#define FREQ_CYBERSUN 1203	// Cybersun Industries and Hardliners comms frequency, teal
#define FREQ_NGR 1205		// New Gorlex Republic comms frequency, beige

#define FREQ_SYNDICATE 1213
#define FREQ_SYNDICATE_LONG 1215

#define FREQ_SUNS 1325
#define FREQ_SUNS_LONG 1327

#define FREQ_INTEQ 1333
#define FREQ_INTEQ_LONG 1335

#define FREQ_NANOTRASEN 1345
#define FREQ_NANOTRASEN_LONG 1347

#define FREQ_SOLFED 1353
#define FREQ_SOLFED_LONG 1355

#define FREQ_ELYSIUM 1339
#define FREQ_ELYSIUM_LONG 1341

#define FREQ_VOX 1417
#define FREQ_VOX_LONG 1419

#define FREQ_RAMZI 1421
#define FREQ_RAMZI_LONG 1423

#define FREQ_PIRATE 1425
#define FREQ_PIRATE_LONG 1427

#define FREQ_EMERGENCY 1429 // Emergency comms frequency, red
// [/CELADON-EDIT]

#define FREQ_SOLGOV 1345 // SolGov comms frequency, dark blue WS ADDITION
#define FREQ_PGF 1349 // PGF comms frequency, lime green
#define FREQ_WARRA 1351 // Makosso-Warra comms frequency, plum
#define FREQ_MINUTEMEN 1355 // Minutemen comms frequency, soft blue

#define FREQ_HOLOGRID_SOLUTION 1433
#define FREQ_STATUS_DISPLAYS 1435
#define FREQ_ATMOS_ALARMS 1437 // air alarms <-> alert computers
#define FREQ_ATMOS_CONTROL 1439 // air alarms <-> vents and scrubbers

#define MIN_FREQ 1441 // ------------------------------------------------------
// Only the 1441 to 1689 range is freely available for general conversation.

#define FREQ_ATMOS_STORAGE 1441
#define FREQ_NAV_BEACON 1445
#define FREQ_PRESSURE_PLATE 1447
#define FREQ_AIRLOCK_CONTROL 1449
#define FREQ_ELECTROPACK 1449
#define FREQ_MAGNETS 1449
#define FREQ_LOCATOR_IMPLANT 1451
#define FREQ_SIGNALER 1457 // the default for new signalers
#define FREQ_COMMON 1459 // Common comms frequency, dark green

#define MAX_FREQ 1689 // ------------------------------------------------------

#define FREQ_WIDEBAND 1691 // sector wide communication

#define MAX_FREE_FREQ 1699 // -------------------------------------------------

// Transmission types.
#define TRANSMISSION_WIRE 0 // some sort of wired connection, not used
#define TRANSMISSION_RADIO 1 // electromagnetic radiation (default)
#define TRANSMISSION_SUBSPACE 2 // subspace transmission (headsets only)
#define TRANSMISSION_SUPERSPACE 3 // reaches independent (CentCom) radios only
#define TRANSMISSION_SECTOR 4 // sector-wide broadcasting units, for cross-sector transmitting but not receiving

// Filter types, used as an optimization to avoid unnecessary proc calls.
#define RADIO_TO_AIRALARM "to_airalarm"
#define RADIO_FROM_AIRALARM "from_airalarm"
#define RADIO_SIGNALER "signaler"
#define RADIO_ATMOSIA "atmosia"
#define RADIO_AIRLOCK "airlock"
#define RADIO_MAGNETS "magnets"

#define DEFAULT_SIGNALER_CODE 30

//Requests Console
#define REQ_NO_NEW_MESSAGE 0
#define REQ_NORMAL_MESSAGE_PRIORITY 1
#define REQ_HIGH_MESSAGE_PRIORITY 2
#define REQ_EXTREME_MESSAGE_PRIORITY 3

#define REQ_DEP_TYPE_ASSISTANCE (1<<0)
#define REQ_DEP_TYPE_SUPPLIES (1<<1)
#define REQ_DEP_TYPE_INFORMATION (1<<2)

//Interference levels
#define INTERFERENCE_LEVEL_BREAKUP_HOLOPADS 30
#define INTERFERENCE_LEVEL_RADIO_PREVENT_ID 50
#define INTERFERENCE_LEVEL_RADIO_STATIC_SOUND 70

///give this to can_receive to specify that there is no restriction on what virtual z level this signal is sent to
#define RADIO_NO_Z_LEVEL_RESTRICTION 0
