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
	if(!(src_object in user))
		return UI_CLOSE
	if(user.stat != CONSCIOUS)
		return UI_CLOSE
	return UI_INTERACTIVE
