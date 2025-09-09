
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pull/1045
- https://github.com/CeladonSS13/Shiptest/pull/1932
- https://github.com/CeladonSS13/Shiptest/pull/2060
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## НАЗВАНИЕ_МОДА

ID модов:
CELADON_OVERLOAD
MAP_EXPANSION
CELADON_OVERMAP
SHIP_HAIL_HIMSELF
REMOVE_INFO_CLASSSHIP
CELADON_OVERMAP_COLLISION, CELADON_OVERMAP_STUFF, CELADON_OVERMAP_ICON, CELADON_OVERMAP_ARPA
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
  Приставка CELADON гарантирует уникальность 
  модпака. Этот ID будет использоваться для обозначения
  изменений в кор коде, если того потребуется.
-->

### Описание мода

CELADON_OVERLOAD
	Добавляет механику перегрузки для ускорения. Это всё авиационно-космическая физика. Т.к. движение в космосе относительно - скорость корабля может значительно повлиять на космонавтов только в случае воздействия другой, останавливающей силы (например гравитации). Но нагрузка при ускорении сама по себе является нагрузкой, потому-что разница между текущей скоростью и вектором её набирания - само по себе является и останавливающим фактором, и скоростью, а следовательно космонавты будут чувствовать перегрузку (см. термины авиации). Если ускорение может вызывать перегрузку - консоль штурвала будет давать об этом знать звуком, а также весь экипаж начнёт понемногу тошнить и дёргаться экран в противоположную ускорению сторону. Непристёгнутый экипаж будет кидать по палубе при значительной перегрузке.

MAP_EXPANSION
	Этот мод изменяет систему спавна док портов увеличивая их общее количество до 4-х, увеличивая расстояние между ними
	Увеличивает размеры планет до 191x191 (~50%) от старых 127x127
	Убирает лишнюю процедуру, которая создаёт дополнительные док порты в количестве двух штук если отсутствуют руины

CELADON_OVERMAP
	Этот мод включает отключенный ионный шторм и будет добавлять в будущем новые ивенты на карту.

SHIP_HAIL_HIMSELF
	Позволяет отправлять хейлы (сообщения между кораблями) самому себе на судно, чтоб слышали на всей планете команда корабля

REMOVE_INFO_CLASSSHIP
	Больше не показывает класс корабля при шифт-клике по нему


CELADON_OVERMAP_COLLISION CELADON_OVERMAP_STUFF CELADON_OVERMAP_ICON CELADON_OVERMAP_ARPA
	Этот мод служит для внедрениея новой физики управления космическими кораблями, коллизии и респрайта интерфейса овермапы.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Используется в других проектах?
- Нет
<!--
  ВНИМАНИЕ!
  Заполняется другими авторами, кто использует этот модпак или
  его часть в других модпаках! Для Автора модпака внимательно
  отслеживать данный пункт при изменении своего кода!
  Пример заполнения: `Используется часть кода для модпака EXAMP_EXAM`
-->

### Изменения *кор кода*

MAP_EXPANSION
- `code\controllers\subsystem\overmap.dm` : 
- `/datum/controller/subsystem/overmap/proc/spawn_dynamic_encounter(datum/overmap/dynamic/dynamic_datum, ruin_type)` -> `var/list/ruin_turfs`
- `/datum/controller/subsystem/overmap/proc/spawn_dynamic_encounter(datum/overmap/dynamic/dynamic_datum, ruin_type)` -> `var/turf/secondary_docking_turf`

CELADON_OVERMAP
- `code/modules/overmap/objects/event_datum.dm` : Дополнен глобальный список `overmap_event_pick_list` объектами ионного шторма

SHIP_HAIL_HIMSELF
- EDIT: `code/modules/overmap/_overmap_datum.dm` : Возврат бага на отправление хайлов кораблей самим себе, это ФИЧА для управление огромным экипажем а не баг

REMOVE_INFO_CLASSSHIP
- EDIT: `code/modules/overmap/ships/controlled_ship_datum.dm`

## CELADON_OVERMAP_COLLISION, CELADON_OVERMAP_STUFF, CELADON_OVERMAP_ICON, CELADON_OVERMAP_ARPA
- code/controllers/subsystem/overmap_stuff.dm
- code/controllers/subsystem/overmap_move.dm, 
- code/game/gamemodes/meteor/meteors.dm, 
- code/modules/overmap/_overmap_datum.dm, 
- code/modules/overmap/helm.dm, 
- code/modules/overmap/objects/dynamic_datum.dm, 
- code/modules/overmap/objects/event_datum.dm, 
- code/modules/overmap/objects/star.dm, 
- code/modules/overmap/overmap_token.dm, 
- code/modules/overmap/overmap_turf.dm, 
- code/modules/overmap/planets/planet_types.dm, 
- code/modules/overmap/ships/controlled_ship_datum.dm, 
- code/modules/overmap/ships/ship_datum.dm, 
- icons/misc/overmap.dmi, 
- icons/misc/overmap_large.dmi, 
- icons/misc/overmap_larger.dmi, 
- icons/turf/overmap.dmi, 
- mod_celadon/maps/code/planet_types.dm, 
- shiptest.dme, 
- tgui/packages/tgui/interfaces/HelmConsole.js, 
<!--
  Если вы редактировали какие-либо процедуры или переменные в кор коде,
  они должны быть указаны здесь.
  Нужно указать и файл, и процедуры/переменные.

  Изменений нет - напиши "Отсутствуют"
  Примеры: `code/modules/mob/living.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

### Оверрайды

- Отсутствуют
<!--
  Если ты добавлял новый модульный оверрайд, его нужно указать здесь.
  Здесь указываются оверрайды в твоём моде и папке `_master_files`

  Изменений нет - напиши "Отсутствуют"
  Примеры: 
  - `mods/_master_files/sound/my_cool_sound.ogg`
  - `mods/_master_files/code/my_modular_override.dm`: `proc/overriden_proc`, `var/overriden_var`
-->

### Дефайны

MAP_EXPANSION
- `code\__DEFINES\maps.dm`:
`QUADRANT_MAP_SIZE`

CELADON_OVERMAP_COLLISION, CELADON_OVERMAP_STUFF, CELADON_OVERMAP_ICON, CELADON_OVERMAP_ARPA
- code/controllers/subsystem/overmap_stuff.dm
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
  Примеры: `code/__defines/~mod_celadon/example.dm`: `EXAMPLE_SPEED_MULTIPLIER`, `EXAMPLE_SPEED_BASE`
-->

### Используемые файлы, не содержащиеся в модпаке

- Отсутствуют
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
  Примеры: `mods/_master_files/icons/obj/alien.dmi`
-->

### Авторы

CELADON_OVERLOAD - vagabond05
MAP_EXPANSION - molniz
CELADON_OVERMAP - MrCat15352
SHIP_HAIL_HIMSELF - KOCMOHABT
REMOVE_INFO_CLASSSHIP - Chituka
CELADON_OVERMAP_COLLISION, CELADON_OVERMAP_STUFF, CELADON_OVERMAP_ICON, CELADON_OVERMAP_ARPA - vagabond05
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
