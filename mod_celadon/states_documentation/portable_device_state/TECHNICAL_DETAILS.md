# Технические детали

## Код состояния

```dm
GLOBAL_DATUM_INIT(portable_device_state, /datum/ui_state/portable_device_state, new)

/datum/ui_state/portable_device_state/can_use_topic(src_object, mob/user)
	if(!(src_object in user))
		return UI_CLOSE
	if(user.stat != CONSCIOUS)
		return UI_CLOSE
	return UI_INTERACTIVE
```

## Логика проверок

1. **Инвентарь**: `!(src_object in user)` - предмет должен быть у пользователя
2. **Сознание**: `user.stat != CONSCIOUS` - пользователь должен быть в сознании
3. **Результат**: `UI_INTERACTIVE` - разрешить взаимодействие

## Сравнение состояний

| Состояние | Инвентарь | Сознание | Лежачее |
|-----------|-----------|----------|---------|
| `inventory_state` | Да | Да | Нет |
| `conscious_state` | Нет | Да | Да |
| `portable_device_state` | Да | Да | Да |

## Возвращаемые значения

- `UI_INTERACTIVE` - UI полностью активен
- `UI_CLOSE` - UI закрыт

## Производительность

- **Сложность**: O(1)
- **Память**: Минимальная (один глобальный датум)

## Отладка

```dm
/mob/proc/check_ui_state(obj/item/device)
	var/datum/ui_state/state = device.ui_state(src)
	var/result = state.can_use_topic(device, src)
	to_chat(src, "UI State: [result]")
```
