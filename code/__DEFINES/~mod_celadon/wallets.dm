#define RANDOM_WALLET_STYLE "random_wallet_style"

#define PREF_NOWALLET "No Wallet"
#define PREF_WALLET "Standart Wallet"
#define PREF_BLACKWALLET "Black Wallet"
#define PREF_WHITEWALLET "White Wallet"

GLOBAL_LIST_INIT(walletlist, list(
	PREF_NOWALLET,
	PREF_WALLET,
	PREF_BLACKWALLET,
	PREF_WHITEWALLET
	))
