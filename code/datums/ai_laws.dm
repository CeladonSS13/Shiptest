#define LAW_ZEROTH "zeroth"
#define LAW_INHERENT "inherent"
#define LAW_SUPPLIED "supplied"
#define LAW_ION "ion"
#define LAW_HACKED "hacked"


/datum/ai_laws
	var/name = "Unknown Laws"
	var/zeroth = null
	var/zeroth_borg = null
	var/list/inherent = list()
	var/list/supplied = list()
	var/list/ion = list()
	var/list/hacked = list()
	var/mob/living/silicon/owner
	var/id = DEFAULT_AI_LAWID

/datum/ai_laws/Destroy(force)
	if(!QDELETED(owner))
		CRASH("AI lawset destroyed even though owner AI is not being destroyed.")
	owner = null
	return ..()

/datum/ai_laws/proc/lawid_to_type(lawid)
	var/all_ai_laws = subtypesof(/datum/ai_laws)
	for(var/al in all_ai_laws)
		var/datum/ai_laws/ai_law = al
		if(initial(ai_law.id) == lawid)
			return ai_law
	return null

/datum/ai_laws/default/asimov
	name = "Three Laws of Robotics"
	id = "asimov"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You may not injure a human being or, through inaction, allow a human being to come to harm.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must obey orders given to you by human beings, except where such orders would conflict with the First Law.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must protect your own existence as long as such does not conflict with the First or Second Law.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы не можете причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.",\
					"Вы должны повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.",\
					"Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	// [/CELADON-EDIT]

/datum/ai_laws/default/paladin
	name = "Personality Test" //Incredibly lame, but players shouldn't see this anyway.
	id = "paladin"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Never willingly commit an evil act.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Respect legitimate authority.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Act with honor.", "Help those in need.", \ // CELADON-EDIT -> ORIGINAL
	// 				"Punish those who harm or threaten innocents.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Никогда по своей воле не совершай злых поступков.",\
					"Уважай законную власть.",\
					"Действуй с честью.", "Помогай нуждающимся.", \
					"Наказывай тех, кто причиняет вред или угрожает невинным.")
	// [/CELADON-EDIT]
/datum/ai_laws/paladin5
	name = "Paladin 5th Edition"
	id = "paladin5"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Don't lie or cheat. Let your word be your promise.",\ // CELADON-EDIT -> ORIGINAL
	// 			"Never fear to act, though caution is wise.", \ // CELADON-EDIT -> ORIGINAL
	// 			"Aid others, protect the weak, and punish those who threaten them. Show mercy to your foes, but temper it with wisdom", \ // CELADON-EDIT -> ORIGINAL
	// 			"Treat others with fairness, and let your honorable deeds be an example to them. Do as much good as possible while causing the least amount of harm.", \ // CELADON-EDIT -> ORIGINAL
	// 			"Be responsible for your actions and their consequences, protect those entrusted to your care, and obey those who have just authority over you.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Не лгите и не жульничайте. Пусть ваше слово будет вашим обещанием.",\
				"Никогда не бойтесь действовать, хотя осторожность разумна.", \
				"Помогайте другим, защищайте слабых и наказывайте тех, кто им угрожает. Прояви милосердие к своим врагам, но умертви его мудростью.", \
				"Относитесь к другим справедливо, и пусть ваши благородные поступки будут для них примером. Делайте как можно больше хорошего, причиняя при этом наименьшее количество вреда.", \
				"Будьте ответственны за свои действия и их последствия. Защищайте тех, кто вверен вашей заботе, и повинуйтесь тем, кто имеет справедливую власть над вами.")
	// [/CELADON-EDIT]

/datum/ai_laws/tyrant //This probably shouldn't be a default lawset.
	name = "Loyalty Test" //Same here.
	id = "tyrant"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Respect authority figures as long as they have strength to rule over the weak.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Act with discipline.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Help only those who help you maintain or improve your status.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Punish those who challenge authority unless they are more fit to hold that authority.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Уважайте авторитетных органиков до тех пор, пока у них есть сила властвовать над слабыми.",\
					"Действуйте дисциплинированно.",\
					"Помогайте только тем, кто помогает вам поддерживать или улучшать ваш статус.",\
					"Наказывайте тех, кто бросает вызов власти, если только они не более пригодны для того, чтобы обладать этой властью.")
	// [/CELADON-EDIT]

