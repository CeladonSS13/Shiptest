/datum/mission/ruin/lost_axe
	name = "Верните Мой Топор"
	desc = "Я потерял одну очень ценную для меня вещь - топор с деревянной рукоятью и красным оголовьем. С этим топором, изготовленным Сибенальхской Гильдией, ещё мои деды ходили. Потерял я его во время того, как моё судно потерпело крушение. Меня-то спасли, а вот топор - нет. Прошу тебя, верни его мне."
	// mission_limit = 1
	// setpiece_item = /obj/item/melee/axe/fire

/datum/mission/ruin/fallen_montagne
	name = "Проверка Неопознанного Сигнала"
	desc = "Мы потеряли контакт с охотничьим угодьем, расположенным на ледяной планете. Скорее всего, на них напали пираты, а значит владелец угодья по имени Montauge уже не в мире живых. Верните нам его тело, дабы мы смогли его похоронить."
	// value = 3000
	// mission_limit = 1
	// mission_reward = /obj/structure/fermenting_barrel/trickwine
	// faction = /datum/faction/srm
	// setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/daughter
	name = "Найдите Нашу Дочь!"
	desc = "Нашу дочь несколько недель назад коммандировали на Фронтир. С того момента к нам не пришло не единой весточки от неё. Никто, даже Солнечная Федерация, не знает что с ней... Пожалуйста! Найдите её и скажите, всё ли с ней хорошо..."
	// value = 4000
	// mission_limit = 1
	// author = "Concerned Parents"
	// faction = /datum/faction/solgov
	// mission_reward = /obj/item/gun/ballistic/automatic/smg/cm5/compact
	// setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/nt_files
	name = "Возвращение Актива"
	desc = "Короче, мне нужно вернуть одну папку. Вы не задаёте лишних вопросов, а я плачу вам обещанную сумму."
	// value = 2500
	// mission_limit = 1
	// mission_reward = list(
	// 	/obj/item/gun/energy/e_gun/old,
	// 	/obj/item/gun/energy/laser/retro,
	// )
	// faction = /datum/faction/nt
	// setpiece_item = /obj/item/documents/nanotrasen

// /datum/mission/ruin/nt_files/generate_mission_details()
// 	. = ..()
// 	author = "Captain [random_species_name()]"

/datum/mission/ruin/icw_documents
	name = "Доставка боевых планов"
	desc = "Наша цель - сохранение истории Межкорпоративных Войн. Мы узнали об ещё одной крупице истории, которую требуется увековечить: Боевые планы, что были связаны с Синдикатом. Наши источники сообщают, что планы находятся в пределах заданного объекта. Удостоверьтесь, там ли они, и доставьте их нам."
	// faction = /datum/faction/syndicate/suns
	// author = "HIS455 \"ICW-era Preservation\""
	// mission_limit = 1
	// setpiece_item = /obj/item/folder/documents/syndicate/red

/datum/mission/ruin/nanotrasen_docs
	name = "Возвращение Собственности Нанотрейзен"
	author = "Nanotrasen Recovery Program"
	desc = "Наши сотрудники потеряли контакт с перерабатывающим предприятием, расположенном в округе этого аванпоста. Корпорация Нанотрейзен заинтересована в возвращении ценных бумаг, распологающихся на данном предприятии."
	// faction = list(
	// 	/datum/faction/nt,
	// 	/datum/faction/syndicate/cybersun
	// )
	// value = 3500
	// mission_limit = 1
	// setpiece_item = /obj/item/documents/nanotrasen

/datum/mission/ruin/nanotrasen_docs/generate_mission_details()
	. = ..()
	if(faction == /datum/faction/nt)
		name = "Возвращение Собственности Нанотрейзен"
		author = "Nanotrasen Recovery Program"
		desc = "Сотрудники Корпорации Нанотрейзен потеряли контакт с перерабатывающим предприятием, расположенном в округе этого аванпоста. Корпорация Нанойтрейзен заинтересована в возвращении ценных бумаг, распологающихся на данном предприятии."
	if(faction == /datum/faction/syndicate/cybersun)
		name = "Cybersun Capture Program"
		author = "Cybersun Virtual Solutions"
		desc = "Киберсан ВР крайне заинтересована в возвращении пакета документов, находящихся на объекте Нанойтрейзен, недавно атакованным Ramzi Clique. Доставьте пакет документов нам, а мы не поскупимся с вознаграждением."

/datum/mission/ruin/captain_medal
	name = "Доставка Утерянной Медали"
	desc = "Пару месяцев назад я потерял медаль \"За Отважную Службу\". К счастью, мне удалось отследить её. Находится она на планете, координаты которой я указал в подробностях к контракту. Я был бы крайне благодарен за её возвращение."
	// faction = /datum/faction/nt
	// value = 2250
	// mission_limit = 1
	// setpiece_item = /obj/item/clothing/accessory/medal/gold/captain

