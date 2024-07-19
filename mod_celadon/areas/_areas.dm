/datum/modpack/areas
	/// Строковое имя модпака. Используется для поиска других модпаков в init.
	name = "New areas"
	/// Строковое описание для модпака. Может использоваться для списка глаголов модпака в качестве описания.
	desc = "Мод добавляет новые зоны для мапинга."
	/// Строка с авторами этого модпака.
	author = "MrCat15352"

///**********************************************************************///
/// Эти проки нужны, для того чтобы инициализировать датумы в определенный момент времени
/// сборки билда. Инициализация обновляет данные в билде повторно, перезаписывая новыми значениями
/// из модпака. Но иногда, сама инциализация есть и вызывается в кор коде в определенный момент, и
/// тогда такие проки не нужны и вовсе. Также проки не нужны если в модпаке только объекты находятся.
/// Если эти конструкции не нужны, просто закоментируй их!
/// (можешь использовать все три, но запуск билда увеличится на 0.1 сек, за каждый датум в модпаке)

// Инициализация ДО
// /datum/modpack/donaters/pre_initialize()
// 	. = ..()

// Инициализация ВОВРЕМЯ
// /datum/modpack/areas/initialize()
// 	. = ..()

// Инициализация ПОСЛЕ
// /datum/modpack/donaters/post_initialize()
// 	. = ..()
