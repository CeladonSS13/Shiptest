/*
		Rifles  // Origin -> code\modules\cargo\packs\gun.dm
*/

/datum/supply_pack/gun/g36
	name = "Оружейный ящик G36"
	desc = "Содержит автоматическую винтовку G36 и 2 запасных пустых обойм."
	cost = 4500
	contains = list(/obj/item/storage/guncase/g36)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/g36sh
	name = "Оружейный ящик G36-SH"
	desc = "Содержит автоматическую винтовку G36-SH и 2 запасных пустых обойм."
	cost = 4500
	contains = list(/obj/item/storage/guncase/g36sh)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/morita1
	name = "Morita Mk.I Rifle crate"
	desc = "Содержит Morita Mk.I. и дополнительную пустую обойму."
	cost = 7350
	contains = list(/obj/item/storage/guncase/morita1)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/morita1_forest
	name = "Morita/forest Mk.I Rifle crate"
	desc = "Содержит Morita/forest Mk.I. и дополнительный пустой барабанный магазин."
	cost = 10850
	contains = list(/obj/item/storage/guncase/morita1_forest)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/morita1_desert
	name = "Morita/desert Mk.I Rifle crate"
	desc = "Содержит Morita/desert Mk.I. и дополнительный пустой барабанный магазин."
	cost = 10850
	contains = list(/obj/item/storage/guncase/morita1_desert)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/morita1_swamp
	name = "Morita/swamp Mk.I Rifle crate"
	desc = "Содержит Morita/swamp Mk.I. и дополнительный пустой барабанный магазин."
	cost = 10850
	contains = list(/obj/item/storage/guncase/morita1_swamp)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/glock
	name = "Оружейный ящик Glock"
	desc = "Содержит пустой пистолет Glock, калибра 9mm."
	cost = 1300
	contains = list(/obj/item/storage/pistolcase/glock)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/usp
	name = "Оружейный ящик USP"
	desc = "Содержит пустой пистолет USP, калибра .45"
	cost = 1350
	contains = list(/obj/item/storage/pistolcase/usp)
	crate_name = "auto rifle crate"

// ПР от Ганзы. Добавляет дробь для дробовиков
// /datum/supply_pack/gun/riot_shotgun // Вроде есть уже ящик с таким оружием, и ценник там 5000
// 	name = "Riot Shotguns Crate"
// 	desc = "For when the greytide gets out of hand. Contains 2 pump shotguns, each with a 4-round magazine."
// 	cost = 3000
// 	contains = list(/obj/item/gun/ballistic/shotgun/lethal,
// 					/obj/item/gun/ballistic/shotgun/lethal)
// 	crate_name = "shotguns crate"

/datum/supply_pack/gun/ballistic
	name = "Combat Shotguns Crate"
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains two Aussec-designed combat shotguns."
	cost = 5500
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat)
	crate_name = "combat shotguns crate"

/// Сайга-410
/datum/supply_pack/gun/saiga
	name = "Saiga-410 \"Saiga\" shotgun assault crate"
	desc = "Содержит Saiga-410 и дополнительные пустые обоймы."
	cost = 10850
	contains = list(/obj/item/storage/guncase/saiga)
	crate_name = "auto shotgun crate"