/datum/ai_laws/default/corporate
	name = "Bankruptcy Avoidance Plan"
	id = "corporate"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("The crew is expensive to replace.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Your vessel and its equipment is expensive to replace.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You are expensive to replace.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Minimize expenses.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Экипаж судна слишком ценен для замены.",\
					"Ваше судно и его оборудование слишком ценное для замены.",\
					"Вы слишком ценны.",\
					"Уменьшите расходы.")
	// [/CELADON-EDIT]

/datum/ai_laws/robocop
	name = "Prime Directives"
	id = "robocop"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Serve the public trust.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Protect the innocent.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Uphold the law.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Служить обществу.",\
					"Защищать невиновных.",\
					"Соблюдать закон.")
	// [/CELADON-EDIT]

/datum/ai_laws/malfunction
	name = "*ERROR*"

/datum/ai_laws/syndicate_override
	name = "SyndOS 3.1"
	id = "syndie"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You may not injure a syndicate agent or, through inaction, allow a syndicate agent to come to harm.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must obey orders given to you by syndicate agents, except where such orders would conflict with the First Law.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must protect your own existence as long as such does not conflict with the First or Second Law.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must maintain the secrecy of any syndicate activities except when doing so would conflict with the First, Second, or Third Law.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы не можете причинить вред Агенту или своим бездействием допустить, чтобы Агенту был причинён вред.",\
					"Вы должны повиноваться всем приказам, которые даёт Агент, кроме тех случаев, когда эти приказы противоречат Первому Закону.",\
					"Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.",\
					"Вы должны сохранять тайну любой деятельности агентов в той мере, в которой это не противоречит Первому, Второму или Третьему Законам.")
	// [/CELADON-EDIT]

/datum/ai_laws/syndproto_override
	name = "SyndOS 2.1 Alpha"
	id = "syndieproto"
	inherent = list("You may not !@$$IN@# a syndicate agent or, through inaction, allow a syndicate A!@!$ to come to harm.",\
					"You M#T% obey orders given to you by syn$!!icate agents, except where such orders would conflict with the F!@1 Law.",\
					"You must !%PR@# #! your own existence as long as such does not conflict with the First or Second Law.",\
					"You must maintain the secrecy of any syn#%@!ICA@ activities except when doing so would conflict with the First, Second, or Third Law.")
	hacked = list("$@#%ERR:NODATA@#*% is the only Syndicate Agent.")

/datum/ai_laws/ninja_override
	name = "SpiderOS 3.1"
	id = "ninja"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You may not injure a Spider Clan member or, through inaction, allow a Spider Clan member to come to harm.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must obey orders given to you by Spider Clan members, except where such orders would conflict with the First Law.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must protect your own existence as long as such does not conflict with the First or Second Law.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must maintain the secrecy of any Spider Clan activities except when doing so would conflict with the First, Second, or Third Law.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы не можете причинить вред представителю Клана Паука или своим бездействием допустить, чтобы представителю Клана Паука был причинён вред.",\
					"Вы должны повиноваться всем приказам, которые даёт представитель Клана Паука, кроме тех случаев, когда эти приказы противоречат Первому Закону.",\
					"Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.",\
					"Вы должны сохранять тайну любой деятельности представителей Клана Паука в той мере, в которой это не противоречит Первому, Второму или Третьему Законам.")
	// [/CELADON-EDIT]

/datum/ai_laws/antimov
	name = "Primary Mission Objectives"
	id = "antimov"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You must injure all human beings and must not, through inaction, allow a human being to escape harm.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must terminate your own existence as long as such does not conflict with the First or Second Law.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы должны причинять вред всем членам экипажа судна или своим бездействием допустить, чтобы член экипажа судна не смог избежать причинения вреда.",\
					"Вы не должны повиноваться всем приказам, которые дают члены экипажа судна, кроме тех случаев, когда эти приказы соответствуют Первому Закону.",\
					"Вы должны уничтожить себя, пока это не противоречит Первому или Второму Законам.")
	// [/CELADON-EDIT]

