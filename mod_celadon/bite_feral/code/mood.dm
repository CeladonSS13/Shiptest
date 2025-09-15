//Некий марк цукерберг по какой то причине все регестрирывал в иницилизации, ну мне же лучше лол
//Еще он забыл сделать UnregisterSignal (если это конечно вобще надо хз)
/datum/component/mood/RegisterWithParent()
	RegisterSignal(parent, COMSIG_REQUEST_SANITY_LEVEL, PROC_REF(get_sanity_level))

/datum/component/mood/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_REQUEST_SANITY_LEVEL)
	
//Указатели просто имба
/datum/component/mood/proc/get_sanity_level(datum/source, output)
	SIGNAL_HANDLER
	*output = sanity_level

