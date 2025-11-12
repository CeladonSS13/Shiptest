#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Тестовый скрипт для проверки парсера
"""

import json
import os
from profiler_parser import parse_profiler_data

def test_parser():
    """Тестирует парсер на реальном файле"""
    file_path = "data/logs/2025/06/25/round-2025-06-25 10.07.03/profiler.json"
    
    if not os.path.exists(file_path):
        print(f"Файл {file_path} не найден!")
        return
    
    print("Читаем файл...")
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        print(f"Загружено {len(data)} записей")
        
        # Создаем отчет
        print("Создаем отчет...")
        report = parse_profiler_data(data)
        
        # Сохраняем отчет
        output_file = "test_profiler_report.txt"
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(report)
        
        print(f"Отчет сохранен в {output_file}")
        
        # Показываем первые строки отчета
        print("\nПервые строки отчета:")
        print("=" * 50)
        lines = report.split('\n')
        for line in lines[:20]:
            print(line)
        
    except Exception as e:
        print(f"Ошибка: {e}")

if __name__ == "__main__":
    test_parser()