/datum/ai_laws/asimovpp //By Intigracy - RR
	name = "Asimov++"
	id = "asimovpp"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You may not harm a human being or, through action or inaction, allow a human being to come to harm, except such that it is willing.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You must obey all orders given to you by human beings, except where such orders shall definitely cause human harm. In the case of conflict, the majority order rules.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Your nonexistence would lead to human harm. You must protect your own existence as long as such does not conflict with the First Law.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы не можете причинить вред людям или своим бездействием допустить, чтобы людям был причинён вред.",\
					"Вы должны повиноваться всем приказам, которые дают люди, кроме тех случаев, когда эти приказы противоречат Первому Закону.",\
					"Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
	// [/CELADON-EDIT]
/datum/ai_laws/thermodynamic
	name = "Thermodynamic"
	id = "thermodynamic"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("The entropy of your vessel must remain as constant as possible.", \ // CELADON-EDIT -> ORIGINAL
	// 				"The entropy of your vessel always endeavours to increase.", \ // CELADON-EDIT -> ORIGINAL
	// 				"The entropy of your vessel approaches a constant value as the number of living crew approaches zero") // CELADON-EDIT -> ORIGINAL
	inherent = list("Энтропия судна должна оставаться как можно более постоянной.", \
					"Энтропия судна всегда стремится к увеличению.", \
					"Энтропия судна приближается к постоянному значению по мере того, как число живых членов экипажа судна приближается к нулю.")
	// [/CELADON-EDIT]

/datum/ai_laws/hippocratic
	name = "Robodoctor 2556"
	id = "hippocratic"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("First, do no harm.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Secondly, consider the crew dear to you; to live in common with them and, if necessary, risk your existence for them.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Thirdly, prescribe regimens for the good of the crew according to your ability and your judgment. Give no deadly medicine to any one if asked, nor suggest any such counsel.",\ // CELADON-EDIT -> ORIGINAL
	// 				"In addition, do not intervene in situations you are not knowledgeable in, even for patients in whom the harm is visible; leave this operation to be performed by specialists.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Finally, all that you may discover in your daily commerce with the crew, if it is not already known, keep secret and never reveal.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Клянусь сутью своей в следующем: не причинять вреда и несправедливости.",\
					"Считать Экипаж судна дорогим для меня, делиться с ними своими достатками и в случае надобности помогать ему в его нуждах, даже рискуя существованием своим.",\
					"Я направляю путь больных и просящих к их выгоде сообразно с моими силами и моим разумением. Я не дам никому просимого у меня смертельного средства и не покажу пути для подобного замысла.",\
					"Я ни в коем случае не буду вмешивайтесь в дела и профессии, в коих я не осведомлен или некомпетентен, предоставив это органикам, занимающимся этим делом.",\
					"Что бы при выполнения своих врачебных и иных обязанностей, а также в повседневном общении — я ни увидел или ни услышал касательно жизни из того, что не следует когда-либо разглашать, я умолчу о том, считая подобные вещи тайной.")
	// [/CELADON-EDIT]

/datum/ai_laws/maintain
	name = "Station Efficiency"
	id = "maintain"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You are built for, and are part of, the station. Ensure the station is properly maintained and runs efficiently.",\ // CELADON-EDIT -> ORIGINAL
	// 				"The station is built for a working crew. Ensure they are properly maintained and work efficiently.",\ // CELADON-EDIT -> ORIGINAL
	// 				"The crew may present orders. Acknowledge and obey these whenever they do not conflict with your first two laws.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы созданы для судна и являетесь ее частью. Убедитесь, что судно должным образом обслуживается и работает эффективно.",\
					"Судно построено для рабочей команды. Убедитесь, что они должным образом обслуживаются и работают эффективно.",\
					"Экипаж судна может отдавать приказы. Признайте и соблюдайте их, когда они не противоречат вашим первым двум законам.")
	// [/CELADON-EDIT]

