
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pulls/2598
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## НАЗВАНИЕ_МОДА

ID мода: CELADON_MODSUITS
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
  Приставка CELADON гарантирует уникальность 
  модпака. Этот ID будет использоваться для обозначения
  изменений в кор коде, если того потребуется.
-->

### Описание мода

Мод добавляет всё связанное с МОДсьютами в общий доступ:
Чертежи модулей и самих костюмов в РнД
Изменение характеристик модсьютов
Изменение модулей модсьютов

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

- `code\__DEFINES\mod.dm` : `DEFAULT_CHARGE_DRAIN`

**Моды**
- `code\modules\mod\mod_control.dm` : `/obj/item/mod/control/emp_act(severity)`, `/obj/item/mod/control/proc/set_mod_skin`, `/obj/item/mod/control/update_icon_state`, `/obj/item/mod/control/attackby`
Добавляем больше эффектов для ЭМИ и фиксим неработающие контроли модов. Изменяем иконки
- `code\modules\mod\mod_core.dm` : `/obj/item/mod/core/standard/proc/mod_uninstall_cell`
Добавляем обновление батареек при вытаскивании. 
- `code\modules\mod\modules\mod_construction.dm` `/obj/item/mod/construction/shell/attackby`
Добавляем проверку на plating/locked
- `code\modules\mod\mod_theme.dm` : Все темы. Добавлена поддержка дыхания без маски.
- `code\modules\mod\mod_types.dm` : Все темы. Удалена ЭМИ защита, мелкие правки баланса с батарейками у элитки.
- `code\modules\mod\mod_core.dm` : `/obj/item/mod/core/standard/proc/on_attackby`, `blacklisted_ammo_types`, `/obj/item/mod/core/Initialize`
**Модули**
- `code\modules\mod\modules\_module.dm` : `var/assist_drain_increase`, `on_deactivation`
- `code/modules/mob/living/carbon/human/species` : `/datum/species/proc/handle_mutant_bodyparts`
- `code\modules\mod\modules\modules_engineering.dm` : `/obj/item/mod/module/tether/on_use()`
- `code\modules\mod\modules\modules_science.dm` : `/obj/item/mod/module/anomaly_locked/antigrav`,`active_power_cost assist_drain_increase`, `var/incompatible_modules`, `var/teleport_time`, `var/cooldown_time`, `var/use_power_cost`
- `code/modules/mod/modules/modules_general.dm` : `complexity`, `overlay_state_inactive`, `var/assist_drain_increase`, `/obj/item/mod/module/jetpack var/use_power_cost`, `/obj/item/mod/module/dna_lock complexity`
- `code\modules\mod\modules\modules_storage.dm` : `/obj/item/mod/module/storage/large_capacity max_vol`
- `code\modules\mod\modules\modules_antag.dm`: `/obj/item/mod/module/armor_booster`, `/obj/item/mod/module/armor_booster/on_activation()`, `var/drain_slowdown_affected`, `drain_per_step`, `var/drain`,`/obj/item/mod/module/armor_assist/proc/drain_on_step`, `/obj/item/mod/module/chameleon/proc/return_look`, `var/module_type` `var/color_list`, `/obj/item/mod/module/insignia/on_use`, `powerkick, plate_compression`
- `code\modules\mod\modules\modules_science.dm`: `/obj/item/mod/module/anomaly_locked/teleporter`, `/obj/item/mod/module/anomaly_locked/antigrav`
- `code\modules\mod\modules\_module.dm` : `incompatible_modules`, `var/assist_drain_increase`
- `code\modules\mod\modules\modules_ninja.dm` : `bulletoff`, `/obj/item/mod/module/stealth/on_activation, on_deactivation`
- `code\modules\mod\modules\modules_supply.dm` : `/obj/item/mod/module/gps/Initialize`
**Сигналы и другие вещи**
- `code\modules\mob\living\carbon\human\human_defense.dm` : `/mob/living/carbon/human/hitby`, `/mob/living/carbon/human/bullet_act`
Добавляем отправку сигналов для работы энергощита и армор бустера. Всё ещё не работает
- `code\game\objects\items.dm` : `/obj/item/proc/equipped`
- `code\modules\mob\inventory.dm` : `/mob/proc/doUnEquip`
Добавляем отправку сигналов для работы магнетик харнесса. Это работает.

- `code\game\mecha\mech_fabricator.dm`: `var/list/part_sets`
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
  Примеры: `code/__defines/~mod_celadon/celadon_modsuits.dm`: `CELADON_MODSUITS_SPEED_MULTIPLIER`, `CELADON_MODSUITS_SPEED_BASE`
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon\_storage_icons\icons\items\clothing\mod_suit\overlay\mod_clothing.dmi`
- `mod_celadon\_storage_icons\icons\items\clothing\mod_suit\overlay\mod_modules.dmi`

- `mod_celadon\_storage_icons\icons\items\clothing\mod_suit\mod_clothing.dmi`
- `mod_celadon\_storage_icons\icons\items\clothing\mod_suit\mod_modules.dmi`
- `mod_celadon\_storage_icons\icons\items\clothing\mod_suit\mod_construction.dmi`
- `mod_celadon\_storage_icons\icons\assets\effects.dmi`
- `mod_celadon\_storage_icons\icons\items\weapons\grenade.dmi`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
  Примеры: `mods/_master_files/icons/obj/alien.dmi`
-->

### Авторы

Quinal, Erring, Chituka, Sodakent (спасибо за спрайт диги-спрайт элитного модсьюта!)
Компонент для милтех модуля: https://github.com/tgstation/tgstation/pull/94467
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
