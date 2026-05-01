
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## ACCESS

ID мода: CELADON_ACCESS
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
  Приставка CELADON гарантирует уникальность 
  модпака. Этот ID будет использоваться для обозначения
  изменений в кор коде, если того потребуется.
-->

### Описание мода

Этот мод расширяет диапазон доступов для наших нужд. Добавляет доступы для аванпоста. Добавляет фракции для дебага аутфита.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Используется в других проектах?
- 'mod_celadon/stuff_elysium/code/outfits.dm'
<!--
  ВНИМАНИЕ!
  Заполняется другими авторами, кто использует этот модпак или
  его часть в других модпаках! Для Автора модпака внимательно
  отслеживать данный пункт при изменении своего кода!
  Пример заполнения: `Используется часть кода для модпака EXAMP_EXAM`
-->

### Изменения *кор кода*

- `code/game/objects/items/cards_ids.dm` - debug outfit
- ADD `code/modules/clothing/outfits/standard.dm`
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

- 'code/__DEFINES/~mod_celadon/access.dm'
- 'define ACCESS_OUTPOST_COMMAND 				8100'
- 'define ACCESS_OUTPOST_BRIG_SB 				8101'
- 'define ACCESS_OUTPOST_DETECTIVE 				8102'
- 'define ACCESS_OUTPOST_BRIGADIR 				8103'
- '
- 'define ACCESS_OUTPOST_ENGINEER				8111'
- '
- 'define ACCESS_OUTPOST_MED_CMO				8117'
- 'define ACCESS_OUTPOST_MED_HIRURG				8118'
- 'define ACCESS_OUTPOST_MED_STORAGE			8119'
- 'define ACCESS_OUTPOST_MED_GENETIC			8120'
- 'define ACCESS_OUTPOST_MED_CHEMISTRY			8121'
- 'define ACCESS_OUTPOST_MED_MORGUE				8122'
- 'define ACCESS_OUTPOST_MED_GENERAL			8123'
- '
- 'define ACCESS_OUTPOST_SERVICE_COOK			8124'
- 'define ACCESS_OUTPOST_SERVICE_BARMAN			8125'
- '
- 'define ACCESS_OUTPOST_OTHER_DONCO			8126'
- 'define ACCESS_OUTPOST_OTHER_TRASH_FACTORY	8127'
- '
- 'define ACCESS_OUTPOST_FACTION_NT				8130'
- 'define ACCESS_OUTPOST_FACTION_SYNDICATE		8131'
- 'define ACCESS_OUTPOST_FACTION_SOLFED			8132'
- 'define ACCESS_OUTPOST_FACTION_INTEQ			8133'
- 'define ACCESS_OUTPOST_FACTION_SEPARATISTS	8134'

- '#define ACCESS_INTEQ_GENERAL 				8484'
- '#define ACCESS_INTEQ_SECURITY 				8485'
- '#define ACCESS_INTEQ_CAPTAIN 				8486'

- '#define FACTION_PLAYER_ELYSIUM "playerElysium"'
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
  Примеры: `code/__defines/~mod_celadon/access.dm`: `ACCESS_SPEED_MULTIPLIER`, `ACCESS_SPEED_BASE`
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
