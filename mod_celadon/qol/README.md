

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## QoL - Улучшения всего и вся

ID мода: CELADON_QOL
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
-->

### Описание мода

Этот мод служит для внесения изменений связаных с улучшением различных вещей, для удобства в общем.
Добавляется: 
- прическа ziegler -> `mod_celadon/qol/code/hair.dm`
- мезонные очки двух видов -> `mod_celadon/qol/code/glasses.dm`
- бинокль -> `mod_celadon/qol/code/binoculars.dm`
- переведены законы ИИ, см.ниже
- изменен размер боевым дробовикам, теперь их можно ложить в слот спины и рюкзака
- добавлена удобная новая кнопка fix chat 2
- добавлена кнопка refresh TGUI
- убраны неиспользуемые кнопки со вкладки ООС	
- перемещены технические кнопки во вкладку Special Verbs
- обновлён функционал Fit Viewport
- исправлен зависающий пузырик сообщения над головой куклы
- /stutter теперь не распространяется на русские гласные
- /slur теперь заменяет символы кириллицы на "пьяный вариант" и пропускает пробел
- /check_for_custom_say_emote теперь нормально работает с кириллицей
- добавлен вариант "bloodbank" в список для выбора при настройке платы умного холодильника
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- ADD `code/game/objects/items/storage/wallets.dm`: `/obj/item/storage/wallet/ComponentInitialize()`: `STR.set_holdable`: `/obj/item/melee/knife/letter_opener,`, `/obj/item/key`
- EDIT `code/modules/mob/dead/new_player/sprite_accessories/hair.dm`: `/datum/sprite_accessory/hair`: `icon` = `mod_celadon/_storge_icons/icons/qol/human_face.dmi`
- EDIT `code/game/objects/items/binoculars.dm`: `/obj/item/binoculars`: `slot_flags` = `ITEM_SLOT_NECK`
- EDIT `code/modules/mob/living/silicon/silicon.dm`: `/mob/living/silicon/proc/checklaws()`
- EDIT `code/game/objects/items/AI_modules.dm`: `/obj/item/aiModule/core/full/asimov/attack_self(mob/user as mob)`
- EDIT `code/modules/ruins/spaceruin_code/forgottenship.dm`: `/datum/ai_laws/cybersun`
Законы ИИ
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/default/asimov`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/default/paladin`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/paladin5`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/tyrant`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/default/corporate`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/robocop`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/syndicate_override`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/syndproto_override`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/ninja_override`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/antimov`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/asimovpp`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/thermodynamic`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/hippocratic`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/maintain`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/drone`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/liveandletlive`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/peacekeeper`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/reporter`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/balance`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/toupee`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/hulkamania`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/overlord`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/custom`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/custom/New()`
- EDIT `code/datums/ai_laws.dm`: `/datum/ai_laws/proc/set_laws_config()`
- EDIT `code/modules/mob/living/living_say.dm`: `/mob/living/send_speech` -> `image`
- EDIT `code/modules/mob/living/living.dm`: `/mob/living/key_down` -> `set_typing_indicator`
- EDIT `code/modules/mob/living/living.dm`: `/mob/living/set_typing_indicator` -> `state, isMe = null, isSay = null`, `var/state_of_bubble`
- ADD `code/modules/mob/living/living.dm`: `/mob/living/set_typing_indicator` -> `if(isMe)`, `if(isSay)`, `if(!state_of_bubble)`
- ADD `code/modules/mob/living/carbon/human/human.dm`: `/mob/living/carbon/human/species/android` -> `bubble_icon`
- ADD `code/modules/mob/living/carbon/human/human.dm`: `/mob/living/carbon/human/species/jelly` -> `bubble_icon`
- ADD `code/modules/mob/living/carbon/human/human.dm`: `/mob/living/carbon/human/species/ipc` -> `bubble_icon`

- EDIT `code/modules/client/preferences.dm`: `var/datum/loadout_category/LC = GLOB.loadout_categories[gear_tab]` - меняем лодаут

- ADD `html/browser/common.css` -> да-да, ксс файлик шатаем. Добавляем классы на обработку картиночек лодаута

- EDIT `code/game/objects/items/storage/ration.dm` - делаем так чтобы можно хитер положить обратно

- EDIT `code/modules/projectiles/boxes_magazines/_box_magazine.dm` -> снижена задержка загрузки патронов с коробки в магазин

