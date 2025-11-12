#### Список PR`ов

- https://github.com/CeladonSS13/Shiptest/pull/2002 (основной PR - INTERCEPTOR v3-FINAL)

## Ship Selection Rework

ID мода: CELADON_SHIP_SELECTION_REWORK

### Описание мода

Полная переработка интерфейса выбора кораблей.

### Изменения *кор кода*
- ADD: `code/modules/asset_cache/asset_list_items.dm`: `datum/asset/simple/faction_logos` - загрузка 8 логотипов фракций
- `code/modules/overmap/ships/ship_application.dm`: 
  - добавлена переменная `var/datum/job/target_job` для хранения целевой профессии
  - дополнен `proc/ui_data()` передачей `job_name` в интерфейс
  - дополнен `proc/application_status_change()` автообновлением Ship Select UI

### Новые файлы модуля (Enhanced Ship Owner Interface)

- `mod_celadon/ship_selection_rework/code/ship_application_enhanced.dm`:
  - Расширение заявки с фото персонажа и информацией о характеристиках
  - Автоматическая генерация фото через `get_flat_human_icon()`
  - Сбор данных о возрасте, квирках, расе и поле персонажа
- `mod_celadon/ship_selection_rework/code/ship_owner_enhanced.dm`:
  - Улучшенный интерфейс владельца корабля
  - Передача расширенных данных о персонаже в UI
  - Использование нового интерфейса `ShipOwnerEnhanced`
- `tgui/packages/tgui/interfaces/ShipOwnerEnhanced.tsx`:
  - Информация о персонаже слева (имя, возраст, квирки, раса)
  - Цветовая индикация статусов и квирков

### Оверрайды

- `mod_celadon/_master_files/code/modules/mob/dead/new_player/ship_select.dm`: 
  - `proc/ui_act()` - перехват и защита join/apply_for_job/cancel_job_application actions
  - `proc/ui_data()` - добавление динамических данных о статусах заявок
  - `proc/handle_protected_join()` - защищённая обработка присоединения к кораблю
  - `proc/handle_protected_job_application()` - обработка заявок на профессии
  - `proc/handle_cancel_job_application()` - отмена заявок
  - `proc/handle_open_faction()` - выбор фракции
  - `proc/handle_back_factions()` - возврат к списку фракций
  - `var/selected_faction` - хранение выбранной фракции

- `code/modules/overmap/ships/ship_application.dm`:
  - `var/target_job` - добавлено поле для хранения целевой профессии
  - `proc/ui_data()` - передача job_name в интерфейс
  - `proc/application_status_change()` - автообновление Ship Select UI

### Дефайны

- Используются существующие: `SHIP_APPLICATION_*` константы из `code/__DEFINES/overmap.dm`

### Используемые файлы, не содержащиеся в модпаке

- `tgui/packages/tgui/interfaces/ShipSelect.js` - основной интерфейс выбора кораблей
- `tgui/packages/tgui/interfaces/FactionButtons.js` - компонент кнопок фракций  
- `tgui/packages/tgui/interfaces/Application.js` - модальное окно заявки
- `mod_celadon/_storage_icons/icons/assets/logo/*.png` - логотипы фракций

### Авторы

- **Основной разработчик:**   Mirag1993/Турон
- **Код-ревью и доработки:** KOCMODECAHTHUK, MysticalFaceLesS
- **AI-ассистент:** Assistant (Claude Sonnet 4)  
