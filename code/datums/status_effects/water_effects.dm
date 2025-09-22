// Статус эффект для утопления
/datum/status_effect/drowning
	id = "drowning"
	duration = -1
	tick_interval = 20
	alert_type = /atom/movable/screen/alert/drowning
	var/water_level = WATER_LEVEL_NONE
	var/has_breathing_apparatus = FALSE

/datum/status_effect/drowning/on_apply()
	. = ..()
	if(!.)
		return
	check_breathing_apparatus()
	return TRUE

/datum/status_effect/drowning/tick()
	if(!owner || !isliving(owner))
		qdel(src)
		return
	
	var/mob/living/L = owner
	check_breathing_apparatus()
	
	// Проверяем уровень воды
	var/turf/T = get_turf(L)
	water_level = get_water_level_at_turf(T)
	if(water_level == WATER_LEVEL_NONE)
		qdel(src)
		return
	
	// Если лежим, то эффективный уровень воды увеличивается на 2
	if(L.body_position == LYING_DOWN)
		water_level = min(water_level + 2, WATER_LEVEL_SUBMERGED)
	
	// Применяем эффекты в зависимости от уровня воды
	switch(water_level)
		if(WATER_LEVEL_NONE to WATER_LEVEL_CHEST)
			// Можно дышать нормально
			return
		if(WATER_LEVEL_NECK)
			// Сложно дышать
			if(!has_breathing_apparatus && prob(30))
				L.adjustOxyLoss(1)
		if(WATER_LEVEL_SUBMERGED)
			// Невозможно дышать без аппарата
			if(!has_breathing_apparatus)
				L.adjustOxyLoss(2)
				// Добавляем воду в легкие
				var/obj/item/organ/lungs/lungs = L.getorganslot(ORGAN_SLOT_LUNGS)
				if(lungs && lungs.reagents)
					lungs.reagents.add_reagent(/datum/reagent/water, 2)
				if(prob(10))
					L.emote("gasp")
			else if(has_mask_without_internals(L) && prob(5))
				// Маска есть, но 5% шанс попадания воды
				var/obj/item/organ/lungs/lungs = L.getorganslot(ORGAN_SLOT_LUNGS)
				if(lungs && lungs.reagents)
					lungs.reagents.add_reagent(/datum/reagent/water, 1)

/datum/status_effect/drowning/proc/check_breathing_apparatus()
	if(!owner || !isliving(owner))
		return
	
	var/mob/living/L = owner
	has_breathing_apparatus = FALSE
	
	// Проверяем дыхательную трубку
	if(L.getorganslot(ORGAN_SLOT_BREATHING_TUBE))
		has_breathing_apparatus = TRUE
		return
	
	// Проверяем маски с кислородом
	var/obj/item/clothing/mask/M = L.get_item_by_slot(ITEM_SLOT_MASK)
	if(M && (M.clothing_flags & ALLOWINTERNALS) && L.internal)
		has_breathing_apparatus = TRUE

// Проверка наличия маски без кислорода
/datum/status_effect/drowning/proc/has_mask_without_internals(mob/living/L)
	var/obj/item/clothing/mask/M = L.get_item_by_slot(ITEM_SLOT_MASK)
	return M && (M.clothing_flags & ALLOWINTERNALS) && !L.internal



// Статус эффект для замедления в воде
/datum/status_effect/water_slowdown
	id = "water_slowdown"
	duration = -1
	tick_interval = 10
	var/slowdown_amount = 0
	var/has_fins = FALSE

/datum/status_effect/water_slowdown/on_apply()
	. = ..()
	if(!.)
		return
	check_fins()
	update_slowdown()
	return TRUE

/datum/status_effect/water_slowdown/tick()
	if(!owner || !isliving(owner))
		qdel(src)
		return
	
	check_fins()
	update_slowdown()

/datum/status_effect/water_slowdown/proc/check_fins()
	if(!owner || !isliving(owner))
		return
	
	var/mob/living/L = owner
	has_fins = FALSE
	
	// Проверяем ласты на ногах
	var/obj/item/clothing/shoes/S = L.get_item_by_slot(ITEM_SLOT_FEET)
	if(S && S.clothing_flags & WATER_FINS)
		has_fins = TRUE

/datum/status_effect/water_slowdown/proc/update_slowdown()
	if(!owner || !isliving(owner))
		return
	
	var/mob/living/L = owner
	var/turf/T = get_turf(L)
	var/water_level = get_water_level_at_turf(T)
	
	if(water_level == WATER_LEVEL_NONE)
		L.remove_movespeed_modifier(MOVESPEED_ID_WATER)
		qdel(src)
		return
	
	// Если лежим, то эффективный уровень воды увеличивается
	if(L.body_position == LYING_DOWN)
		water_level = min(water_level + 2, WATER_LEVEL_SUBMERGED)
	
	var/new_slowdown = 0
	switch(water_level)
		if(WATER_LEVEL_NONE to WATER_LEVEL_WAIST)
			new_slowdown = 0
		if(WATER_LEVEL_CHEST)
			new_slowdown = WATER_SLOWDOWN_CHEST
		if(WATER_LEVEL_NECK)
			new_slowdown = WATER_SLOWDOWN_NECK
		if(WATER_LEVEL_SUBMERGED)
			new_slowdown = WATER_SLOWDOWN_SUBMERGED
			// Ласты убирают замедление при полном погружении
			if(has_fins)
				new_slowdown = 0
	
	if(new_slowdown != slowdown_amount)
		slowdown_amount = new_slowdown
		if(slowdown_amount > 0)
			L.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/water_slowdown, multiplicative_slowdown = slowdown_amount)
		else
			L.remove_movespeed_modifier(MOVESPEED_ID_WATER)

