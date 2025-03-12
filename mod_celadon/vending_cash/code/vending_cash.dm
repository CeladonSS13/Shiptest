// Определяем специальный счёт для вендинг-машин
/datum/bank_account/vending
	add_to_accounts = FALSE

/obj/machinery/vending/Initialize()
	. = ..()
	if(!all_items_free && !mining_point_vendor)
		bank_account = new /datum/bank_account/vending

// Обрабатываем ввод денег
/obj/machinery/vending/attackby(obj/item/I, mob/user, params)
	. = ..(I, user, params)

	if(istype(I, /obj/item/holochip))
		if(bank_account && !all_items_free && !mining_point_vendor)
			var/obj/item/holochip/chip = I
			bank_account.adjust_money(chip.credits)
			to_chat(user, "<span class='notice'>You insert [I] into [name].</span>")
			qdel(I)

	if(istype(I, /obj/item/spacecash))
		if(bank_account && !all_items_free && !mining_point_vendor)
			var/obj/item/spacecash/cash = I
			bank_account.adjust_money(cash.value)
			to_chat(user, "<span class='notice'>You insert [I] into [name].</span>")
			qdel(I)

// Добавляем UI данные
/obj/machinery/vending/ui_data(mob/user)
	. = ..()
	if(bank_account)
		.["current_amount"] = bank_account.account_balance

// Определяем какой файл UI использовать при взаимодействии
/obj/machinery/vending/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "VendingCeladon", name)
		ui.open()


// При уничтожении, вызываем Destroy() у аккаунта
/obj/machinery/vending/Destroy()
	. = ..()
	if(bank_account)
		bank_account.Destroy()
