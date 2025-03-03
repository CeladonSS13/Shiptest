
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Возвращение спавнов и тендрилов

ID мода: CELADON_RETURN_CONTENT
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
-->

### Описание мода

Этот мод возвращает вырезаные спавнеры, хайвботов, тендрилов в игру, а также ачивки связаные с ними.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- `code/datums/components/chasm.dm`
- `code/datums/mapgen/planetary/AsteroidGenerator.dm`
- `code/datums/mapgen/planetary/JungleGenerator.dm`
- `code/datums/mapgen/planetary/LavaGenerator.dm`
- `code/datums/mapgen/planetary/RockGenerator.dm`
- `code/datums/mapgen/planetary/SandGenerator.dm`
- `code/datums/mapgen/planetary/SnowGenerator.dm`
- `code/datums/mapgen/planetary/WasteGenerator.dm`
- `code/modules/mining/ore_veins.dm`
- `code/modules/mob/living/simple_animal/hostile/mining_mobs/hivelord.dm`
- `code/modules/mob/living/simple_animal/hostile/mining_mobs/mining_mobs.dm`
- `code/modules/ruins/objects_and_mobs/ash_walker_den.dm`

Возвращение спрайтов ЧАСТЬ 2
- `code/__DEFINES/species_clothing_defines.dm`
- 
- `code/game/gamemodes/clown_ops/bananium_bomb.dm`
- 
- `code/game/machinery/computer/arcade.dm`
- `code/game/mecha/mecha_construction_paths.dm`
- 
- `code/game/objects/items/devices/PDA/PDA_types.dm`
- `code/game/objects/items/grenades/discogrenade.dm`
- `code/game/objects/items/stacks/sheets/leather.dm`
- `code/game/objects/items/stacks/sheets/sheet_types.dm`
- `code/game/objects/items/storage/backpack.dm`
- `code/game/objects/items/storage/toolbox.dm`
- `code/game/objects/items/gift.dm`
- `code/game/objects/items/miscellaneous.dm`
- 
- `code/game/objects/structures/crates_lockers/closets/secure/security.dm`
- `code/game/objects/structures/crates_lockers/closets/job_closets.dm`
- `code/game/objects/structures/crates_lockers/closets/wardrobe.dm`
- 
- `code/modules/antagonists/cult/cult_structures.dm`
- `code/modules/antagonists/santa/santa.dm`
- `code/modules/antagonists/wizard/equipment/artefact.dm`
- 
- `code/modules/awaymissions/mission_code/Academy.dm`
- 
- `code/modules/cargo/exports/lavaland.dm`
- 
- `code/modules/clothing/glasses/_glasses.dm`
- 
- `code/modules/holiday/easter.dm`
- 
- `code/modules/mining/lavaland/necropolis_chests.dm`
- `code/modules/mining/lavaland/necropolis_chests.dm`
- `code/modules/mining/lavaland/necropolis_chests.dm`
- `code/modules/mining/abandoned_crates.dm`
- `code/modules/mining/machine_vending.dm`
- 
- `code/modules/mob/living/simple_animal/hostile/mining_mobs/hivelord_outfits.dm`
- `code/modules/mod/modules/modules_general.dm`
- 
- `code/modules/research/xenobiology/crossbreeding/chilling.dm`
- `code/modules/research/xenobiology/crossbreeding/chilling.dm`
- 
- `code/modules/spells/spell_types/lichdom.dm`
- `code/modules/spells/spell.dm`
- 
- `code/modules/unit_tests/icons/worn_icons.dm`
- 
- `code/modules/vehicles/cars/clowncar.dm`
- 
- `code/modules/vending/autodrobe.dm`
- `code/modules/vending/clothesmate.dm`
- `code/modules/vending/wardrobes.dm`


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

- `code/__DEFINES/achievements.dm`
  - `SWARMER_BEACON_SCORE`
  - `TENDRIL_CLEAR_SCORE`
  - `BOSS_MEDAL_SWARMERS_CRUSHER`
  - `BOSS_MEDAL_KINGGOAT_CRUSHER`
  - `BOSS_MEDAL_TENDRIL`
  - `BOSS_MEDAL_SWARMERS`
  - `BOSS_MEDAL_KINGGOAT`
  
  - `code/__DEFINES/~mod_celadon/traits.dm`
		`REVERSE_BEAR_TRAP_TRAIT`
		`SHAMEBRERO_TRAIT`
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
  Примеры: `code/__defines/~mod_celadon/return_content.dm`: `RETURN_CONTENT_SPEED_MULTIPLIER`, `RETURN_CONTENT_SPEED_BASE`
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

MrCat15352, Molniz
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
