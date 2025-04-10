GLOBAL_DATUM_INIT(news_network, /datum/newscaster/feed_network, new)
GLOBAL_LIST_EMPTY(allCasters)

/datum/newscaster

/datum/newscaster/feed_comment
	var/author = ""
	var/body = ""
	var/time_stamp = ""

/datum/newscaster/feed_message
	var/author =""
	var/body =""
	var/list/authorCensorTime = list()
	var/list/bodyCensorTime = list()
	var/is_admin_message = 0
	var/icon/img = null
	var/time_stamp = ""
	var/list/datum/newscaster/feed_comment/comments = list()
	var/locked = FALSE
	var/caption = ""
	var/creationTime
	var/authorCensor
	var/bodyCensor
	var/photo_file

/datum/newscaster/feed_message/proc/returnAuthor(censor)
	if(censor == -1)
		censor = authorCensor
	var/txt = "[GLOB.news_network.redactedText]"
	if(!censor)
		txt = author
	return txt

/datum/newscaster/feed_message/proc/returnBody(censor)
	if(censor == -1)
		censor = bodyCensor
	var/txt = "[GLOB.news_network.redactedText]"
	if(!censor)
		txt = body
	return txt

/datum/newscaster/feed_message/proc/toggleCensorAuthor()
	if(authorCensor)
		authorCensorTime.Add(GLOB.news_network.lastAction*-1)
	else
		authorCensorTime.Add(GLOB.news_network.lastAction)
	authorCensor = !authorCensor
	GLOB.news_network.lastAction ++

/datum/newscaster/feed_message/proc/toggleCensorBody()
	if(bodyCensor)
		bodyCensorTime.Add(GLOB.news_network.lastAction*-1)
	else
		bodyCensorTime.Add(GLOB.news_network.lastAction)
	bodyCensor = !bodyCensor
	GLOB.news_network.lastAction ++

/datum/newscaster/feed_channel
	var/channel_name = ""
	var/list/datum/newscaster/feed_message/messages = list()
	var/locked = FALSE
	var/author = ""
	var/censored = 0
	var/list/authorCensorTime = list()
	var/list/DclassCensorTime = list()
	var/authorCensor
	var/is_admin_channel = 0

/datum/newscaster/feed_channel/proc/returnAuthor(censor)
	if(censor == -1)
		censor = authorCensor
	var/txt = "[GLOB.news_network.redactedText]"
	if(!censor)
		txt = author
	return txt

/datum/newscaster/feed_channel/proc/toggleCensorDclass()
	if(censored)
		DclassCensorTime.Add(GLOB.news_network.lastAction*-1)
	else
		DclassCensorTime.Add(GLOB.news_network.lastAction)
	censored = !censored
	GLOB.news_network.lastAction ++

/datum/newscaster/feed_channel/proc/toggleCensorAuthor()
	if(authorCensor)
		authorCensorTime.Add(GLOB.news_network.lastAction*-1)
	else
		authorCensorTime.Add(GLOB.news_network.lastAction)
	authorCensor = !authorCensor
	GLOB.news_network.lastAction ++

/datum/newscaster/wanted_message
	var/active
	var/criminal
	var/body
	var/scannedUser
	var/isAdminMsg
	var/icon/img
	var/photo_file

/datum/newscaster/feed_network
	var/list/datum/newscaster/feed_channel/network_channels = list()
	var/datum/newscaster/wanted_message/wanted_issue
	var/lastAction
	var/redactedText = "\[REDACTED\]"

/datum/newscaster/feed_network/New()
	CreateFeedChannel("Колониальная сеть объявлений", "SS13", 1)
	wanted_issue = new /datum/newscaster/wanted_message

/datum/newscaster/feed_network/proc/CreateFeedChannel(channel_name, author, locked, adminChannel = 0)
	var/datum/newscaster/feed_channel/newChannel = new /datum/newscaster/feed_channel
	newChannel.channel_name = channel_name
	newChannel.author = author
	newChannel.locked = locked
	newChannel.is_admin_channel = adminChannel
	network_channels += newChannel

/datum/newscaster/feed_network/proc/SubmitArticle(msg, author, channel_name, datum/picture/picture, adminMessage = 0, allow_comments = 1)
	var/datum/newscaster/feed_message/newMsg = new /datum/newscaster/feed_message
	newMsg.author = author
	newMsg.body = msg
	newMsg.time_stamp = "[station_time_timestamp()]"
	newMsg.is_admin_message = adminMessage
	newMsg.locked = !allow_comments
	if(picture)
		newMsg.img = picture.picture_image
		newMsg.caption = picture.caption
		newMsg.photo_file = save_photo(picture.picture_image)
	for(var/datum/newscaster/feed_channel/FC in network_channels)
		if(FC.channel_name == channel_name)
			FC.messages += newMsg
			break
	for(var/obj/machinery/newscaster/NEWSCASTER in GLOB.allCasters)
		NEWSCASTER.newsAlert(channel_name)
	lastAction ++
	newMsg.creationTime = lastAction

/datum/newscaster/feed_network/proc/submitWanted(criminal, body, scanned_user, datum/picture/picture, adminMsg = 0, newMessage = 0)
	wanted_issue.active = 1
	wanted_issue.criminal = criminal
	wanted_issue.body = body
	wanted_issue.scannedUser = scanned_user
	wanted_issue.isAdminMsg = adminMsg
	if(picture)
		wanted_issue.img = picture.picture_image
		wanted_issue.photo_file = save_photo(picture.picture_image)
	if(newMessage)
		for(var/obj/machinery/newscaster/N in GLOB.allCasters)
			N.newsAlert()
			N.update_appearance()

/datum/newscaster/feed_network/proc/deleteWanted()
	wanted_issue.active = 0
	wanted_issue.criminal = null
	wanted_issue.body = null
	wanted_issue.scannedUser = null
	wanted_issue.img = null
	for(var/obj/machinery/newscaster/NEWSCASTER in GLOB.allCasters)
		NEWSCASTER.update_appearance()

/datum/newscaster/feed_network/proc/save_photo(icon/photo)
	var/photo_file = copytext_char(md5("\icon[photo]"), 1, 6)
	if(!fexists("[GLOB.log_directory]/photos/[photo_file].png"))
		//Clean up repeated frames
		var/icon/clean = new /icon()
		clean.Insert(photo, "", SOUTH, 1, 0)
		fcopy(clean, "[GLOB.log_directory]/photos/[photo_file].png")
	return photo_file

/obj/item/wallframe/newscaster
	name = "newscaster frame"
	desc = "Используется для создания newscasters, просто крепится к стене."
	icon_state = "newscaster"
	custom_materials = list(/datum/material/iron=14000, /datum/material/glass=8000)
	result_path = /obj/machinery/newscaster
	inverse_pixel_shift = TRUE
	pixel_shift = 30


