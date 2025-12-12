GLOBAL_LIST_EMPTY(loadout_categories)
GLOBAL_LIST_EMPTY(gear_datums)
GLOBAL_LIST_EMPTY(loadout_parent_categories) // [CELADON-ADD] - CELADON_QOL_LOADOUT - Родительские категории

/datum/loadout_category
	var/category = ""
	 // [CELADON-ADD] - CELADON_QOL_LOADOUT
	var/parent_category = "" // Родительская категория
	var/category_icon = "" // Иконка категории
	var/category_order = 0 // Порядок сортировки
	var/list/subcategories = list() // Подкатегории
	 // [/CELADON-ADD]
	var/list/gear = list()

// [CELADON-EDIT] - CELADON_QOL_LOADOUT
// /datum/loadout_category/New(cat)	// ORIGINAL
/datum/loadout_category/New(cat, parent = "", icon = "", order = 0)
// [/CELADON-EDIT]
	category = cat
	// [CELADON-ADD] - CELADON_QOL_LOADOUT
	parent_category = parent
	category_icon = icon
	category_order = order
	// [/CELADON-ADD]
	..()

///Create a list of gear datums to sort
/proc/populate_gear_list()
	create_parent_categories()	// [CELADON-ADD] - CELADON_QOL_LOADOUT

	for(var/geartype in subtypesof(/datum/gear))
		var/datum/gear/G = geartype

		var/use_name = initial(G.display_name)
		var/use_category = initial(G.sort_category)

		if(G == initial(G.subtype_path))
			continue

		if(!use_name && initial(G.path))
			WARNING("Loadout gear [G] is missing display name")
			continue
		if(!initial(G.path) && use_category != "OOC") //OOC category does not contain actual items
			WARNING("Loadout gear [G] is missing path definition")
			continue

		// [CELADON-ADD] - CELADON_QOL_LOADOUT - Получаем информацию о категории
		var/category_info = get_category_info(use_category)
		var/parent_cat = category_info["parent"]
		var/cat_icon = category_info["icon"]
		var/cat_order = category_info["order"]
		// [/CELADON-ADD]

		if(!GLOB.loadout_categories[use_category])
			// [CELADON-EDIT] - CELADON_QOL_LOADOUT
			// GLOB.loadout_categories[use_category] = new /datum/loadout_category(use_category)	// ORIGINAL
			GLOB.loadout_categories[use_category] = new /datum/loadout_category(use_category, parent_cat, cat_icon, cat_order)
			// [/CELADON-EDIT]

			// [CELADON-ADD] - CELADON_QOL_LOADOUT - Добавляем в родительскую категорию
			if(parent_cat && GLOB.loadout_parent_categories[parent_cat])
				var/datum/loadout_category/parent_LC = GLOB.loadout_parent_categories[parent_cat]
				parent_LC.subcategories[use_category] = GLOB.loadout_categories[use_category]
			// [/CELADON-ADD]

		var/datum/loadout_category/LC = GLOB.loadout_categories[use_category]
		GLOB.gear_datums[use_name] = new geartype
		LC.gear[use_name] = GLOB.gear_datums[use_name]

	// [CELADON-REMOVE] - CELADON_QOL_LOADOUT
	// GLOB.loadout_categories = sortAssoc(GLOB.loadout_categories)
	// for(var/loadout_category in GLOB.loadout_categories)
	// 	var/datum/loadout_category/LC = GLOB.loadout_categories[loadout_category]
	// 	LC.gear = sortAssoc(LC.gear)
	// [/CELADON-REMOVE]
	sort_categories()	// [CELADON-ADD] - CELADON_QOL_LOADOUT - Сортируем категории
	return 1

/datum/gear
	///Name/index. Must be unique.
	var/display_name
	///Description of this gear. If left blank will default to the description of the pathed item.
	var/description
	///Path to item.
	// [CELADON-EDIT] - CELADON_QOL
	// var/path // CELADON-EDIT - ORIGINAL
	var/atom/path
	// [/CELADON-EDIT]
	///Slot to equip to.
	var/slot
	// [CELADON-REMOVE] - CELADON_QOL_LOADOUT
	///Roles that can spawn with this item.
	var/list/allowed_roles
	// [/CELADON-REMOVE]
	// [CELADON-ADD] - CELADON_QOL_LOADOUT
	///Factions that can spawn with this item.
	var/list/allowed_factions
	// Примеры 	allowed_factions = list("NanoTrasen", "Syndicate", "Independent", "InteQ", "SolFed", "Pirates", "Elysium")
	// [/CELADON-ADD]
	///Stop certain species from receiving this gear
	var/list/species_blacklist
	///Only allow certain species to receive this gear
	var/list/species_whitelist
	///A list of jobs with typepaths to the loadout item the job should recieve
	var/list/role_replacements
	///The sub tab under gear that the loadout item is listed under
	var/sort_category = "General"
	///for skipping organizational subtypes (optional)
	var/subtype_path = /datum/gear
	// [CELADON-ADD] - CELADON_QOL
	//It will be generated automaticly
	var/base64icon
	//File of icon
	var/icon
	//Icon state of item
	var/icon_state
	// [/CELADON-ADD]
	// [CELADON-ADD] - CELADON_QOL_LOADOUT
	///Tags for search and filtering
	var/list/tags = list()
	///Cost in loadout points (if point system is used)
	var/cost = 0
	///Large preview icon for detailed view
	var/preview_icon_large
	// [/CELADON-ADD]

