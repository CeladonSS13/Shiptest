import os
import re
from collections import defaultdict
from datetime import datetime

def parse_runtime_logs():
    logs_dir = "logs_runtimes"
    
    if not os.path.exists(logs_dir):
        print(f"Папка {logs_dir} не найдена!")
        return
    
    log_files = [f for f in os.listdir(logs_dir) if f.endswith('.log')]
    if not log_files:
        print("Файлы логов не найдены!")
        return
    
    for log_file in log_files:
        process_single_log(log_file, logs_dir)

def process_single_log(log_file, logs_dir):
    file_path = os.path.join(logs_dir, log_file)
    print(f"Обрабатываю файл: {log_file}")
    
    # Создаем папку для отчетов этого лога
    log_name = os.path.splitext(log_file)[0]
    reports_dir = "reports"
    output_dir = os.path.join(reports_dir, log_name)
    os.makedirs(output_dir, exist_ok=True)
    
    all_runtimes = []
    unique_runtimes = {}
    
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    
    # Паттерн для поиска runtime ошибок
    runtime_pattern = r'\[([^\]]+)\] runtime error: ([^\n]+)\n((?:\s+-[^\n]+\n)*)'
    
    matches = re.finditer(runtime_pattern, content, re.MULTILINE)
    
    for match in matches:
        timestamp = match.group(1)
        error_msg = match.group(2)
        details = match.group(3).strip()
        
        runtime_data = {
            'timestamp': timestamp,
            'error': error_msg,
            'details': details,
            'full_text': match.group(0)
        }
        
        all_runtimes.append(runtime_data)
        
        # Создаем ключ для уникальности на основе ошибки и деталей
        unique_key = f"{error_msg}|{details}"
        if unique_key not in unique_runtimes:
            unique_runtimes[unique_key] = runtime_data
        else:
            # Обновляем счетчик повторений
            if 'count' not in unique_runtimes[unique_key]:
                unique_runtimes[unique_key]['count'] = 1
            unique_runtimes[unique_key]['count'] += 1
    
    # Генерируем отчеты в папку лога
    generate_report(all_runtimes, unique_runtimes, output_dir, log_name)
    generate_summary(unique_runtimes, output_dir, log_name)

def generate_report(all_runtimes, unique_runtimes, output_dir, log_name):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    report_file = os.path.join(output_dir, f"runtime_report_{log_name}_{timestamp}.txt")
    
    with open(report_file, 'w', encoding='utf-8') as f:
        f.write("=" * 80 + "\n")
        f.write("ОТЧЕТ ПО RUNTIME ОШИБКАМ\n")
        f.write("=" * 80 + "\n\n")
        
        f.write(f"Общее количество runtime ошибок: {len(all_runtimes)}\n")
        f.write(f"Количество уникальных runtime ошибок: {len(unique_runtimes)}\n\n")
        
        f.write("=" * 80 + "\n")
        f.write("ДЕТАЛЬНЫЙ АНАЛИЗ УНИКАЛЬНЫХ RUNTIME ОШИБОК\n")
        f.write("=" * 80 + "\n\n")
        
        for i, (key, runtime) in enumerate(unique_runtimes.items(), 1):
            f.write(f"RUNTIME #{i}\n")
            f.write("-" * 40 + "\n")
            f.write(f"Время первого появления: {runtime['timestamp']}\n")
            f.write(f"Ошибка: {runtime['error']}\n")
            
            if 'count' in runtime:
                f.write(f"Количество повторений: {runtime['count']}\n")
            
            f.write(f"Детали:\n{runtime['details']}\n")
            
            # Анализ ошибки
            f.write("\nАНАЛИЗ:\n")
            analyze_runtime_error(f, runtime)
            
            f.write("\n" + "=" * 80 + "\n\n")
    
    print(f"Отчет сохранен в файл: {report_file}")

def analyze_runtime_error(f, runtime):
    error = runtime['error'].lower()
    details = runtime['details']
    
    if 'json_decode error' in error:
        f.write("- Тип: Ошибка парсинга JSON\n")
        f.write("- Причина: Некорректный формат JSON данных\n")
        f.write("- Рекомендация: Проверить источник JSON данных и их валидность\n")
    
    elif 'cannot execute null' in error:
        f.write("- Тип: Ошибка обращения к null объекту\n")
        f.write("- Причина: Попытка вызова метода у несуществующего объекта\n")
        f.write("- Рекомендация: Добавить проверку на null перед вызовом\n")
    
    elif 'cannot read null' in error:
        f.write("- Тип: Ошибка чтения null объекта\n")
        f.write("- Причина: Попытка доступа к свойству несуществующего объекта\n")
        f.write("- Рекомендация: Добавить проверку существования объекта\n")
    
    elif 'bad client' in error:
        f.write("- Тип: Ошибка клиентского соединения\n")
        f.write("- Причина: Проблемы с подключением клиента\n")
        f.write("- Рекомендация: Проверить состояние клиентского соединения\n")
    
    elif 'doubled atmosmachine' in error:
        f.write("- Тип: Ошибка дублирования атмосферного оборудования\n")
        f.write("- Причина: Конфликт в системе атмосферы\n")
        f.write("- Рекомендация: Проверить логику создания атмосферных объектов\n")
    
    else:
        f.write("- Тип: Общая runtime ошибка\n")
        f.write("- Рекомендация: Требуется детальный анализ кода\n")
    
    # Извлекаем файл и строку из деталей
    if 'source file:' in details:
        source_match = re.search(r'source file: ([^,\n]+)', details)
        if source_match:
            f.write(f"- Файл источника: {source_match.group(1)}\n")
    
    if 'proc name:' in details:
        proc_match = re.search(r'proc name: ([^\n]+)', details)
        if proc_match:
            f.write(f"- Процедура: {proc_match.group(1)}\n")

def generate_summary(unique_runtimes, output_dir, log_name):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    summary_file = os.path.join(output_dir, f"runtime_summary_{log_name}_{timestamp}.txt")
    
    with open(summary_file, 'w', encoding='utf-8') as f:
        f.write("КРАТКИЙ СПИСОК RUNTIME ОШИБОК\n")
        f.write("=" * 50 + "\n\n")
        
        for i, (key, runtime) in enumerate(unique_runtimes.items(), 1):
            f.write(f"#{i} - {runtime['error']}\n")
    
    print(f"Краткий список сохранен в файл: {summary_file}")

if __name__ == "__main__":
    parse_runtime_logs()