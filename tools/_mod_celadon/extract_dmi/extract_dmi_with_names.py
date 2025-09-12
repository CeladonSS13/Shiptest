#!/usr/bin/env python3
import os
import re
from PIL import Image
from PIL.PngImagePlugin import PngInfo

def parse_dmi_metadata(dmi_path):
    """Извлекает метаданные из DMI файла"""
    
    try:
        img = Image.open(dmi_path)
        
        # DMI метаданные хранятся в zTXt чанке
        metadata = img.text.get('Description', '')
        
        if not metadata:
            print("Метаданные DMI не найдены")
            return None
        
        print(f"Найдены метаданные: {len(metadata)} символов")
        
        # Парсим метаданные DMI
        states = []
        lines = metadata.split('\n')
        
        current_state = None
        for line in lines:
            line = line.strip()
            
            # Ищем определения состояний
            if line.startswith('state = '):
                state_name = line.split('=', 1)[1].strip().strip('"')
                current_state = {'name': state_name, 'frames': 1, 'dirs': 1}
                states.append(current_state)
                print(f"Найден спрайт: {state_name}")
            
            elif current_state and line.startswith('frames = '):
                current_state['frames'] = int(line.split('=')[1].strip())
            
            elif current_state and line.startswith('dirs = '):
                current_state['dirs'] = int(line.split('=')[1].strip())
        
        print(f"Всего найдено спрайтов: {len(states)}")
        return states if states else None
        
    except Exception as e:
        print(f"Ошибка парсинга метаданных: {e}")
        return None

def get_naming_mode():
    """Получает режим именования от пользователя"""
    print("\n┌──────────────────────────────────────────────────────────────────────┐")
    print("│                    РЕЖИМ ИМЕНОВАНИЯ ФАЙЛОВ                    │")
    print("├──────────────────────────────────────────────────────────────────────┤")
    print("│ 0. Оригинальные имена спрайтов                           │")
    print("│    Пример: layer1_0.png, asteroids.png                    │")
    print("├──────────────────────────────────────────────────────────────────────┤")
    print("│ 1. Добавить префикс к оригинальным именам               │")
    print("│    Пример: parallax_layer1_0.png, my_asteroids.png        │")
    print("├──────────────────────────────────────────────────────────────────────┤")
    print("│ 2. Заменить имена на префикс + нумерация             │")
    print("│    Пример: sprite_001.png, parallax_002.png             │")
    print("└──────────────────────────────────────────────────────────────────────┘")
    
    while True:
        try:
            mode = int(input("\n➤ Введите номер режима (0-2): "))
            if mode in [0, 1, 2]:
                print(f"[✓] Выбран режим {mode}")
                return mode
            else:
                print("[✗] Ошибка: Введите число от 0 до 2")
        except ValueError:
            print("[✗] Ошибка: Введите корректное число")

def get_prefix():
    """Получает префикс от пользователя"""
    print("\n┌──────────────────────────────────────────────────────────────────────┐")
    print("│                         ПРЕФИКС ФАЙЛОВ                         │")
    print("└──────────────────────────────────────────────────────────────────────┘")
    prefix = input("➤ Введите префикс (или Enter для 'sprite'): ").strip()
    result = prefix if prefix else "sprite"
    print(f"[✓] Префикс: '{result}'")
    return result

def get_format():
    """Получает формат файлов от пользователя"""
    formats = {1: "PNG", 2: "JPEG", 3: "GIF", 4: "BMP"}
    extensions = {1: "png", 2: "jpg", 3: "gif", 4: "bmp"}
    descriptions = {
        1: "Лучшее качество, поддержка прозрачности",
        2: "Меньший размер, без прозрачности",
        3: "Отдельные кадры GIF (не анимация)",
        4: "Без сжатия, большой размер"
    }
    
    print("\n┌──────────────────────────────────────────────────────────────────────┐")
    print("│                        ФОРМАТ ВЫХОДНЫХ ФАЙЛОВ                        │")
    print("├──────────────────────────────────────────────────────────────────────┤")
    
    for i in range(1, 5):
        print(f"│ {i}. {formats[i]:<4} - {descriptions[i]:<55} │")
    
    print("└──────────────────────────────────────────────────────────────────────┘")
    
    while True:
        try:
            choice = int(input("\n➤ Введите номер формата (1-4): "))
            if choice in formats:
                print(f"[✓] Выбран формат: {formats[choice]}")
                return formats[choice], extensions[choice]
            else:
                print("[✗] Ошибка: Введите число от 1 до 4")
        except ValueError:
            print("[✗] Ошибка: Введите корректное число")

