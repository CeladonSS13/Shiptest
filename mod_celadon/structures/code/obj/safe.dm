/obj/item/storage/secure/safe/lab
	name = "Secure safe"
	desc = "Внизу видна нашкрябанная надпись: <i>Не совершай ошибок.</i>"

/obj/item/storage/secure/safe/lab/Initialize()
	. = ..()
	new /obj/item/radio/old(src)
	new /obj/item/pizzabox/bomb{bomb_defused = 0;bomb_timer = 3}(src)
	new /obj/item/spacecash/bundle/c1000(src)
	new /obj/item/clothing/accessory/medal/gold{desc = "За успешный эксперимент в 2570г."}(src)
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_SET_LOCKSTATE, TRUE)
	SEND_SIGNAL(src, COMSIG_TRY_STORAGE_HIDE_FROM, usr)
