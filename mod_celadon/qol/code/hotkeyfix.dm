/client/verb/fix_layout()
	set name = "Исправить раскладку"
	set category = "Special Verbs"

	set_macros()
	to_chat(src, span_warning("Перерегистрация макросов выполнена. Если не сработало, убедитесь что раскладка переключена на английский язык."))
