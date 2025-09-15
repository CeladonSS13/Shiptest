#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Упрощенный парсер profiler.json без интерактивного ввода
Использование: python simple_profiler_parser.py [путь_к_файлу]
"""

import json
import os
import sys
from datetime import datetime

def format_time(time_value):
    """Форматирует время в читаемый вид"""
    if time_value >= 1:
        return f"{time_value:.3f}s"
    elif time_value >= 0.001:
        return f"{time_value*1000:.1f}ms"
    else:
        return f"{time_value*1000000:.0f}μs"

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

def create_report(data):
    """Создает отчет из данных профайлера"""
    if not data:
        return "Файл пуст или не содержит данных"
    
    # Сортируем по total времени
    sorted_data = sorted(data, key=lambda x: x.get('total', 0), reverse=True)
    
    output = []
    output.append("=" * 80)
    output.append("ОТЧЕТ ПРОФАЙЛЕРА")
    output.append("=" * 80)
    output.append(f"Дата создания: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    output.append(f"Всего записей: {len(data)}")
    output.append("")
    
    # Статистика
    total_calls = sum(item.get('calls', 0) for item in data)
    total_time = sum(item.get('total', 0) for item in data)
    
    output.append("ОБЩАЯ СТАТИСТИКА:")
    output.append(f"  Общее количество вызовов: {total_calls:,}")
    output.append(f"  Общее время выполнения: {format_time(total_time)}")
    output.append("")
    
    # Топ-20 по времени
    output.append("ТОП-20 ФУНКЦИЙ ПО ВРЕМЕНИ ВЫПОЛНЕНИЯ:")
    output.append("-" * 80)
    output.append(f"{'№':<3} {'Функция':<90} {'Время':<10} {'Вызовы':<8}")
    output.append("-" * 120)
    
    for i, item in enumerate(sorted_data[:20], 1):
        name = item.get('name', 'Unknown')
        total = item.get('total', 0)
        calls = item.get('calls', 0)
        
        # Обрезаем длинные имена
        if len(name) > 87:
            name = name[:84] + "..."
        
        output.append(f"{i:<3} {name:<90} {format_time(total):<10} {calls:<8}")
    
    output.append("")
    
    # Топ-20 по вызовам
    sorted_by_calls = sorted(data, key=lambda x: x.get('calls', 0), reverse=True)
    output.append("ТОП-20 ФУНКЦИЙ ПО КОЛИЧЕСТВУ ВЫЗОВОВ:")
    output.append("-" * 80)
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

def main():
    # Определяем путь к файлу (можно использовать как относительный, так и полный путь)
    if len(sys.argv) > 1:
        file_path = sys.argv[1]
    else:
        file_path = "data/logs/2025/06/25/round-2025-06-25 10.07.03/profiler.json"
    
    # Проверяем существование файла
    if not os.path.exists(file_path):
        print(f"Ошибка: Файл '{file_path}' не найден!")
        return 1
    
    try:
        print(f"Обрабатываем файл: {file_path}")
        print("Примечание: Можно использовать как относительный, так и полный путь к файлу")
        
        # Читаем JSON
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        print(f"Загружено {len(data)} записей")
        
        # Создаем отчет
        report = create_report(data)
        
        # Создаем папку для отчетов
        now = datetime.now()
        report_date = now.strftime('%Y-%m-%d')
        report_time = now.strftime('%H-%M-%S')
        report_dir = os.path.join(os.path.dirname(file_path) or '.', f"profiler_report_{report_date}", f"report_{report_time}")
        os.makedirs(report_dir, exist_ok=True)
        
        # Краткий отчет
        output_path = os.path.join(report_dir, "report_top20.txt")
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(report)
        print(f"Краткий отчет сохранен: {output_path}")
        
        # Полный отчет по времени
        time_report_path = os.path.join(report_dir, "report_time_run.txt")
        time_report = create_time_report(data)
        with open(time_report_path, 'w', encoding='utf-8') as f:
            f.write(time_report)
        print(f"Отчет по времени сохранен: {time_report_path}")
        
        # Полный отчет по вызовам
        call_report_path = os.path.join(report_dir, "report_call.txt")
        call_report = create_call_report(data)
        with open(call_report_path, 'w', encoding='utf-8') as f:
            f.write(call_report)
        print(f"Отчет по вызовам сохранен: {call_report_path}")
        
        # Детальный отчет
        detailed_report_path = os.path.join(report_dir, "report_detailed.txt")
        detailed_report = create_detailed_report(data)
        with open(detailed_report_path, 'w', encoding='utf-8') as f:
            f.write(detailed_report)
        print(f"Детальный отчет сохранен: {detailed_report_path}")
        return 0
        
    except json.JSONDecodeError as e:
        print(f"Ошибка парсинга JSON: {e}")
        return 1
    except Exception as e:
        print(f"Ошибка: {e}")
        return 1

if __name__ == "__main__":
    sys.exit(main())