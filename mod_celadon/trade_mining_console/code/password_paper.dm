/obj/item/paper/console_password
	name = "trade console access code"

/obj/item/paper/console_password/Initialize(mapload, password_text)
	. = ..()
	if(password_text)
		add_raw_text("<center><b>FRONTIER TRADE CONSOLE</b></center>")
		add_raw_text("<center>ACCESS CODE: <b>[password_text]</b></center>")
		update_appearance()