/datum/gear/New()
	..()
	if(!description)
		var/obj/O = path
		description = initial(O.desc)
	// [CELADON-ADD] - CELADON_QOL
	if(!icon || !icon_state)
		icon_state = initial(path.icon_state)
		icon = initial(path.icon)
	base64icon = icon2base64(icon(icon, icon_state, SOUTH, 1, FALSE))
	// [/CELADON-ADD]
	// [CELADON-ADD] - CELADON_QOL_LOADOUT
	// Генерируем большую иконку для превью
	if(!preview_icon_large)
		preview_icon_large = icon2base64(icon(icon, icon_state, SOUTH, 1, FALSE))
	// Автоматически определяем теги на основе категории и слота
	if(!tags.len)
		generate_auto_tags()
	// [/CELADON-ADD]

///Called when the gear is first purchased
/datum/gear/proc/purchase(client/C)
	return

/datum/gear_data
	var/path
	var/location

/datum/gear_data/New(npath, nlocation)
	path = npath
	location = nlocation

/datum/gear/proc/spawn_item(location, mob/owner)
	var/datum/gear_data/gd
	if(role_replacements) //If the owner is a human (should be one) and the item in question has a role replacement
		var/job = owner.job || owner.mind?.assigned_role
		if(job in role_replacements) //If the job has an applicable replacement
			gd = new(role_replacements[job], location)
			return new gd.path(gd.location)

	gd = new(path, location) //Else, just give them the item and be done with it

	return new gd.path(gd.location)

// [CELADON-ADD] - CELADON_QOL_LOADOUT
///Создаем родительские категории
/proc/create_parent_categories()
	GLOB.loadout_parent_categories["Clothing"] = new /datum/loadout_category("Одежда", "", "icons/obj/clothing/suits.dmi", 1)
	GLOB.loadout_parent_categories["Accessories"] = new /datum/loadout_category("Аксессуары", "", "icons/obj/clothing/accessories.dmi", 2)
	GLOB.loadout_parent_categories["Equipment"] = new /datum/loadout_category("Снаряжение", "", "icons/obj/tools.dmi", 3)
	GLOB.loadout_parent_categories["Personal"] = new /datum/loadout_category("Личное", "", "icons/obj/toy.dmi", 4)

///Получаем информацию о категории
/proc/get_category_info(category)
	var/list/category_mapping = list(
		// Одежда
		"Headwear" = list("parent" = "Clothing", "icon" = "icons/obj/clothing/hats.dmi", "order" = 1),
		"Uniforms" = list("parent" = "Clothing", "icon" = "icons/obj/clothing/uniforms.dmi", "order" = 2),
		"Suits" = list("parent" = "Clothing", "icon" = "icons/obj/clothing/suits.dmi", "order" = 3),
		"Footwear" = list("parent" = "Clothing", "icon" = "icons/obj/clothing/shoes.dmi", "order" = 4),
		"External Wear" = list("parent" = "Clothing", "icon" = "icons/obj/clothing/suits.dmi", "order" = 5),
		"Eyewear" = list("parent" = "Clothing", "icon" = "icons/obj/clothing/glasses.dmi", "order" = 6),

		// Аксессуары
		"Accessories" = list("parent" = "Accessories", "icon" = "icons/obj/clothing/accessories.dmi", "order" = 1),
		"Gloves" = list("parent" = "Accessories", "icon" = "icons/obj/clothing/gloves.dmi", "order" = 2),
		"Scarfs" = list("parent" = "Accessories", "icon" = "icons/obj/clothing/neck.dmi", "order" = 3),

		// Снаряжение
		"General" = list("parent" = "Equipment", "icon" = "icons/obj/items_and_weapons.dmi", "order" = 1),

		// Личное
		"Plushes" = list("parent" = "Personal", "icon" = "icons/obj/plushes.dmi", "order" = 1),
		"Cloaks" = list("parent" = "Personal", "icon" = "icons/obj/clothing/cloaks.dmi", "order" = 2),
		"Costumes" = list("parent" = "Personal", "icon" = "icons/obj/clothing/costumes.dmi", "order" = 3),
		"Coats" = list("parent" = "Personal", "icon" = "icons/obj/clothing/suits.dmi", "order" = 4),
		"Dress" = list("parent" = "Personal", "icon" = "icons/obj/clothing/under/dress.dmi", "order" = 5),
		"OOC" = list("parent" = "Personal", "icon" = "icons/obj/toy.dmi", "order" = 6)
	)

	return category_mapping[category] || list("parent" = "Equipment", "icon" = "", "order" = 99)

