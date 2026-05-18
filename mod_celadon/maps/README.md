

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Maps - карты

ID мода: CELADON_CONFIGS_MAPS
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
-->

### Описание мода

Этот мод содержит наши шатлы, субшатлы, руинки и аванпосты.
В файле subshuttles.dm находятся датумы новых сабшатлов.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- `code/modules/mob/living.dm`: `proc/overriden_proc`, `var/overriden_var`
- EDIT `code\controllers\subsystem\mapping.dm`: `load_ship_templates()` -> `flist`, `file`
- EDIT `code\datums\shuttles.dm` -> `mappath`: меняем пути к сабшатлам
- EDIT `code\modules\overmap\objects\outpost\outpost_types.dm` -> `path`: меняем путь к аванпостам

- ADD `_maps\_basemap.dm` -> включение карты ЦК

- EDIT:
	`code\datums\ruins\beachplanet.dm` 	: `/datum/map_template/ruin/beachplanet.dm`	: `prefix`
	`code\datums\ruins\icemoon.dm`		: `/datum/map_template/ruin/icemoon.dm`		: `prefix`
	`code\datums\ruins\jungle.dm`		: `/datum/map_template/ruin/jungle.dm`		: `prefix`
	`code\datums\ruins\lavaland.dm`		: `/datum/map_template/ruin/lavaland.dm`	: `prefix`
	`code\datums\ruins\reebe.dm`		: `/datum/map_template/ruin/reebe.dm`		: `prefix`
	`code\datums\ruins\rockplanet.dm`	: `/datum/map_template/ruin/rockplanet.dm` 	: `prefix`
	`code\datums\ruins\space.dm`		: `/datum/map_template/ruin/space.dm`		: `prefix`
	`code\datums\ruins\wasteplanet.dm`	: `/datum/map_template/ruin/wasteplanet.dm` : `prefix`
	`code\datums\ruins\whitesands.dm`	: `/datum/map_template/ruin/whitesands.dm` 	: `prefix`
	
- EDIT: `tools\build\build.js` : `export const DmMapsIncludeTarget`
<!--
  Если вы редактировали какие-либо процедуры или переменные в кор коде,
  они должны быть указаны здесь.
  Нужно указать и файл, и процедуры/переменные.

  Изменений нет - напиши "Отсутствуют"
-->

### Оверрайды

- Отсутствуют
<!--
  Если ты добавлял новый модульный оверрайд, его нужно указать здесь.
  Здесь указываются оверрайды в твоём моде и папке `_master_files`

  Изменений нет - напиши "Отсутствуют"
-->

### Дефайны

- EDIT `code\__DEFINES\overmap.dm` -> : добавляем дефайн
- EDIT `code/__DEFINES/ruins.dm` -> : добавляем дефайн
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- `_maps\_mod_celadon\*`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:


MrCat15352, Overteh, Molniz, MysticalFaceLesS, Mirag1993

<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