/obj/machinery/newscaster
	name = "newscaster"
	desc = "Стандартный обработчик новостной ленты. Все новости, которые вам совершенно не нужны, в одном месте!"
	icon = 'icons/obj/terminals.dmi'
	icon_state = "newscaster"
	base_icon_state = "newscaster"
	verb_say = "beeps"
	verb_ask = "beeps"
	verb_exclaim = "beeps"
	armor = list("melee" = 50, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	max_integrity = 200
	integrity_failure = 0.25
	var/screen = 0
	var/paper_remaining = 15
	var/securityCaster = 0
	var/unit_no = 0
	var/alert_delay = 500
	var/alert = FALSE
	var/scanned_user = "Unknown"
	var/msg = ""
	var/datum/picture/picture
	var/channel_name = ""
	var/c_locked=0
	var/datum/newscaster/feed_channel/viewing_channel = null
	var/allow_comments = 1

	FASTDMM_PROP(\
		set_instance_vars(\
			pixel_x = dir == EAST ? 30 : (dir == WEST ? -30 : INSTANCE_VAR_DEFAULT),\
			pixel_y = dir == NORTH ? 30 : (dir == SOUTH ? -30 : INSTANCE_VAR_DEFAULT)\
		),\
		dir_amount = 4\
	)

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/newscaster, 30)

/obj/machinery/newscaster/security_unit
	name = "security newscaster"
	securityCaster = TRUE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/newscaster/security_unit, 30)

/obj/machinery/newscaster/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		setDir(ndir)
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -32 : 32)
		pixel_y = (dir & 3)? (dir ==1 ? -32 : 32) : 0

	GLOB.allCasters += src
	unit_no = GLOB.allCasters.len
	update_appearance()

/obj/machinery/newscaster/Destroy()
	GLOB.allCasters -= src
	viewing_channel = null
	picture = null
	return ..()

/obj/machinery/newscaster/update_overlays()
	. = ..()
	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)
	if(machine_stat & BROKEN)
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_broken", layer, plane, dir)
		return

	if(machine_stat & NOPOWER)
		return

	if(GLOB.news_network.wanted_issue.active)
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_wanted", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_wanted", layer, EMISSIVE_PLANE, dir)
	else if(alert)
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_alert", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_alert", layer, EMISSIVE_PLANE, dir)
	else
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_normal", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "[base_icon_state]_normal", layer, EMISSIVE_PLANE, dir)


/obj/machinery/newscaster/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	. = ..()
	update_appearance()

