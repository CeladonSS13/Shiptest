

#### Список PRов:

- https://github.com/MysticalFaceLesS/Shiptest/pulls/#####
<!--
  Ссылки на PRы, связанные с модом:
  - Создание
  - Большие изменения
-->

<!-- Название мода. Не важно на русском или на английском. -->
## Lazy Components

ID мода: CELADON_COMPONENTS, CELADON_COMPONENTS_EMOTE
<!--
  Название модпака прописными буквами, СОЕДИНЁННЫМИ_ПОДЧЁРКИВАНИЕМ,
  которое ты будешь использовать для обозначения файлов.
-->

### Описание мода

Это система оповещений в Discord - components, Префиксы кораблей и Оутфиты для ролей. Система доната.
<!--
  Что он делает, что добавляет: что, куда, зачем и почему - всё здесь.
  А также любая полезная информация.
-->

Глобальные вещи для FOV
`mod_celadon\_components\code\_globals.dm`

Математика для FOV
`mod_celadon\_components\code\maths.dm`

Время для FOV
`mod_celadon\_components\code\time.dm`


### Изменения *кор кода*

- EDIT -> `code\modules\mob\living\carbon\emote.dm`
- REMOVE -> `code\__HELPERS\names.dm`

- ADD -> `code/modules/overmap/ships/controlled_ship_datum.dm` - оповещение о пиратах
- ADD -> `code/modules/overmap/objects/outpost/outpost.dm` - запрет о пиратах
- ADD -> `code/modules/donator/_donator.dm` - CELADON_DONATE
- ADD -> `code/modules/client/verbs/ooc.dm` - CELADON_DONATE
<!--
  Если вы редактировали какие-либо процедуры или переменные в кор коде,
  они должны быть указаны здесь.
  Нужно указать и файл, и процедуры/переменные.

  Изменений нет - напиши "Отсутствуют"
-->

### Оверрайды

- Возможно есть
<!--
  Если ты добавлял новый модульный оверрайд, его нужно указать здесь.
  Здесь указываются оверрайды в твоём моде и папке `_master_files`

  Изменений нет - напиши "Отсутствуют"
-->

### Дефайны

- `code/__DEFINES/~mod_celadon/prefixes.dm`
- `code/__DEFINES/~mod_celadon/emote_panel.dm`
- `code/__DEFINES/~mod_celadon/access.dm`
- `code/__DEFINES/~mod_celadon/names.dm`
- `code/__DEFINES/~mod_celadon/donate.dm`

- `#define FACTION_SYNDICATE "Syndicate"`
- `#define FACTION_SOLFED "SolGov"`
- `#define FACTION_INTEQ "Inteq Risk Management Group"`
- `#define FACTION_NT "Nanotrasen"`
- `#define FACTION_INDEPENDENT "Independent"`
- `#define FACTION_ELYSIUM "Elysium"`
- `#define PREFIX_SYNDICATE list("SEV", "SSV", "SMMV", "PCAC", "SSASV", "SSSV", "SOSSV", "TSSV", "SABSV", "BSSV", "ASSV", "MSSV", "LSSV", "DSSV")`
- `#define PREFIX_SOLFED list("SFSV", "BSFSV", "ASFSV", "SSFSV", "MDSFSV", "LSFSV", "MSFSV", "SPSFSV")`
- `#define PREFIX_INTEQ list("IRMV", "IQMSSV", "BIQSV", "LIQSV", "SPIQSV")`
- `#define PREFIX_NT list("NTSV", "NTBSV", "NTASV", "NTSSV", "NTTSV", "NTMSV", "NTLSV", "NTDSV", "NTSPSV",)`
- `#define PREFIX_INDEPENDENT list("SV", "IMV", "ISV")`
- `#define PREFIX_ELYSIUM list("EUSM", "EUSQ", "EUSF", "EUSR",)`
- `#define PREFIX_PIRATES list("PIRATE")`
- `#define VIP_GHOST_TIER1_LIST`
- `#define VIP_GHOST_TIER3_LIST`
<!--
  Если требовалось добавить какие-либо дефайны, укажи файлы,
  в которые ты их добавил, а также перечисли имена.
  И то же самое, если ты используешь дефайны, определённые другим модом.

  Не используешь - напиши "Отсутствуют"
-->

### Используемые файлы, не содержащиеся в модпаке

- `mod_celadon/_storge_sounds/sound`
<!--
  Будь то немодульный файл или модульный файл, который не содержится в папке,
  принадлежащей этому конкретному моду, он должен быть упомянут здесь.
  Хорошими примерами являются иконки или звуки, которые используются одновременно
  несколькими модулями, или что-либо подобное.
-->

### Авторы:

Mirag1993, Voiko, RalseiDreemuurr, Ganza9991
<!--
  Здесь находится твой никнейм
  Если работал совместно - никнеймы тех, кто помогал.
  В случае порта чего-либо должна быть ссылка на источник.
-->
