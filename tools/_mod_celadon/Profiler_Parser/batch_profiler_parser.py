#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Batch Profiler JSON Parser
Обрабатывает все файлы profiler.json в указанной папке
"""

import json
import os
import sys
import glob
from datetime import datetime

def format_time(time_value):
    """Форматирует время в читаемый вид"""
    if time_value >= 1:
        return f"{time_value:.3f}s"
    elif time_value >= 0.001:
        return f"{time_value*1000:.1f}ms"
    else:
        return f"{time_value*1000000:.0f}μs"

def create_report(data):
    """Создает краткий отчет из данных профайлера"""
    if not data:
        return "Файл пуст или не содержит данных"
    
    sorted_data = sorted(data, key=lambda x: x.get('total', 0), reverse=True)
    
    output = []
    output.append("=" * 120)
    output.append("ОТЧЕТ ПРОФАЙЛЕРА")
    output.append("=" * 120)
    output.append(f"Дата создания: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append(f"Всего записей: {len(data)}")
    output.append("")
    
    total_calls = sum(item.get('calls', 0) for item in data)
    total_time = sum(item.get('total', 0) for item in data)
    
    output.append("ОБЩАЯ СТАТИСТИКА:")
    output.append(f"  Общее количество вызовов: {total_calls:,}")
    output.append(f"  Общее время выполнения: {format_time(total_time)}")
    output.append("")
    
    output.append("ТОП-20 ФУНКЦИЙ ПО ВРЕМЕНИ ВЫПОЛНЕНИЯ:")
    output.append("-" * 120)
    output.append(f"{'№':<3} {'Функция':<90} {'Время':<10} {'Вызовы':<8}")
    output.append("-" * 120)
    
    for i, item in enumerate(sorted_data[:20], 1):
        name = item.get('name', 'Unknown')
        total = item.get('total', 0)
        calls = item.get('calls', 0)
        
        if len(name) > 87:
            name = name[:84] + "..."
        
        output.append(f"{i:<3} {name:<90} {format_time(total):<10} {calls:<8}")
    
    output.append("")
    
    sorted_by_calls = sorted(data, key=lambda x: x.get('calls', 0), reverse=True)
    output.append("ТОП-20 ФУНКЦИЙ ПО КОЛИЧЕСТВУ ВЫЗОВОВ:")
    output.append("-" * 120)
    output.append(f"{'№':<3} {'Функция':<90} {'Вызовы':<8} {'Время':<10}")
    output.append("-" * 120)
    
    for i, item in enumerate(sorted_by_calls[:20], 1):
        name = item.get('name', 'Unknown')
        total = item.get('total', 0)
        calls = item.get('calls', 0)
        
        if len(name) > 87:
            name = name[:84] + "..."
        
        output.append(f"{i:<3} {name:<90} {calls:<8} {format_time(total):<10}")
    
    return "\n".join(output)

def create_time_report(data):
    """Создает отчет по времени выполнения"""
    if not data:
        return "Файл пуст или не содержит данных"
    
    sorted_data = sorted(data, key=lambda x: x.get('total', 0), reverse=True)
    
    output = []
    output.append("=" * 120)
    output.append("ОТЧЕТ ПО ВРЕМЕНИ ВЫПОЛНЕНИЯ - ВСЕ ФУНКЦИИ")
    output.append("=" * 120)
    output.append(f"Дата создания: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append(f"Всего записей: {len(data)}")
    output.append("")
    
    output.append(f"{'№':<5} {'Функция':<90} {'Время':<10} {'Вызовы':<10} {'Среднее':<10}")
    output.append("-" * 130)
    
    for i, item in enumerate(sorted_data, 1):
        name = item.get('name', 'Unknown')
        total = item.get('total', 0)
        calls = item.get('calls', 0)
        avg = total / calls if calls > 0 else 0
        
        if len(name) > 87:
            name = name[:84] + "..."
        
        output.append(f"{i:<5} {name:<90} {format_time(total):<10} {calls:<10} {format_time(avg):<10}")
    
    return "\n".join(output)

def create_call_report(data):
    """Создает отчет по количеству вызовов"""
    if not data:
        return "Файл пуст или не содержит данных"
    
    sorted_data = sorted(data, key=lambda x: x.get('calls', 0), reverse=True)
    
    output = []
    output.append("=" * 120)
    output.append("ОТЧЕТ ПО КОЛИЧЕСТВУ ВЫЗОВОВ - ВСЕ ФУНКЦИИ")
    output.append("=" * 120)
    output.append(f"Дата создания: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append(f"Всего записей: {len(data)}")
    output.append("")
    
    output.append(f"{'№':<5} {'Функция':<90} {'Вызовы':<10} {'Время':<10} {'Среднее':<10}")
    output.append("-" * 130)
    
    for i, item in enumerate(sorted_data, 1):
        name = item.get('name', 'Unknown')
        total = item.get('total', 0)
        calls = item.get('calls', 0)
        avg = total / calls if calls > 0 else 0
        
        if len(name) > 87:
            name = name[:84] + "..."
        
        output.append(f"{i:<5} {name:<90} {calls:<10} {format_time(total):<10} {format_time(avg):<10}")
    
    return "\n".join(output)

def create_detailed_report(data):
    """Создает детальный отчет по всем функциям"""
    if not data:
        return "Файл пуст или не содержит данных"
    
    sorted_data = sorted(data, key=lambda x: x.get('total', 0), reverse=True)
    
    output = []
    output.append("=" * 120)
    output.append("ДЕТАЛЬНАЯ ИНФОРМАЦИЯ ПО ВСЕМ ФУНКЦИЯМ")
    output.append("=" * 120)
    output.append(f"Дата создания: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append(f"Всего записей: {len(data)}")
    output.append("")
    
    for item in sorted_data:
        name = item.get('name', 'Unknown')
        self_time = item.get('self', 0)
        total_time = item.get('total', 0)
        real_time = item.get('real', 0)
        over_time = item.get('over', 0)
        calls = item.get('calls', 0)
        
        output.append(f"Функция: {name}")
        output.append(f"  Собственное время: {format_time(self_time)}")
        output.append(f"  Общее время: {format_time(total_time)}")
        output.append(f"  Реальное время: {format_time(real_time)}")
        output.append(f"  Превышение: {format_time(over_time)}")
        output.append(f"  Количество вызовов: {calls}")
        if calls > 0:
            output.append(f"  Среднее время на вызов: {format_time(total_time / calls)}")
        output.append("")
    
    return "\n".join(output)

def get_round_id(profiler_file_path):
    """Извлекает ID раунда из game.log"""
    try:
        game_log_path = os.path.join(os.path.dirname(profiler_file_path), "game.log")
        if os.path.exists(game_log_path):
            with open(game_log_path, 'r', encoding='utf-8') as f:
                first_line = f.readline().strip()
                if "Starting up round ID" in first_line:
                    # Ищем число после "Starting up round ID"
                    parts = first_line.split("Starting up round ID")
                    if len(parts) > 1:
                        round_part = parts[1].strip().rstrip('.')
                        if round_part.isdigit():
                            return round_part
        return "unknown"
    except:
        return "unknown"

def process_profiler_file(file_path, base_report_dir):
    """Обрабатывает один файл profiler.json"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        # Получаем ID раунда
        round_id = get_round_id(file_path)
        
        # Создаем папку для этого файла
        now = datetime.now()
        report_date = now.strftime('%Y-%m-%d')
        report_time = now.strftime('%H-%M-%S')
        
        report_dir = os.path.join(base_report_dir, report_date, round_id, report_time)
        os.makedirs(report_dir, exist_ok=True)
        
        # Создаем отчеты
        reports = [
            ("report_top20.txt", create_report(data)),
            ("report_time_run.txt", create_time_report(data)),
            ("report_call.txt", create_call_report(data)),
            ("report_detailed.txt", create_detailed_report(data))
        ]
        
        for filename, content in reports:
            report_path = os.path.join(report_dir, filename)
            with open(report_path, 'w', encoding='utf-8') as f:
                f.write(content)
        
        print(f"Обработан: {file_path} -> {report_dir}")
        return True
        
    except Exception as e:
        print(f"Ошибка при обработке {file_path}: {e}")
        return False

