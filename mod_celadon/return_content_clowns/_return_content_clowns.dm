/// name - название модпака. Используется для поиска других модпаков в init.
/// desc - описание для модпака. Может использоваться для списка глаголов модпака в качестве описания.
/// author - автор(ы) этого модпака.

/datum/modpack/return_content_clowns
	name = "Return content clown and mime"
	desc = "Этот мод возвращает вырезаный контент офами, клоунов и мимов и все что с ними связано обратно в билд."
	author = "MrCat15352"

/// Эти проки нужны, для того чтобы инициализировать датумы в определенный момент времени
/// сборки билда. Инициализация обновляет данные в билде повторно, перезаписывая новыми значениями
/// из модпака. Но иногда, сама инциализация есть и вызывается в кор коде в определенный момент, и
/// тогда такие проки не нужны и вовсе. Также проки не нужны если в модпаке только объекты находятся.
/// Если эти конструкции не нужны, просто закоментируй их!
/// (можешь использовать все три, но запуск билда увеличится на 0.1 сек, за каждый датум в модпаке)

// Инициализация ДО
/datum/modpack/return_content_clowns/pre_initialize()
	. = ..()

// Инициализация ВОВРЕМЯ
/datum/modpack/return_content_clowns/initialize()
	. = ..()
	var/list/dye_registry = list(
		DYE_REGISTRY_UNDER = list(
			DYE_MIME = /obj/item/clothing/under/rank/civilian/mime,
			DYE_CLOWN = /obj/item/clothing/under/rank/civilian/clown,
		),
		DYE_REGISTRY_JUMPSKIRT = list(
			DYE_MIME = /obj/item/clothing/under/rank/civilian/mime/skirt,
		),
		DYE_REGISTRY_GLOVES = list(
			DYE_MIME = /obj/item/clothing/gloves/color/white,
			DYE_CLOWN = /obj/item/clothing/gloves/color/rainbow,
		),
		DYE_REGISTRY_SNEAKERS = list(
			DYE_MIME = /obj/item/clothing/shoes/sneakers/black,
		),
		DYE_REGISTRY_BEDSHEET = list(
			DYE_MIME = /obj/item/bedsheet/mime,
			DYE_CLOWN = /obj/item/bedsheet/clown,
		),
	)
	for(var/category, key in dye_registry)
		GLOB.dye_registry[category][key] = dye_registry[category][key]

	var/list/custom_names = list(
		"clown" = list("pref_name" = "Clown" , "qdesc" = "clown name", "group" = "fun", "allow_null" = FALSE),
		"mime" = list("pref_name" = "Mime", "qdesc" = "mime name" , "group" = "fun", "allow_null" = FALSE),
	)
	for(var/key in custom_names)
		GLOB.preferences_custom_names[key] = custom_names[key]

	GLOB.arcade_prize_pool |= list(
		/obj/item/toy/prize/honk = 1,
		/obj/item/clothing/shoes/wheelys = 2,
	)
	GLOB.blacklisted_malf_machines |= typecacheof(/obj/machinery/syndicatebomb/badmin/clown) // [CELADON-ADD] - CELADON_RETURN_CONTENT_CLOWNS
	GLOB.service_positions |= list("Clown", "Mime")

// Инициализация ПОСЛЕ
/datum/modpack/return_content_clowns/post_initialize()
	. = ..()
