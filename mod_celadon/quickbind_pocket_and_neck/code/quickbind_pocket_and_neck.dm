#define COMSIG_KB_HUMAN_QUICKEQUIP_LPOCKET_DOWN "keybinding_human_quickequip_lpocket_down"
#define COMSIG_KB_HUMAN_QUICKEQUIP_RPOCKET_DOWN "keybinding_human_quickequip_rpocket_down"
#define COMSIG_KB_HUMAN_QUICKEQUIP_NECK_DOWN "keybinding_human_quickequip_neck_down"

/datum/keybinding/human/quick_equip_belt/quick_equip_lpocket
	hotkey_keys = list("Unbound")
	name = "quick_equip_lpocket"
	full_name = "Quick left pocket"
	description = "Put held thing in left pocket or take the item from it"
	slot_type = ITEM_SLOT_LPOCKET
	slot_item_name = "lpocket"
	keybind_signal = COMSIG_KB_HUMAN_QUICKEQUIP_LPOCKET_DOWN

/datum/keybinding/human/quick_equip_belt/quick_equip_rpocket
	hotkey_keys = list("Unbound")
	name = "quick_equip_rpocket"
	full_name = "Quick right pocket"
	description = "Put held thing in right pocket or take the item from it"
	slot_type = ITEM_SLOT_RPOCKET
	slot_item_name = "rpocket"
	keybind_signal = COMSIG_KB_HUMAN_QUICKEQUIP_RPOCKET_DOWN

/datum/keybinding/human/quick_equip_belt/quick_equip_neck
	hotkey_keys = list("Unbound")
	name = "quick_equip_neck"
	full_name = "Quick neck"
	description = "Put held thing in neck or take the item from it"
	slot_type = ITEM_SLOT_NECK
	slot_item_name = "neck"
	keybind_signal = COMSIG_KB_HUMAN_QUICKEQUIP_NECK_DOWN
