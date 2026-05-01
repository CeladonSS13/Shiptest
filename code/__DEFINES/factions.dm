#define FACTION_SYNDICATE "Syndicate" // CELADON EDIT
	#define FACTION_NGR "New Gorlex Republic"
	#define FACTION_CYBERSUN "CyberSun" // CELADON EDIT
	#define FACTION_HARDLINERS "Hardliners"
	#define FACTION_SUNS "Student-Union of Naturalistic Sciences"
#define FACTION_SOLCON "SolFed" // CELADON EDIT
#define FACTION_SRM "Saint-Roumain Militia"
#define FACTION_INTEQ "InteQ" // CELADON EDIT
#define FACTION_CLIP "CLIP Minutemen" // CELADON EDIT
#define FACTION_NT "Nanotrasen"
	#define FACTION_NS_LOGI "N+S Logistics"
	#define FACTION_VIGILITAS "Vigilitas Interstellar"
#define FACTION_FRONTIERSMEN "Frontiersmen Fleet"
#define FACTION_PGF "Pan-Gezenan Federation" // CELADON EDIT
#define FACTION_ZOHIL "Zohil Explorat"
#define FACTION_INDEPENDENT "Independent"
#define FACTION_RAMZI "Ramzi Clique"
#define FACTION_UNKNOWN "Unknown"

#define PREFIX_SYNDICATE list("SEV", "SSV", "SMMV", "PCAC", "SSASV", "SSSV", "SOSSV", "TSSV", "SABSV", "BSSV", "ASSV", "MSSV", "LSSV", "DSSV", "RSSV",) // CELADON EDIT
	#define PREFIX_NGR list("NGRV")
	#define PREFIX_CYBERSUN list("CSSV")
	#define PREFIX_HARDLINERS list("HSSV") // CELADON EDIT
	#define PREFIX_SUNS list("SUNS")
#define PREFIX_SOLCON list("SCSV")
#define PREFIX_SRM list("SRSV")
#define PREFIX_INTEQ list("IRMV", "IQMSSV", "BIQSV", "LIQSV", "SPIQSV",) // CELADON EDIT
#define PREFIX_CLIP list("CMSV", "CMGSV", "CLSV")
#define PREFIX_NT list("NTSV", "NTBSV", "NTASV", "NTSSV", "NTTSV", "NTMSV", "NTLSV", "NTDSV", "NTSPSV", "NTESV", "NTRSV",)
	#define PREFIX_NS_LOGI list("NSSV")
	#define PREFIX_VIGILITAS list("VISV")
#define PREFIX_FRONTIERSMEN list("FFV")
#define PREFIX_PGF list("PGF", "PGFMC", "PGFN", "PGFS")
#define PREFIX_ZOHIL list("ZESV")
#define PREFIX_INDEPENDENT list("SV", "IMV", "ISV", "MSV", "ЕSV",) // CELADON EDIT
#define PREFIX_RAMZI list("RCSV")
#define PREFIX_NONE list()

#define FACTION_SORT_INDEPENDENT 100 // Independents first because of majority
#define FACTION_SORT_DEFAULT 50 // Everything else in the middle
#define FACTION_SORT_ASPAWN 0 // Frontiersmen and Ramzi on the bottom because of rarity
