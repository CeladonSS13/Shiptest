//
//     5.56mm
//

//Коробки 5.56 , плюс стандартная коробка так как ее нету в основном коде

/obj/item/ammo_box/a556_box
	name = "ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/ammo/ammo.dmi'
	icon_state = "a556box_856"
	ammo_type = /obj/item/ammo_casing/a556_45
	max_ammo = 50

/obj/item/ammo_box/a556_box/a856
	name = "A856 ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/ammo/ammo.dmi'
	icon_state = "a556box"
	ammo_type = /obj/item/ammo_casing/a556_45/a856
	max_ammo = 50

/obj/item/ammo_box/a556_box/m903
	name = "M903 ammo box (5.56x45mm)"
	desc = "A box of armour-piercing 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/ammo/ammo.dmi'
	icon_state = "a556_ap"
	ammo_type = /obj/item/ammo_casing/a556_45/m903
	max_ammo = 50

/obj/item/ammo_box/a556_box/surplus
	name = "surplus ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/ammo/ammo.dmi'
	icon_state = "a556box_surplus"
	ammo_type = /obj/item/ammo_casing/a556_45/surplus
	max_ammo = 50

//
//     .308
//

//коробки патроны 308 калибра - на данный момент эндгейм патроны , огромный урон , огромное пробитие , высокая цена

/obj/item/ammo_box/a308
	name = "Коробка патронов .308"
	desc = "Коробка стандартных патронов .308 . Заводского качества, еще в смазке."
	icon = 'mod_celadon/_storge_icons/icons/ammo/ammo.dmi'
	icon_state = "308_fmj"
	ammo_type = /obj/item/ammo_casing/a308
	max_ammo = 30

//Пули против мяса , минусовое пробитие , не должно пробивать даже минимальную броню , но огромный урон здоровью
/obj/item/ammo_box/a308/a308_sp
	name = "Коробка патронов .308(Охотничий)"
	desc = "Пуля с мягкой оболочкой , эффективна против крупной дичи , но практически бесполезна даже против базовой брони"
	icon_state = "308_sp"
	ammo_type = /obj/item/ammo_casing/a308/a308_sp

//Тупое название сурплус , будет брак или некачественное исполнение. Снижен урон , минимум пробития - не для продажи
/obj/item/ammo_box/a308/a308_brak
	name = "Коробка бракованных патронов .308"
	desc = "Не слишком качественные патроны калибра .308 , хуже заводских но все еще годны."
	icon_state = "a308_brak"
	ammo_type = /obj/item/ammo_casing/a308/a308_brak
	max_ammo = 50

//Бронебойки , должны пробивать любую броню , но урон снижен
/obj/item/ammo_box/a308/a308_ap
	name = "Коробка патронов .308(Бронебойный)"
	desc = "Бронебойные патроны с вольфрамовым наконечником , хороши против брони но наносят не так много повреждений."
	icon_state = "308_ap"
	ammo_type = /obj/item/ammo_casing/a308/a308_ap

//Резина , минимум урона здоровью , средне стамине
/obj/item/ammo_box/a308/a308_rubber
	name = "Коробка патронов .308(Резина)"
	desc = "Патроны с резиновой пулей , не смертельны но все еще наносят травмы."
	icon_state = "308_rub"
	ammo_type = /obj/item/ammo_casing/a308/a308_rubber

//
//     8x58
//

//Стандартные безгильзовые патроны калибра 8x58
/obj/item/ammo_box/a858_ammo_box
	name = "Ammo box (8x58mm Caseless)"
	desc = "A box of standard 8x58mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/ammo/ammo.dmi'
	icon_state = "a858box"
	ammo_type = /obj/item/ammo_casing/caseless/a858
	max_ammo = 50

//
//     410x76mm
//
/obj/item/ammo_box/a410_ammo_box
	name = "Ammo box (410x76mm buckshot)"
	desc = "Дробь он же бакшот 8 металлических шаров, сняражённых в патрон, урон большой по целям в малой броне и без брони, при средних и больших показателях брони урон ниже. В коробке 75 пуль."
	icon = 'mod_celadon/_storge_icons/icons/weapons/obj/saiga_ammo.dmi'
	icon_state = "410box_buckshot"
	ammo_type = /obj/item/ammo_casing/a410
	max_ammo = 75

/obj/item/ammo_box/a410_slug_ammo_box
	name = "Ammo box (410x76mm slug)"
	desc = "Жакан - пулевой патрон - slug, повышенный урон по не бронированным целям и немного пониженный по целям в броне. В коробке 65 пуль."
	icon = 'mod_celadon/_storge_icons/icons/weapons/obj/saiga_ammo.dmi'
	icon_state = "410box_slug"
	ammo_type = /obj/item/ammo_casing/a410/a410_slug
	max_ammo = 65

/obj/item/ammo_box/a410_flechette_ammo_box
	name = "Ammo box (410x76mm flechette)"
	desc = "Флешшет - дротик с повышенной пробиваемостью из-за своей формы, но меньшим уроном, чем пулевой патрон. В коробке 55 пуль."
	icon = 'mod_celadon/_storge_icons/icons/weapons/obj/saiga_ammo.dmi'
	icon_state = "410box_flechette"
	ammo_type = /obj/item/ammo_casing/a410/a410_flechette
	max_ammo = 55

