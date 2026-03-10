// Пример создания касеты
// /obj/item/tape/random/preset/ruin/"название руины"/"название касеты"/Initialize() //если хочу положить на шип -> ship вместо ruin
//	. = ..()
//	storedinfo = list(
//		"\[00:00\] Recording started.", // запись всегда начинается с этого
//		"\[00:03\] scared human woman whispers \"Я слышу их, кажется они нашли меня...\"", // пример записи фраз
//		"\[00:06\] scared human woman кричит!", // пример записи эмоций
//		"\[00:07\] Глухие удары тупым предметом.", // пример описания звуков окружения
//	)
// Пояснение: \["время"\] "Прилагательное" "Раса" "Пол" "Действие (whispers, says, yells, etc) \"фраза.\""

//	timestamp = list(
//		0,
//		3,
//		6,
//		7
//	)
// ВАЖНО, В ЭТОМ БЛОКЕ! Если время записи более 1 минуты исчисление продолжается также в секундах т.е. 65, 94, 124 и так далее.

// Tape

/obj/item/tape/random/preset/lima/first/Initialize()
	. = ..()
	storedinfo = list(
		"\[00:00\] Recording started.",
		"\[00:03\] lithe human man says \"Так парни... запись пошла.\"",
		"\[00:05\] twitchy human woman questions \"Скажи честно, ты конченый?\"",
		"\[00:07\] lithe human man retorts \"Ну что ты опять начинаешь...\"",
		"\[00:08\] radical human man states \"Закрыли рот, оба.\"",
		"\[00:11\] twitchy human woman whispers \"Твои записи нас быстрее в могилу сведут.\"",
		"\[00:12\] radical human man вздыхает",
		"\[00:14\] radical human man yells \"Я не ясно выразился!? Мне повторить?\"",
		"\[00:19\] chaotic human man states \"Шеф, получен зашифрованный сигнал, источник примерно к западу от нас.\"",
		"\[00:23\] radical human man ask \"Я правильно понимаю, что ты имеешь ввиду астероидные поля?\"",
		"\[00:26\] chaotic human man doubts \"Эээ... так точно?\"",
		"\[00:28\] radical human man questions \"Как там с расшифровкой?\"",
		"\[00:30\] sleepy human woman зевает",
		"\[00:31\] sleepy human woman ask \"Неуже ли что-то интересное?\"",
		"\[00:34\] lithe human man insists \"Ставлю на то, что там огромная военная база. Полная зомби и Синдиката.\"",
		"\[00:38\] lithe human man confidently delivers \"Уже руки чешутся, чтобы вынести этот мусор!\"",
		"\[00:40\] twitchy human woman вздыхает",
		"\[00:41\] twitchy human woman comments \"Я говорила, что брать этого молокососа ужасная затея.\"",
		"\[00:43\] lithe human man retort \"Эй, я не молокосос!\"",
		"\[00:45\] chaotic human man doubts \"Шеееф... это сигнал сос... с объекта Лима.\"",
		"\[00:48\] lithe human man ask \"Объект Лима?\"",
		"\[00:49\] sleepy human woman insists \"Вырубай запись, шутки кончились.\"",
		"\[00:51\] lithe human man retorts \"Что но...\"",
		"\[00:52\] radical human man questions \"ВЫРУБИ!\"",
	)

	timestamp = list(
		0,
		3,
		5,
		7,
		8,
		11,
		12,
		14,
		19,
		23,
		26,
		28,
		30,
		31,
		34,
		38,
		40,
		41,
		43,
		45,
		48,
		49,
		51,
		52
	)
