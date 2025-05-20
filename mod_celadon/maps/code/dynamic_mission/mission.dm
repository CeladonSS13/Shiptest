/datum/mission/ruin/lost_axe
	name = "Axe Retrieval"
	desc = "Я потерял одну очень ценную для меня вещь - топор. С этим топором, изготовленным Сибенальхской Гильдией, ещё мои деды ходили. Потерял я его во время того, как моё судно потерпело крушение. Меня-то спасли, а вот топор - нет. Прошу тебя, верни его мне."
	mission_limit = 1
	setpiece_item = /obj/item/melee/axe/fire

/datum/mission/ruin/fallen_montagne
	name = "dark signal investigation"
	desc = "Мы потеряли контакт с охотничьим угодьем, расположенным на ледяной планете. Скорее всего, на них напали пираты, а значит владелец угодья Монтаг уже не в мире живых. Верните нам его тело, дабы мы смогли его похоронить."
	value = 3000
	mission_limit = 1
	mission_reward = /obj/structure/fermenting_barrel/trickwine
	faction = /datum/faction/srm
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/daughter
	name = "find our daughter!"
	desc = "Нашу дочь несколько недель назад коммандировали на Фронтир. С того момента нам не пришло не единой весточки от неё. Никто, даже СолФед, не знает что с ней... Пожалуйста! Найдите её и скажите, всё ли с ней хорошо..."
	value = 4000
	mission_limit = 1
	author = "Concerned Parents"
	faction = /datum/faction/solgov
	mission_reward = /obj/item/gun/ballistic/automatic/smg/cm5/compact
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/nt_files
	name = "Discrete Asset Recovery"
	desc = "Короче, мне нужно вернуть одну папку. Вы не задаёте лишних вопросов, а я плачу вам обещанную сумму."
	value = 2500
	mission_limit = 1
	mission_reward = list(
		/obj/item/gun/energy/e_gun/old,
		/obj/item/gun/energy/laser/retro,
	)
	faction = /datum/faction/nt
	setpiece_item = /obj/item/documents/nanotrasen

/datum/mission/ruin/nt_files/generate_mission_details()
	. = ..()
	author = "Captain [random_species_name()]"

/datum/mission/ruin/icw_documents
	name = "Syndicate Battleplans Retrieval"
	desc = "Наша цель - сохранение истории периода Межкорпоративных Войн. Мы узнали о ещё одной крупице истории, которую требуется увековечить: Планы Боёв Синдиката. Наши источники сообщают, что планы находятся в пределах заданного объекта. Удостоверьтесь, там ли они, и доставьте их нам."
	faction = /datum/faction/syndicate/suns
	author = "HIS455 \"ICW-era Preservation\""
	mission_limit = 1
	setpiece_item = /obj/item/folder/documents/syndicate/red

/datum/mission/ruin/nanotrasen_docs
	name = "Nanotrasen Asset Recovery Program."
	author = "Nanotrasen Recovery Program"
	desc = "Мы потеряли контакт с перерабатывающим предприятием, находящимся в округе этого аванпоста. Нанойтрейзен заинтересована в возвращении ценных бумаг, распологающихся на этом предприятии."
	faction = list(
		/datum/faction/nt,
		/datum/faction/syndicate/cybersun
	)
	value = 3500
	mission_limit = 1
	setpiece_item = /obj/item/documents/nanotrasen

/datum/mission/ruin/nanotrasen_docs/generate_mission_details()
	. = ..()
	if(faction == /datum/faction/nt)
		name = "Nanotrasen Asset Recovery Program"
		author = "Nanotrasen Recovery Program"
		desc = "Корпорация Нанотрейзен потеряла контакт с перерабатывающим предприятием, находящимся в округе этого аванпоста. Нанойтрейзен заинтересована в возвращении ценных бумаг с этого предприятия."
	if(faction == /datum/faction/syndicate/cybersun)
		name = "Cybersun Capture Program"
		author = "Cybersun Virtual Solutions"
		desc = "Киберсан ВР крайне заинтересована в возвращении пакета документов, находящихся на объекте Нанойтрейзен, на который недавно напала клика Рамзи. Доставьте пакет документов нам, а мы не поскупимся с вознаграждением."