def extract_dmi_with_names(dmi_path, output_dir, naming_mode=0, prefix="", file_format="PNG", file_ext="png"):
    """Извлекает спрайты с настраиваемыми названиями"""
    
    img = Image.open(dmi_path)
    total_width, total_height = img.size
    
    # Размер спрайта
    sprite_width = 480 if 'parallax' in dmi_path.lower() else 32
    sprite_height = 480 if 'parallax' in dmi_path.lower() else 32
    
    # Пробуем извлечь метаданные
    states = parse_dmi_metadata(dmi_path)
    
    os.makedirs(output_dir, exist_ok=True)
    
    # Создаем папки для слоев паралакса
    if 'parallax' in dmi_path.lower():
        layer_folders = ['layer1', 'layer2', 'layer3', 'layer4']
        for folder in layer_folders:
            layer_path = os.path.join(output_dir, folder)
            os.makedirs(layer_path, exist_ok=True)
            print(f"[✓] Создана папка: {folder}/")
    
    cols = total_width // sprite_width
    rows = total_height // sprite_height
    
    sprite_index = 0
    
    if states and naming_mode in [0, 1]:
        # Используем названия из метаданных
        extracted_files = []
        
        for state in states:
            for frame in range(state['frames']):
                for direction in range(state['dirs']):
                    if sprite_index >= cols * rows:
                        break
                    
                    row = sprite_index // cols
                    col = sprite_index % cols
                    
                    left = col * sprite_width
                    top = row * sprite_height
                    right = left + sprite_width
                    bottom = top + sprite_height
                    
                    sprite = img.crop((left, top, right, bottom))
                    
                    # Конвертируем RGBA в RGB для JPG
                    if file_format == "JPEG" and sprite.mode == "RGBA":
                        # Создаем белый фон
                        background = Image.new("RGB", sprite.size, (255, 255, 255))
                        background.paste(sprite, mask=sprite.split()[-1])  # Используем альфа-канал как маску
                        sprite = background
                    
                    # Сначала сохраняем с оригинальным именем
                    if state['frames'] > 1 or state['dirs'] > 1:
                        original_name = f"{state['name']}_f{frame}_d{direction}.{file_ext}"
                    else:
                        original_name = f"{state['name']}.{file_ext}"
                    
                    # Определяем папку для паралакса
                    if 'parallax' in dmi_path.lower():
                        layer_folder = get_layer_folder(state['name'])
                        if layer_folder:
                            save_dir = os.path.join(output_dir, layer_folder)
                        else:
                            save_dir = output_dir
                    else:
                        save_dir = output_dir
                    
                    output_path = os.path.join(save_dir, original_name)
                    sprite.save(output_path, file_format)
                    
                    extracted_files.append(original_name)
                    print(f"Извлечен: {original_name}")
                    sprite_index += 1
        
        # Для режима 1: переименовываем файлы
        if naming_mode == 1 and prefix:
            print(f"\nПереименовываем файлы с префиксом '{prefix}'...")
            for original_name in extracted_files:
                old_path = os.path.join(output_dir, original_name)
                new_name = f"{prefix}{original_name}"
                new_path = os.path.join(output_dir, new_name)
                
                try:
                    os.rename(old_path, new_path)
                    print(f"Переименован: {original_name} -> {new_name}")
                except Exception as e:
                    print(f"Ошибка переименования {original_name}: {e}")
    # Режим 2 или fallback: префикс + нумерация
    if naming_mode == 2 or not states:
        print(f"Используем нумерацию (режим {naming_mode})")
        for row in range(rows):
            for col in range(cols):
                left = col * sprite_width
                top = row * sprite_height
                right = left + sprite_width
                bottom = top + sprite_height
                
                sprite = img.crop((left, top, right, bottom))
                
                # Конвертируем RGBA в RGB для JPG
                if file_format == "JPEG" and sprite.mode == "RGBA":
                    background = Image.new("RGB", sprite.size, (255, 255, 255))
                    background.paste(sprite, mask=sprite.split()[-1])
                    sprite = background
                
                if naming_mode == 2 and prefix:
                    filename = f"{prefix}_{sprite_index:03d}.{file_ext}"
                else:
                    filename = f"sprite_{sprite_index:03d}.{file_ext}"
                
                # Для режима 2 сохраняем в основную папку
                output_path = os.path.join(output_dir, filename)
                sprite.save(output_path, file_format)
                
                print(f"Извлечен: {filename}")
                sprite_index += 1
    
    print(f"Всего извлечено {sprite_index} спрайтов")

