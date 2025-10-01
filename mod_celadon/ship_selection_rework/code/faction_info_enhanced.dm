// SHIP_SELECTION_REWORK - Faction information and outfit previews
// Система генерации превью экипировки фракций и информации о них

// Кэш для превью экипировки (ленивая загрузка)
GLOBAL_LIST_INIT(faction_preview_cache, list())

// Данные о фракциях для информационных блоков
GLOBAL_LIST_INIT(faction_info_data, list(
	"elysium" = list(
		"name" = "Elysium",
		"description" = "Радикальное движение за независимость Элизиума и «очищение» родной земли. Дисциплина, вера и готовность к жертве делают их опасными противниками; в ход идёт трофейное и самодельное вооружение.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Elysim_Separatists",
		"outfits" = list(
			/datum/outfit/job/elysium/captain,
			/datum/outfit/job/elysium/assistant
		)
	),
	"nanotrasen" = list(
		"name" = "Nanotrasen",
		"description" = "Мегакорпорация-освоитель рубежей: добыча, исследования, станции и флот — всё ради прибыли и прогресса. Внутри царят протоколы и отчётность, но взамен — доступ к лучшим технологиям, стабильные контракты и карьерный рост.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Nanotrasen",
		"outfits" = list(
			/datum/outfit/job/nanotrasen/captain,
			/datum/outfit/job/nanotrasen/assistant
		)
	),
	"syndicate" = list(
		"name" = "Syndicate",
		"description" = "Союз подпольных корпораций и наёмных ячеек, ведущих тихую войну против НТ. Их стиль — диверсии, шпионаж и удар в нужный момент; идеалы свободы смешаны с чёрным рынком и высокой ценой ошибки.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Syndicate",
		"outfits" = list(
			/datum/outfit/job/syndicate/captain,
			/datum/outfit/job/syndicate/assistant
		)
	),
	"pirates" = list(
		"name" = "Pirates",
		"description" = "Разношёрстные экипажи, живущие налётами, выкупом и охотой на одиночные цели. Они полагаются на скорость, хитрость и знание маршрутов, но иногда готовы торговаться, если риск не оправдывает трофей.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Pirates",
		"outfits" = list(
			/datum/outfit/job/independent/captain/pirate,
			/datum/outfit/job/independent/security/pirate
		)
	),
	"solfed" = list(
		"name" = "SolFed",
		"description" = "Закон и порядок больших дорог: патрули, лицензии, таможня и спасательные маяки. Они защищают торговлю и граждан, но требуют соблюдения правил — бюрократия здесь такая же мощная, как и флот.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Solar_Federation",
		"outfits" = list(
			/datum/outfit/job/solgov/captain,
			/datum/outfit/job/solgov/assistant
		)
	),
	"inteq" = list(
		"name" = "InteQ",
		"description" = "Крупнейшая частная военная компания сектора: профессиональные группы, чёткие правила и оплата по контракту. Эскорты, зачистки и охрана — они не выбирают стороны, они выбирают заказы.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Inteq",
		"outfits" = list(
			/datum/outfit/job/inteq/captain,
			/datum/outfit/job/inteq/assistant
		)
	),
	"independent" = list(
		"name" = "Independent",
		"description" = "Свободные капитаны, торговцы и исследователи, для которых главное — репутация и гибкие союзы. Берутся за перевозки и редкие поручения, лавируя между крупными силами ради своей выгоды.",
		"wiki_url" = "https://wiki.celadon.pro/index.php/Other_Fractions",
		"outfits" = list(
			/datum/outfit/job/independent/captain,
			/datum/outfit/job/independent/assistant
		)
	)
))

/// Генерирует превью экипировки для фракции с защитой от ошибок
/proc/generate_faction_outfit_previews(faction_name)
	var/list/faction_data = GLOB.faction_info_data[faction_name]
	if(!faction_data)
		return list()

	var/list/outfit_types = faction_data["outfits"]
	if(!outfit_types)
		return list()

	var/list/previews = list()
	var/dummy_key = "faction_preview_[faction_name]_[world.time]"

	// Инициализируем dummy для превью с защитой от ошибок
	try
		generate_dummy_lookalike(dummy_key, null)
		unset_busy_human_dummy(dummy_key)
	catch
		log_runtime("Failed to initialize dummy for faction preview [faction_name]")
		return list()

	for(var/outfit_type in outfit_types)
		if(!ispath(outfit_type, /datum/outfit))
			continue

		try
			// Генерируем иконку используя тот же метод что и админская команда
			var/icon/dummysprite = get_flat_human_icon(
				null,
				dummy_key = dummy_key,
				outfit_override = outfit_type
			)

			// Масштабируем иконку до 64x64 для уменьшения размера base64
			dummysprite.Scale(64, 64)

			// Получаем название outfit'а (убираем название фракции)
			var/datum/outfit/outfit_datum = new outfit_type()
			var/outfit_name = outfit_datum.name || "Unknown Outfit"
			qdel(outfit_datum)

			// Убираем название фракции из названия профессии
			var/list/name_parts = splittext(outfit_name, " - ")
			if(name_parts.len > 1)
				outfit_name = name_parts[2] // Берем только часть после " - "
			else
				outfit_name = name_parts[1] // Если нет разделителя, берем как есть

			// Создаем data URI с проверкой размера
			var/base64 = icon2base64(dummysprite)
			if(length(base64) > 50000) // Ограничиваем размер base64
				log_runtime("Base64 too large for [outfit_name]: [length(base64)] chars")
				continue

			previews += list(list(
				"label" = outfit_name,
				"image" = "data:image/png;base64,[base64]"
			))

			// Очищаем иконку
			qdel(dummysprite)

		catch
			log_runtime("Failed to generate preview for outfit [outfit_type]")
			continue

	// Очищаем dummy
	try
		clear_human_dummy(dummy_key)
	catch
		log_runtime("Failed to clear dummy [dummy_key]")

	return previews

/// Получает информацию о фракции с превью экипировки (ленивая загрузка)
/proc/get_faction_info_with_previews(faction_name)
	var/list/faction_data = GLOB.faction_info_data[faction_name]
	if(!faction_data)
		return null

	var/list/result = faction_data.Copy()

	// Проверяем кэш
	if(!GLOB.faction_preview_cache[faction_name])
		GLOB.faction_preview_cache[faction_name] = generate_faction_outfit_previews(faction_name)

	result["outfit_previews"] = GLOB.faction_preview_cache[faction_name]

	return result

/// Получает базовые данные о фракциях БЕЗ превью (для ui_static_data)
/proc/get_all_faction_info_data()
	var/list/result = list()

	for(var/faction_name in GLOB.faction_info_data)
		var/list/faction_data = GLOB.faction_info_data[faction_name]
		if(faction_data)
			result[faction_name] = faction_data.Copy()

	return result

/// Action для загрузки превью конкретной фракции по требованию
/proc/load_faction_preview(faction_name)
	if(!faction_name || !GLOB.faction_info_data[faction_name])
		return null

	// Если уже в кэше, возвращаем
	if(GLOB.faction_preview_cache[faction_name])
		return GLOB.faction_preview_cache[faction_name]

	// Генерируем и кэшируем
	GLOB.faction_preview_cache[faction_name] = generate_faction_outfit_previews(faction_name)
	return GLOB.faction_preview_cache[faction_name]
