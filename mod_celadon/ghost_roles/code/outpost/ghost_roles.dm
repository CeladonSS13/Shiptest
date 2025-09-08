/obj/effect/mob_spawn/human/elysium_outpost
	death = FALSE
	roundstart = FALSE
	random = FALSE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "cryopod"
	// mob_species = /datum/species/human
	/// Whether this role should be replenished when player leaves via cryopod
	var/replenish_role = TRUE
	/// Reference to the cryopod that will handle respawning
	var/datum/weakref/linked_cryopod

// Cook

/obj/effect/mob_spawn/human/elysium_outpost/cook
	name = "Outpost Cook"
	id_job = "Cook"
	faction = FACTION_ELYSIUM
	// short_desc = "You are a cook of Elysium."
	assignedrole = "Outpost Cook of Elysium"
	outfit = /datum/outfit/outpost/cook
	important_info = "Не покидайте свой аванпост без разрешения администрации, кроме тех случаев, когда вас силой забрали! Вы являетесь гражданином республики Элизиум и ваш долг проявить свою гражданскую позицию!"
	short_desc = "Готовьте еду, выращивайте растения, держите в чистоту свою кухню, разговаривайте с посетителями, поднимайте настроение им своей стряпнёй."
	flavour_text = "Готовьте, растите различную еду. Вы должны обеспечить аванпост едой, свежими фруктами и овощами. Вам разрешается применять CQC только на территории кухни и центрального бара. Вы также являетесь гражданином республики Элизиум, и поэтому без весомой причины покидать аванпост вы не можете. Если же вас с силой заставили это сделать - выживайте, применяйте силу только для обороны, и надейтесь, что кто-то сможет вам помочь. Не мешайте другим игрокам и обслуживающему персоналу аванпоста. Вы можете работать вместе, контактировать с капитанами и членами команд на аванпосту."

/obj/effect/mob_spawn/human/elysium_outpost/cook/Destroy()
	new /obj/machinery/cryopod/outpost/cook(drop_location())
	return ..()

// /obj/effect/mob_spawn/human/elysium_outpost/cook/special(mob/living/new_spawn)
// 	new_spawn.fully_replace_character_name(null, random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_outpost/cook/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Динамик в криокапсуле запиликал, извещая о том, что сон закончился, пора вставать на работу \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

// Bartender

/obj/effect/mob_spawn/human/elysium_outpost/bartender
	name = "Elysium Outpost Bartender"
	id_job = "Bartender"
	faction = FACTION_ELYSIUM
	// short_desc = "You are a bartender of Elysium."
	assignedrole = "Outpost Bartender of Elysium"
	outfit = /datum/outfit/outpost/bartender
	important_info = "Не покидайте свой аванпост без разрешения администрации, кроме тех случаев, когда вас силой забрали! Вы являетесь гражданином республики Элизиум и ваш долг проявить свою гражданскую позицию!"
	short_desc = "Разливайте пиво, готовьте бахус самым отпетым капитанам, наводите порядок в своем баре, разговаривайте с поваром, если он есть, рассказывайте басни и слушайте истории капитанов."
	flavour_text = "Вы главный разливщик напитков и коктелей на этом ледяном куске камня в космосе. Ваш бар - ваша территория. Можете зарабатывать продажей напитков, а можете предлагать всем свои зеленые листочки. Вам разрешено применять силу в виде двух дробовиков к особо буйным посетителям, не понимают с первого слова - поймут после заряда дроби. Не мешайте другим игрокам и обслуживающему персоналу аванпоста. Вы можете работать вместе, контактировать с капитанами и членами команд на аванпосту."

/obj/effect/mob_spawn/human/elysium_outpost/bartender/Destroy()
	new /obj/machinery/cryopod/outpost/bartender(drop_location())
	return ..()

// /obj/effect/mob_spawn/human/elysium_outpost/bartender/special(mob/living/new_spawn)
// 	new_spawn.fully_replace_character_name(null, random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_outpost/bartender/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Динамик в криокапсуле запиликал, извещая о том, что сон закончился, пора вставать на работу \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

// Maid - Janitor

/obj/effect/mob_spawn/human/elysium_outpost/maid
	name = "Elysium Outpost Maid"
	id_job = "Maid"
	faction = FACTION_ELYSIUM
	// short_desc = "You are a maid of Elysium."
	assignedrole = "Outpost Maid of Elysium"
	outfit = /datum/outfit/outpost/maid
	important_info = "Не покидайте свой аванпост без разрешения администрации, кроме тех случаев, когда вас силой забрали! Вы являетесь гражданином республики Элизиум и ваш долг проявить свою гражданскую позицию!"
	short_desc = "Убирайте мусор, чистите полы, заигрывайте с посетителями, выносите мусор, вносите позитив своим откровенным нарядом."
	flavour_text = "Вы горничная и по совместительству уборщица аванпоста. Ваша главная цель, поддерживать чистоту на аванпосту, в перерывах зависая на подиуме в баре. Если вас обидели, обратитесь к бармену или повару, эти ребята быстро поставят на место хулиганов! Не мешайте другим игрокам и обслуживающему персоналу аванпоста. Вы можете работать вместе, контактировать с капитанами и членами команд на аванпосту."

