#define TIME_OFFSET GLOB.config.time_offset

// Добавляем год для игры
GLOBAL_VAR_INIT(game_year, (text2num(time2text(world.realtime, "YYYY")) + 554))

// Принимает значение в дицесекундах.
// Возвращает текстовое значение числа в формате День - часы:минуты:секунды (пример: 5 дней - 02:45:30).
/proc/DisplayTime2Text(time_value)
	var/negative = time_value < 0
	if(negative)
		time_value = -time_value
	var/second = FLOOR(time_value * 0.1, 1)
	if(second < 60)
		return "[negative? "-":""][second]"
	var/minute = FLOOR(second / 60, 1)
	second = zero(FLOOR(MODULUS(second, 60), 1))
	if(minute < 60)
		return "[negative? "-":""][minute]:[second]"
	var/hour = FLOOR(minute / 60, 1)
	minute = zero(MODULUS(minute, 60))
	if(hour < 24)
		return "[negative? "-":""][hour]:[minute]:[second]"
	var/day = FLOOR(hour / 24, 1)
	hour = zero(MODULUS(hour, 24))
	return "[negative? "-":""][day] [days2textRU(day)] - [hour]:[minute]:[second]"

/proc/zero(num)
	return num < 10 ? "0[num]" : "[num]"

/proc/days2textRU(day)
	switch(day)
		if(1)
			return "день"
		if(2 to 4)
			return "дня"
		else
			return "дней"