/datum/mission/ruin/captain_medal
	name = "Recover War Medal"
	desc = "Пару месяцев назад я потерял медаль \"За Отважную Службу\". К счастью, мне удалось отследить её. Находится она на планете в пределах этой системы, и я был бы крайне благодарен за её возвращение."
	faction = /datum/faction/nt
	value = 2250
	mission_limit = 1
	setpiece_item = /obj/item/clothing/accessory/medal/gold/captain

/datum/mission/ruin/brainchip
	name = "Nanotrasen Asset Recovery Program"
	author = "Nanotrasen Recovery Program"
	desc = "Ваша задача - вернуть имплант внутри одного незадачливого грузчика, у которого не хватило мозгов на то, что бы использовать его так, как было завещано контрактом."
	faction = /datum/faction/nt
	mission_limit = 1
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/bitch_wife
	name = "My Bitch Wife's Stupid Mothroach"
	desc = "Моя, блять, жена потеряла молетаракана, который скорее всего забрался на один из отлетающих шаттлов. С того момента она не прекращала верещать о том, как же он ей нужен, как она скучает о нём... Я заебался слушать эти сиренады. Ради бога, верните мне эту тварь. и ПОЖАЛУЙСТА верните её живой, а то она опять разорётся. "
	value = 3000
	mission_limit = 1
	setpiece_item = /mob/living/simple_animal/pet/mothroach

/datum/mission/ruin/ns_manager
	name = "Retrieve Manager For Interview"
	desc = "Ввиду поломки систем связи на одной из отдалённых шахтёрских баз, N+S Logistics не смогла провести инвентаризацию вышеупомянутого объекта. Отправьтесь на шахтёрскую базу и доставьте нам её менеджера, дабы мы узнали, с чего это он решил отказаться от ремонта систем связи."
	value = 3000
	mission_limit = 1
	faction = list(
		/datum/faction/nt/ns_logi,
	)
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/oh_fuck
	name = "Singularity Generator Signature"
	desc = "Мы засекли генератор сингулярности в данном квадрате системы. Вы даже не представляете, насколько это опасно. Мы готовы щедро вознаградить того, кто сможет найти и доставить эту вещицу. Боже... Мы боимся даже представить, какого масшатаба будет катастрофа в случае появления целой чёрной дыры в пределах нашей системы."
	author = "The Outpost"
	value = 15000
	mission_limit = 1
	setpiece_item = /obj/machinery/the_singularitygen

/datum/mission/ruin/pgf_captain
	name = "MIA Vessel Investigation"
	desc = "Мы начали получать сигналы от маячка бедствия, расположенном на одном из кораблей, пропавших без вести во время патруля. По мнению разведки, они были атакованы пиратами, так что шансы на выживание кого-то из членов экипажа близки к нулю. Найдите тело капитана судна и доставьте его нам ради предписанного вознаграждения."
	author = "PGFN Naval Command"
	value = 3000
	mission_limit = 1
	faction = /datum/faction/pgf
	setpiece_item = /mob/living/carbon/human

/datum/mission/ruin/my_mech
	name = "Lucky #2"
	desc = "Слушай... Когда межкорпоратские войны уже начинали подходить к концу, меня занесло на мир-свалку. Наше подразделение было готово к высадке на фронт по первому приказу начальства, однако приказа так и не последовало. Время шло, и в итоге все из нас разъехались по домам. Однако, спустя все эти года, мои порывы к пилотированию мехов до сих пор не угасли. Отправься на координаты, которые я тебе выдал, и проверь, на месте ли моя меха Lucky #2? Если она там, умоляю тебя, доставь её мне."
	author = "Bernard Lytton"
	value = 9000
	mission_limit = 1
	setpiece_item = /obj/structure/mecha_wreckage/gygax/dark

/datum/mission/ruin/dead_vanguard
	name = "Retrieve Fallen Vanguard"
	desc = "Inteq потеряла связь с одним из заказчиков и авангардистом, который его задание выполнял. Мы бы и своих людей туда отправили, да вот все либо заняты, либо недоступны. Inteq готова выдать это поручение любому, кто гораст вернуть тело нашего авангардиста. Его имя - Кавур."
	faction = /datum/faction/inteq
	value = 6000
	setpiece_item = /mob/living/carbon/human
