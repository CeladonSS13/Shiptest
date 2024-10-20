// Сигнал S.O.S.
// Реакция на нажатие кнопки - code\modules\overmap\helm.dm
// Сама кнопка - tgui\packages\tgui\interfaces\HelmConsole.js

/datum/overmap/ship/controlled
		COOLDOWN_DECLARE(sendsos_cooldown)
		var/obj/item/radio/intercom/wideband/radio

/datum/overmap/ship/controlled/proc/SendSos(name, x, y)
	if((!COOLDOWN_FINISHED(src, sendsos_cooldown)))
		return FALSE
	switch(alert(usr, "При активации маяка спасения координаты местоположения вашего корабля будут переданы по всем возможным каналам связи, весь Китай узнает, что вы здесь. Вы уверены?", "Сигнал S.O.S.", "Подтвердить", "Отмена"))
		if("Подтвердить")
			priority_announce("Наши локаторы получили сигнал бедствия S.O.S., который исходит от судна '" \
			+ name + "' по координатам: X - " + x + " / Y - " + y + ". " + name + " запрашивает скорейшей помощи!", \
			sound = 'mod_celadon/_storge_sounds/sound/announce/sos.ogg', sender_override = "Outpost Distress Beacon System", zlevel = 0)

			COOLDOWN_START(src, sendsos_cooldown, 45 MINUTES)
			// Отправляем сигнал в Wideband.
			radio = new(src.token)
			radio.talk_into(src.token, "Был активирован сигнал бедствия S.O.S. на координатах: X - " + x + " / Y - " + y + ".", FREQ_WIDEBAND)
			// Делаем оповещение для Newscaster - Новые новости в системе Гриффон!
			GLOB.news_network.SubmitArticle("<b>Получен сигнал S.O.S.</b> <br> Наши локаторы получили сигнал бедствия, который исходит от судна '" + name + "' по координатам: X - " + x + " / Y - " + y + ". <br><b>" + name + " запрашивает скорейшей помощи!</b>", "Outpost Distress Beacon System", "Колониальная сеть объявлений", adminMessage = 0, allow_comments = 1)
			// Отправляем сообщения в Discord о помощи в чат Shiptest`a.
			if(CONFIG_GET(string/servername) == "\[RU] Celadon Shiptest: Alpha")
				send2chat("<:Celadon:1200703387717619814>  \[Shiptest: Alpha] > Внимание! Судно **`" + name + "`** подаёт сигнал бедствия **S.O.S.** на координатах: **X - " + x + "** / **Y - " + y + "**.", "round-report")
			if(CONFIG_GET(string/servername) == "\[RU] Celadon Shiptest: Beta")
				send2chat("<:Celadon:1200703387717619814>  \[Shiptest: Beta] > Внимание! Судно **`" + name + "`** подаёт сигнал бедствия **S.O.S.** на координатах: **X - " + x + "** / **Y - " + y + "**.", "round-report")
			// Логируем действия.
			message_admins("[key_name_admin(usr)] send signal S.O.S.")
			log_admin("[key_name(usr)] - [key_name(src)] send signal S.O.S.")
			return TRUE
		if("Отмена")
			return FALSE
