# Примеры использования

## Базовые примеры

### Рация
```dm
/obj/item/radio/ui_state(mob/user)
	return GLOB.portable_device_state
```

### PDA
```dm
/obj/item/pda/ui_state(mob/user)
	return GLOB.portable_device_state
```

### Планшет
```dm
/obj/item/tablet/ui_state(mob/user)
	return GLOB.portable_device_state
```

## Миграция

```dm
// Было:
/obj/item/device/ui_state(mob/user)
	return GLOB.inventory_state

// Стало:
/obj/item/device/ui_state(mob/user)
	return GLOB.portable_device_state
```

## Тестовые сценарии

### Сознательный лежащий пользователь с предметом
- **Ожидается**: `UI_INTERACTIVE`
- **Результат**: Успешно

### Без сознания пользователь с предметом
- **Ожидается**: `UI_CLOSE`
- **Результат**: Успешно

### Сознательный пользователь без предмета
- **Ожидается**: `UI_CLOSE`
- **Результат**: Успешно

## Отладка

```dm
/mob/proc/debug_ui_state(obj/item/device)
	var/datum/ui_state/state = device.ui_state(src)
	var/result = state.can_use_topic(device, src)
	to_chat(src, "UI State: [result]")
```