/obj/machinery/newscaster/ui_interact(mob/user)
	. = ..()
	if(ishuman(user) || issilicon(user))
		var/mob/living/human_or_robot_user = user
		var/dat
		scan_user(human_or_robot_user)
		switch(screen)
			if(0)
				dat += "Добро пожаловать в новостной монитор #[unit_no].<BR> Системы успешно загружены и доступны."
				dat += "<BR><FONT SIZE=1>Разработано корпорацией: Griffon Inc</FONT>"
				if(GLOB.news_network.wanted_issue.active)
					dat+= "<HR><A href='?src=[REF(src)];view_wanted=1'>Межсекторный розыск</A>"
				dat+= "<HR><BR><A href='?src=[REF(src)];create_channel=1'>Создать новостной канал</A>"
				dat+= "<BR><A href='?src=[REF(src)];view=1'>Ознакомиться с лентой каналов</A>"
				dat+= "<BR><A href='?src=[REF(src)];create_feed_story=1'>> Создать новый пост</A>"
				dat+= "<BR><A href='?src=[REF(src)];menu_paper=1'>> Напечатать газету</A>"
				dat+= "<BR><A href='?src=[REF(src)];refresh=1'>Обновить пользователя</A>"
				dat+= "<BR><BR><A href='?src=[REF(human_or_robot_user)];mach_close=newscaster_main'>Выйти</A>"
				if(securityCaster)
					var/wanted_already = 0
					if(GLOB.news_network.wanted_issue.active)
						wanted_already = 1
					dat+="<HR><B>Модуль безопасности системы Griffon:</B><BR>"
					dat+="<BR><A href='?src=[REF(src)];menu_wanted=1'>[(wanted_already) ? ("Настроить") : ("Объявить")] \"Розыск\"</A>"
					dat+="<BR><A href='?src=[REF(src)];menu_censor_story=1'>Цензура новостей</A>"
					dat+="<BR><A href='?src=[REF(src)];menu_censor_channel=1'>Установить метку D-Notice</A>"
				dat+="<BR><HR>Вы были успешно зарегистрированы под именем:<BR><FONT COLOR='green'>[scanned_user]</FONT>"
			if(1)
				dat+= "Доступные каналы в вашем секторе:<HR>"
				if(!length(GLOB.news_network.network_channels))
					dat+="<I>Активные каналы не найдены...</I>"
				else
					for(var/datum/newscaster/feed_channel/CHANNEL in GLOB.news_network.network_channels)
						if(CHANNEL.is_admin_channel)
							dat+="<B><FONT style='BACKGROUND-COLOR: LightGreen '><A href='?src=[REF(src)];show_channel=[REF(CHANNEL)]'>[CHANNEL.channel_name]</A></FONT></B><BR>"
						else
							dat+="<B><A href='?src=[REF(src)];show_channel=[REF(CHANNEL)]'>[CHANNEL.channel_name]</A> [(CHANNEL.censored) ? ("<FONT COLOR='red'>***</FONT>") : ""]<BR></B>"
				dat+="<BR><HR><A href='?src=[REF(src)];refresh=1'>Обновить</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A>"
			if(2)
				dat+="Регистрация нового канала:"
				dat+="<HR><B><A href='?src=[REF(src)];set_channel_name=1'>Название канала</A>:</B> [channel_name]<BR>"
				dat+="<B>Автор канала:</B> <FONT COLOR='green'>[scanned_user]</FONT><BR>"
				dat+="<B><A href='?src=[REF(src)];set_channel_lock=1'>Будет ли канал являться публичным?</A>:</B> [(c_locked) ? ("Нет") : ("Да")]<BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];submit_new_channel=1'>Подтвердить</A><BR><BR><A href='?src=[REF(src)];setScreen=[0]'>Отмена</A><BR>"
			if(3)
				dat+="Публикация нового поста:"
				dat+="<HR><B><A href='?src=[REF(src)];set_channel_receiving=1'>Выбранный канал</A>:</B> [channel_name]<BR>"
				dat+="<B>Автор сообщения:</B> <FONT COLOR='green'>[scanned_user]</FONT><BR>"
				dat+="<B><A href='?src=[REF(src)];set_new_message=1'>Сообщение</A>:</B> <BR><font face=\"[PEN_FONT]\">[parsemarkdown(msg, user)]</font><BR>"
				dat+="<B><A href='?src=[REF(src)];set_attachment=1'>Прикреплённые сообщения</A>:</B>  [(picture ? "Фото прикреплено" : "Фото отсутствует")]</BR>"
				dat+="<B><A href='?src=[REF(src)];set_comment=1'>Комментарии [allow_comments ? "разрешены" : "отключены"]</A></B><BR>"
				dat+="<BR><A href='?src=[REF(src)];submit_new_message=1'>Подтвердить</A><BR><BR><A href='?src=[REF(src)];setScreen=[0]'>Отмена</A><BR>"
			if(4)
				dat+="Новый пост успешно загружен ​​на канал '[channel_name]'.<BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(5)
				dat+="Канал '[channel_name]' успешно создан.<BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(6)
				dat+="<B><FONT COLOR='DarkTurquoisen'>ОШИБКА:</FONT> <FONT COLOR='Crimson'>Не удалось отправить новый пост в сеть.</FONT></B><HR><BR>"
				if(channel_name=="")
					dat+="<FONT COLOR='DarkTurquoisen'>Неверное имя для канала.</FONT><BR>"
				if(scanned_user=="Unknown")
					dat+="<FONT COLOR='DarkTurquoisen'>Автор канала не определён.</FONT><BR>"
				if(msg == "" || msg == "\[REDACTED\]")
					dat+="<FONT COLOR='DarkTurquoisen'>Недопустимое сообщение.</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[3]'>Return</A><BR>"
			if(7)
				dat+="<B><FONT COLOR='DarkTurquoisen'>ОШИБКА:</FONT> <FONT COLOR='Crimson'>Не удалось создать канал в сети Griffon.</FONT></B><HR><BR>"
				var/list/existing_authors = list()
				for(var/datum/newscaster/feed_channel/FC in GLOB.news_network.network_channels)
					if(FC.authorCensor)
						existing_authors += GLOB.news_network.redactedText
					else
						existing_authors += FC.author
				if(scanned_user in existing_authors)
					dat+="<FONT COLOR='DarkTurquoisen'>Вы уже являетесь автором одного из каналов.</FONT><BR>"
				if(channel_name=="" || channel_name == "\[REDACTED\]")
					dat+="<FONT COLOR='DarkTurquoisen'>Неверное имя канала.</FONT><BR>"
				var/check = 0
				for(var/datum/newscaster/feed_channel/FC in GLOB.news_network.network_channels)
					if(FC.channel_name == channel_name)
						check = 1
						break
				if(check)
					dat+="<FONT COLOR='DarkTurquoisen'>Название канала уже используется.</FONT><BR>"
				if(scanned_user=="Unknown")
					dat+="<FONT COLOR='DarkTurquoisen'>Автор канала не определён.</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[2]'>Вернуться</A><BR>"
			if(8)
				var/total_num=length(GLOB.news_network.network_channels)
				var/active_num=total_num
				var/message_num=0
				for(var/datum/newscaster/feed_channel/FC in GLOB.news_network.network_channels)
					if(!FC.censored)
						message_num += length(FC.messages)
					else
						active_num--
				dat+="В настоящее время сеть обслуживает в общей сложности [total_num] новостных каналов, [active_num] из них активны, и всего [message_num] постов."
				dat+="<BR><BR><B>Остаток жидкой бумаги:</B> [(paper_remaining) *100 ] cm^3"
				dat+="<BR><BR><A href='?src=[REF(src)];print_paper=[0]'>Распечатать газету</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Отмена</A>"
			if(9)
				dat+="<B>[viewing_channel.channel_name]:<BR> </B><FONT SIZE=1>\[Автор: <FONT COLOR='DarkTurquoise'>[viewing_channel.returnAuthor(-1)]</FONT>\]</FONT><HR>"
				if(viewing_channel.censored)
					dat+="<FONT COLOR='red'><B>ВНИМАНИЕ: </B></FONT>Этот канал был признан угрожающим благополучию сектора и отмечен меткой 'D-Notice' администрацией информационной сети Griffon.<BR>"
					dat+="Под действием метки 'D-Notice' дальнейший просмотр канала и добавление новых постов запрещено.</FONT><BR><BR>"
				else
					if(!length(viewing_channel.messages))
						dat+="<I>В канале не найдено каких-либо постов...</I><BR>"
					else
						var/i = 0
						for(var/datum/newscaster/feed_message/MESSAGE in viewing_channel.messages)
							i++
							dat+="[MESSAGE.returnBody(-1)] <BR>"
							if(MESSAGE.img)
								usr << browse_rsc(MESSAGE.img, "tmp_photo[i].png")
								dat+="<img src='tmp_photo[i].png' width = '180'><BR>"
								if(MESSAGE.caption)
									dat+="[MESSAGE.caption]<BR>"
								dat+="<BR>"
							dat+="<FONT SIZE=2>\[Автор: <FONT COLOR='DarkTurquoise'>[MESSAGE.returnAuthor(-1)] </FONT>\] ([MESSAGE.time_stamp])</FONT><BR>"
							dat+="<b><font size=1>[MESSAGE.comments.len] comment[MESSAGE.comments.len > 1 ? "s" : ""]</font></b><br>"
							for(var/datum/newscaster/feed_comment/comment in MESSAGE.comments)
								dat+="<font size=2><small> - [comment.body]</font><br><font size=2><small><small>[comment.author] [comment.time_stamp]</small></small></small></font><br>"
							if(MESSAGE.locked)
								dat+="<b>Комментарии заблокированы</b><br>"
							else
								dat+="<a href='?src=[REF(src)];new_comment=[REF(MESSAGE)]'>Прокомментировать</a><br>"
				dat+="<BR><HR><A href='?src=[REF(src)];refresh=1'>Обновить</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[1]'>Вернуться</A>"
			if(10)
				dat+="<B>Инструмент цензуры каналов сети Griffon</B><BR>"
				dat+="<FONT SIZE=1>ПРИМЕЧАНИЕ: Из-за технических работ полное удаление каналов невозможно.<BR>"
				dat+="Имейте в виду, что пользователи, пытающиеся просмотреть цензурированный канал, вместо канала увидят \[REDACTED\] тег над ним.</FONT>"
				dat+="<HR>Выберите канал, чтобы ознакомиться с лентой:<BR>"
				if(!length(GLOB.news_network.network_channels))
					dat+="<I>Активные каналы не найдены...</I><BR>"
				else
					for(var/datum/newscaster/feed_channel/CHANNEL in GLOB.news_network.network_channels)
						dat+="<A href='?src=[REF(src)];pick_censor_channel=[REF(CHANNEL)]'>[CHANNEL.channel_name]</A> [(CHANNEL.censored) ? ("<FONT COLOR='red'>***</FONT>") : ""]<BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Отмена</A>"
			if(11)
				dat+="<B>Модуль D-Notice:</B><HR>"
				dat+="<FONT SIZE=1>Метка D-Notice должна быть прикреплена к каналу, если администрация сочтет его запрещённым для сектора. "
				dat+="D-Notice сделает канал недоступным для обновления кем-либо, но без удаления самого канала. "
				dat+="Вы можете отменить D-Notice, если у вас есть необходимый доступ, в любое время.</FONT><HR>"
				if(!length(GLOB.news_network.network_channels))
					dat+="<I>Активные каналы не найдены...</I><BR>"
				else
					for(var/datum/newscaster/feed_channel/CHANNEL in GLOB.news_network.network_channels)
						dat+="<A href='?src=[REF(src)];pick_d_notice=[REF(CHANNEL)]'>[CHANNEL.channel_name]</A> [(CHANNEL.censored) ? ("<FONT COLOR='red'>***</FONT>") : ""]<BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A>"
			if(12)
				dat+="<B>[viewing_channel.channel_name]:<BR> </B><FONT SIZE=1>\[ Автор: <FONT COLOR='DarkTurquoise'>[viewing_channel.returnAuthor(-1)]</FONT> \]</FONT><BR>"
				dat+="<FONT SIZE=2><A href='?src=[REF(src)];censor_channel_author=[REF(viewing_channel)]'>[(viewing_channel.authorCensor) ? ("Отменить цензуру автора") : ("Скрыть имя автора")]</A></FONT><HR>"
				if(!length(viewing_channel.messages))
					dat+="<I>В канале не найдено постов...</I><BR>"
				else
					for(var/datum/newscaster/feed_message/MESSAGE in viewing_channel.messages)
						dat+="-[MESSAGE.returnBody(-1)] <BR><FONT SIZE=1>\[Автор <FONT COLOR='DarkTurquoise'>[MESSAGE.returnAuthor(-1)]</FONT>\]</FONT><BR>"
						dat+="<FONT SIZE=2><A href='?src=[REF(src)];censor_channel_story_body=[REF(MESSAGE)]'>[(MESSAGE.bodyCensor) ? ("Отменить цензуру сообщения") : ("Заблокировать сообщение")]</A>  -  <A href='?src=[REF(src)];censor_channel_story_author=[REF(MESSAGE)]'>[(MESSAGE.authorCensor) ? ("Отменить цензуру имени автора") : ("Скрыть имя автора")]</A></FONT><BR>"
						dat+="[MESSAGE.comments.len] comment[MESSAGE.comments.len > 1 ? "s" : ""]: <a href='?src=[REF(src)];lock_comment=[REF(MESSAGE)]'>[MESSAGE.locked ? "Разблокированы" : "Заблокированы"]</a><br>"
						for(var/datum/newscaster/feed_comment/comment in MESSAGE.comments)
							dat+="[comment.body] <a href='?src=[REF(src)];del_comment=[REF(comment)];del_comment_msg=[REF(MESSAGE)]'>X</a><br><font size=1>[comment.author] [comment.time_stamp]</font><br>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[10]'>Вернуться</A>"
			if(13)
				dat+="<B>[viewing_channel.channel_name]:<BR> </B><FONT SIZE=1>\[ Автор: <FONT COLOR='DarkTurquoise'>[viewing_channel.returnAuthor(-1)]</FONT> \]</FONT><BR>"
				dat+="Если вы считаете cообщения канала, что перечислены ниже, опасными для сектора, вы можете <A href='?src=[REF(src)];toggle_d_notice=[REF(viewing_channel)]'>редактировать метку D-Notice для этого канала</A>.<HR>"
				if(viewing_channel.censored)
					dat+="<FONT COLOR='red'><B>ВНИМАНИЕ: </B></FONT>Этот канал был признан угрожающим благополучию сектора и отмечен меткой D-Notice администрацией Griffon.<BR>"
					dat+="Под действием метки D-Notice дальнейшее добавление новых постов запрещено.</FONT><BR><BR>"
				else
					if(!length(viewing_channel.messages))
						dat+="<I>В канале не найдено постов...</I><BR>"
					else
						for(var/datum/newscaster/feed_message/MESSAGE in viewing_channel.messages)
							dat+="[MESSAGE.returnBody(-1)] <BR><FONT SIZE=1>\[Автор <FONT COLOR='DarkTurquoisen'>[MESSAGE.returnAuthor(-1)]</FONT>\]</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[11]'>Вернуться</A>"
			if(14)
				dat+="<B>Модуль безопасности:</B>"
				var/wanted_already = 0
				var/end_param = 1
				if(GLOB.news_network.wanted_issue.active)
					wanted_already = 1
					end_param = 2
				if(wanted_already)
					dat+="<FONT SIZE=2><BR><I>Преступник уже объявлен в новостных каналах. Вы можете отредактировать или отменить ориентировку ниже.</FONT></I>"
				dat+="<HR>"
				dat+="<A href='?src=[REF(src)];set_wanted_name=1'>Имя цели</A>: [channel_name] <BR>"
				dat+="<A href='?src=[REF(src)];set_wanted_desc=1'>Описание</A>: [msg] <BR>"
				dat+="<A href='?src=[REF(src)];set_attachment=1'>Прикреплённые материалы</A>: [(picture ? "Фото прикрепленно" : "Фото отсутствует")]</BR>"
				if(wanted_already)
					dat+="<B>Розыск был объявлен пользователем: </B><FONT COLOR='green'>[GLOB.news_network.wanted_issue.scannedUser]</FONT><BR>"
				else
					dat+="<B>Розыск будет объявлен пользователем:</B><FONT COLOR='green'>[scanned_user]</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];submit_wanted=[end_param]'>[(wanted_already) ? ("Редактировать цель") : ("Подтвердить")]</A>"
				if(wanted_already)
					dat+="<BR><A href='?src=[REF(src)];cancel_wanted=1'>Отменить розыск</A>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Отмена</A>"
			if(15)
				dat+="<FONT COLOR='green'>Розыск на '[channel_name]' был успешно опубликован на первых строчках сети Griffon.</FONT><BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(16)
				dat+="<B><FONT COLOR='DarkTurquoisen'>ERROR: Розыск был отменён сетью Griffon.</B></FONT><HR><BR>"
				if(channel_name=="" || channel_name == "\[REDACTED\]")
					dat+="<FONT COLOR='DarkTurquoisen'>Неверное имя разыскиваемого.</FONT><BR>"
				if(scanned_user=="Unknown")
					dat+="<FONT COLOR='DarkTurquoisen'>Автор не идентифицирован.</FONT><BR>"
				if(msg == "" || msg == "\[REDACTED\]")
					dat+="<FONT COLOR='DarkTurquoisen'>Неверное описание.</FONT><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(17)
				dat+="<B>Розыск успешно был удалён с сети Griffon</B><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(18)
				if(GLOB.news_network.wanted_issue.active)
					dat+="<B><FONT COLOR ='FireBrick'>-- ОБЪЯВЛЕН РОЗЫСК --</B></FONT><BR><FONT SIZE=2>\[Подтверждено: <FONT COLOR='green'>[GLOB.news_network.wanted_issue.scannedUser]</FONT>\]</FONT><HR>"
					dat+="<B>Цель</B>: [GLOB.news_network.wanted_issue.criminal]<BR>"
					dat+="<B>Описание</B>: [GLOB.news_network.wanted_issue.body]<BR>"
					dat+="<B>Прикреплённые материалы:</B>: "
					if(GLOB.news_network.wanted_issue.img)
						usr << browse_rsc(GLOB.news_network.wanted_issue.img, "tmp_photow.png")
						dat+="<BR><img src='tmp_photow.png' width = '180'>"
					else
						dat+="Отсутствуют"
				else
					dat+="Объявленных розысков не найдено<BR><BR>"
				dat+="<BR><BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(19)
				dat+="<FONT COLOR='green'>Розыск для '[channel_name]' успешно отредактирован</FONT><BR><BR>"
				dat+="<BR><A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A><BR>"
			if(20)
				dat+="<FONT COLOR='green'>Файл успешно был распечатан. Пожалуйста, возьмите газету из нижней части машины.</FONT><BR><BR>"
				dat+="<A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A>"
			if(21)
				dat+="<FONT COLOR='DarkTurquoisen'>Невозможно напечатать газету. Недостаточно бумаги. Пожалуйста, сообщите обслуживающему персоналу о необходимости пополнить запасы машины.</FONT><BR><BR>"
				dat+="<A href='?src=[REF(src)];setScreen=[0]'>Вернуться</A>"
		var/datum/browser/popup = new(human_or_robot_user, "newscaster_main", "Новостной монитор #[unit_no]", 400, 600)
		popup.set_content(dat)
		popup.open()

