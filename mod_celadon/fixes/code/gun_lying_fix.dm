// Убирает флаг AB_CHECK_LYING из проверок действия прицеливания, исправляя баг с невозможностью встать после выстрела мини-арбалетом лежа.
/datum/action/toggle_scope_zoom
	check_flags = AB_CHECK_CONSCIOUS | AB_CHECK_HANDS_BLOCKED | AB_CHECK_IMMOBILE
