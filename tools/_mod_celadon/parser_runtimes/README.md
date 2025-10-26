### Структура папок
```
parser_runtimes/
├── logs_runtimes/          # Поместите сюда файлы логов (.log)
├── runtime_parser.py       # Основной скрипт
└── README.md              # Эта инструкция
```

### Добавление логов
1. Создайте папку `logs_runtimes` (если её нет)
2. Поместите файлы логов с расширением `.log` в эту папку
3. Пример: `runtime.log`, `server_log.log`, `debug.log`

### Запуск скрипта
Откройте командную строку в папке со скриптом и выполните:
```bash
python runtime_parser.py
```

## Результат работы

После запуска скрипт создаст папку `reports/` со следующей структурой:
```
reports/
├── runtime/                # Отчеты для runtime.log
│   ├── runtime_report_runtime_YYYYMMDD_HHMMSS.txt
│   └── runtime_summary_runtime_YYYYMMDD_HHMMSS.txt
└── server_log/             # Отчеты для server_log.log
    ├── runtime_report_server_log_YYYYMMDD_HHMMSS.txt
    └── runtime_summary_server_log_YYYYMMDD_HHMMSS.txt
```

## Типы отчетов

### 1. Подробный отчет (`runtime_report_*.txt`)
- Общая статистика ошибок
- Детальный анализ каждой уникальной ошибки
- Рекомендации по исправлению
- Информация о файлах и процедурах

### 2. Краткий список (`runtime_summary_*.txt`)
- Нумерованный список всех уникальных ошибок
- Быстрый обзор проблем

## Поддерживаемые форматы

Скрипт ищет строки в формате:
```
[YYYY-MM-DD HH:MM:SS.mmm] runtime error: описание ошибки
 - proc name: название процедуры
 -   source file: путь к файлу
 -   дополнительная информация
```

## Требования

- Python 3.6+
- Стандартные библиотеки: `os`, `re`, `datetime`