/obj/machinery/newscaster/Topic(href, href_list)
	if(..())
		return
	if ((usr.contents.Find(src) || ((get_dist(src, usr) <= 1) && isturf(loc))) || issilicon(usr))
		usr.set_machine(src)
		scan_user(usr)
		if(href_list["set_channel_name"])
			channel_name = stripped_input(usr, "Укажите желаемое название для вашего канала", "Информационная сеть Griffon", "", MAX_NAME_LEN)
			updateUsrDialog()
		else if(href_list["set_channel_lock"])
			c_locked = !c_locked
			updateUsrDialog()
		else if(href_list["submit_new_channel"])
			var/list/existing_authors = list()
			for(var/datum/newscaster/feed_channel/FC in GLOB.news_network.network_channels)
				if(FC.authorCensor)
					existing_authors += GLOB.news_network.redactedText
				else
					existing_authors += FC.author
			var/check = 0
			for(var/datum/newscaster/feed_channel/FC in GLOB.news_network.network_channels)
				if(FC.channel_name == channel_name)
					check = 1
					break
			if(channel_name == "" || channel_name == "\[REDACTED\]" || scanned_user == "Unknown" || check || (scanned_user in existing_authors))
				screen=7
			else
				var/choice = alert("Пожалуйста, подтвердите создание нового канала","Информационная сеть Griffon","Подтвердить","Отмена")
				if(choice=="Подтвердить")
					scan_user(usr)
					GLOB.news_network.CreateFeedChannel(channel_name, scanned_user, c_locked)
					SSblackbox.record_feedback("text", "newscaster_channels", 1, "[channel_name]")
					screen=5
			updateUsrDialog()
		else if(href_list["set_channel_receiving"])
			var/list/available_channels = list()
			for(var/datum/newscaster/feed_channel/F in GLOB.news_network.network_channels)
				if((!F.locked || F.author == scanned_user) && !F.censored)
					available_channels += F.channel_name
			channel_name = input(usr, "Выберите информационный канал", "Информационная сеть Griffon") in sortList(available_channels)
			updateUsrDialog()
		else if(href_list["set_new_message"])
			var/temp_message = trim(stripped_multiline_input(usr, "Создайте самый оригинальный пост в вашем канале", "Информационная сеть Griffon", msg))
			if(temp_message)
				msg = temp_message
				updateUsrDialog()
		else if(href_list["set_attachment"])
			AttachPhoto(usr)
			updateUsrDialog()
		else if(href_list["submit_new_message"])
			if(msg =="" || msg=="\[REDACTED\]" || scanned_user == "Unknown" || channel_name == "" )
				screen=6
			else
				GLOB.news_network.SubmitArticle("<font face=\"[PEN_FONT]\">[parsemarkdown(msg, usr)]</font>", scanned_user, channel_name, picture, 0, allow_comments)
				SSblackbox.record_feedback("amount", "newscaster_stories", 1)
				screen=4
				msg = ""
				picture = null
			updateUsrDialog()
		else if(href_list["create_channel"])
			screen=2
			updateUsrDialog()
		else if(href_list["create_feed_story"])
			screen=3
			updateUsrDialog()
		else if(href_list["menu_paper"])
			screen=8
			updateUsrDialog()
		else if(href_list["print_paper"])
			if(!paper_remaining)
				screen=21
			else
				print_paper()
				screen = 20
			updateUsrDialog()
		else if(href_list["menu_censor_story"])
			screen=10
			updateUsrDialog()
		else if(href_list["menu_censor_channel"])
			screen=11
			updateUsrDialog()
		else if(href_list["menu_wanted"])
			var/already_wanted = 0
			if(GLOB.news_network.wanted_issue.active)
				already_wanted = 1
			if(already_wanted)
				channel_name = GLOB.news_network.wanted_issue.criminal
				msg = GLOB.news_network.wanted_issue.body
			screen = 14
			updateUsrDialog()
		else if(href_list["set_wanted_name"])
			channel_name = stripped_input(usr, "Укажите имя вашей цели", "Модуль безопасности системы Griffon")
			updateUsrDialog()
		else if(href_list["set_wanted_desc"])
			msg = stripped_input(usr, "Укажите описание вашей цели, а также остальные различные подробности", "Модуль безопасности системы Griffon")
			updateUsrDialog()
		else if(href_list["submit_wanted"])
			var/input_param = text2num(href_list["submit_wanted"])
			if(msg == "" || channel_name == "" || scanned_user == "Unknown")
				screen = 16
			else
				var/choice = alert("Пожалуйста, подтвердите [(input_param==1) ? ("объявление.") : ("изменения.")]","Модуль безопасности системы Griffon","Подтвердить","Отменить")
				if(choice=="Подтвердить")
					scan_user(usr)
					if(input_param==1)		  //If input_param == 1 we're submitting a new wanted issue. At 2 we're just editing an existing one.
						GLOB.news_network.submitWanted(channel_name, msg, scanned_user, picture, 0 , 1)
						screen = 15
					else
						if(GLOB.news_network.wanted_issue.isAdminMsg)
							alert("Разыскиваемый выпуск был объявлен администратором сети Griffon. Вы не можете его редактировать.","Ok")
							return
						GLOB.news_network.submitWanted(channel_name, msg, scanned_user, picture)
						screen = 19
			updateUsrDialog()
		else if(href_list["cancel_wanted"])
			if(GLOB.news_network.wanted_issue.isAdminMsg)
				alert("Разыскиваемый выпуск был объявлен администратором сети Griffon. Вы не можете его снять.","Ok")
				return
			var/choice = alert("Подтвердите отмену розыска.","Модуль безопасности сети Griffon","Подтвердить","Отменить")
			if(choice=="Подтвердить")
				GLOB.news_network.deleteWanted()
				screen=17
			updateUsrDialog()
		else if(href_list["view_wanted"])
			screen=18
			updateUsrDialog()
		else if(href_list["censor_channel_author"])
			var/datum/newscaster/feed_channel/FC = locate(href_list["censor_channel_author"]) in GLOB.news_network.network_channels
			if(FC.is_admin_channel)
				alert("Этот канал был создан администратором сети Griffon. Вы не можете подвергать это цензуре.","Ok")
				return
			FC.toggleCensorAuthor()
			updateUsrDialog()
		else if(href_list["censor_channel_story_author"])
			var/datum/newscaster/feed_message/MSG = locate(href_list["censor_channel_story_author"]) in viewing_channel.messages
			if(MSG.is_admin_message)
				alert("Это сообщение было создано администратором сети Griffon. Вы не можете подвергнуть цензуре его автора.","Ok")
				return
			MSG.toggleCensorAuthor()
			updateUsrDialog()
		else if(href_list["censor_channel_story_body"])
			var/datum/newscaster/feed_message/MSG = locate(href_list["censor_channel_story_body"]) in viewing_channel.messages
			if(MSG.is_admin_message)
				alert("Этот канал был создан администратором сети Griffon. Вы не можете подвергать это цензуре.","Ok")
				return
			MSG.toggleCensorBody()
			updateUsrDialog()
		else if(href_list["pick_d_notice"])
			var/datum/newscaster/feed_channel/FC = locate(href_list["pick_d_notice"]) in GLOB.news_network.network_channels
			viewing_channel = FC
			screen=13
			updateUsrDialog()
		else if(href_list["toggle_d_notice"])
			var/datum/newscaster/feed_channel/FC = locate(href_list["toggle_d_notice"]) in GLOB.news_network.network_channels
			if(FC.is_admin_channel)
				alert("Этот канал был создан администратором сети Griffon. Вы не можете установить метку D-Notice.","Ok")
				return
			FC.toggleCensorDclass()
			updateUsrDialog()
		else if(href_list["view"])
			screen=1
			updateUsrDialog()
		else if(href_list["setScreen"])
			screen = text2num(href_list["setScreen"])
			if (screen == 0)
				scanned_user = "Unknown";
				msg = "";
				c_locked=0;
				channel_name="";
				viewing_channel = null
			updateUsrDialog()
		else if(href_list["show_channel"])
			var/datum/newscaster/feed_channel/FC = locate(href_list["show_channel"]) in GLOB.news_network.network_channels
			viewing_channel = FC
			screen = 9
			updateUsrDialog()
		else if(href_list["pick_censor_channel"])
			var/datum/newscaster/feed_channel/FC = locate(href_list["pick_censor_channel"]) in GLOB.news_network.network_channels
			viewing_channel = FC
			screen = 12
			updateUsrDialog()
		else if(href_list["new_comment"])
			var/datum/newscaster/feed_message/FM = locate(href_list["new_comment"]) in viewing_channel.messages
			var/cominput = stripped_input(usr, "Укажите ваш комментарий:", "Информационная сеть Griffon", null, 140)
			if(cominput)
				scan_user(usr)
				var/datum/newscaster/feed_comment/FC = new/datum/newscaster/feed_comment
				FC.author = scanned_user
				FC.body = cominput
				FC.time_stamp = station_time_timestamp()
				FM.comments += FC
				usr.log_message("(as [scanned_user]) commented on message [FM.returnBody(-1)] -- [FC.body]", LOG_COMMENT)
			updateUsrDialog()
		else if(href_list["del_comment"])
			var/datum/newscaster/feed_message/FM = locate(href_list["del_comment_msg"]) in viewing_channel.messages
			var/datum/newscaster/feed_comment/FC = locate(href_list["del_comment"]) in FM.comments
			if(istype(FC) && istype(FM))
				FM.comments -= FC
				qdel(FC)
				updateUsrDialog()
		else if(href_list["lock_comment"])
			var/datum/newscaster/feed_message/FM = locate(href_list["lock_comment"]) in viewing_channel.messages
			FM.locked ^= 1
			updateUsrDialog()
		else if(href_list["set_comment"])
			allow_comments ^= 1
			updateUsrDialog()
		else if(href_list["refresh"])
			updateUsrDialog()

