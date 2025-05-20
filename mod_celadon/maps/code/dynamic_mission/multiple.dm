/datum/mission/ruin/multiple/moonshine_crates
	name = "Retrieve Booze"
	desc = "Э-э-э... Собственно, мне нужен кто-то кто может достать выпивку, приобретённую у местного поставщика. Слетайте к ним и доставьте её сюда. Они говорили, что сами привезут её, но уже три недели прошло, а выпивка мне всё ещё нужна... Вечеринка у меня, понимаете?"
	author = "Guy Raelman"
	faction = /datum/faction/independent
	value = 1750
	mission_limit = 1
	setpiece_item = /obj/item/storage/bottles/moonshine/sealed
	specific_item = FALSE
	required_count = 3

/datum/mission/ruin/multiple/moonshine_crates/distillery
	name = "Assess and Retrieve Booze Supply"
	desc = "Один из главных поставщиков самогона для нашего магазина перестал подвозить заказы, а нам ведь что-то да нужно продавать! Найдите запечатанные коробки алкашки и доставьте их к нам."
	author = "Tallymere Party Store"
	mission_limit = 1
	value = 2500

/* Aurora wrote these */

/datum/mission/ruin/multiple/notes
	name = "recover research notes"
	desc = "Доброго времени суток. От лица Cybersun Biodynamics, мы разыскиваем подрядчика, готового вернуть исследовательские работы доктора Margret Kithin, которые находятся на бывшей оперативной базе, от которой не было вестей уже несколько лет. По последним данным, базу заняли пиратские группировки, которых состояние базы не волновало от слова совсем. Единственное, чего мы хотим - доставка утерянных документов их законному владельцу."
	faction = /datum/faction/syndicate/cybersun
	value = 8000
	mission_limit = 1
	setpiece_item = /obj/item/documents/syndicate/cybersun/biodynamics
	required_count = 2

/datum/mission/ruin/multiple/e11_stash
	name = "recover a stash of Eoehoma weapons"
	desc = "MМой добрый напарник нашёл документы Eoehoma, в которых сообщается о расположении предприятия по производству энергооружия. Мы щедро вознаградим того, который доставит нам 6 пушек с вышеупомянутого предприятия."
	faction = /datum/faction/independent
	value = 2750
	mission_limit = 1
	setpiece_item = /obj/item/gun/energy/e_gun/e11
	required_count = 6

// СМ. -> code/datums/ruins/whitesands.dm
// /datum/mission/ruin/multiple/e11_stash/can_turn_in(atom/movable/item_to_check)
// 	if(istype(item_to_check, /obj/item/gun))
// 		var/obj/item/gun/eoehoma_gun = item_to_check
// 		if(eoehoma_gun.manufacturer == MANUFACTURER_EOEHOMA)
// 			return TRUE
