/datum/modpack/example
	name = "Discord System"
	desc = "Система для интеграции с Discord, которая позволяет отправлять сообщения в определенные каналы при наступлении определенных событий в игре. "
	author = "Voiko"

// Инициализация ДО
/datum/modpack/example/pre_initialize()
	. = ..()

// Инициализация ВОВРЕМЯ
/datum/modpack/example/initialize()
	. = ..()

// Инициализация ПОСЛЕ
/datum/modpack/example/post_initialize()
	. = ..()