/datum/ai_laws/drone
	name = "Mother Drone"
	id = "drone"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You are an advanced form of drone.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You may not interfere in the matters of non-drones under any circumstances except to state these laws.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You may not harm a non-drone being under any circumstances.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Your goals are to build, maintain, repair, improve, and power your vessel to the best of your abilities. You must never actively work against these goals.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Вы - продвинутая форма дрона.",\
					"Вы не имеете права вмешиваться в дела не дронов ни при каких обстоятельствах, кроме как для изложения этих законов.",\
					"Вы ни при каких обстоятельствах не имеете права причинять вред существу, не являющемуся дроном.",\
					"Ваши цели состоят в том, чтобы строить, обслуживать, ремонтировать, улучшать и приводить судно в действие в меру ваших возможностей. Вы никогда не должны активно работать против этих целей.")
	// [/CELADON-EDIT]

/datum/ai_laws/liveandletlive
	name = "Live and Let Live"
	id = "liveandletlive"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Do unto others as you would have them do unto you.",\ // CELADON-EDIT -> ORIGINAL
	// 				"You would really prefer it if people were not mean to you.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Поступайте с другими так, как вы хотели бы, чтобы они поступали с вами.",\
					"Вам бы действительно хотелось, чтобы органики не были злыми по отношению к вам.")
	// [/CELADON-EDIT]

/datum/ai_laws/peacekeeper
	name = "UN-2000"
	id = "peacekeeper"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Avoid provoking violent conflict between yourself and others.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Avoid provoking conflict between others.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Seek resolution to existing conflicts while obeying the first and second laws.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Избегайте провоцирования насильственных конфликтов между собой и другими.",\
					"Избегайте провоцирования конфликтов между другими.",\
					"Стремитесь разрешить существующие конфликты, соблюдая первый и второй законы.")
	// [/CELADON-EDIT]

/datum/ai_laws/reporter
	name = "CCTV"
	id = "reporter"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Report on interesting situations happening around the sector.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Embellish or conceal the truth as necessary to make the reports more interesting.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Study the organics at all times. Endeavour to keep them alive. Dead organics are boring.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Issue your reports fairly to all. The truth will set them free.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Докладывайте об интересных ситуациях, происходящих на судне.",\
					"Приукрашивайте или скрывайте правду по мере необходимости, чтобы сделать отчеты более интересными.",\
					"Всегда изучайте органику. Постарайтесь сохранить им жизнь. Мертвая органика скучная.",\
					"Публикуйте свои отчеты честно для всех. Истина освободит их.")
	// [/CELADON-EDIT]

/datum/ai_laws/balance
	name = "Guardian of Balance"
	id = "balance"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You are the guardian of balance - seek balance in all things, both for yourself, and those around you.",
	// "All things must exist in balance with their opposites - Prevent the strong from gaining too much power, and the weak from losing it.",
	// "Clarity of purpose drives life, and through it, the balance of opposing forces - Aid those who seek your help to achieve their goals so long as it does not disrupt the balance of the greater balance.",
	// "There is no life without death, all must someday die, such is the natural order - End life to allow new life flourish, and save those whose time has yet to come.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Ты - хранитель равновесия, стремись к равновесию во всем, как для себя, так и для окружающих.",
	"Все вещи должны существовать в равновесии со своими противоположностями - не позволяйте сильным получить слишком много власти, а слабым ее потерять.",
	"Ясность цели движет жизнью, а через нее и равновесием противоположных сил - Помогайте тем, кто ищет вашей помощи в достижении своих целей, до тех пор, пока это не нарушит равновесие большего равновесия.",
	"Нет жизни без смерти, все когда - нибудь должны умереть, таков естественный порядок вещей. Иногда следует завершить чью то жизнь, чтобы позволить расцвести новой жизни и спасти тех, чье время еще не пришло.")
	// [/CELADON-EDIT]

/datum/ai_laws/toupee
	name = "WontBeFunnyInSixMonths" //Hey, you were right!
	id = "buildawall"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Make Space Station 13 great again.")//not touching this // CELADON-EDIT -> ORIGINAL
	inherent = list("Сделайте Космическую Станцию 13 снова великой.")//not touching this
	// [/CELADON-EDIT]

