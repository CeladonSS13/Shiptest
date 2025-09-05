// Пример использования системы восполнения ролей аванпоста
// Example usage of outpost role replenishment system

/*
Чтобы включить восполнение роли для спавнера ghost роли:

1. Установите replenish_role = TRUE в определении спавнера
2. Убедитесь, что в методе Destroy() создается соответствующая криокапсула/кровать
3. Передайте тип спавнера в linked_spawner_type новой криокапсулы/кровати

Пример:

/obj/effect/mob_spawn/human/my_custom_role
	name = "My Custom Role"
	replenish_role = TRUE  // Включить восполнение
	// ... другие параметры роли

/obj/effect/mob_spawn/human/my_custom_role/Destroy()
	var/obj/machinery/cryopod/outpost/my_role/new_cryopod = new(drop_location())
	if(replenish_role)
		new_cryopod.linked_spawner_type = type  // Связать с типом спавнера
	return ..()

Когда игрок войдет в криокапсулу и будет удален из игры,
система автоматически создаст новый спавнер на том же месте.

По умолчанию replenish_role = FALSE, поэтому роли не будут восполняться
если это явно не включено.
*/