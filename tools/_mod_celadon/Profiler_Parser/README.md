# Profiler Parser

Набор скриптов для парсинга и анализа файлов `profiler.json`, создаваемых инструментом профилирования.

## Описание

Инструмент профилирования записывает ВСЕ вызовы функций в JSON формате, но читаемость таких файлов очень низкая. Эти скрипты преобразуют JSON данные в удобочитаемые отчеты с анализом производительности.

## Файлы

### Основные скрипты:
- `simple_profiler_parser.py` - **Рекомендуемый** - обработка одного файла с четырьмя отчетами
- `batch_profiler_parser.py` - **Массовая обработка** - обработка всех profiler.json в папке с четырьмя отчетами

### Дополнительные скрипты:
- `test_parser.py` - Тестовый скрипт для проверки работоспособности
- `profiler_parser.sh` - Bash скрипт для Linux/Unix систем (требует jq)
- `profiler_parser_simple.sh` - Упрощенная bash версия без зависимостей
- `profiler_parser.bat` - Batch файл для Windows

### Документация:
- `README_profiler_parser.md` - Данная инструкция

## Использование

### Windows
1. Запустите `profiler_parser.bat`
2. Введите путь к файлу `profiler.json` или просто имя файла, если он в той же папке
3. Скрипт создаст отформатированный отчет в формате `.txt`

### Linux/Unix/macOS

#### Полная версия (требует jq):
1. Установите `jq`: `sudo apt install jq` (Ubuntu/Debian) или `brew install jq` (macOS)
2. Сделайте скрипт исполняемым: `chmod +x profiler_parser.sh`
3. Запустите: `./profiler_parser.sh`

#### Упрощенная версия (без зависимостей):
1. Сделайте скрипт исполняемым: `chmod +x profiler_parser_simple.sh`
2. Запустите: `./profiler_parser_simple.sh`
3. Введите путь к файлу `profiler.json`

### Python (универсальный)

#### Обработка одного файла (рекомендуется):
```bash
python simple_profiler_parser.py [путь_к_файлу]
```
**Путь**: Можно использовать как относительный (`profiler.json`, `data/logs/profiler.json`), так и полный (`C:/logs/profiler.json`)

Создает 4 отчета в структуре папок: `profiler_report/YYYY-MM-DD/report_HH-MM-SS/`

#### Массовая обработка:
```bash
python batch_profiler_parser.py
```
**Путь к папке**: Можно использовать как относительный (`data/logs`, `../logs`), так и полный (`C:/GameServer/logs`)

Обрабатывает все profiler.json в указанной папке рекурсивно. Структура: `profiler_report/YYYY-MM-DD/ID_ROUND/HH-MM-SS/`



#### Тестирование:
```bash
python test_parser.py
```

## Типы отчетов

### Создаваемые файлы:
1. **`report_top20.txt`** - Краткий отчет с топ-20 функций
2. **`report_time_run.txt`** - Полный отчет всех функций по времени выполнения
3. **`report_call.txt`** - Полный отчет всех функций по количеству вызовов
4. **`report_detailed.txt`** - Детальная информация по каждой функции

### Содержание отчетов:

#### Краткий отчет (report_top20.txt):
- Общая статистика (количество записей, вызовов, общее время)
- Топ-20 функций по времени выполнения
- Топ-20 функций по количеству вызовов

#### Полные отчеты (report_time_run.txt / report_call.txt):
- Все функции с детальной информацией:
  - Номер в рейтинге
  - Полное имя функции (до 90 символов)
  - Время выполнения / Количество вызовов
  - Среднее время на вызов

#### Детальный отчет (report_detailed.txt):
- Полная информация по каждой функции:
  - Полное имя функции
  - Собственное время выполнения
  - Общее время (включая вложенные вызовы)
  - Реальное время выполнения
  - Превышение (overhead)
  - Количество вызовов
  - Среднее время на вызов

## Формат входных данных

