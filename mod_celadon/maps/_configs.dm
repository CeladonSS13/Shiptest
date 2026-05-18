/datum/modpack/configs
	name = "Configs and maps"
	desc = "Добавляет наши суда и карты в игру, создан файл для добавления сабшатлов."

	author = "Molniz, MrCat15352, Overteh, MysticalFaceLesS, Mirag1993"


/datum/modpack/configs/pre_initialize() /// Требуется сделать так, чтобы это работало при обновлении датумов руинок. Вынеся потом в модпак их
	. = ..()

/datum/modpack/configs/initialize() /// Если эти три конструкции не нужны, просто удалите их!
	. = ..()

/datum/modpack/configs/post_initialize()
	. = ..()
