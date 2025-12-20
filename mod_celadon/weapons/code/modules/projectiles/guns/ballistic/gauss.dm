// Добавил поддержку батареек НТ
/obj/item/gun/ballistic/automatic/powered
	allowed_cell_types = list(
		/obj/item/stock_parts/cell/gun,
		/obj/item/stock_parts/cell/gun/upgraded,
		/obj/item/stock_parts/cell/gun/empty,
		/obj/item/stock_parts/cell/gun/upgraded/empty,
		/obj/item/stock_parts/cell/gun/sharplite,
		/obj/item/stock_parts/cell/gun/sharplite/plus,
		/obj/item/stock_parts/cell/gun/sharplite/empty,
		/obj/item/stock_parts/cell/gun/sharplite/plus/empty
	)
// https://github.com/CeladonSS13/Shiptest/pull/1703
// code\modules\projectiles\guns\powered.dm есть изменения
/obj/item/gun/ballistic/automatic/powered/AltClick(mob/living/user)
	if(!internal_magazine && loc == user && user.is_holding(src) && cell && tac_reloads && !(gun_firemodes[firemode_index] == FIREMODE_UNDERBARREL))
		if(do_after(user, 3.5 SECONDS, src, hidden = TRUE))
			eject_cell(user)

NO_MAG_GUN_HELPER(automatic/powered/gauss/gar)
NO_MAG_GUN_HELPER(automatic/powered/gauss/gar/suns)
NO_MAG_GUN_HELPER(automatic/powered/gauss)


