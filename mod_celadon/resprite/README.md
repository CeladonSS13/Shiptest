

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Респрйты текстур

ID мода: CELADON_RESPRITE
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
-->

### Описание мода

Этот мод содержит респрайты текстурок. Заменяет текстуры на наши.
- Канистры заменились на Сьеровские.
- Камеры охраны заменены на Эрисовские.
- Ковбойские сапоги заменены на новые.
- Мусорки заменены на новые.
- Заменены спрайты шлемов и масок для сарати
- Заменены спрайты, рад коллекторов, эмиттеров, генераторов поля, генераторы электрополя, луч между генераторами поля
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

### Изменения *кор кода*

- ADD:
  - `code/game/objects/items.dm`
    - `var/snout_override_icon`
  - `shiptest.dme`
    - `#include "code\__DEFINES\~mod_celadon\sarathi.dm"`
- EDIT:
  - `code/modules/mob/living/carbon/human/update_icons.dm`
    - if(dna.species.bodytype & BODYTYPE_SNOUT)
			icon_file = SARATHI_SNOUTED_HELM_PATH
			if(I.snout_override_icon)
				icon_file = I.snout_override_icon
			else
				handled_by_bodytype = TRUE
	- if(dna.species.bodytype & BODYTYPE_SNOUT)
				icon_file = SARATHI_SNOUTED_MASK_PATH
				if(I.snout_override_icon)
					icon_file = I.snout_override_icon
			else
				handled_by_bodytype = TRUE
  - `code/modules/shuttle/ripple.dm`
    - `/obj/effect/abstract/ripple/proc/stop_animation()`
	   - `icon_state = "landing_noanim"`

- EDIT: `code\modules\instruments\stationary.dm`: `/obj/structure/musician/piano/Initialize(mapload)` -> изменен прок на выборку спрайта пиано
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

- `code/__DEFINES/~mod_celadon/sarathi.dm`:
  - `SARATHI_SNOUTED_MASK_PATH`
  - `SARATHI_SNOUTED_HELM_PATH`
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon/_storge_icons/icons/resprite`
- `mod_celadon/_storge_icons/icons/helms_snouted.dmi`
- `mod_celadon/_storge_icons/icons/mask_snouted.dmi`
- `mod_celadon/_storge_icons/icons`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:

MrCat15352, Yata9arsu, Kottason, RalseiDreemuurr
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
