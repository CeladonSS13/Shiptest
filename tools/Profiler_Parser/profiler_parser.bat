@echo off
chcp 65001 >nul
echo Profiler JSON Parser (Windows версия)
echo =====================================
echo.

set /p "file_path=Введите путь к файлу profiler.json: "

REM Проверяем, если введено только имя файла
if not "%file_path:~1,1%"==":" (
    if not "%file_path:~0,1%"=="\" (
        set "file_path=%cd%\%file_path%"
    )
)

REM Проверяем существование файла
if not exist "%file_path%" (
    echo Ошибка: Файл '%file_path%' не найден!
    pause
    exit /b 1
)

REM Проверяем наличие Python
python --version >nul 2>&1
if errorlevel 1 (
    echo Ошибка: Python не найден в системе!
    echo Установите Python с https://python.org
    pause
    exit /b 1
)

echo Запускаем Python скрипт...
python "%~dp0profiler_parser.py"

pause