/obj/machinery/newscaster/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_WRENCH)
		to_chat(user, span_notice("You start [anchored ? "un" : ""]securing [name]..."))
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 60))
			playsound(loc, 'sound/items/deconstruct.ogg', 50, TRUE)
			if(machine_stat & BROKEN)
				to_chat(user, span_warning("The broken remains of [src] fall on the ground."))
				new /obj/item/stack/sheet/metal(loc, 5)
				new /obj/item/shard(loc)
				new /obj/item/shard(loc)
			else
				to_chat(user, span_notice("You [anchored ? "un" : ""]secure [name]."))
				new /obj/item/wallframe/newscaster(loc)
			qdel(src)
	else if(I.tool_behaviour == TOOL_WELDER && user.a_intent != INTENT_HARM)
		if(machine_stat & BROKEN)
			if(!I.tool_start_check(user, amount=0))
				return
			user.visible_message(span_notice("[user] ремонтирует [src]."), \
							span_notice("Вы начинаете ремонт [src]..."), \
							span_hear("Вы слышите сварку."))
			if(I.use_tool(src, user, 40, volume=50))
				if(!(machine_stat & BROKEN))
					return
				to_chat(user, span_notice("Вы ремонтируете [src]."))
				obj_integrity = max_integrity
				set_machine_stat(machine_stat & ~BROKEN)
				update_appearance()
		else
			to_chat(user, span_notice("[src] не требует ремонта."))
	else
		return ..()

