/**
 * tgui state: portable_device_state
 * Основано на примере кода из "code\modules\tgui\states\inventory.dm"
 *
 * Checks that the src_object is in the user's inventory
 * and that the user is conscious. Allows UI interaction
 * for lying characters. Suitable for portable devices
 * like radios, PDAs, tablets, scanners, etc.
 *
 * Copyright (c) 2024 Mirag1993
 * SPDX-License-Identifier: MIT
 */

GLOBAL_DATUM_INIT(portable_device_state, /datum/ui_state/portable_device_state, new)

/datum/ui_state/portable_device_state/can_use_topic(src_object, mob/user)
	log_game("TGUI_DEBUG: portable_device_state check for [src_object] by [user?.ckey || "null"]")// [CELADON-ADD] - CELADON_DEBUG - Логируем
	if(!(src_object in user))
		log_game("TGUI_DEBUG: portable_device_state - object not in user inventory, returning UI_CLOSE")// [CELADON-ADD] - CELADON_DEBUG - Логируем
		return UI_CLOSE
	if(user.stat != CONSCIOUS)
		log_game("TGUI_DEBUG: portable_device_state - user not conscious (stat=[user.stat]), returning UI_CLOSE")// [CELADON-ADD] - CELADON_DEBUG - Логируем
		return UI_CLOSE
	log_game("TGUI_DEBUG: portable_device_state - allowing UI_INTERACTIVE")// [CELADON-ADD] - CELADON_DEBUG - Логируем
	return UI_INTERACTIVE
