
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pull/1045
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## CELADON_OVERMAP_COLLISION, CELADON_OVERMAP_STUFF, CELADON_OVERMAP_ICON, CELADON_OVERMAP_ARPA

ID мода: 
	CELADON_OVERMAP_COLLISION
	CELADON_OVERMAP_STUFF 
	CELADON_OVERMAP_ICON 
	CELADON_OVERMAP_ARPA
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
  Приставка CELADON гарантирует уникальность 
  модпака. Этот ID будет использоваться для обозначения
  изменений в кор коде, если того потребуется.
-->

### Описание мода

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

- code/controllers/subsystem/overmap_stuff.dm
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
  Примеры: `code/__defines/~mod_celadon/example.dm`: `EXAMPLE_SPEED_MULTIPLIER`, `EXAMPLE_SPEED_BASE`
-->

### Используемые файлы, не содержащиеся в модпаке

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
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
  Примеры: `mods/_master_files/icons/obj/alien.dmi`
-->

### Авторы

vagabond05
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
