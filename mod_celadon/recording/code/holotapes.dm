// Пример создания голо-диска
// /datum/preset_holoimage/"название модели"
// 	outfit_type = /datum/outfit/job/cel/pirate/ramzi/captain "тут указывается путь оутфита"

// /obj/item/disk/holodisk/ruin/"название руины"/"название диска" //если хочу положить на шип -> ship вместо ruin
// 	name = "название диска"
// 	desc = "описание диска"
// 	preset_image_type = /datum/preset_holoimage/battlemaster "сюда указывается модель, которая будет произносить записаный текст"
// 	preset_record_text = {"
// 	NAME Имя Отображаемой Модели
// 	SAY Текст который будет проигрываться моделью.
// 	DELAY 75 "задержка между фразами"
// 	SAY Текст который будет проигрываться моделью.
// 	DELAY 75
// 	"}

//Holoimage

/datum/preset_holoimage/operator_ramzi
	outfit_type = /datum/outfit/ramzi/sniper

//Holotapes

/obj/item/disk/holodisk/ruin/lima/request
	name = "Battle Group Request"
	desc = "A holodisk containing an request for help fot the battle group."
	preset_image_type = /datum/preset_holoimage/operator_ramzi
	preset_record_text = {"
	NAME Crimson Operator 27-16
	DELAY 40
	SAY Мы потеряли связь с группой разведки в вашем секторе. Текущий статус группы MIA. На ее последнее местоположение отправлена оперативная группа.
	DELAY 95
	SAY По имеющейся информации развед группой был получен сигнал. Он исходит из структуры замаскированной под астероид. Любые попытки связи с объектом оборачиваются неудачей.
	DELAY 105
	SAY Вашей целью является поддержка оперативной группы, и по возможности поиск разведведчиков или того, что от них осталось.
	DELAY 50
	SAY Конец связи.
	DELAY 20
	"}
