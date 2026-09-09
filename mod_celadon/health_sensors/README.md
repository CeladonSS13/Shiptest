#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

## Vital Sensor Implants

ID мода: CELADON_HEALTH_SENSORS
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ.
  Приставка CELADON гарантирует уникальность модпака.
-->

### Описание мода

Добавляет имплантируемые датчики жизненных показателей (MK1 / MK2) и ручной монитор,
который показывает состояние только привязанных носителей.

- MK1: жив / мёртв / DNR.
- MK2: то же плюс цифры урона; после смерти с задержкой 5 минут показывает сектор overmap и координаты.
- Привязка: клик датчиком по монитору (или наоборот), либо монитором по носителю.
- Слежка по каждому датчику отдельно: динамик и спрайт good/bad.
- Датчик вживляется операцией (предмет / кейс / имплантер).
- MK1 и монитор — карго и шкафчик врача; MK2 — RnD, нода Subdermal Implants.

### Используется в других проектах?
- Нет

### Изменения *кор кода*

- Отсутствуют

### Оверрайды

- `mod_celadon/health_sensors/code/lockers.dm`: `/obj/structure/closet/secure_closet/medical3/PopulateContents`
- `mod_celadon/health_sensors/code/designs.dm`: `/datum/techweb_node/subdermal_implants` (`design_ids`)

### Дефайны

- `code/__DEFINES/~mod_celadon/health_sensors.dm`: `VITAL_SENSOR_ALIVE`, `VITAL_SENSOR_CRIT`, `VITAL_SENSOR_DEAD`, `VITAL_SENSOR_DNR`, `VITAL_SENSOR_NOSIGNAL`

### Используемые файлы, не содержащиеся в модпаке

- `icons/obj/implants.dmi`
- `mod_celadon/_storage_icons/icons/health_sensors/vital_monitor.dmi`
- `mod_celadon/_storage_sounds/sound/health_sensors/patient_bad.ogg`
- `mod_celadon/_storage_sounds/sound/health_sensors/patient_dead.ogg`
- `tgui/packages/tgui/interfaces/HealthSensorMonitor.js`

### Авторы

Lexanx
