

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Balance - изменение баланса

ID мода: CELADON_BALANCE, CELADON_BALANCE_MOBS
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов. Добавлены
  дополнительные ID.
-->

### Описание мода

Этот мод вносит различные изменения в балансе. 
- Изменено количество получаемого лута с элиток.
- Портированы изменения от Ганзы.

<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*
- Снаряжение шахтеров:
EDIT: `code\modules\mining\equipment\explorer_gear.dm`: `/obj/item/clothing/suit/hooded/explorer` -> `allowed = list`
- Изменены рад коллекторы:
EDIT: `code\modules\power\singularity\collector.dm`: `#define RAD_COLLECTOR_EFFICIENCY`, `#define RAD_COLLECTOR_COEFFICIENT`, `#define RAD_COLLECTOR_OUTPUT`
- Изменения части шатлов:
EDIT: `code\game\machinery\shuttle\custom_shuttle.dm`: `/obj/machinery/power/shuttle` -> icon
EDIT: `code\game\machinery\shuttle\custom_shuttle.dm`: `/obj/machinery/atmospherics/components/unary/shuttle` -> icon
- Двигатели:
EDIT: `code\game\machinery\shuttle\shuttle_engine_types.dm`: `fuel_use`, `thrust`
- РнД:
EDIT: `code\modules\research\techweb\all_nodes.dm`: `research_costs`, `export_price`, `prereq_ids`
- Универсальная плата вендоров:
ADD: `code\game\objects\items\circuitboards\machine_circuitboards.dm` : `/obj/item/circuitboard/machine/vendor`
- Уменьшение цены еды в карго:
EDIT: `code\modules\cargo\packs\food.dm` : `/datum/supply_pack/food/`

Ребаланс
Лут с элиток (на данный момент убрано из кода для ребаланса)
EDIT: `code\modules\mob\living\simple_animal\hostile\mining_mobs\elites\elite.dm`: `/obj/structure/elite_tumor/proc/onEliteLoss()` -> var/obj/structure/closet/crate/necropolis/tendril/lootbox = new /obj/structure/closet/crate/necropolis/tendril(loc)

ADD: `code\modules\projectiles\ammunition\_ammunition.dm` : /obj/item/ammo_casing/attackby(obj/item/I, mob/user, params) -> добавлены звук подбора патрона в магазин с пола и задержка в 1 секунду зависящая от кликанья по патронам. Чем быстрее клики - тем быстрее загрузятся патроны.
Очки с зомби и ксеноморфов
REMOVE: `D:\1ss\ShiptestYata\code\modules\surgery\experimental_dissection.dm`: `/datum/surgery_step/dissection/preop`
REMOVE: `code\modules\projectiles\guns\energy.dm`

EDIT: `code/modules/mining/equipment/regenerative_core.dm` - теперь ИПС не смогут жрать ядра для полного отхила, их лечить будет на половину.
EDIT:
`code/modules/mob/living/simple_animal/hostile/mining_mobs/basilisk.dm`
`code/modules/mob/living/simple_animal/hostile/mining_mobs/brimdemon.dm`
`code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/elite.dm`
`code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/goliath_broodmother.dm`
`code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/herald.dm`
`code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/legionnaire.dm`
`code/modules/mob/living/simple_animal/hostile/mining_mobs/elites/pandora.dm`

`code/modules/projectiles/ammunition/_ammunition.dm`

`code/modules/reagents/chemistry/reagents/medicine_reagents.dm`

`code/modules/surgery/tools.dm`

`code/datums/status_effects/buffs.dm`

ADD: 
`code/modules/vending/_vending.dm` : Добавлена вероятность поломки автомата при уничтожение его с вероятностью в 30% что ничего не выпадет с него

Хардсьюты:
EDIT: `code/modules/clothing/spacesuits/hardsuit.dm`
REMOVE: `code/modules/clothing/spacesuits/hardsuit.dm`

EDIT: `code/__DEFINES/turfs.dm`	- Меняем минимальный урон необходимый для снова стены из камня
EDIT: `code/game/turfs/closed/walls.dm` - Меняем хп стены в 2 раза = 800, увеличиваем минимальный порог урона с 8 до 25
EDIT: `code/game/turfs/closed/minerals.dm` - Убираем флаг на минимальный дамаг стене, назначаем числовой параметр. И даем сопротивление стене из камня в 70% и хп в 1200

EDIT: `code/modules/projectiles/projectile.dm` : Меняем систему лежания и попадания по лежачим и стоячи

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

- Отсутствуют
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon/_storge_icons/icons`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:

- Кинетик Крашер, универасльная вендор плата, цены карго, одежда с ЦК, нёрф очков диссекции с спец мобов и её упрощение - Yata9arasu
- Двигатели, рад. коллекторы - RalseiDreemuurr
- Затронуты проджектайлы энергетических дробовиков, батарейки в энерегетических пушках теперь можно вытаскивать руками, убрана возможность вытаскивать батарею в само-заряжающихся пушках. - Molniz
- Ganza Pain Elite Edition Deluxe: баланс трогается всех мобов элитных и простых, Пандора реально может убить вас - Ganza9991
Затронуты патроны .44, .357, slug. Усилены в целом - Deylan
- Изменения попаданий по лежачим - MrCat15352
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