// Статус эффект для подводного оверлея
/datum/status_effect/underwater_overlay
	id = "underwater_overlay"
	duration = -1
	var/obj/effect/overlay/underwater/overlay_obj

/datum/status_effect/underwater_overlay/on_apply()
	. = ..()
	if(!.)
		return
	
	if(!owner || !owner.client)
		return FALSE
	
	// Создаем полупрозрачный синий оверлей
	overlay_obj = new()
	overlay_obj.icon = 'icons/effects/water.dmi'
	overlay_obj.icon_state = "underwater"
	overlay_obj.alpha = 100
	overlay_obj.color = "#0066CC"
	overlay_obj.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	overlay_obj.layer = FULLSCREEN_LAYER
	overlay_obj.plane = FULLSCREEN_PLANE
	owner.client.screen += overlay_obj
	return TRUE

/datum/status_effect/underwater_overlay/on_remove()
	if(overlay_obj && owner && owner.client)
		owner.client.screen -= overlay_obj
		QDEL_NULL(overlay_obj)
	return ..()

// Объект оверлея
/obj/effect/overlay/underwater
	name = "underwater effect"
	desc = "You are underwater."
	icon = 'icons/effects/water.dmi'
	icon_state = "underwater"
	alpha = 100
	color = "#0066CC"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	layer = FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE

// Статус эффект давления воды
/datum/status_effect/water_pressure
	id = "water_pressure"
	duration = -1
	tick_interval = 20
	alert_type = /atom/movable/screen/alert/water_pressure

/datum/status_effect/water_pressure/tick()
	if(!owner || !isliving(owner))
		qdel(src)
		return
	
	var/mob/living/L = owner
	var/turf/T = get_turf(L)
	var/water_volume = get_water_volume_at_turf(T)
	if(water_volume < 1000)
		qdel(src)
		return
	
	// Урон от давления
	var/pressure_damage = round((water_volume - 1000) / 500)
	L.adjustBruteLoss(min(pressure_damage, 5))
	if(prob(20))
		to_chat(L, "<span class='danger'>Сильное давление воды сдавливает вас!</span>")

// Алерт для утопления
/atom/movable/screen/alert/drowning
	name = "Утопление"
	desc = "Вы тонете! Найдите воздух или дыхательный аппарат."
	icon_state = "drowning"

// Алерт для давления воды
/atom/movable/screen/alert/water_pressure
	name = "Давление воды"
	desc = "Сильное давление воды наносит вам урон."
	icon_state = "pressure"

// Статус эффект очистки легких от воды
/datum/status_effect/lung_water_clearing
	id = "lung_water_clearing"
	duration = -1
	tick_interval = 30
	alert_type = /atom/movable/screen/alert/lung_water

/datum/status_effect/lung_water_clearing/on_apply()
	. = ..()
	if(!owner || !isliving(owner))
		return FALSE
	return TRUE

/datum/status_effect/lung_water_clearing/tick()
	if(!owner || !isliving(owner))
		qdel(src)
		return
	
	var/mob/living/L = owner
	var/obj/item/organ/lungs/lungs = L.getorganslot(ORGAN_SLOT_LUNGS)
	if(!lungs || !lungs.reagents)
		qdel(src)
		return
	
	var/water_amount = lungs.reagents.get_reagent_amount(/datum/reagent/water)
	if(water_amount <= 0)
		qdel(src)
		return
	
	// Кашель и очистка
	if(prob(60))
		L.emote("cough")
		lungs.reagents.remove_reagent(/datum/reagent/water, rand(5, 15))
	
	// Удушье при большом количестве воды
	if(water_amount >= 200)
		L.adjustOxyLoss(1)
		if(prob(30))
			to_chat(L, "<span class='danger'>Вода в легких мешает вам дышать!</span>")

// Алерт для воды в легких
/atom/movable/screen/alert/lung_water
	name = "Вода в легких"
	desc = "В ваших легких есть вода. Кашляйте чтобы избавиться от нее!"
	icon_state = "lung_water"

// Универсальная функция получения уровня воды
/proc/get_water_level_at_turf(turf/T)
	if(!T)
		return WATER_LEVEL_NONE
	
	// Проверяем эффект воды
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in T
	if(water_effect)
		return water_effect.get_water_level()
	
	// Проверяем турф воды
	if(istype(T, /turf/open/water))
		return WATER_LEVEL_SUBMERGED // Старые турфы воды считаются глубокими
	
	return WATER_LEVEL_NONE

// Универсальная функция получения объема воды
/proc/get_water_volume_at_turf(turf/T)
	if(!T)
		return 0
	
	// Проверяем эффект воды
	var/obj/effect/water_overlay/water_effect = locate(/obj/effect/water_overlay) in T
	if(water_effect)
		return water_effect.water_volume
	
	// Проверяем турф воды
	if(istype(T, /turf/open/water))
		return 500 // Старые турфы воды имеют фиксированный объем
	
	return 0

// Переопределяем эмоут кашля для очистки легких
/datum/emote/living/cough/run_emote(mob/user, params, type_override, intentional = FALSE)
	. = ..() 
	if(!. || !isliving(user))
		return
	
	// Проверяем наличие воды в легких
	var/mob/living/L = user
	var/obj/item/organ/lungs/lungs = L.getorganslot(ORGAN_SLOT_LUNGS)
	if(!lungs || !lungs.reagents)
		return
	
	var/water_amount = lungs.reagents.get_reagent_amount(/datum/reagent/water)
	if(water_amount > 0 && intentional)
		// Удаляем больше воды при сознательном кашле
		lungs.reagents.remove_reagent(/datum/reagent/water, rand(15, 25))
		to_chat(L, "<span class='notice'>Вы откашливаете воду из легких.</span>")