Скрипт ожидает JSON файл со следующей структурой:
```json
[
  {
    "name": "/datum/controller/subsystem/air/fire",
    "self": 0.044,
    "total": 16.713,
    "real": 16.72,
    "over": 0,
    "calls": 799
  },
  ...
]
```

Где:
- `name` - имя функции/процедуры
- `self` - собственное время выполнения (без вложенных вызовов)
- `total` - общее время выполнения (включая вложенные вызовы)
- `real` - реальное время выполнения
- `over` - превышение времени (overhead)
- `calls` - количество вызовов

## Структура выходных файлов

### Для одного файла (simple_profiler_parser.py):
```
profiler_report/
└── YYYY-MM-DD/
    └── report_HH-MM-SS/
        ├── report_top20.txt
        ├── report_time_run.txt
        ├── report_call.txt
        └── report_detailed.txt
```

### Для массовой обработки (batch_profiler_parser.py):
```
profiler_report/
└── YYYY-MM-DD/
    ├── 1234/                    # ID раунда из game.log
    │   └── HH-MM-SS/
    │       ├── report_top20.txt
    │       ├── report_time_run.txt
    │       ├── report_call.txt
    │       └── report_detailed.txt
    └── unknown/                 # Если ID не найден
        └── HH-MM-SS/
            ├── report_top20.txt
            ├── report_time_run.txt
            ├── report_call.txt
            └── report_detailed.txt
```



## Требования

### Python версия
- Python 3.6 или выше
- Стандартные библиотеки (json, os, sys, datetime)

### Bash версия
- Bash shell
- `profiler_parser.sh`: Утилиты `jq` и `bc`
- `profiler_parser_simple.sh`: Только стандартные утилиты (grep, sed, sort)

### Windows версия
- Windows с поддержкой batch файлов
- Python 3.6+ (для запуска основного скрипта)

## Примеры использования

```bash
# Рекомендуемый способ - обработка одного файла
# Относительный путь:
python simple_profiler_parser.py "data/logs/2025/06/25/round-2025-06-25 10.07.03/profiler.json"
# Полный путь:
python simple_profiler_parser.py "E:/GitRepo/MrCat/data/logs/2025/06/25/round-2025-06-25 10.07.03/profiler.json"

# Массовая обработка всех файлов в папке
python batch_profiler_parser.py
# Относительный путь: data/logs/2025/06/25/
# Полный путь: E:/GitRepo/MrCat/data/logs/

# Linux/Unix (полная версия)
./profiler_parser.sh

# Linux/Unix (упрощенная версия)
./profiler_parser_simple.sh

# Windows
profiler_parser.bat

# Тестирование
python test_parser.py
```

## Особенности

### ID раунда (batch_profiler_parser.py):
- Извлекается из файла `game.log` в той же папке, что и `profiler.json`
- Ищет строку вида "Starting up round ID 1234."
- Если не найден, использует "unknown"

### Форматирование времени:
- Секунды: 1.234s
- Миллисекунды: 123.4ms  
- Микросекунды: 1234μs

### Ширина столбцов:
- Имя функции: 90 символов (обрезается с "...")
- Автоматическое выравнивание данных

## Устранение неполадок

1. **"Файл не найден"** - Проверьте правильность пути. Можно использовать относительные и полные пути
2. **"jq не найден"** (Linux) - Используйте `profiler_parser_simple.sh` или установите: `sudo apt install jq`
3. **"Python не найден"** (Windows) - Установите Python с python.org
4. **Ошибка парсинга JSON** - Проверьте корректность JSON файла
5. **Отчет в одну строку** - Проблема с переносами строк, используйте другой текстовый редактор

## Рекомендации по использованию

1. **Для разового анализа**: `simple_profiler_parser.py`
2. **Для анализа множества файлов**: `batch_profiler_parser.py`  
3. **Для автоматизации**: используйте версии без интерактивного ввода
4. **Для детального исследования**: используйте `report_detailed.txt`

## Лицензия

Скрипты распространяются свободно для использования в проектах SS13/Shiptest.