def get_layer_folder(sprite_name):
    """Определяет в какую папку поместить спрайт по его имени"""
    name = sprite_name.lower()
    
    # Layer 1 - Звезды
    if name.startswith('layer1'):
        return 'layer1'
    
    # Layer 2 - Туманности
    if name.startswith('layer2'):
        return 'layer2'
    
    # Layer 3 - Передний план
    if name.startswith('layer3'):
        return 'layer3'
    
    # Layer 4 - Объекты
    if name in ['asteroids', 'gas', 'trash', 'infection', 'empty']:
        return 'layer4'
    
    # Неизвестные спрайты - в основную папку
    return None

def main_menu():
    """Основное меню программы"""
    while True:
        print("\n" + "="*70)
        print("┌────────────────────────────────────────────────────────────────────┐")
        print("│              ИЗВЛЕЧЕНИЕ СПРАЙТОВ ИЗ DMI ФАЙЛОВ              │")
        print("│                      Версия 2.0 - Полный контроль                      │")
        print("└────────────────────────────────────────────────────────────────────┘")
        
        # Ввод имени файла
        dmi_file = input("\n➤ Введите имя DMI файла (или Enter для 'parallax.dmi'): ").strip()
        if not dmi_file:
            dmi_file = "parallax.dmi"
        
        if not os.path.exists(dmi_file):
            print(f"\n[✗] Ошибка: Файл '{dmi_file}' не найден!")
            print("Поместите DMI файл в папку со скриптом и попробуйте снова.")
            input("\nНажмите Enter для продолжения...")
            continue
        
        print(f"[✓] Файл '{dmi_file}' найден")
        
        # Настройки
        naming_mode = get_naming_mode()
        
        prefix = ""
        if naming_mode in [1, 2]:
            prefix = get_prefix()
        
        file_format, file_ext = get_format()
        
        # Подтверждение
        print("\n" + "─"*70)
        print("┌────────────────────────────────────────────────────────────────────┐")
        print("│                      ПОДТВЕРЖДЕНИЕ НАСТРОЕК                      │")
        print("├────────────────────────────────────────────────────────────────────┤")
        print(f"│ Файл:     {dmi_file:<50} │")
        print(f"│ Режим:     {naming_mode} ({'Original' if naming_mode == 0 else 'Prefix+Original' if naming_mode == 1 else 'Prefix+Numbers'}){' '*(35-len(str(naming_mode)))} │")
        if prefix:
            print(f"│ Префикс:  {prefix:<50} │")
        print(f"│ Формат:   {file_format} (.{file_ext}){' '*(44-len(file_format)-len(file_ext))} │")
        print("└────────────────────────────────────────────────────────────────────┘")
        
        confirm = input("\n➤ Начать извлечение? (y/n): ").lower()
        if confirm in ['y', 'yes', 'да', 'д']:
            # Создаем папку по имени DMI файла
            base_name = os.path.splitext(dmi_file)[0]  # Убираем расширение
            output_folder = f"extracted_{base_name}"
            
            print("\n" + "─"*70)
            print(f"[▶] Начинаем извлечение из '{dmi_file}'...")
            print("─"*70)
            
            try:
                extract_dmi_with_names(dmi_file, output_folder, naming_mode, prefix, file_format, file_ext)
                
                print("\n" + "─"*70)
                print("┌────────────────────────────────────────────────────────────────────┐")
                print("│                        ✓ ИЗВЛЕЧЕНИЕ ЗАВЕРШЕНО ✓                        │")
                print("├────────────────────────────────────────────────────────────────────┤")
                print(f"│ Спрайты сохранены в папке: {output_folder:<30} │")
                print("│ Теперь вы можете использовать их в своих проектах!        │")
                print("└────────────────────────────────────────────────────────────────────┘")
                
            except Exception as e:
                print(f"\n[✗] Ошибка при извлечении: {e}")
            
            # Предложение повторить
            repeat = input("\n➤ Извлечь ещё один файл? (y/n): ").lower()
            if repeat not in ['y', 'yes', 'да', 'д']:
                print("\n┌────────────────────────────────────────────────────────────────────┐")
                print("│                 Спасибо за использование программы!                 │")
                print("│                    Закройте окно для выхода                     │")
                print("└────────────────────────────────────────────────────────────────────┘")
                break
        else:
            print("[ℹ] Операция отменена")

if __name__ == "__main__":
    main_menu()