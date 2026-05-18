#!/bin/bash

# Простой парсер profiler.json без зависимостей
echo "Profiler JSON Parser (простая версия)"
echo "===================================="

while true; do
    read -p "Введите путь к файлу profiler.json: " file_path
    
    if [[ "$file_path" != *"/"* ]]; then
        file_path="./$file_path"
    fi
    
    if [[ -f "$file_path" ]]; then
        break
    else
        echo "Ошибка: Файл '$file_path' не найден! Попробуйте еще раз."
    fi
done

echo "Обрабатываем файл..."

base_name=$(basename "$file_path" .json)
timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="${base_name}_report_${timestamp}.txt"
output_path="$(dirname "$file_path")/$output_file"

{
    echo "================================================================================"
    echo "ОТЧЕТ ПРОФАЙЛЕРА"
    echo "================================================================================"
    echo "Дата создания отчета: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Исходный файл: $file_path"
    echo ""
    
    # Простой подсчет записей
    total_records=$(grep -o '"name"' "$file_path" | wc -l)
    echo "Всего записей: $total_records"
    echo ""
    
    echo "ФУНКЦИИ С НАИБОЛЬШИМ ВРЕМЕНЕМ ВЫПОЛНЕНИЯ:"
    echo "--------------------------------------------------------------------------------"
    
    # Извлекаем данные и сортируем по total времени
    grep -o '"name":"[^"]*","self":[0-9.]*,"total":[0-9.]*,"real":[0-9.]*,"over":[0-9.]*,"calls":[0-9]*' "$file_path" | \
    sed 's/"name":"//g; s/","self":/|/g; s/,"total":/|/g; s/,"real":/|/g; s/,"over":/|/g; s/,"calls":/|/g' | \
    sort -t'|' -k3 -nr | \
    head -20 | \
    nl | \
    while IFS='|' read -r num name self total real over calls; do
        # Обрезаем длинные имена
        if [[ ${#name} -gt 50 ]]; then
            name="${name:0:47}..."
        fi
        printf "%2s. %-50s %8ss (%s вызовов)\n" "$num" "$name" "$total" "$calls"
    done
    
    echo ""
    echo "ФУНКЦИИ С НАИБОЛЬШИМ КОЛИЧЕСТВОМ ВЫЗОВОВ:"
    echo "--------------------------------------------------------------------------------"
    
    # Сортируем по количеству вызовов
    grep -o '"name":"[^"]*","self":[0-9.]*,"total":[0-9.]*,"real":[0-9.]*,"over":[0-9.]*,"calls":[0-9]*' "$file_path" | \
    sed 's/"name":"//g; s/","self":/|/g; s/,"total":/|/g; s/,"real":/|/g; s/,"over":/|/g; s/,"calls":/|/g' | \
    sort -t'|' -k6 -nr | \
    head -20 | \
    nl | \
    while IFS='|' read -r num name self total real over calls; do
        if [[ ${#name} -gt 50 ]]; then
            name="${name:0:47}..."
        fi
        printf "%2s. %-50s %8s вызовов (%ss)\n" "$num" "$name" "$calls" "$total"
    done
    
    echo ""
    echo "ПОДСИСТЕМЫ (SUBSYSTEMS):"
    echo "--------------------------------------------------------------------------------"
    
    # Ищем подсистемы
    grep -o '"name":"[^"]*subsystem[^"]*","self":[0-9.]*,"total":[0-9.]*,"real":[0-9.]*,"over":[0-9.]*,"calls":[0-9]*' "$file_path" | \
    sed 's/"name":"//g; s/","self":/|/g; s/,"total":/|/g; s/,"real":/|/g; s/,"over":/|/g; s/,"calls":/|/g' | \
    sort -t'|' -k3 -nr | \
    head -10 | \
    nl | \
    while IFS='|' read -r num name self total real over calls; do
        # Извлекаем имя подсистемы
        subsystem_name=$(echo "$name" | sed 's|.*/||g')
        printf "%2s. %-30s %8ss (%s вызовов)\n" "$num" "$subsystem_name" "$total" "$calls"
    done
    
    echo ""
    echo "ДЕТАЛЬНАЯ ИНФОРМАЦИЯ:"
    echo "================================================================================"
    
    # Показываем все записи отсортированные по времени
    grep -o '"name":"[^"]*","self":[0-9.]*,"total":[0-9.]*,"real":[0-9.]*,"over":[0-9.]*,"calls":[0-9]*' "$file_path" | \
    sed 's/"name":"//g; s/","self":/|/g; s/,"total":/|/g; s/,"real":/|/g; s/,"over":/|/g; s/,"calls":/|/g' | \
    sort -t'|' -k3 -nr | \
    while IFS='|' read -r name self total real over calls; do
        echo "Функция: $name"
        echo "  Собственное время: ${self}s"
        echo "  Общее время: ${total}s"
        echo "  Реальное время: ${real}s"
        echo "  Превышение: ${over}s"
        echo "  Количество вызовов: $calls"
        if [[ $calls -gt 0 ]]; then
            avg=$(echo "scale=6; $total / $calls" | bc -l 2>/dev/null || echo "N/A")
            echo "  Среднее время на вызов: ${avg}s"
        fi
        echo ""
    done

} > "$output_path"

echo "Отчет создан: $output_path"
echo "Обработано записей: $total_records"