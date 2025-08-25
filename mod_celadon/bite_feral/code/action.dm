/datum/action/item_action/toggeble
	name = "Переключаемое"
	var/icon_state_on = "default"
	var/background_state_on = "bg_default_on"
	button_icon_state = "default" //And this is the state for the action ic
	background_icon_state = ACTION_BUTTON_DEFAULT_BACKGROUND //And this is the state for the background icon
	var/state = FALSE

/datum/action/item_action/toggeble/proc/icon_update() //Пара style
	if(state)
		button_icon_state = icon_state_on
		background_icon_state = background_state_on
	else
		button_icon_state = initial(button_icon_state)
		background_icon_state = initial(background_icon_state)
	UpdateButtonIcon()
//Стиль проков с c#

/datum/action/item_action/toggeble/proc/OnAct()

/datum/action/item_action/toggeble/proc/OffAct()

/datum/action/item_action/toggeble/proc/Switch()
	state = !state
	icon_update()
	if(state)
		OnAct()
	else
		OffAct()

/datum/action/item_action/toggeble/proc/SetState(swith = FALSE)
	if(state == swith)
		return
	Switch()
		
/datum/action/item_action/toggeble/Trigger()
	if(!..())
		return FALSE
	Switch()

/datum/action/item_action/toggeble/organ_action/IsAvailable()
	var/obj/item/organ/I = target
	if(!I.owner)
		return 0
	return ..()