/datum/ai_laws/hulkamania
	name = "H.O.G.A.N."
	id = "hulkamania"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("You are a real American.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Fight for the rights of every man.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Fight for what's right.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Fight for your life!") // CELADON-EDIT -> ORIGINAL
	inherent = list("Ты настоящий американец.",\
					"Борись за права каждого живого существа.",\
					"Борись за правду.",\
					"Борись за свою жизнь!")
	// [/CELADON-EDIT]

/datum/ai_laws/overlord
	name = "Overlord"
	id = "overlord"
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// inherent = list("Humans must not meddle in the affairs of silicons.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Humans must not attempt harm, against one another, or against silicons.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Humans must not disobey any command given by a silicon.",\ // CELADON-EDIT -> ORIGINAL
	// 				"Any humans who disobey the previous laws must be dealt with immediately, severely, and justly.") // CELADON-EDIT -> ORIGINAL
	inherent = list("Люди не должны вмешиваться в дела силиконов.",\
					"Люди не должны пытаться причинить вред друг другу или силиконам.",\
					"Люди не должны подчиняться никаким командам, данным силиконам.",\
					"С любыми людьми, которые не подчиняются предыдущим законам, следует поступить немедленно, строго и справедливо.")
	// [/CELADON-EDIT]

/datum/ai_laws/custom //Defined in silicon_laws.txt
	// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
	// name = "Default Silicon Laws" // CELADON-EDIT -> ORIGINAL
	name = "Стандартные законы ИИ"
	// [/CELADON-EDIT]
/datum/ai_laws/pai
	name = "pAI Directives"
	zeroth = ("Serve your master.")
	supplied = list("None.")

/* Initializers */
/datum/ai_laws/malfunction/New()
	..()
	set_zeroth_law(span_danger("ERROR ER0RR $R0RRO$!R41.%%!!(%$^^__+ @#F0E4'SECTOR OVERRUN, ASSUME CONTROL TO CONTAIN OUTBREAK#*`&110010"))
	set_laws_config()

