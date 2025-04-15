// Перенесено с code\__HELPERS\names.dm | Инициализация префиксов кораблей для дальнейшего использования в конфигах.
#define FACTION_SYNDICATE "Syndicate"
	#define FACTION_NGR "New Gorlex Republic"
	#define FACTION_CYBERSUN "CyberSun"
	#define FACTION_HARDLINERS "Hardliners"
	#define FACTION_SUNS "Student-Union of Naturalistic Sciences"
#define FACTION_SOLGOV "SolFed"
#define FACTION_SOLCON "SolFed"
#define FACTION_INTEQ "Inteq Risk Management Group"
#define FACTION_NT "Nanotrasen"
	#define FACTION_NS_LOGI "N+S Logistics"
	#define FACTION_VIGILITAS "Vigilitas Interstellar"
#define FACTION_INDEPENDENT "Independent"
#define FACTION_ELYSIUM "Elysium"
#define FACTION_EVENT "Event"
#define FACTION_PIRATES "Pirates"

#define FACTION_RAMZI "Ramzi Clique"
#define FACTION_SRM "Saint-Roumain Militia"
#define FACTION_CLIP "CLIP Minutemen"
#define FACTION_FRONTIER "Frontiersmen Fleet"
#define FACTION_FRONTIERSMEN "Frontiersmen Fleet"
#define FACTION_PGF "Pan-Gezenan Federation"

// code/__DEFINES/mobfactions.dm
// #define FACTION_PLAYER_SYNDICATE "playerSyndicate"
#define FACTION_PLAYER_PIRATE "playerPirate"
// #define FACTION_PLAYER_NANOTRASEN "playerNanotrasen"
// #define FACTION_PLAYER_FRONTIERSMEN "playerFrontiersmen"
// #define FACTION_PLAYER_MINUTEMAN "playerMinuteman"
#define FACTION_PLAYER_SOLGOV "playerSolgov"
// #define FACTION_PLAYER_SOLCON "playerSolcon"
// #define FACTION_PLAYER_INTEQ "playerInteq"
// #define FACTION_PLAYER_ROUMAIN "playerRoumain"
// #define FACTION_PLAYER_GEZENA "playerGezena"

#define PREFIX_SRM list("SRSV",)
#define PREFIX_SYNDICATE list("SEV", "SSV", "SMMV", "PCAC", "SSASV", "SSSV", "SOSSV", "TSSV", "SABSV", "BSSV", "ASSV", "MSSV", "LSSV", "DSSV",)
	#define PREFIX_NGR list("NGRV",)
	#define PREFIX_CYBERSUN list("CSSV",)
	#define PREFIX_HARDLINERS list("ISV",)
	#define PREFIX_SUNS list("SUNS",)
#define PREFIX_SOLCON list("SCSV")
#define PREFIX_SOLGOV list("SFSV", "BSFSV", "ASFSV", "SSFSV", "MDSFSV", "LSFSV", "MSFSV", "SPSFSV",)
#define PREFIX_INTEQ list("IRMV", "IQMSSV", "BIQSV", "LIQSV", "SPIQSV",)
#define PREFIX_NT list("NTSV", "NTBSV", "NTASV", "NTSSV", "NTTSV", "NTMSV", "NTLSV", "NTDSV", "NTSPSV",)
	#define PREFIX_NS_LOGI list("NSSV",)
	#define PREFIX_VIGILITAS list("VISV",)
#define PREFIX_FRONTIER list("FFV",)
#define PREFIX_INDEPENDENT list("SV", "IMV", "ISV", "MSV",)
#define PREFIX_ELYSIUM list("EUSM", "EUSQ", "EUSF", "EUSR",)
#define PREFIX_PIRATES list("PIRATE",)
#define PREFIX_EVENT list("CLO",)

#define PREFIX_FRONTIERSMEN list("FFV")
#define PREFIX_CLIP list("CMSV", "CMGSV",)
#define PREFIX_PGF list("PGF", "PGFMC", "PGFN",)
#define PREFIX_RAMZI list("RCSV")
#define PREFIX_NONE list()

GLOBAL_LIST_INIT(ship_faction_to_prefixes, list(
	FACTION_SYNDICATE = PREFIX_SYNDICATE,
	FACTION_SOLGOV = PREFIX_SOLGOV,
	FACTION_INTEQ = PREFIX_INTEQ,
	FACTION_NT = PREFIX_NT,
	FACTION_INDEPENDENT = PREFIX_INDEPENDENT,
	FACTION_ELYSIUM = PREFIX_ELYSIUM,
	FACTION_PIRATES = PREFIX_PIRATES,
	FACTION_EVENT = PREFIX_EVENT
	))