///Сортируем категории
/proc/sort_categories()
	// Сортируем родительские категории
	var/list/sorted_parents = list()
	for(var/cat_name in GLOB.loadout_parent_categories)
		var/datum/loadout_category/LC = GLOB.loadout_parent_categories[cat_name]
		sorted_parents += list(list(LC.category_order, cat_name, LC))
	sorted_parents = sortTim(sorted_parents, /proc/cmp_loadout_category_order)

	GLOB.loadout_parent_categories = list()
	for(var/list/entry in sorted_parents)
		GLOB.loadout_parent_categories[entry[2]] = entry[3]

	// Сортируем подкатегории
	for(var/parent_name in GLOB.loadout_parent_categories)
		var/datum/loadout_category/parent_LC = GLOB.loadout_parent_categories[parent_name]
		var/list/sorted_subs = list()
		for(var/sub_name in parent_LC.subcategories)
			var/datum/loadout_category/sub_LC = parent_LC.subcategories[sub_name]
			sorted_subs += list(list(sub_LC.category_order, sub_name, sub_LC))
		sorted_subs = sortTim(sorted_subs, /proc/cmp_loadout_category_order)

		parent_LC.subcategories = list()
		for(var/list/entry in sorted_subs)
			parent_LC.subcategories[entry[2]] = entry[3]
			// Сортируем предметы в подкатегории
			var/datum/loadout_category/sub_LC = entry[3]
			sub_LC.gear = sortAssoc(sub_LC.gear)

///Компаратор для сортировки категорий
/proc/cmp_loadout_category_order(list/a, list/b)
	return a[1] - b[1]

///Генерирует древовидную навигацию для loadout
/proc/generate_loadout_tree_navigation(current_tab)
	var/list/dat = list()
	dat += "<div style='text-align: center; margin: 5px 0; padding: 5px; background: #2a2a2a; border-radius: 5px;'>"
	var/firstcat = 1
	for(var/category in GLOB.loadout_categories)
		if(firstcat)
			firstcat = 0
		else
			dat += " | "
		if(category == current_tab)
			dat += "<span style='color: #90EE90; font-weight: bold; padding: 2px 6px; background: #3a3a3a; border-radius: 3px;'>[category]</span>"
		else
			dat += "<a href='byond://?_src_=prefs;preference=gear;select_category=[category]' style='color: #87CEEB; text-decoration: none; padding: 2px 6px; border-radius: 3px;'>[category]</a>"
	dat += "</div>"
	return dat.Join()

///Генерирует CSS стили для древовидной навигации
/proc/generate_loadout_tree_styles()
	return ""

///Автоматически генерирует теги для предмета
/datum/gear/proc/generate_auto_tags()
	// Добавляем тег категории
	if(sort_category)
		tags += lowertext(sort_category)

	// Добавляем тег слота
	if(slot)
		switch(slot)
			if(ITEM_SLOT_HEAD)
				tags += "head"
			if(ITEM_SLOT_NECK)
				tags += "neck"
			if(ITEM_SLOT_GLOVES)
				tags += "gloves"
			if(ITEM_SLOT_FEET)
				tags += "feet"

	// Добавляем теги на основе названия
	if(display_name)
		var/list/name_words = splittext(lowertext(display_name), " ")
		for(var/word in name_words)
			if(length(word) > 2) // Игнорируем короткие слова
				tags += word

///Проверяет, соответствует ли предмет поисковому запросу
/datum/gear/proc/matches_search(search_query)
	if(!search_query || search_query == "")
		return TRUE

	search_query = lowertext(search_query)

	// Поиск по названию
	if(findtext(lowertext(display_name), search_query))
		return TRUE

	// Поиск по описанию
	if(findtext(lowertext(description), search_query))
		return TRUE

	// Поиск по тегам
	for(var/tag in tags)
		if(findtext(lowertext(tag), search_query))
			return TRUE

	return FALSE
// [/CELADON-ADD]
