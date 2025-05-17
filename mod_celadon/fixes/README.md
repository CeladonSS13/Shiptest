

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Fixes - фиксы

ID мода: CELADON_FIXES
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
-->

### Описание мода

Этот мод Фиксит различные вещи в коде, например крашеры или красную катану.

Weebstick (Красная катана) теперь нельзя сломать, 
вытащив меч при подготовке блинка. (Если что-то сломается всёравно, попросите 
вызвать proc "unprime_unlock" у ближайшего админа)

<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- ADD: `code\modules\mining\equipment\kinetic_crusher.dm`: `/obj/item/kinetic_crusher/old/update_icon_state()` -> `..()`
- REMOVE: `code\modules\mining\equipment\kinetic_crusher.dm`: `/obj/item/kinetic_crusher/old/update_icon_state()` -> `return ..()`

- ADD: `code\modules\mining\equipment\kinetic_crusher.dm`: `/obj/item/kinetic_crusher/syndie_crusher/update_icon_state()` -> `..()`
- REMOVE: `code\modules\mining\equipment\kinetic_crusher.dm`: `/obj/item/kinetic_crusher/syndie_crusher/update_icon_state()` -> `return ..()`

- EDIT: `code\modules\projectiles\ammunition\caseless\_caseless.dm`: `/obj/item/ammo_casing/caseless/on_eject()`


- ADD: `code\modules\clothing\suits\hoodies.dm`: `/obj/item/clothing/suit/hooded/hoodie/rilena` -> чиним офов, пропущенный стэйт иконки.

- ADD: `code\game\machinery\shuttle\shuttle_engine.dm`: `var/engine_type=`
- ADD: `code\game\machinery\shuttle\shuttle_engine.dm`: `/obj/machinery/power/shuttle/engine/proc/plasma_thrust`
- EDIT: `code\game\machinery\shuttle\shuttle_engine_types.dm`: `/obj/machinery/power/shuttle/engine/fueled/burn_engine`-> `return resolved_heater.consume_fuel(to_use, fuel_type)`
- ADD: `code\game\machinery\shuttle\shuttle_engine_types.dm`: `/obj/machinery/power/shuttle/engine/fueled/plasma`-> `engine_type = "plasma"`
- ADD: `code\game\machinery\shuttle\shuttle_engine_types.dm`: `/obj/machinery/power/shuttle/engine/fueled/plasma/plasma_thrust`
- EDIT: `code\modules\overmap\ships\controlled_ship_datum.dm`: `/datum/overmap/ship/controlled/burn_engines` -> `Добавлена логика`
- EDIT: `tgui\packages\tgui\interfaces\HelmConsole.js`: `estThrust * 500`-> `estThrust * 1600`
- EDIT: `tgui\packages\tgui\interfaces\HelmConsole.js`: ` format={(value) => value.toFixed(1)}` -> ` format={(value) => value.toFixed(2)}`

- ADD: `code\modules\projectiles\guns\ballistic\revolver.dm` : `/obj/item/gun/ballistic/revolver/proc/insert_casing` -> `проверка на калибр`

- EDIT: `code\modules\mining\equipment\explorer_gear.dm` : `/obj/item/clothing/mask/gas/explorer/adjustmask(user)` -> Исправлен баг с размерами газ масок при снятие фильтров
- EDIT: `code\modules\projectiles\ammunition\ballistic\rifle.dm` - исправление калибра
- EDIT: `code\modules\projectiles\boxes_magazines\external\rifle.dm` - - исправление калибра

- REMOVE: `code\game\machinery\newscaster.dm` - Полная замена на переведённый файл. Пожалуйста, сделайте это нормально.

- REMOVE: `code\game\objects\items\kitchen.dm` - Исправляет спрайт ножа.

- REMOVE: `code/modules/vending/_vending.dm` - вынос в родителя переменной

- ADD: `code\__HELPERS\text.dm` - Добавляем возможность создания имён персонажей на кирилице.
- EDIT: `code\modules\admin\player_panel.dm` - Фикс <meta>, исправлено отображение кирилицы на F6.

- EDIT: `code\game\objects\structures.dm` - Исправляет односторониие перила путям отключения одной строчки кода.

- EDIT: `code/modules/research/rdconsole.dm` - Попытка изменить абьюз, когда игрок мог внести семена сколько угодно раз, пересобирая тупо консоль. Сделано через глобальный список.

- ADD: `/obj/machinery/computer/telecomms/server/ui_interact` - Добавляем поддержку UTF-8
- ADD: `/obj/machinery/computer/telecomms/monitor/ui_interact` - Добавляем поддержку UTF-8

- REMOVE: `code/modules/client/verbs/looc.dm` - Убрано пару проверок. Разрешаем писать в LOOC будучи призраком.

- EDIT: `code/modules/overmap/objects/event_datum.dm` - Выносим в отдельные родители ивенты, для корректной работы миссий на изучение

- REMOVE: `code/modules/clothing/outfits/standard.dm` : `W.registered_name = H.real_name`, `W.update_label()` - Вызывают рантаймы

- EDIT: `code/game/objects/items/devices/taperecorder.dm` - Изменение рекордера, дабы тот более не мог переводить другие языки

- EDIT: `code\modules\hydroponics\gene_modder.dm` - Добавление удаления мусора а не данных с диска

- EDIT: `code\modules\hydroponics\grown\replicapod.dm` - Исправление отобрежения ДНК на сканере 

- EDIT: `code\modules\hydroponics\grown\replicapod.dm` - Исправлено появление людей из капусты

- EDIT: `code/modules/mob/living/carbon/human/human_movement.dm` - Учитывается влияние обуви на гравитацию

- ADD: `code/modules/mob/living/life.dm` - Добавление magboots_handle_gravity

- EDIT: `code/modules/overmap/objects/event_datum.dm`

- EDIT: `code/modules/missions/outpost/research_mission.dm` - Окргуление координат


<!--
  Если вы редактировали какие-либо процедуры или переменные в кор коде,
  они должны быть указаны здесь.
  Нужно указать и файл, и процедуры/переменные.

  Изменений нет - напиши "Отсутствуют"
-->

### Оверрайды

- `mod_celadon/fixes/code/research_mission.dm` - вроде перезаписывает

<!-- fax_name -->
- `code\controllers\subsystem\overmap.dm`: `proc/spawn_ship_at_start`,
- `code\modules\paperwork\fax.dm`: `proc/connect_to_shuttle`

<!--
  Если ты добавлял новый модульный оверрайд, его нужно указать здесь.
  Здесь указываются оверрайды в твоём моде и папке `_master_files`

  Изменений нет - напиши "Отсутствуют"
-->

### Дефайны

<!-- fax_name -->
- `code/__defines/~mod_celadon/ship.dm`

<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon/crusher_trophy/code/kinetic_crusher.dm`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:


RalseiDreemuurr, Mirag1993 , Корольный крыс, MrCat15352, MysticalFaceLesS, Burbonchik, MrRomainzZ, Molniz, Redwizz, Sjerty, Garomt, Ganza9991

<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