/datum/mission/ruin/brainchip
	name = "Возвращение Собственности Нанотрейзен"
	author = "Nanotrasen Recovery Program"
	desc = "Ваша задача - вернуть имплант внутри одного незадачливого грузчика, у которого не хватило мозгов на то, что бы использовать его так, как было завещано контрактом."
	// faction = /datum/faction/nt
	// mission_limit = 1
	// setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/bitch_wife
	name = "Молетаракан Моей Ёбаной Жены"
	desc = "Моя жена потеряла блядского молетаракана. Столько крика и воплей я, пожалуй, за всю свою жизнь не слышал. Этот маленький засранец, должно быть, забрался на один из отлетающих шаттлов. У меня уже башка трещит от этих постоянных серенад, хоть за бутылку берись... Христом Богом прошу, верните мне эту тварь. И, ПОЖАЛУЙСТА, верните её живой, а то жёнушка опять разорётся."
	// value = 3000
	// mission_limit = 1
	// setpiece_item = /mob/living/simple_animal/pet/mothroach

/datum/mission/ruin/ns_manager
	name = "Менеджер, заждавшийся интервью"
	desc = "Ввиду поломки систем связи на одном из отдалённых шахтёрских участков, N+S Logistics не смогла провести инвентаризацию вышеупомянутого объекта. Отправьтесь на шахтёрскую базу и доставьте нам её менеджера, дабы мы узнали, с чего это он решил пренебречь ремонтом систем связи."
	// value = 3000
	// mission_limit = 1
	// faction = list(
	// 	/datum/faction/nt/ns_logi,
	// )
	// setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/oh_fuck
	name = "След Генератора Сингулярности"
	desc = "Мы засекли след Генератора Сингулярности в указанном квадрате системы. Вы даже не представляете, какую опасность это несёт не только для нас, но и для всей системы в целом. Стоит генератору попасть в недобрые или некомпетентные руки - катастрофы не избежать. Вы можете рассчитывать на шикарное вознаграждение, главное - доставьте нам эту роковую установку."
	// author = "The Outpost"
	// value = 15000
	// mission_limit = 1
	// setpiece_item = /obj/machinery/the_singularitygen

/datum/mission/ruin/pgf_captain
	name = "Расследование Пропавшего Судна"
	desc = "Мы начали получать сигналы от маячка бедствия, расположенном на одном из пропавших патрульных кораблей. По мнению разведки, они были атакованы пиратами, так что шансы на выживание кого-то из членов экипажа близки к нулю. Найдите тело капитана судна и доставьте его нам ради предписанного вознаграждения."
	// author = "PGFN Naval Command"
	// value = 3000
	// mission_limit = 1
	// faction = /datum/faction/pgf
	// setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/my_mech
	name = "Lucky #2"
	desc = "Слушай... Однажды, во время очередной межкорпоратской войны, меня занесло на мир-свалку. Наше подразделение было готово к высадке на фронт с минуты на минуту, однако приказа о высадке так и не последовало. Время шло, война уже подходила к концу, и по итоге мы с товарищами разлетелись по домам. Однако, спустя все эти годы, моя страсть к пилотированию мехов так и не угасла. Отправься на координаты, которые я тебе выдал, и проверь, на месте ли моя меха Lucky #2? Если она там, умоляю тебя, доставь её мне."
	// author = "Bernard Lytton"
	// value = 9000
	// mission_limit = 1
	// setpiece_item = /obj/structure/mecha_wreckage/gygax/dark

/datum/mission/ruin/dead_vanguard
	name = "Доставьте Павшего Авангардиста"
	desc = "InteQ потерял связь с заказчиком и авангардистом, который выполнял его задание. На данный момент силы ЧВК находятся на заданиях более приоритетных, чем возвращение тела одного из сотрудников, а потому InteQ готова выдать это поручение любому, кто горазд вернуть тело авангардиста. Его имя - Kavur."
	// faction = /datum/faction/inteq
	// value = 6000
	// setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/data_retrieval
	name = "Восстановление данных"
	desc = "Мы бы хотели, чтобы %MISSION_REQUIRED был получен с интересующего нас объекта."

/datum/mission/ruin/blackbox
	name = "Восстановление Чёрного Ящика"
	desc = "Связь с этим миром недавно была потеряна. Исследуйте объект, при необходимости вступайте в бой с противниками и добудьте %MISSION_REQUIRED, чтобы мы могли наметить дальнейший план действий."
