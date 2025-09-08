@echo off
chcp 65001 >nul
echo Extracting sprites from DMI file...
echo.

REM Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python not found! Install Python from python.org
    pause
    exit /b 1
)

echo [INFO] Checking dependencies...
pip install Pillow >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Could not install Pillow automatically
    echo Install manually: pip install Pillow
) else (
    echo [OK] Pillow library ready
)

echo.
echo Starting extraction script...
echo =====================================
python extract_dmi_with_names.py

echo.
echo =====================================
echo [DONE] Sprites extracted to extracted_sprites folder
echo Press any key to exit...
pause >nul