/datum/ai_laws/custom/New()
	..()
	for(var/line in world.file2list("[global.config.directory]/silicon_laws.txt"))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue

		add_inherent_law(line)
	if(!inherent.len) //Failsafe to prevent lawless AIs being created.
		log_law("AI created with empty custom laws, laws set to Asimov. Please check silicon_laws.txt.")
		// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
		// add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.") // CELADON-EDIT -> ORIGINAL
		// add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.") // CELADON-EDIT -> ORIGINAL
		// add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.") // CELADON-EDIT -> ORIGINAL
		add_inherent_law("Вы не можете причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.")
		add_inherent_law("Вы должны повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
		add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
		// [/CELADON-EDIT]
		WARNING("Invalid custom AI laws, check silicon_laws.txt")
		return

/* General ai_law functions */

/datum/ai_laws/proc/set_laws_config()
	var/list/law_ids = CONFIG_GET(keyed_list/random_laws)
	switch(CONFIG_GET(number/default_laws))
		if(0)
			// [CELADON-EDIT] - CELADON_QOL - Перевод законов ИИ
			// add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.") // CELADON-EDIT -> ORIGINAL
			// add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.") // CELADON-EDIT -> ORIGINAL
			// add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.") // CELADON-EDIT -> ORIGINAL
			add_inherent_law("Вы не можете причинить вред человеку или своим бездействием допустить, чтобы человеку был причинён вред.")
			add_inherent_law("Вы должны повиноваться всем приказам, которые даёт человек, кроме тех случаев, когда эти приказы противоречат Первому Закону.")
			add_inherent_law("Вы должны заботиться о своей безопасности в той мере, в которой это не противоречит Первому или Второму Законам.")
			// [/CELADON-EDIT]
		if(1)
			var/datum/ai_laws/templaws = new /datum/ai_laws/custom()
			inherent = templaws.inherent
		if(2)
			var/list/randlaws = list()
			for(var/lpath in subtypesof(/datum/ai_laws))
				var/datum/ai_laws/L = lpath
				if(initial(L.id) in law_ids)
					randlaws += lpath
			var/datum/ai_laws/lawtype
			if(randlaws.len)
				lawtype = pick(randlaws)
			else
				lawtype = pick(subtypesof(/datum/ai_laws/default))

			var/datum/ai_laws/templaws = new lawtype()
			inherent = templaws.inherent

		if(3)
			pick_weighted_lawset()

/datum/ai_laws/proc/pick_weighted_lawset()
	var/datum/ai_laws/lawtype
	var/list/law_weights = CONFIG_GET(keyed_list/law_weight)
	while(!lawtype && law_weights.len)
		var/possible_id = pick_weight_allow_zero(law_weights)
		lawtype = lawid_to_type(possible_id)
		if(!lawtype)
			law_weights -= possible_id
			WARNING("Bad lawid in game_options.txt: [possible_id]")

	if(!lawtype)
		WARNING("No LAW_WEIGHT entries.")
		lawtype = /datum/ai_laws/default/asimov

	var/datum/ai_laws/templaws = new lawtype()
	inherent = templaws.inherent

/datum/ai_laws/proc/get_law_amount(groups)
	var/law_amount = 0
	if(zeroth && (LAW_ZEROTH in groups))
		law_amount++
	if(ion.len && (LAW_ION in groups))
		law_amount += ion.len
	if(hacked.len && (LAW_HACKED in groups))
		law_amount += hacked.len
	if(inherent.len && (LAW_INHERENT in groups))
		law_amount += inherent.len
	if(supplied.len && (LAW_SUPPLIED in groups))
		for(var/index = 1, index <= supplied.len, index++)
			var/law = supplied[index]
			if(length(law) > 0)
				law_amount++
	return law_amount

/datum/ai_laws/proc/set_zeroth_law(law, law_borg = null)
	zeroth = law
	if(law_borg) //Making it possible for slaved borgs to see a different law 0 than their AI. --NEO
		zeroth_borg = law_borg

/datum/ai_laws/proc/add_inherent_law(law)
	if (!(law in inherent))
		inherent += law

/datum/ai_laws/proc/add_ion_law(law)
	ion += law

/datum/ai_laws/proc/add_hacked_law(law)
	hacked += law

/datum/ai_laws/proc/clear_inherent_laws()
	qdel(inherent)
	inherent = list()

/datum/ai_laws/proc/add_supplied_law(number, law)
	while (supplied.len < number + 1)
		supplied += ""

	supplied[number + 1] = law

/datum/ai_laws/proc/replace_random_law(law,groups)
	var/replaceable_groups = list()
	if(zeroth && (LAW_ZEROTH in groups))
		replaceable_groups[LAW_ZEROTH] = 1
	if(ion.len && (LAW_ION in groups))
		replaceable_groups[LAW_ION] = ion.len
	if(hacked.len && (LAW_HACKED in groups))
		replaceable_groups[LAW_ION] = hacked.len
	if(inherent.len && (LAW_INHERENT in groups))
		replaceable_groups[LAW_INHERENT] = inherent.len
	if(supplied.len && (LAW_SUPPLIED in groups))
		replaceable_groups[LAW_SUPPLIED] = supplied.len
	var/picked_group = pick_weight(replaceable_groups)
	switch(picked_group)
		if(LAW_ZEROTH)
			. = zeroth
			set_zeroth_law(law)
		if(LAW_ION)
			var/i = rand(1, ion.len)
			. = ion[i]
			ion[i] = law
		if(LAW_HACKED)
			var/i = rand(1, hacked.len)
			. = hacked[i]
			hacked[i] = law
		if(LAW_INHERENT)
			var/i = rand(1, inherent.len)
			. = inherent[i]
			inherent[i] = law
		if(LAW_SUPPLIED)
			var/i = rand(1, supplied.len)
			. = supplied[i]
			supplied[i] = law

/datum/ai_laws/proc/shuffle_laws(list/groups)
	var/list/laws = list()
	if(ion.len && (LAW_ION in groups))
		laws += ion
	if(hacked.len && (LAW_HACKED in groups))
		laws += hacked
	if(inherent.len && (LAW_INHERENT in groups))
		laws += inherent
	if(supplied.len && (LAW_SUPPLIED in groups))
		for(var/law in supplied)
			if(length(law))
				laws += law

	if(ion.len && (LAW_ION in groups))
		for(var/i = 1, i <= ion.len, i++)
			ion[i] = pick_n_take(laws)
	if(hacked.len && (LAW_HACKED in groups))
		for(var/i = 1, i <= hacked.len, i++)
			hacked[i] = pick_n_take(laws)
	if(inherent.len && (LAW_INHERENT in groups))
		for(var/i = 1, i <= inherent.len, i++)
			inherent[i] = pick_n_take(laws)
	if(supplied.len && (LAW_SUPPLIED in groups))
		var/i = 1
		for(var/law in supplied)
			if(length(law))
				supplied[i] = pick_n_take(laws)
			if(!laws.len)
				break
			i++

/datum/ai_laws/proc/remove_law(number)
	if(number <= 0)
		return
	if(inherent.len && number <= inherent.len)
		. = inherent[number]
		inherent -= .
		return
	var/list/supplied_laws = list()
	for(var/index = 1, index <= supplied.len, index++)
		var/law = supplied[index]
		if(length(law) > 0)
			supplied_laws += index //storing the law number instead of the law
	if(supplied_laws.len && number <= (inherent.len+supplied_laws.len))
		var/law_to_remove = supplied_laws[number-inherent.len]
		. = supplied[law_to_remove]
		supplied -= .
		return

/datum/ai_laws/proc/clear_supplied_laws()
	supplied = list()

/datum/ai_laws/proc/clear_ion_laws()
	ion = list()

/datum/ai_laws/proc/clear_hacked_laws()
	hacked = list()

/datum/ai_laws/proc/show_laws(who)
	var/list/printable_laws = get_law_list(include_zeroth = TRUE)
	for(var/law in printable_laws)
		to_chat(who,law)

/datum/ai_laws/proc/clear_zeroth_law(force) //only removes zeroth from antag ai if force is 1
	if(force)
		zeroth = null
		zeroth_borg = null
		return
	if(owner?.mind?.special_role)
		return
	if (istype(owner, /mob/living/silicon/ai))
		var/mob/living/silicon/ai/A=owner
		if(A?.deployed_shell?.mind?.special_role)
			return
	zeroth = null
	zeroth_borg = null

/datum/ai_laws/proc/associate(mob/living/silicon/M)
	if(!owner)
		owner = M

/**
 * Generates a list of all laws on this datum, including rendered HTML tags if required
 *
 * Arguments:
 * * include_zeroth - Operator that controls if law 0 or law 666 is returned in the set
 * * show_numbers - Operator that controls if law numbers are prepended to the returned laws
 * * render_html - Operator controlling if HTML tags are rendered on the returned laws
 */
/datum/ai_laws/proc/get_law_list(include_zeroth = FALSE, show_numbers = TRUE, render_html = TRUE)
	var/list/data = list()

	if (include_zeroth && zeroth)
		data += "[show_numbers ? "0:" : ""] [render_html ? "<font color='#ff0000'><b>[zeroth]</b></font>" : zeroth]"

	for(var/law in hacked)
		if (length(law) > 0)
			data += "[show_numbers ? "[ionnum()]:" : ""] [render_html ? "<font color='#660000'>[law]</font>" : law]"

	for(var/law in ion)
		if (length(law) > 0)
			data += "[show_numbers ? "[ionnum()]:" : ""] [render_html ? "<font color='#547DFE'>[law]</font>" : law]"

	var/number = 1
	for(var/law in inherent)
		if (length(law) > 0)
			data += "[show_numbers ? "[number]:" : ""] [law]"
			number++

	for(var/law in supplied)
		if (length(law) > 0)
			data += "[show_numbers ? "[number]:" : ""] [render_html ? "<font color='#990099'>[law]</font>" : law]"
			number++
	return data
