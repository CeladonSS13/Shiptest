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

- MK1: жив / мёртв / DNR; после смерти с задержкой 5 минут — сектор overmap и X/Y тайла тела.
- MK2: то же плюс цифры урона.
- Привязка: клик датчиком по монитору (или наоборот), либо монитором по носителю.
- Слежка по каждому датчику отдельно: динамик и спрайт good/bad.
- Вживление и снятие: Organ manipulation / Prosthesis organ manipulation (грудь). Также можно зарядить обычный имплантер.
- MK1 и монитор — карго и шкафчик врача; MK2 — RnD, нода Cybernetic Implants.

### Используется в других проектах?
- `CELADON_RND`: дизайн `vital_sensor_mk2` и нода `cyber_implants`
- `CELADON_OUTPOST_CONSOLE`: карго-пакет Independent Medical

### Изменения *кор кода*

- Отсутствуют

### Оверрайды

- `mod_celadon/health_sensors/code/lockers.dm`: `/obj/structure/closet/secure_closet/medical3/PopulateContents`
- `mod_celadon/health_sensors/code/implant.dm`: `/obj/item/implanter` (load/inject vital sensor organs)

### Дефайны

- `code/__DEFINES/~mod_celadon/health_sensors.dm`: `VITAL_SENSOR_ALIVE`, `VITAL_SENSOR_CRIT`, `VITAL_SENSOR_DEAD`, `VITAL_SENSOR_DNR`, `VITAL_SENSOR_NOSIGNAL`, `ORGAN_SLOT_VITAL_SENSOR`

### Используемые файлы, не содержащиеся в модпаке

- `icons/obj/implants/implant.dmi`
- `mod_celadon/_storage_icons/icons/health_sensors/vital_monitor.dmi`
- `mod_celadon/_storage_sounds/sound/health_sensors/patient_bad.ogg`
- `mod_celadon/_storage_sounds/sound/health_sensors/patient_dead.ogg`
- `tgui/packages/tgui/interfaces/_mod_celadon/HealthSensorMonitor.js`
- `mod_celadon/rnd/code/designs/protolathe.dm`
- `mod_celadon/rnd/code/nodes.dm`
- `mod_celadon/outpost_console/code/supply_pack/independent/medical/vital_sensors.dm`

### Авторы

Lexanx
