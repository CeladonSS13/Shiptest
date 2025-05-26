//
//     5.56mm
//

//Коробки 5.56 , плюс стандартная коробка так как ее нету в основном коде

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45
	ammo_type = /obj/item/ammo_casing/a556_45
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/a856
	ammo_type = /obj/item/ammo_casing/a556_45/a856
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/m903
	ammo_type = /obj/item/ammo_casing/a556_45/m903
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/surplus
	ammo_type = /obj/item/ammo_casing/a556_45/surplus
	max_ammo = 15

/obj/item/storage/box/ammo/a556_box
	name = "ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556box_856"
/obj/item/storage/box/ammo/a556_box/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a556_box/a856
	name = "A856 ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556box"
/obj/item/storage/box/ammo/a556_box/a856/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/a856 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a556_box/m903
	name = "M903 ammo box (5.56x45mm)"
	desc = "A box of armour-piercing 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556_ap"
/obj/item/storage/box/ammo/a556_box/m903/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/m903 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a556_box/surplus
	name = "surplus ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556box_surplus"
/obj/item/storage/box/ammo/a556_box/surplus/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/surplus = 4)
	generate_items_inside(items_inside,src)

//
//     .308
//

//коробки патроны 308 калибра - на данный момент эндгейм патроны , огромный урон , огромное пробитие , высокая цена

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308
	ammo_type = /obj/item/ammo_casing/a308
	max_ammo = 10

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_sp
	ammo_type = /obj/item/ammo_casing/a308/a308_sp
	max_ammo = 10

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_brak
	ammo_type = /obj/item/ammo_casing/a308/a308_brak
	max_ammo = 10

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_ap
	ammo_type = /obj/item/ammo_casing/a308/a308_ap
	max_ammo = 10

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_rubber
	ammo_type = /obj/item/ammo_casing/a308/a308_rubber
	max_ammo = 10

/obj/item/storage/box/ammo/a308
	name = "Коробка патронов .308"
	desc = "Коробка стандартных патронов .308. Заводского качества, ещё в смазке."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "308_fmj"

/obj/item/storage/box/ammo/a308/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308 = 4)
	generate_items_inside(items_inside,src)

//Пули против мяса , минусовое пробитие , не должно пробивать даже минимальную броню , но огромный урон здоровью
/obj/item/storage/box/ammo/a308/a308_sp
	name = "Коробка патронов .308(Охотничий)"
	desc = "Пуля с мягкой оболочкой, эффективна против крупной дичи, но практически бесполезна даже против базовой брони"
	icon_state = "308_sp"

/obj/item/storage/box/ammo/a308/a308_sp/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_sp = 4)
	generate_items_inside(items_inside,src)

//Тупое название сурплус , будет брак или некачественное исполнение. Снижен урон , минимум пробития - не для продажи
/obj/item/storage/box/ammo/a308/a308_brak
	name = "Коробка бракованных патронов .308"
	desc = "Не слишком качественные патроны калибра .308, хуже заводских но все еще годны."
	icon_state = "a308_brak"

/obj/item/storage/box/ammo/a308/a308_brak/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_brak = 4)
	generate_items_inside(items_inside,src)


//Бронебойки , должны пробивать любую броню , но урон снижен
/obj/item/storage/box/ammo/a308/a308_ap
	name = "Коробка патронов .308(Бронебойный)"
	desc = "Бронебойные патроны с вольфрамовым наконечником, хороши против брони но наносят не так много повреждений."
	icon_state = "308_ap"

/obj/item/storage/box/ammo/a308/a308_ap/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_ap = 4)
	generate_items_inside(items_inside,src)

//Резина , минимум урона здоровью , средне стамине
/obj/item/storage/box/ammo/a308/a308_rubber
	name = "Коробка патронов .308(Резина)"
	desc = "Патроны с резиновой пулей, не смертельны но все еще наносят травмы."
	icon_state = "308_rub"

/obj/item/storage/box/ammo/a308/a308_rub/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/a308_rubber = 4)
	generate_items_inside(items_inside,src)
//
//     8x58
//

//Стандартные безгильзовые патроны калибра 8x58

/obj/item/ammo_box/magazine/ammo_stack/prefilled/caseless/a858
	ammo_type = /obj/item/ammo_casing/caseless/a858
	max_ammo = 10

/obj/item/storage/box/ammo/a858_ammo_box
	name = "Ammo box (8x58mm Caseless)"
	desc = "A box of standard 8x58mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a858box"

/obj/item/storage/box/ammo/a858_ammo_box/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/caseless/a858 = 4)
	generate_items_inside(items_inside,src)

//
//     410x76mm
//
/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/saiga_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/a410
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/slug
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/saiga_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/a410/a410_slug
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/flechette
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/saiga_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/a410/a410_flechette
	max_ammo = 15

/obj/item/storage/box/ammo/a410_ammo_box
	name = "Ammo box (410x76mm buckshot)"
	desc = "A box of buckshot 410x76mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/saiga_ammo.dmi'
	icon_state = "410box_buckshot"
/obj/item/storage/box/ammo/a410_ammo_box/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a410_ammo_box/slug
	name = "Ammo box (410x76mm slug)"
	desc = "A box of slug 410x76mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/saiga_ammo.dmi'
	icon_state = "410box_slug"
/obj/item/storage/box/ammo/a410_ammo_box/slug/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/slug = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a410_ammo_box/flechette
	name = "Ammo box (410x76mm flechette)"
	desc = "A box of flechette 410x76mm ammo."
	icon = 'mod_celadon/_storge_icons/icons/items/weapons/saiga_ammo.dmi'
	icon_state = "410box_flechette"
/obj/item/storage/box/ammo/a410_ammo_box/flechette/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/flechette = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a308/hunterspride
	icon = 'icons/obj/ammunition/ammo_boxes.dmi'

/obj/item/storage/box/ammo/a308/hp
	icon = 'icons/obj/ammunition/ammo_boxes.dmi'

/obj/item/storage/box/ammo/a308/ap
	icon = 'icons/obj/ammunition/ammo_boxes.dmi'
