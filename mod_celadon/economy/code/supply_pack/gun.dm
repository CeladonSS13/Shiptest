// Перемещено полностью в independent, кроме этого...
/*
		Rifles  // Origin -> code\modules\cargo\packs\gun.dm
*/
// ПР от Ганзы. Добавляет дробь для дробовиков
// /datum/supply_pack/gun/riot_shotgun // Вроде есть уже ящик с таким оружием, и ценник там 5000
// 	name = "Riot Shotguns Crate"
// 	desc = "For when the greytide gets out of hand. Contains 2 pump shotguns, each with a 4-round magazine."
// 	cost = 3000
// 	contains = list(/obj/item/gun/ballistic/shotgun/lethal,
// 					/obj/item/gun/ballistic/shotgun/lethal)
// 	crate_name = "shotguns crate"

/datum/supply_pack/gun/ballistic
	cost = 5500

/*
		Rifles  // Origin -> code\modules\cargo\packs\gun.dm
*/

/datum/supply_pack/gun/g36
	name = "Оружейный ящик G36"
	desc = "Содержит автоматическую винтовку G36 и одну дополнительную обойму стандартного размера."
	cost = 12000
	contains = list(/obj/item/storage/guncase/g36)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/g36sh
	name = "Оружейный ящик G36-SH"
	desc = "Содержит автоматическую винтовку G36-SH и одну дополнительную обойму малого размера."
	cost = 12000
	contains = list(/obj/item/storage/guncase/g36sh)
	crate_name = "auto rifle crate"

/datum/supply_pack/gun/morita1
	name = "Morita Mk.I Rifle crate"
	desc = "Содержит Morita Mk.I. и одну дополнительную обойму стандартного размера."
	cost = 11000
	contains = list(/obj/item/storage/guncase/morita1)
	crate_name = "auto rifle crate"

// ПР от Ганзы. Добавляет дробь для дробовиков
// /datum/supply_pack/gun/riot_shotgun // Вроде есть уже ящик с таким оружием, и ценник там 5000
// 	name = "Riot Shotguns Crate"
// 	desc = "For when the greytide gets out of hand. Contains 2 pump shotguns, each with a 4-round magazine."
// 	cost = 3000
// 	contains = list(/obj/item/gun/ballistic/shotgun/lethal,
// 					/obj/item/gun/ballistic/shotgun/lethal)
// 	crate_name = "shotguns crate"

/// Сайга-410
/datum/supply_pack/gun/saiga
	name = "Saiga-410 \"Saiga\" shotgun assault crate"
	desc = "Содержит штурмовой дробовик Saiga-410 и дополнительные пустые обоймы среднего размера."
	cost = 10850
	contains = list(/obj/item/storage/guncase/saiga)
	crate_name = "auto shotgun crate"


