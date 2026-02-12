SUBSYSTEM_DEF(missions)
	name = "Missions"
	flags = SS_NO_INIT|SS_NO_FIRE
	priority = FIRE_PRIORITY_MISSIONS
	wait = 10 SECONDS

// should probably come up with a better solution for this
// hierarchical weighting? would need to distinguish between "real" and "fake" missions
/datum/controller/subsystem/missions/proc/get_weighted_mission_type()
	var/static/list/weighted_missions
	if(!weighted_missions)
		weighted_missions = list()
		var/list/mission_types = subtypesof(/datum/mission)
		for(var/datum/mission/mis_type as anything in mission_types)
			if(!(mis_type::acceptable))
				continue
			if(mis_type::weight > 0)
				weighted_missions[mis_type] = mis_type::weight
	return pickweight_float(weighted_missions)

/datum/controller/subsystem/missions/proc/get_researcher_name()
	var/group = pick(list(
		"Киберсан: Биодайнемикс",
		"Киберсан: Виртуальные Решения",
		"Управление расследований фронтира CLIP-GOLD",
		"Управление освоения фронтира CLIP-LAND",
		"Исследовательское подразделение Нанотрейзен на Фронтире",
		"Разведовательный корпус N+S",
		"Союз студенческих объединений NS-V естественных наук Солнечной Федерации",
		"Центральное исследовательское агенство Солнечной Федерации",
		"Бюро экспансии NGR",
		"Промышленное бюро NGR",
		"Гезенанский ведущий новостей",
		"Представители PGFN",
		"Тецетианские исследователи",
		"Представитель гильдии рахнидов",
		"Таинственный запрос с аванпоста от Сарати"
	))
	return group
