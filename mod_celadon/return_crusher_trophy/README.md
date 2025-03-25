
#### Список PRов

- https://github.com/CeladonSS13/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Возвращение трофеев крашеров

ID мода: RETURN_CRUSHER_TROPHY
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
  При запуске скрипта выставляется автоматически.
-->

### Описание мода

Этот мод отменяет парадигму офов, возвращая в игру легендарные трофеи для крашеров. Теперь можно вешать на крашеры трофеи.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- code/modules/mob/living/simple_animal/hostile/mining_mobs/wolf.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/mining_mobs.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/polarbear.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/ice demon.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/hivelord.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/goliath.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/legionnaire.dm
- code/modules/mob/living/simple_animal/hostile/mining_mobs/basilisk.dm
- code/modules/mob/living/simple_animal/hostile/megafauna/megafauna.dm
- code/modules/mob/living/simple_animal/hostile/megafauna/drake.dm
- code/modules/mob/living/simple_animal/hostile/megafauna/cult_templar.dm
- code/modules/mob/living/simple_animal/hostile/megafauna/codename_claw.dm
- code/modules/mob/living/simple_animal/hostile/megafauna/bubblegum.dm
- code/modules/mob/living/simple_animal/hostile/human/survivors.dm
- code/modules/mining/equipment/trophies.dm
- code/modules/mining/lavaland/necropolis_chests.dm
- code/modules/mining/equipment/kinetic_crusher.dm
- code/datums/components/crafting/recipes/tribal.dm

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
  Примеры: `code/__defines/~mod_celadon/crusher_trophy.dm`: `CRUSHER_TROPHY_SPEED_MULTIPLIER`, `CRUSHER_TROPHY_SPEED_BASE`
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon/balance/code/hostile_mobs.dm` : Перенесены туда части трофеев с фауны
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
