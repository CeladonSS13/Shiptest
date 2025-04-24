
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Возвращение клоунов и мимов

ID мода: CELADON_RETURN_CONTENT_CLOWNS
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
  Приставка CELADON гарантирует уникальность 
  модпака. Этот ID будет использоваться для обозначения
  изменений в кор коде, если того потребуется.
-->

### Описание мода

Этот мод возвращает вырезаный контент офами, клоунов и мимов и все что с ними связано обратно в билд.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Используется в других проектах?
- Да
- mod_celadon/outpost_console/code/supply_pack/independent/costumes_toys.dm
<!--
  ВНИМАНИЕ!
  Заполняется другими авторами, кто использует этот модпак или
  его часть в других модпаках! Для Автора модпака внимательно
  отслеживать данный пункт при изменении своего кода!
  Пример заполнения: `Используется часть кода для модпака EXAMP_EXAM`
-->

### Изменения *кор кода*

- code/__DEFINES/is_helpers.dm
- code/_globalvars/traits.dm
- code/_globalvars/lists/names.dm
- code/controllers/subsystem/traumas.dm
- code/controllers/subsystem/processing/quirks.dm
- code/datums/components/fantasy/suffixes.dm
- code/game/objects/items/granters.dm
- code/game/objects/items/storage/backpack.dm
- code/game/objects/items/storage/uplink_kits.dm
- code/modules/antagonists/traitor/equipment/Malf_Modules.dm
- code/modules/asset_cache/asset_list_items.dm
- code/modules/client/preferences.dm
- code/modules/clothing/under/_under.dm
- code/modules/holiday/halloween.dm
- code/modules/mob/living/carbon/human/human.dm
- code/modules/vending/autodrobe.dm
- code/modules/vending/wardrobes.dm
- code/modules/mining/abandoned_crates.dm

- code/modules/antagonists/santa/santa.dm
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

- Отсутствуют
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
  Примеры: `code/__defines/~mod_celadon/return_content_clowns.dm`: `RETURN_CONTENT_CLOWNS_SPEED_MULTIPLIER`, `RETURN_CONTENT_CLOWNS_SPEED_BASE`
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

MrCat15352
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
