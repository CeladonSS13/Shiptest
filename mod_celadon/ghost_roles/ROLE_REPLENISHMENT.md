# Система восполнения ролей аванпоста

## Описание

Новая система позволяет автоматически восстанавливать спавнеры ghost ролей после того, как игрок покидает роль через криокапсулу или специальное взаимодействие с кроватью.

## Как это работает

1. **Игрок берет роль** - спавнер исчезает, создается криокапсула/кровать
2. **Игрок наигрался** - заходит в криокапсулу или взаимодействует с кроватью бомжа
3. **Система проверяет** - если `replenish_role = TRUE`, то создается новый спавнер
4. **Слот освобожден** - другие игроки могут взять эту роль

## Настройка для новых ролей

### Для ролей с криокапсулами:

```dm
/obj/effect/mob_spawn/human/my_role
    name = "My Role"
    replenish_role = TRUE  // Включить восполнение (по умолчанию FALSE)
    // ... другие параметры

/obj/effect/mob_spawn/human/my_role/Destroy()
    var/obj/machinery/cryopod/outpost/my_role/new_cryopod = new(drop_location())
    if(replenish_role)
        new_cryopod.linked_spawner_type = type
    return ..()
```

### Для ролей с кроватями:

```dm
/obj/effect/mob_spawn/human/my_bed_role
    name = "My Bed Role"
    replenish_role = TRUE
    // ... другие параметры

/obj/effect/mob_spawn/human/my_bed_role/Destroy()
    var/obj/structure/bed/outpost/my_role/new_bed = new(drop_location())
    if(replenish_role)
        new_bed.linked_spawner_type = type
    return ..()
```

## Текущие роли с восполнением

Все роли аванпоста имеют `replenish_role = TRUE`:
- Cook (Повар)
- Bartender (Бармен) 
- Maid (Горничная)
- Artist (Артист)
- Medic (Медик)
- Wagabond (Бродяга) - использует специальное взаимодействие с кроватью

## Взаимодействие с игроком

### Криокапсулы
- Игрок заходит в криокапсулу как обычно
- При despawn автоматически проверяется возможность восполнения

### Кровать бомжа
- Игрок кликает по кровати
- Появляется диалог: "Do you want to leave your role and return to ghost?"
- При подтверждении роль освобождается и может быть восполнена

## Безопасность

- Система работает только с ghost ролями (проверка `!mob_occupant.mind?.original_ship`)
- Восполнение происходит только если `replenish_role = TRUE`
- Проверяется соответствие роли перед освобождением слота