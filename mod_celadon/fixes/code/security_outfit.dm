//Модуль для фикса сломанных оффовских security одежд.
//Путь до файла - code/modules/clothing/under/jobs/security.dm
//Путь до атласа оффов - /icons/mob/clothing/under/security.dmi

/obj/item/clothing/under/rank/security/officer/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/nt/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/detective/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/detective/grey/skirt
	roll_sleeves = FALSE

//Эта вещь сломана полностью и абсолютно и не фиксится никак
/obj/item/clothing/under/rank/security/brig_phys/nt
	icon_state = "security_medic"
	item_state = "rbrig_phys"
	mob_overlay_state = "security_medic"

//Тоже самое, что и выше
/obj/item/clothing/under/rank/security/brig_phys/nt/skirt
	icon_state = "security_medic_skirt"
	item_state = "rbrig_phys_skirt"
	roll_sleeves = FALSE
	mob_overlay_state = "security_medic_skirt"

/obj/item/clothing/under/rank/security/warden/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/warden/nt/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/head_of_security/nt/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/prisoner/skirt
	roll_down = TRUE

/obj/item/clothing/under/rank/prisoner/protected_custody/skirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/beatcop
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/blueshirt
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/mallcop
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/military
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/military/eng
	roll_sleeves = FALSE

/obj/item/clothing/under/rank/security/officer/camo
	roll_sleeves = FALSE


//Отдельный фикс конкретного предмета

/obj/item/clothing/under/utility/skirt
	roll_down = FALSE