/obj/machinery/newscaster/play_attack_sound(damage, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			if(machine_stat & BROKEN)
				playsound(loc, 'sound/effects/hit_on_shattered_glass.ogg', 100, TRUE)
			else
				playsound(loc, 'sound/effects/glasshit.ogg', 90, TRUE)
		if(BURN)
			playsound(src.loc, 'sound/items/welder.ogg', 100, TRUE)


/obj/machinery/newscaster/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/metal(loc, 2)
		new /obj/item/shard(loc)
		new /obj/item/shard(loc)
	qdel(src)

/obj/machinery/newscaster/obj_break(damage_flag)
	. = ..()
	if(.)
		playsound(loc, 'sound/effects/glassbr3.ogg', 100, TRUE)


/obj/machinery/newscaster/attack_paw(mob/user)
	if(user.a_intent != INTENT_HARM)
		to_chat(user, span_warning("Управление этой штукой выглядит слишком сложно для вашего крошечного мозга!"))
	else
		take_damage(5, BRUTE, "melee")

/obj/machinery/newscaster/proc/AttachPhoto(mob/user)
	var/obj/item/photo/photo = user.is_holding_item_of_type(/obj/item/photo)
	if(photo)
		picture = photo.picture
	if(issilicon(user))
		var/obj/item/camera/siliconcam/targetcam
		if(isAI(user))
			var/mob/living/silicon/ai/R = user
			targetcam = R.aicamera
		else if(ispAI(user))
			var/mob/living/silicon/pai/R = user
			targetcam = R.aicamera
		else if(iscyborg(user))
			var/mob/living/silicon/robot/R = user
			if(R.connected_ai)
				targetcam = R.connected_ai.aicamera
			else
				targetcam = R.aicamera
		else
			to_chat(user, span_warning("Вы не можете взаимодействовать с загрузкой фотографий!"))
		if(!targetcam.stored.len)
			to_chat(usr, span_boldannounce("Изображения не найдены."))
			return
		var/datum/picture/selection = targetcam.selectpicture(user)
		if(selection)
			picture = selection

/obj/machinery/newscaster/proc/scan_user(mob/living/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		if(human_user.wear_id)
			if(istype(human_user.wear_id, /obj/item/pda))
				var/obj/item/pda/P = human_user.wear_id
				if(P.id)
					scanned_user = "[P.id.registered_name] ([P.id.assignment])"
				else
					scanned_user = "Unknown"
			else if(istype(human_user.wear_id, /obj/item/card/id))
				var/obj/item/card/id/ID = human_user.wear_id
				scanned_user ="[ID.registered_name] ([ID.assignment])"
			else
				scanned_user ="Unknown"
		else
			scanned_user ="Unknown"
	else if(issilicon(user))
		var/mob/living/silicon/ai_user = user
		scanned_user = "[ai_user.name] ([ai_user.job])"
	else
		CRASH("Invalid user for this proc")

/obj/machinery/newscaster/proc/print_paper()
	SSblackbox.record_feedback("amount", "newspapers_printed", 1)
	var/obj/item/newspaper/NEWSPAPER = new /obj/item/newspaper
	for(var/datum/newscaster/feed_channel/FC in GLOB.news_network.network_channels)
		NEWSPAPER.news_content += FC
	if(GLOB.news_network.wanted_issue.active)
		NEWSPAPER.wantedAuthor = GLOB.news_network.wanted_issue.scannedUser
		NEWSPAPER.wantedCriminal = GLOB.news_network.wanted_issue.criminal
		NEWSPAPER.wantedBody = GLOB.news_network.wanted_issue.body
		if(GLOB.news_network.wanted_issue.img)
			NEWSPAPER.wantedPhoto = GLOB.news_network.wanted_issue.img
	NEWSPAPER.forceMove(drop_location())
	NEWSPAPER.creationTime = GLOB.news_network.lastAction
	paper_remaining--


/obj/machinery/newscaster/proc/remove_alert()
	alert = FALSE
	update_appearance()

/obj/machinery/newscaster/proc/newsAlert(channel)
	if(channel)
		say("Новые новости от канала: [channel]!")
		alert = TRUE
		update_appearance()
		addtimer(CALLBACK(src, PROC_REF(remove_alert)),alert_delay,TIMER_UNIQUE|TIMER_OVERRIDE)
		playsound(loc, 'sound/machines/twobeep_high.ogg', 75, TRUE)
	else
		say("Внимание! Объявлен новый розыск!")
		playsound(loc, 'sound/machines/warning-buzzer.ogg', 75, TRUE)


/obj/item/newspaper
	name = "newspaper"
	desc = "Выпуск газеты «Griffon», часто распространяемой на борту космических станций «Nanotrasen»."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "newspaper"
	lefthand_file = 'icons/mob/inhands/misc/books_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/books_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("bapped")
	resistance_flags = FLAMMABLE
	var/screen = 0
	var/pages = 0
	var/curr_page = 0
	var/list/datum/newscaster/feed_channel/news_content = list()
	var/scribble=""
	var/scribble_page = null
	var/wantedAuthor
	var/wantedCriminal
	var/wantedBody
	var/wantedPhoto
	var/creationTime

/obj/item/newspaper/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		var/dat="<meta http-equiv='X-UA-Compatible' content='IE=edge' charset='UTF-8'/>"
		pages = 0
		switch(screen)
			if(0) //Cover
				dat+="<DIV ALIGN='center'><B><FONT SIZE=6>Griffon</FONT></B></div>"
				dat+="<DIV ALIGN='center'><FONT SIZE=2>Стандартная общедоступная информационная сеть. Лучшее место для вашей рекламы!</FONT></div><HR>"
				if(!length(news_content))
					if(wantedAuthor)
						dat+="<B>Содержание:</B><BR><ul><B><FONT COLOR='red'>**</FONT>Межсекторный розыск<FONT COLOR='red'>**</FONT></B><BR> <FONT SIZE=2>\[Страница: [pages+2]\]</FONT><BR></ul>"
					else
						dat+="<I>Остальная часть газеты ещё не напечатана.</I>"
				else
					dat+="<B>Содержание:</B><BR><ul>"
					for(var/datum/newscaster/feed_channel/NP in news_content)
						pages++
					if(wantedAuthor)
						dat+="<B><FONT COLOR='red'>\[Внимание!\] </FONT>Важная информация о безопасности</B><BR> <FONT SIZE=2>\[Страница: [pages+2]\]</FONT><BR>"
					var/temp_page=0
					for(var/datum/newscaster/feed_channel/NP in news_content)
						temp_page++
						dat+="<B>[NP.channel_name]</B><BR> <FONT SIZE=2>\[Страница: [temp_page+1]\]</FONT><BR>"
					dat+="</ul>"
				if(scribble_page==curr_page)
					dat+="<BR><I>В конце этой страницы есть небольшие каракули... \"[scribble]\"</I>"
				dat+= "<HR><DIV STYLE='float:right;'><A href='?src=[REF(src)];next_page=1'>Next Page</A></DIV> <div style='float:left;'><A href='?src=[REF(human_user)];mach_close=newspaper_main'>Close</A></DIV>"
			if(1) // X channel pages inbetween.
				for(var/datum/newscaster/feed_channel/NP in news_content)
					pages++
				var/datum/newscaster/feed_channel/C = news_content[curr_page]
				dat += "<FONT SIZE=4><B>[C.channel_name]</B></FONT><BR><FONT SIZE=1> \[Автор: <FONT COLOR='DarkTurquoisen'>[C.returnAuthor(notContent(C.authorCensorTime))]</FONT>\]</FONT><BR><BR>"
				if(notContent(C.DclassCensorTime))
					dat+="Этот канал был признан опасным для общего благосостояния сектора и поэтому отмечен знаком <B><FONT COLOR='red'>D-Notice</B></FONT>. Содержание было проигнорировано на момент печати газеты."
				else
					if(!length(C.messages))
						dat+="<i>Новостей нет в этом канале..</i>"
					else
						var/i = 0
						for(var/datum/newscaster/feed_message/MESSAGE in C.messages)
							if(MESSAGE.creationTime > creationTime)
								if(i == 0)
									dat+="<i>Новостей нет в этом канале..</i>"
								break
							if(i == 0)
								dat+="<ul>"
							i++
							dat+="-[MESSAGE.returnBody(notContent(MESSAGE.bodyCensorTime))] <BR>"
							if(MESSAGE.img)
								user << browse_rsc(MESSAGE.img, "tmp_photo[i].png")
								dat+="<img src='tmp_photo[i].png' width = '180'><BR>"
							dat+="<FONT SIZE=1>\[Автор: <FONT COLOR='DarkTurquoisen'>[MESSAGE.returnAuthor(notContent(MESSAGE.authorCensorTime))]</FONT>\]</FONT><BR><BR>"
						dat+="</ul>"
				if(scribble_page==curr_page)
					dat+="<BR><I>В конце этой страницы есть небольшая каракуля... \"[scribble]\"</I>"
				dat+= "<BR><HR><DIV STYLE='float:left;'><A href='?src=[REF(src)];prev_page=1'>Previous Page</A></DIV> <DIV STYLE='float:right;'><A href='?src=[REF(src)];next_page=1'>Next Page</A></DIV>"
			if(2) //Last page
				for(var/datum/newscaster/feed_channel/NP in news_content)
					pages++
				if(wantedAuthor!=null)
					dat+="<DIV STYLE='float:center;'><FONT SIZE=4><B>Межсекторный Розыск:</B></FONT SIZE></DIV><HR><BR><BR>"
					dat+="<B>Преступник</B>: <FONT COLOR='DarkTurquoisen'>[wantedCriminal]</FONT><BR>"
					dat+="<B>Описание</B>: [wantedBody]<BR>"
					dat+="<B>Прикреплённые материалы</B>: "
					if(wantedPhoto)
						user << browse_rsc(wantedPhoto, "tmp_photow.png")
						dat+="<BR><img src='tmp_photow.png' width = '180'>"
					else
						dat+="None"
				else
					dat+="<I>Кроме неинтересных объявлений на этой странице ничего нет...</I>"
				if(scribble_page==curr_page)
					dat+="<BR><I>В конце этой страницы есть небольшая каракуля... \"[scribble]\"</I>"
				dat+= "<HR><DIV STYLE='float:left;'><A href='?src=[REF(src)];prev_page=1'>Previous Page</A></DIV>"
		dat+="<BR><HR><div align='center'>[curr_page+1]</div>"
		human_user << browse(dat, "window=newspaper_main;size=300x400")
		onclose(human_user, "newspaper_main")
	else
		to_chat(user, span_warning("В газете полно непонятных символов!"))

/obj/item/newspaper/proc/notContent(list/L)
	if(!L.len)
		return 0
	for(var/i=L.len;i>0;i--)
		var/num = abs(L[i])
		if(creationTime <= num)
			continue
		else
			if(L[i] > 0)
				return 1
			else
				return 0
	return 0

/obj/item/newspaper/Topic(href, href_list)
	var/mob/living/U = usr
	..()
	if((src in U.contents) || (isturf(loc) && in_range(src, U)))
		U.set_machine(src)
		if(href_list["next_page"])
			if(curr_page == pages+1)
				return //Don't need that at all, but anyway.
			if(curr_page == pages) //We're at the middle, get to the end
				screen = 2
			else
				if(curr_page == 0) //We're at the start, get to the middle
					screen=1
			curr_page++
			playsound(loc, "pageturn", 50, TRUE)
		else if(href_list["prev_page"])
			if(curr_page == 0)
				return
			if(curr_page == 1)
				screen = 0
			else
				if(curr_page == pages+1) //we're at the end, let's go back to the middle.
					screen = 1
			curr_page--
			playsound(loc, "pageturn", 50, TRUE)
		if(ismob(loc))
			attack_self(loc)

/obj/item/newspaper/attackby(obj/item/W, mob/living/user, params)
	if(burn_paper_product_attackby_check(W, user))
		return

	if(istype(W, /obj/item/pen))
		if(!user.is_literate())
			to_chat(user, span_notice("Ты пишешь неразборчиво [src]!"))
			return
		if(scribble_page == curr_page)
			to_chat(user, span_warning("На этой странице уже есть каракули... Вы же не хотите, чтобы все было слишком непонятно, не так ли?"))
		else
			var/s = stripped_input(user, "Write something", "Newspaper")
			if (!s)
				return
			if(!user.canUseTopic(src, BE_CLOSE))
				return
			scribble_page = curr_page
			scribble = s
			attack_self(user)
			add_fingerprint(user)
	else
		return ..()
