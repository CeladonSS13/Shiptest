#!/bin/bash

# Profiler JSON Parser - Bash версия
# Парсер для файлов profiler.json

echo "Profiler JSON Parser (Bash версия)"
echo "=================================="

# Функция для форматирования времени
format_time() {
    local time=$1
    if (( $(echo "$time >= 1" | bc -l) )); then
        printf "%.3fs" "$time"
    elif (( $(echo "$time >= 0.001" | bc -l) )); then
        printf "%.1fms" "$(echo "$time * 1000" | bc -l)"
    else
        printf "%.0fμs" "$(echo "$time * 1000000" | bc -l)"
    fi
}

# Запрашиваем путь к файлу
read -p "Введите путь к файлу profiler.json: " file_path

# Проверяем, если введено только имя файла
if [[ "$file_path" != *"/"* ]]; then
    file_path="./$file_path"
fi

# Проверяем существование файла
if [[ ! -f "$file_path" ]]; then
    echo "Ошибка: Файл '$file_path' не найден!"
    read -p "Нажмите Enter для выхода..."
    exit 1
fi

# Проверяем наличие jq
if ! command -v jq &> /dev/null; then
    echo "Ошибка: Для работы скрипта требуется утилита 'jq'"
    echo "Установите её командой: sudo apt install jq (Ubuntu/Debian) или brew install jq (macOS)"
    read -p "Нажмите Enter для выхода..."
    exit 1
fi

echo "Обрабатываем файл..."

# Создаем имя выходного файла
base_name=$(basename "$file_path" .json)
timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="${base_name}_report_${timestamp}.txt"
output_path="$(dirname "$file_path")/$output_file"

# Начинаем создание отчета
{
    echo "================================================================================"
    echo "ОТЧЕТ ПРОФАЙЛЕРА"
    echo "================================================================================"
    echo "Дата создания отчета: $(date '+%Y-%m-%d %H:%M:%S')"
    
    # Подсчитываем общую статистику
    total_records=$(jq 'length' "$file_path")
    total_calls=$(jq '[.[].calls] | add' "$file_path")
    total_time=$(jq '[.[].total] | add' "$file_path")
    max_time=$(jq '[.[].total] | max' "$file_path")
    
    echo "Всего записей: $total_records"
    echo ""
    echo "ОБЩАЯ СТАТИСТИКА:"
    echo "  Общее количество вызовов: $(printf "%'d" "$total_calls")"
    echo "  Общее время выполнения: $(format_time "$total_time")"
    echo "  Максимальное время функции: $(format_time "$max_time")"
    echo ""
    
    echo "ТОП-20 ФУНКЦИЙ ПО ОБЩЕМУ ВРЕМЕНИ ВЫПОЛНЕНИЯ:"
    echo "--------------------------------------------------------------------------------"
    printf "%-3s %-50s %-10s %-8s %-10s\n" "№" "Функция" "Время" "Вызовы" "Среднее"
    echo "--------------------------------------------------------------------------------"
    
    # Топ по времени
    jq -r 'sort_by(-.total) | to_entries | .[:20][] | 
        "\(.key + 1) \(.value.name) \(.value.total) \(.value.calls)"' "$file_path" | \
    while read -r num name total calls; do
        # Обрезаем длинные имена
        if [[ ${#name} -gt 47 ]]; then
            name="${name:0:44}..."
        fi
        
        # Вычисляем среднее
        if [[ $calls -gt 0 ]]; then
            avg=$(echo "scale=6; $total / $calls" | bc -l)
        else
            avg=0
        fi
        
        printf "%-3s %-50s %-10s %-8s %-10s\n" \
            "$num" "$name" "$(format_time "$total")" "$calls" "$(format_time "$avg")"
    done
    
    echo ""
    echo "ТОП-20 ФУНКЦИЙ ПО КОЛИЧЕСТВУ ВЫЗОВОВ:"
    echo "--------------------------------------------------------------------------------"
    printf "%-3s %-50s %-8s %-10s %-10s\n" "№" "Функция" "Вызовы" "Время" "Среднее"
    echo "--------------------------------------------------------------------------------"
    
    # Топ по вызовам
    jq -r 'sort_by(-.calls) | to_entries | .[:20][] | 
        "\(.key + 1) \(.value.name) \(.value.calls) \(.value.total)"' "$file_path" | \
    while read -r num name calls total; do
        if [[ ${#name} -gt 47 ]]; then
            name="${name:0:44}..."
        fi
        
        if [[ $calls -gt 0 ]]; then
            avg=$(echo "scale=6; $total / $calls" | bc -l)
        else
            avg=0
        fi
        
        printf "%-3s %-50s %-8s %-10s %-10s\n" \
            "$num" "$name" "$calls" "$(format_time "$total")" "$(format_time "$avg")"
    done
    
    echo ""
    echo "ДЕТАЛЬНАЯ ИНФОРМАЦИЯ ПО ВСЕМ ФУНКЦИЯМ:"
    echo "================================================================================"
    
    # Детальная информация
    jq -r 'sort_by(-.total)[] | 
        "Функция: \(.name)
  Собственное время: \(.self)
  Общее время: \(.total)
  Реальное время: \(.real)
  Превышение: \(.over)
  Количество вызовов: \(.calls)
"' "$file_path" | \
    while IFS= read -r line; do
        if [[ $line == "Функция: "* ]]; then
            echo "$line"
        elif [[ $line == *"время: "* ]] || [[ $line == *"Превышение: "* ]]; then
            # Извлекаем числовое значение и форматируем
            value=$(echo "$line" | grep -o '[0-9.]*$')
            prefix=$(echo "$line" | sed 's/[0-9.]*$//')
            echo "${prefix}$(format_time "$value")"
        else
            echo "$line"
        fi
    done

} > "$output_path"

echo "Отчет успешно создан: $output_path"
echo "Обработано записей: $total_records"
read -p "Нажмите Enter для выхода..."