- EDIT `code/game/objects/structures/flora.dm` -> меняем звук падающего дерева с метеоритного на нормальный

- EDIT `code/game/gamemodes/extended/extended.dm` -> меняем начальный репорт

- EDIT `code\modules\mob\mob_helpers.dm`: `/proc/slur`
- EDIT `code\modules\mob\mob_helpers.dm`: `/proc/stutter`

ООС вкладка	
- EDIT `code/modules/client/verbs/ooc.dm` -> Убраны неиспользуемые кнопки "Message Of The Day" "Show Policy" со вкладки ООС.Перемещена кнопка "Fit Viewport" со вкладки "ООС" во вкладку "Special Verbs"
- EDIT `code/datums/keybinding/client.dm` -> Перемещена кнопка "Toggle Fullscreen" со вкладки "ООС" во вкладку "Special Verbs"
- EDIT `code/modules/mob/mob.dm` Перемещена кнопка "Cancel camera view" со вкладки "ООС" во вкладку "Special Verbs"
- EDIT `code/modules/client/verbs/ping.dm` Убрана неиспользуемая кнопка "Ping" со вкладки "ООС
- REMOVE `code/datums/helper_datums/getrev.dm` -> Убрана неиспользуемая кнопка "Show Server Revision" со вкладки ООС
- REMOVE `code/modules/discord/accountlink.dm` -> Убрана неиспользуемая кнопка Verify Discord Account со вкладки ООС
- REMOVE `code/modules/discord/toggle_notify.dm` Убрана неиспользуемая кнопка "Notify Restart" со вкладки "ООС"
- REMOVE `code/modules/tgui_panel/external.dm` Убрана кнопка "Fix chat" со вкладки "ООС". Устаревшая функция.
Карго
- REMOVE `code\modules\cargo\packs\machinery.dm` Перемещён Robotics crate в 
	`mod_celadon\cargo_items\code\space_idea.dm`, на более видное место, дополнил деталями для сборки ботов и инструкции по сборке

- EDIT `code/modules/clothing/clothing.dm` -> `armor_to_protection_class` -> Замена римских цифр на числовые значения

- ADD `code\modules\mob\dead\new_player\ship_select.dm` -> Добавлено подтягивание short_name для шаблона.
- ADD `tgui\packages\tgui\interfaces\ShipSelect.js` -> Добавлена подвкладка при покупке корабля с отображением карты.

- EDIT `code\__HELPERS\roundend.dm` -> Изменён вывод гринтекста на более правильный для последующего вывода в Discord.

Смартфридж Bloodbank
- ADD+EDIT `code\game\objects\items\circuitboards\machine_circuitboards.dm` - Добавление платы bloodbank в пул смартфридж плат, сортировка по алфавиту в меню.

- EDIT `code/game/objects/structures/spirit_board.dm` - Снижаем лимит игроков для спиритической доски с 2 до 1

- ADD, EDIT: `code/game/objects/items/storage/fancy.dm` - Делаем возможным положить обратно в пачку сигарет бычки

- ADD: `code/game/objects/items/stacks/sheets/sheet_types.dm` - добавляем в рецепты ткани обмотки для ног, всех цветов и стоимостью в 2 единицы ткани

- ADD: `code/modules/power/singularity/singularity.dm` - добавляем сингулярность которая не излучает радиацию.

<!--
  Если вы редактировали какие-либо процедуры или переменные в кор коде,
  они должны быть указаны здесь.
  Нужно указать и файл, и процедуры/переменные.

  Изменений нет - напиши "Отсутствуют"
-->

### Оверрайды

- `/datum/outfit/debug`
- `/datum/viewData/assertFormat`
- `/datum/viewData/resetFormat`
- `/client/fit_viewport`
- `/mob/verb/me_verb`
- `/mob/verb/say_verb`
- `/mob/proc/check_for_custom_say_emote`
<!--
  Если ты добавлял новый модульный оверрайд, его нужно указать здесь.
  Здесь указываются оверрайды в твоём моде и папке `_master_files`

  Изменений нет - напиши "Отсутствуют"
-->

### Дефайны

- EDIT `code/__DEFINES/species_clothing_defines.dm`: `DEFAULT_NECK_PATH`
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon/_storge_icons/icons/qol`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:

RalseiDreemuurr, MysticalFaceLesS, MrCat15352, Yata9arasu, MrRomainzZ
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
