/datum/modpack/fixes
	name = "Fixes"
	desc = "Содержит различные фиксы багов. \
			Фикс удушья при пустом баллоне. \
			Сломанные иконки. \
			Исправление работы плазма двигателей, \
			фикс зарядки револьверов, \
			фикс newscaster, \
			фикс дюпа боргов, \
			фикс сломанных шаттерсов, \
			поддержка русского языка в конослях телекоммов, \
			добавляет возможность писать в LOOC будучи призраком. \
			Чинит миссии на исследования карпов, метеоритов и пыли, \
			фикс разборки коилов, \
			Weebstick (Красная катана) теперь нельзя сломать, вытащив меч при подготовке блинка. (Если что-то сломается всёравно, попросите вызвать proc \"unprime_unlock\" у ближайшего админа), \
			фикс бесконечного спавна мобов при добыче, \
			фикс перезарядки мех-оружия (SOB-3, BRM-6, SGL-6), \
			фикс бесконечного спавна мобов при добыче с балансировкой жил класса 4, \
			фикс оффовской одежды c закатываемыми руками в атласе - icons/obj/clothing/under/security.dmi \
			фазон требует ядро блюспейс аномалии"
			// TODO сделать ПР для офовичные фиксы багов. Фикс удушья при пустом баллоне. Сломанные иконки. Исправление работы плазма двигателей,фикс зарядки револьверов, фикс дюпа боргов, фикс сломанных шаттерсов" // TODO сделать ПР для офов
	author = "RalseiDreemuurr, Mirag1993, Корольный крыс, MrCat15352, MysticalFaceLesS, GrozaAndGrom, MrRomainzZ, Yata9arasu, Redwizz777, Ganza9991, Cuildipie, Турон"

/// Эти проки нужны, для того чтобы инициализировать датумы в определенный момент времени
/// сборки билда. Инициализация обновляет данные в билде повторно, перезаписывая новыми значениями
/// из модпака. Но иногда, сама инциализация есть и вызывается в кор коде в определенный момент, и
/// тогда такие проки не нужны и вовсе. Также проки не нужны если в модпаке только объекты находятся.
/// Если эти конструкции не нужны, просто закоментируй их!
/// (можешь использовать все три, но запуск билда увеличится на 0.1 сек, за каждый датум в модпаке)

// Инициализация ДО
/datum/modpack/fixes/pre_initialize()
	. = ..()

// Инициализация ВОВРЕМЯ
/datum/modpack/fixes/initialize()
	. = ..()
	GLOB.channel_tokens[MODE_BINARY] = RADIO_TOKEN_WIDEBAND
	GLOB.rod_recipes += new /datum/stack_recipe("guardrail barricade", /obj/structure/deployable_barricade/guardrail, 15, time = 4 SECONDS, one_per_turf = TRUE, on_floor = TRUE) // [CELADON-ADD] - CELADON_STRUCTURES - Барикады
	GLOB.leather_recipes += new /datum/stack_recipe("leather overcoat", /obj/item/clothing/suit/jacket/leather/overcoat, 10) // [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
	GLOB.wood_recipes += new /datum/stack_recipe("Wooden Half-Barricade", /obj/structure/deployable_barricade/wooden, 10, time = 5 SECONDS, one_per_turf = TRUE, on_floor = TRUE) // [CELADON-ADD] - CELADON_STRUCTURES - Барикады
	var/list/cloth_recipes = list( // [CELADON-ADD] - CELADON_QOL - добавляем рецепты обмоток лап
		new /datum/stack_recipe("footwraps white", /obj/item/clothing/shoes/footwraps, 2),
		new /datum/stack_recipe("footwraps black", /obj/item/clothing/shoes/footwraps/black, 2),
		new /datum/stack_recipe("footwraps brown", /obj/item/clothing/shoes/footwraps/brown, 2),
	)
	GLOB.cloth_recipes += cloth_recipes
	var/list/bronze_recipes = list( // [CELADON-ADD] - CELADON_RETURN_CONTENT_SPAWN
		new /datum/stack_recipe("bronze suit", /obj/item/clothing/suit/bronze),
		new /datum/stack_recipe("bronze boots", /obj/item/clothing/shoes/bronze),
	)
	GLOB.bronze_recipes += bronze_recipes
	GLOB.metal_recipes += new /datum/stack_recipe("metal barricade", /obj/structure/deployable_barricade/metal, 20, time = 4 SECONDS, one_per_turf = TRUE, on_floor = TRUE) // [CELADON-ADD] - CELADON_STRUCTURES - Барикады
	GLOB.department_radio_keys["ö"] = RADIO_CHANNEL_WIDEBAND
	var/list/events = list(
		// [CELADON-ADD] - CELADON_OVERMAP - Включаем на овермапе ионные шторма
		/datum/overmap/event/emp/minor = 25,
		/datum/overmap/event/emp = 20,
		/datum/overmap/event/emp/major = 25,
		// [/CELADON-ADD]
	)
	for(var/key in events)
		GLOB.overmap_event_pick_list[key] = events[key]

// Инициализация ПОСЛЕ
/datum/modpack/fixes/post_initialize()
	. = ..()
