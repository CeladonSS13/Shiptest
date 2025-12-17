// Weapon exports. Stun batons, disablers, etc.
// Логика для уникального оружия такая: cargo_cost / 10 = export_cost
// MARK: Weapon

/datum/export/weapon
	include_subtypes = FALSE

/datum/export/weapon/baton
	unit_name = "stun baton"
	desc = "Security with a stun baton."
	cost = 250
	export_types = list(/obj/item/melee/baton)
	exclude_types = list(/obj/item/melee/baton/cattleprod)
	include_subtypes = TRUE

/datum/export/weapon/taser
	unit_name = "advanced taser"
	desc = "Disabler-taser hybrid weapon."
	cost = 125
	export_types = list(/obj/item/gun/energy/e_gun/advtaser)

/datum/export/weapon/laser
	unit_name = "laser gun"
	desc = "Scatter Laser a multi-function scatter energy gun."
	cost = 125
	export_types = list(/obj/item/gun/energy/laser)

/datum/export/weapon/disabler
	unit_name = "disabler"
	desc = "One of the most basic energy weapons in the universe."
	cost = 100
	export_types = list(/obj/item/gun/energy/disabler)

/datum/export/weapon/energy_gun
	unit_name = "energy gun"
	cost = 150
	export_types = list(/obj/item/gun/energy/e_gun)

/datum/export/weapon/energy_gun
	unit_name = "energy gun"
	desc = "This premium assault rifle is the most reliable Nanotrasen-Sharplite energy weapon"
	cost = 200
	export_types = list(/obj/item/storage/guncase/hades_old)

// MARK: Nanotrasen

/datum/export/weapon/hades
	unit_name = "energy gun"
	desc = "This premium assault rifle is the most reliable Nanotrasen-Sharplite energy weapon"
	cost = 600
	export_types = list(/obj/item/storage/guncase/hades_old)

/datum/export/weapon/saber
	unit_name = "VI Saber SMG"
	desc = "An experimental ballistic weapon produced by Vigilitas Interstellar."
	cost = 250
	export_types = list(/obj/item/storage/guncase/saber_old)

/datum/export/weapon/vector
	unit_name = "VI Vector SMG"
	desc = "Vector PDW produced by Sharplite Defense and chambered in 9x18mm."
	cost = 300
	export_types = list(/obj/item/storage/guncase/vector)

/datum/export/weapon/wt550
	unit_name = "WT-550 automatic rifle"
	desc = "A ballistic PDW produced by Vigilitas Interstellar."
	cost = 350
	export_types = list(/obj/item/gun/ballistic/automatic/smg/wt550)

/datum/export/weapon/shotgun
	unit_name = "combat shotgun"
	desc = "For when the enemy absolutely needs to be replaced with lead."
	cost = 350
	export_types = list(/obj/item/gun/ballistic/shotgun/automatic/combat)

// MARK: Independent

/datum/export/weapon/glock
	unit_name = "Glock Pistol"
	desc = "Glock Pistol 9x18mm."
	cost = 130
	export_types = list(/obj/item/storage/guncase/glock)

/datum/export/weapon/usp
	unit_name = "USP Pistol"
	desc = "USP pistol .45 caliber."
	cost = 135
	export_types = list(/obj/item/storage/guncase/usp)

// MARK: Grenade
/datum/export/weapon/flashbang
	cost = 5
	unit_name = "flashbang grenade"
	export_types = list(/obj/item/grenade/flashbang)

/datum/export/weapon/teargas
	cost = 5
	unit_name = "tear gas grenade"
	export_types = list(/obj/item/grenade/chem_grenade/teargas)

/datum/export/weapon/flash
	cost = 5
	unit_name = "handheld flash"
	export_types = list(/obj/item/assembly/flash)
	include_subtypes = TRUE
