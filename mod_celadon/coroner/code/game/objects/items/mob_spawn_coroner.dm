// Coroner spawner
/obj/effect/mob_spawn/human/elysium_outpost/coroner
	name = "Elysium Outpost Coroner"
	id_job = "Coroner"
	faction = FACTION_ELYSIUM
	assignedrole = "Outpost Coroner of Elysium"
	outfit = /datum/outfit/outpost/coroner
	important_info = "Не покидайте свой аванпост без разрешения администрации, кроме тех случаев, когда вас силой забрали! Вы являетесь гражданином республики Элизиум и ваш долг проявить свою гражданскую позицию!"
	short_desc = "Обрабатывайте тела умерших, ведите документооборот, следите за моргом, зарабатывайте на обработке тел."
	flavour_text = "Вы коронер аванпоста. Ваша задача - обработка тел умерших, ведение документации о смерти, мониторинг морга. Используйте конвейер для обработки тел и получения кредитов. Следите за системой мониторинга - если кто-то вернется в тело, немедленно окажите помощь."

/obj/effect/mob_spawn/human/elysium_outpost/coroner/Destroy()
	new /obj/machinery/cryopod/outpost/coroner(drop_location())
	return ..()

/obj/effect/mob_spawn/human/elysium_outpost/coroner/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Система морга активирована. Коронер требуется в [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)
