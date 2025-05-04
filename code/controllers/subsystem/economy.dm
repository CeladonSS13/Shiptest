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

//[CELADON-ADD] - CELADON_OUTPOST_CONSOLE
	var/budget_pool = 35000
	var/list/department_accounts = list(ACCOUNT_FAC = ACCOUNT_FAC_NAME,
										ACCOUNT_SYN = ACCOUNT_SYN_NAME,
										ACCOUNT_INT = ACCOUNT_INT_NAME,
										ACCOUNT_SLF = ACCOUNT_SLF_NAME,
										ACCOUNT_NTN = ACCOUNT_NTN_NAME,
										ACCOUNT_IND = ACCOUNT_IND_NAME,
										ACCOUNT_IND_1 = ACCOUNT_IND_1_NAME,
										ACCOUNT_IND_2 = ACCOUNT_IND_2_NAME,
										ACCOUNT_IND_3 = ACCOUNT_IND_3_NAME,
										ACCOUNT_IND_4 = ACCOUNT_IND_4_NAME)
	var/list/departmental_accounts = list()
//[/CELADON-ADD]

/datum/controller/subsystem/economy/stat_entry(msg)
	msg += "{"
	msg += "PH: [physical_money]|"
	msg += "BN: [bank_money]|"
	msg += "TOT: [physical_money + bank_money]"
	msg += "}"
	return ..()

//[CELADON-ADD] - CELADON_OUTPOST_CONSOLE
/datum/bank_account/department
	account_holder = "Guild Credit Agency"
	var/department_id = "REPLACE_ME"

/datum/bank_account/department/New(dep_id, budget, player_account = FALSE)
	department_id = dep_id
	account_balance = budget
	account_holder = SSeconomy.department_accounts[dep_id]
	SSeconomy.departmental_accounts += src

/datum/controller/subsystem/economy/proc/get_dep_account(dep_id)
	for(var/datum/bank_account/department/D in departmental_accounts)
		if(D.department_id == dep_id)
			return D

/datum/controller/subsystem/economy/Initialize()
	for(var/dep_id in department_accounts)
		new /datum/bank_account/department(dep_id, 0, player_account = FALSE)
	return 2
//[/CELADON-ADD]