/obj/effect/mob_spawn/human/elysium_outpost/maid/Destroy()
	new /obj/machinery/cryopod/outpost/maid(drop_location())
	return ..()

// /obj/effect/mob_spawn/human/elysium_outpost/maid/special(mob/living/new_spawn)
// 	new_spawn.fully_replace_character_name(null, random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_outpost/maid/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Динамик в криокапсуле запиликал, извещая о том, что сон закончился, пора вставать на работу \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

// Artist

/obj/effect/mob_spawn/human/elysium_outpost/artist
	name = "Elysium Outpost Artist"
	id_job = "Artist"
	faction = FACTION_ELYSIUM
	// short_desc = "You are a artist of Elysium."
	assignedrole = "Outpost Artist of Elysium"
	outfit = /datum/outfit/outpost/artist
	important_info = "Не покидайте свой аванпост без разрешения администрации, кроме тех случаев, когда вас силой забрали! Вы являетесь гражданином республики Элизиум и ваш долг проявить свою гражданскую позицию!"
	short_desc = "Вы известный артист (ну или вы так думаете)! И ваша основная цель это веселить народ вокруг Вас! Устраивайте шоу, расказывайте анекдоты, делайте на этом деньги!"
	flavour_text = "В прошлом вы были клоуном, но сейчас настали другие времена и ваш талант, ваши заслуги признали и сделали из вас артиста, путешествующего по разынм уголках космоса! Не мешайте другим игрокам и обслуживающему персоналу аванпоста. Вы можете работать вместе, контактировать с капитанами и членами команд на аванпосту."

/obj/effect/mob_spawn/human/elysium_outpost/artist/Destroy()
	new /obj/machinery/cryopod/outpost/artist(drop_location())
	return ..()

// /obj/effect/mob_spawn/human/elysium_outpost/artist/special(mob/living/new_spawn)
// 	new_spawn.fully_replace_character_name(null, random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_outpost/artist/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Динамик в криокапсуле заиграл весёлой музыкой, извещая о том, что сон закончился, пора вставать на работу и веселить народ, \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

// Wagabond - он же бомж

/obj/effect/mob_spawn/human/elysium_outpost/wagabond
	name = "Wagabond"
	id_job = "Wagabond"
	icon = 'icons/obj/objects.dmi'
	icon_state = "dirty_mattress"
	faction = FACTION_ELYSIUM
	// short_desc = "You are a artist of Elysium."
	assignedrole = "Wagabond"
	outfit = /datum/outfit/outpost/wagabond
	important_info = "Внимание! Данная роль является пока что сырой! У вас пока нету цели конкретной, придумайте сами или попросите администрацию."
	short_desc = "Вы бродяга. Ищите еду, пытайтесь выжить на этом куске металла в космосе, погрузитесь в мир нищеты (халявной еды и пива в бесплатных автоматах)!"
	flavour_text = "Вы бродяга. Только вы сами знаете как вы стали им, было ли это подставой или быть может не оплатили ипотеку на судно? никто не скажет уже точно, главное одно, надо как-то прожить очередной день..."
	replenish_role = FALSE

/obj/effect/mob_spawn/human/elysium_outpost/wagabond/Destroy()
	new /obj/structure/bed/outpost/wagabond(drop_location())
	return ..()

// /obj/effect/mob_spawn/human/elysium_outpost/wagabond/special(mob/living/new_spawn)
// 	new_spawn.fully_replace_character_name(null, random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_outpost/wagabond/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Вы просыпаетесь под собачий холод и запаха тухлых носков. Ваше сознание смутно припоминает, то кем вы были раньше, но вы точно помните что вас зовут \the [A.name]. Пора прожить ещё один жалкий день в этом аду...", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)

// Medic

/obj/effect/mob_spawn/human/elysium_outpost/medic
	name = "Elysium Outpost Medic"
	id_job = "Medic"
	faction = FACTION_ELYSIUM
	assignedrole = "Outpost Medic of Elysium"
	outfit = /datum/outfit/outpost/medic
	important_info = "Не покидайте свой аванпост без разрешения администрации, кроме тех случаев, когда вас силой забрали! Вы являетесь гражданином республики Элизиум и ваш долг проявить свою гражданскую позицию!"
	short_desc = "Лечите больных, оказывайте помощь в операциях, вырезайте тайно органы, для дальнейшей перепродажи на черном рынке."
	flavour_text = "Вы доктор, и по совместительству хирург, гробовщик, как повезет. Вы явно проснулись для того чтобы лечить пациентов. Вы также можете попросить СМО или администрацию аванпоста, чтобы вам выдали доступ к химии и или генетике, но у Вас должна быть хорошая причина для этого."

/obj/effect/mob_spawn/human/elysium_outpost/medic/Destroy()
	new /obj/machinery/cryopod/outpost/medic(drop_location())
	return ..()

// /obj/effect/mob_spawn/human/elysium_outpost/medic/special(mob/living/new_spawn)
// 	new_spawn.fully_replace_character_name(null, random_unique_name(gender))

/obj/effect/mob_spawn/human/elysium_outpost/medic/Initialize()
	. = ..()
	var/area/A = get_area(src)
	if(A)
		notify_ghosts("Вас вызывают, доктор \the [A.name].", source = src, action=NOTIFY_ATTACK, flashwindow = FALSE)