def main():
    print("Batch Profiler JSON Parser")
    print("=" * 40)
    
    # Запрашиваем папку для поиска (можно использовать как относительный, так и полный путь)
    search_dir = input("Введите путь к папке с файлами profiler.json: ").strip()
    print("Примеры: 'data/logs' или 'C:/logs' или '../data/logs'")
    
    if not os.path.exists(search_dir):
        print(f"Ошибка: Папка '{search_dir}' не найдена!")
        input("Нажмите Enter для выхода...")
        return 1
    
    # Ищем все файлы profiler.json
    pattern = os.path.join(search_dir, "**", "profiler.json")
    profiler_files = glob.glob(pattern, recursive=True)
    
    if not profiler_files:
        print(f"В папке '{search_dir}' не найдено файлов profiler.json")
        input("Нажмите Enter для выхода...")
        return 1
    
    print(f"Найдено {len(profiler_files)} файлов profiler.json")
    print("Примечание: Поиск выполняется рекурсивно во всех подпапках")
    
    # Создаем базовую папку для отчетов рядом со скриптом
    script_dir = os.path.dirname(os.path.abspath(__file__))
    base_report_dir = os.path.join(script_dir, "profiler_report")
    os.makedirs(base_report_dir, exist_ok=True)
    
    # Обрабатываем каждый файл
    processed = 0
    for file_path in profiler_files:
        if process_profiler_file(file_path, base_report_dir):
            processed += 1
    
    print(f"\nОбработано файлов: {processed}/{len(profiler_files)}")
    print(f"Отчеты сохранены в: {base_report_dir}")
    input("Нажмите Enter для выхода...")
    return 0

if __name__ == "__main__":
    sys.exit(main())