/datum/mission/ruin/multiple/moonshine_crates
	name = "Доставьте Выпивку"
	desc = "Э-э-э... Собственно, мне нужен кто-то, кто может достать выпивку у местного поставщика. Слетайте к ним и привезите её сюда. Они говорили, что сами доставят её, но вот уже три недели прошло, а выпивка мне всё ещё нужна... Вечеринка у меня намечается, понимаете?"
	// author = "Guy Raelman"
	// faction = /datum/faction/independent
	// value = 1750
	// mission_limit = 1
	// setpiece_item = /obj/item/storage/bottles/moonshine/sealed
	// specific_item = FALSE
	// required_count = 3

/datum/mission/ruin/multiple/moonshine_crates/distillery
	name = "Найдите и Верните Поставку Алкоголя"
	desc = "Один из главных поставщиков самогона для нашего магазина перестал подвозить заказы, а нам ведь что-то да нужно продавать! Найдите запечатанные коробки алкашки и доставьте их к нам."
	// author = "Tallymere Party Store"
	// mission_limit = 1
	// value = 2500

/* Aurora wrote these */

/datum/mission/ruin/multiple/notes
	name = "Верните Исследовательские Работы"
	desc = "Доброго времени суток. Cybersun Biodynamics требуется подрядчик, готовый вернуть исследовательские работы доктора Margret Kithin. Работы распологаются на бывшей оперативной базе, от которой не было вестей уже несколько лет. По последним данным, базу заняли пиратские группировки, которые никак не заинтересованы в поддержании адекватного состояния базы. Единственное, чего мы хотим - доставка утерянных документов их законному владельцу."
	// faction = /datum/faction/syndicate/cybersun
	// value = 8000
	// mission_limit = 1
	// setpiece_item = /obj/item/documents/syndicate/cybersun/biodynamics
	// required_count = 2

/datum/mission/ruin/multiple/e11_stash
	name = "Доставьте Пачку Оружия 'Eoehoma'"
	desc = "Мой добрый напарник нашёл документы Eoehoma, в которых сообщается о месторасположении предприятия по производству энергооружия. Мы щедро вознаградим того, кто доставит нам 6 энергопушек с вышеупомянутого предприятия."
	// faction = /datum/faction/independent
	// value = 2750
	// mission_limit = 1
	// setpiece_item = /obj/item/gun/energy/e_gun/e11
	// required_count = 6

// СМ. -> code/datums/ruins/whitesands.dm
// /datum/mission/ruin/multiple/e11_stash/can_turn_in(atom/movable/item_to_check)
// 	if(istype(item_to_check, /obj/item/gun))
// 		var/obj/item/gun/eoehoma_gun = item_to_check
// 		if(eoehoma_gun.manufacturer == MANUFACTURER_EOEHOMA)
// 			return TRUE
