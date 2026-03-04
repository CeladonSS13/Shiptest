/* MARK: = Ammo List =
[*] - отсутствуют.
[-] - отключены.

> 5.56x45mm
> .308
> 8x58
> 410x76mm
Resprite
> .308
> 5.56x42
> 7.62x40
MARK: 5.56x45
*/

//Коробки 5.56x45mm, плюс стандартная коробка так как ее нету в основном коде

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
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'
	icon_state = "a556_45box_big"
/obj/item/storage/box/ammo/a556_box/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a556_box/a856
	name = "ammo box (5.56x45mm EP)"
	desc = "A box of 5.56x45mm enhanced-performance ammo."
	icon_state = "a556_45box_big-ep"
/obj/item/storage/box/ammo/a556_box/a856/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/a856 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a556_box/m903
	name = "ammo box (5.56x45mm AP)"
	desc = "A box of 5.56x45mm armour-piercing ammo."
	icon_state = "a556_45box_big-ap"
/obj/item/storage/box/ammo/a556_box/m903/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/m903 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a556_box/surplus
	name = "surplus ammo box (5.56x45mm)"
	desc = "A box of standard 5.56x45mm ammo."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo.dmi'
	icon_state = "a556box_surplus"
/obj/item/storage/box/ammo/a556_box/surplus/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a556_45/surplus = 4)
	generate_items_inside(items_inside,src)

//
// MARK: .308
//

//коробки патроны 308 калибра - на данный момент эндгейм патроны , огромный урон , огромное пробитие , высокая цена

//Резина , минимум урона здоровью , средне стамине
/obj/item/storage/box/ammo/a308/rubber
	name = "box of rubber .308 ammo"
	icon_state = "a308box-rubbershot"

/obj/item/storage/box/ammo/a308/rubber/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/rubber = 4)
	generate_items_inside(items_inside,src)

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/rubber
	ammo_type = /obj/item/ammo_casing/a308/rubber
	max_ammo = 10

//Тупое название сурплус , будет брак или некачественное исполнение. Снижен урон , минимум пробития - не для продажи
/obj/item/storage/box/ammo/a308/surplus
	name = "Коробка бракованных патронов .308"
	desc = "Не очень качественные патроны калибра .308, хуже заводских но все еще годны."
	icon_state = "a308_brak"

/obj/item/storage/box/ammo/a308/surplus/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/surplus = 4)
	generate_items_inside(items_inside,src)

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a308/surplus
	ammo_type = /obj/item/ammo_casing/a308/surplus
	max_ammo = 10


//
// MARK: 410x76
//

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/a410
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/slug
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/a410/a410_slug
	max_ammo = 15

/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/flechette
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/a410/a410_flechette
	max_ammo = 15

/obj/item/storage/box/ammo/a410_ammo_box
	name = "Ammo box (410x76mm buckshot)"
	desc = "A box of buckshot 410x76mm ammo."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_ammo.dmi'
	icon_state = "410box_buckshot"
/obj/item/storage/box/ammo/a410_ammo_box/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410 = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a410_ammo_box/slug
	name = "Ammo box (410x76mm slug)"
	desc = "A box of slug 410x76mm ammo."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_ammo.dmi'
	icon_state = "410box_slug"
/obj/item/storage/box/ammo/a410_ammo_box/slug/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/slug = 4)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/ammo/a410_ammo_box/flechette
	name = "Ammo box (410x76mm flechette)"
	desc = "A box of flechette 410x76mm ammo."
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/saiga_ammo.dmi'
	icon_state = "410box_flechette"
/obj/item/storage/box/ammo/a410_ammo_box/flechette/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/a410/flechette = 4)
	generate_items_inside(items_inside,src)

// MARK: 7.62X54mm R
//
//     7.62x54mmR
//
/obj/item/ammo_box/magazine/ammo_stack/prefilled/x762_54
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/svd_bullet.dmi'
	ammo_type = /obj/item/ammo_casing/x762_54
	max_ammo = 10

/obj/item/storage/box/ammo/x762_54
	name = "box of 7.62x54mmR ammo"
	desc = "A box of standard 7.62x54mmR ammo."
	icon_state = "x762_54box"
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'

/obj/item/storage/box/ammo/x762_54/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/x762_54 = 4)
	generate_items_inside(items_inside,src)

// MARK: RESPRITE






// MARK: .308

/obj/item/storage/box/ammo/a308
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'
	icon_state = "a308box-HP"

/obj/item/storage/box/ammo/a308/hunterspride
	icon_state = "a308box"

/obj/item/storage/box/ammo/a308/hp
	icon_state = "a308box-hp"

/obj/item/storage/box/ammo/a308/ap
	icon_state = "a308box-ap"

// MARK: 5.56x42

/obj/item/storage/box/ammo/a556_42
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'
	icon_state = "a556_42box_big"

/obj/item/storage/box/ammo/a556_box/a856
	icon_state = "a556_45box_big-up"

/obj/item/storage/box/ammo/a556_box/m903
	icon_state = "a556_45box_big-ap"

// MARK: 7.62x40

/obj/item/storage/box/ammo/a762_40
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'

/obj/item/storage/box/ammo/a762_40/inteq
	icon_state = "a762_40box_big_inteq"

/obj/item/storage/box/ammo/a762_40/ap/inteq
	icon_state = "a762_40box_big-ap_inteq"

/obj/item/storage/box/ammo/a762_40/hp/inteq
	icon_state = "a762_40box_big-hp_inteq"

/obj/item/storage/box/ammo/a762_40/rubber/inteq
	icon_state = "a762_40box_big-rubbershot_inteq"

/obj/item/ammo_box/magazine/m57_39_sidewinder
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo.dmi'

// MARK: 4.6x30

/obj/item/storage/box/ammo/c46x30mm
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'

/obj/item/storage/box/ammo/c46x30mm/tesla
	name = "box of 4.6x30mm tesla ammo"
	desc = "A box of standard 4.6x30mm tesla ammo."
	icon_state = "46x30mmbox-tesla"

/obj/item/storage/box/ammo/c46x30mm/tesla/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/ammo_stack/prefilled/c46x30mm/tesla = 4)
	generate_items_inside(items_inside,src)

// MARK: 9x18mm

//why are they not subpaths to c9mm
/obj/item/storage/box/ammo/c9mm
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'

/obj/item/storage/box/ammo/c9mm_ap
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'

/obj/item/storage/box/ammo/c9mm_hp
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'

/obj/item/storage/box/ammo/c9mm_rubber
	icon = 'mod_celadon/_storage_icons/icons/items/weapons/ammo/ammo_boxes.dmi'
