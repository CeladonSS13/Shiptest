/datum/modpack/balance
	name = "Balance"
	desc = "Вносит изменения в баланс. Затронуты кинетик Крашер, проджектайлы энергетических дробовиков, двигатели, радиационные коллекторы, универсальная плата для вендоров с карго, цены в карго, одежда с ЦК. Изменено количество получаемого лута с элиток. Изменения попаданий по лежачим. Убрано замедление у синдидюффелей. Вернули омнизин в синди сигареты. Изменяет цены в оутпост меде"
	author = "Yata9arasu, RalseiDreemuurr, MrCat15352, Molniz, Ganza9991, Deylan, Quinal, Cuild"

// Инициализация ДО
/datum/modpack/balance/pre_initialize()
	. = ..()

// Инициализация ВОВРЕМЯ
/datum/modpack/balance/initialize()
	. = ..()
	GLOB.oddity_loot -= list(/obj/item/circular_saw/best) // CELADON_BALANCE - Что это за инструмент шакальный не понятно

// Инициализация ПОСЛЕ
/datum/modpack/balance/post_initialize()
	. = ..()
