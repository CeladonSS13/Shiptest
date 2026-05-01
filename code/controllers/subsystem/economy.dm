//[CELADON-ADD] - CELADON_OUTPOST_CONSOLE
#define ACCOUNT_FAC "FAC"
#define ACCOUNT_FAC_NAME "Faction Budget"
#define ACCOUNT_SYN "SYN"
#define ACCOUNT_SYN_NAME "Syndicate Budget"
#define ACCOUNT_INT "INT"
#define ACCOUNT_INT_NAME "InteQ Budget"
#define ACCOUNT_SLF "SLF"
#define ACCOUNT_SLF_NAME "SolFed Budget"
#define ACCOUNT_NTN "NTN"
#define ACCOUNT_NTN_NAME "Nanotrasen Budget"
#define ACCOUNT_IND "IND"
#define ACCOUNT_IND_NAME "Independent Budget"
#define ACCOUNT_IND_1 "IND_1"
#define ACCOUNT_IND_1_NAME "Independent 1 Budget"
#define ACCOUNT_IND_2 "IND_2"
#define ACCOUNT_IND_2_NAME "Independent 2 Budget"
#define ACCOUNT_IND_3 "IND_3"
#define ACCOUNT_IND_3_NAME "Independent 3 Budget"
#define ACCOUNT_IND_4 "IND_4"
#define ACCOUNT_IND_4_NAME "Independent 4 Budget"
//[/CELADON-ADD]

SUBSYSTEM_DEF(economy)
	name = "Economy"
	init_order = INIT_ORDER_ECONOMY
	flags = SS_NO_FIRE
	runlevels = RUNLEVEL_GAME

	///List of normal accounts (not ship accounts)
	var/list/bank_accounts = list()
	///Total amount of physical money in the game
	var/physical_money = 0
	///Total amount of money in bank accounts
	var/bank_money = 0

/datum/controller/subsystem/economy/stat_entry(msg)
	msg += "{"
	msg += "PH: [physical_money]|"
	msg += "BN: [bank_money]|"
	msg += "TOT: [physical_money + bank_money]"
	msg += "}"
	return ..()
