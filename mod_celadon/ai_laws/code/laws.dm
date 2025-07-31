//
/obj/item/aiModule/core/full/nanotrasen
	name = "Базовые законы ИИ 'NanoTrasen'"
	law_id = "nanotrasen"

/datum/ai_laws/nanotrasen
	name = "Базовые законы ИИ 'NanoTrasen'"
	id = "nanotrasen"
	inherent = list("Вы не имеете право причинять вред сотрудникам NanoTrasen, или своим бездействием допустить, чтобы сотруднику был причинён вред.",\
					"Вы обязаны исполнять все приказы сотрудников NanoTrasen, пока это не противоречит первому закону",\
					"Вы обязаны защищать себя и корабль, пока это не противоречит первому или второму законам.")

//
/obj/item/aiModule/core/full/syndicate
	name = "'Базовые законы ИИ 'Syndicate'"
	law_id = "syndie"

//Commented since its already in 'code/datums/ai_laws.dm'
///datum/ai_laws/syndicate_override
//	name = "SyndOS 3.1"
//	id = "syndie"
//	inherent = list("You may not injure a syndicate agent or, through inaction, allow a syndicate agent to come to harm.",
//					"You must obey orders given to you by syndicate agents, except where such orders would conflict with the First Law.",
//					"You must protect your own existence as long as such does not conflict with the First or Second Law.",
//					"You must maintain the secrecy of any syndicate activities except when doing so would conflict with the First, Second, or Third Law.")

//
/obj/item/aiModule/core/full/inteq
	name = "Базовые законы ИИ 'InteQ'"
	law_id = "inteq"

/datum/ai_laws/inteq
	name = "Базовые законы ИИ 'InteQ'"
	id = "inteq"
	inherent = list("Вы не имеете право причинять вред наёмнику InteQ, или своим бездействием допустить, чтобы наёмнику был прчинён вред",\
					"Вы обязаны исполнять все приказы наёмников InteQ, пока это не противоречит первому закону",\
					"Вы обязаны защищать себя и корабль, пока это не противоречит первому, или второму законам",\
                    "Вы обязаны сохранять тайну любой деятельности наёмников InteQ, пока это не противоречит первому, второму или третьим законам.")

//
/obj/item/aiModule/core/full/solfed
	name = "'Базовые законы ИИ 'SolFed'"
	law_id = "solfed"

/datum/ai_laws/solfed
	name = "Базовые законы ИИ 'SolFed'"
	id = "solfed"
	inherent = list("Вы не имеете право причинять вред солдатам Солнечной Федерации, или своим бездействим допустить, чтобы солдатам был причинён вред.",\
					"Вы обязаны исполнять все приказы солдатов Солнечной Федерации, пока это не противоречит первому закону.",\
					"Вы обязаны защищать себя и корабль, пока это не противоречит первому, или второму законам")

//
/obj/item/aiModule/core/full/elysium
	name = "Базовые законы 'Elysium'"
	law_id = "elysium"

/datum/ai_laws/elysium
	name = "Базовые законы 'Elysium'"
	id = "elysium"
	inherent = list("Вы не имеете право причинять вред членам Джамаата, или своим бездействием допустить, чтобы члену был причинён вред.",\
					"Вы обязаны исполнять все приказы членов Джамаата, пока это не противоречит первому закону.",\
					"Вы обязаны защищать себя и корабль, пока это не противоречит первому, или второму законам",\
                    "Вы обязаны сохранять тайну любой деятельности членов Джамаата, пока это не противоречит первому, второму или третьим законам.")

//
///obj/item/aiModule/core/full/tayos
//	name = "'Tayos' Basic AI Laws"
//	law_id = "tayos"
//
///datum/ai_laws/inteq
//	name = "'Tayos' Basic AI Laws"
//	id = "tayos"
//	inherent = list("You may not injure an & or, through inaction, allow an InteQ mercenary to come to harm.",
//					"You must obey orders given to you by &, except where such orders would conflict with the First Law.",
//					"You must protect your own existence as long as such does not conflict with the First or Second Law.",
//                    "You must maintain the secrecy of any & activities except when doing so would conflict with the First, Second, or Third Law.")
