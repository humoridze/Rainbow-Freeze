@echo off
chcp 65001 > nul
title Rainbow Freeze

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo The script must be run as an administrator.
    echo Скрипт должен быть запущен от имени администратора.
    pause
    exit /b
)

:: Выбор языка
:language_selection
cls
echo ######################################
echo #                                    #
echo #         Choose Language            #
echo #          Выберите язык             #
echo #                                    #
echo ######################################
echo.
echo 1. English
echo 2. Русский
echo.
set /p lang_choice=Select a language (1-2): 

if "%lang_choice%"=="1" set lang=EN
if "%lang_choice%"=="2" set lang=RU
if not defined lang goto language_selection

if "%lang%"=="EN" (
    set menu_title=Rainbow Freeze
    set option1=Steam - Normal Version
    set option2=Steam - Vulkan Version
    set option3=Ubisoft - Normal Version
    set option4=Ubisoft - Vulkan Version
    set option5=Go to Website
    set option6=Exit
    set invalid_input=Invalid input. Please try again.
    set confirm_running=Make sure the game is running.
    set website_url=https://github.com/humoridze/Rainbow-Freeze
) else (
    set menu_title=Rainbow Freeze
    set option1=Steam - Обычная версия
    set option2=Steam - Vulkan версия
    set option3=Ubisoft - Обычная версия
    set option4=Ubisoft - Vulkan версия
    set option5=Перейти на сайт
    set option6=Выход
    set invalid_input=Неверный ввод. Попробуйте снова.
    set confirm_running=Убедитесь, что игра запущена.
    set website_url=https://github.com/humoridze/Rainbow-Freeze
)

:menu
cls
echo ######################################
echo #                                    #
echo #         %menu_title%             #
echo #         v. 1.0.0                   #
echo #                                    #
echo ######################################
echo.
echo 1. %option1%
echo 2. %option2%
echo 3. %option3%
echo 4. %option4%
echo 5. %option5%
echo 6. %option6%
echo.
set /p choice=Выберите опцию (1-6): 

if "%choice%"=="1" goto steam_normal
if "%choice%"=="2" goto steam_vulkan
if "%choice%"=="3" goto ubisoft_normal
if "%choice%"=="4" goto ubisoft_vulkan
if "%choice%"=="5" goto website
if "%choice%"=="6" goto exit
echo %invalid_input%
pause
goto menu

:steam_normal
start "" "steam://rungameid/359550"
goto steam_normal_loop

:steam_vulkan
start "" "steam://rungameid/359550//vulkan/"
goto steam_vulkan_loop

:ubisoft_normal
echo %confirm_running%                 
pause
goto ubisoft_normal_loop

:ubisoft_vulkan
echo %confirm_running%                 
pause
goto ubisoft_vulkan_loop

:website
start "" "%website_url%"
pause
goto menu

:steam_normal_loop
timeout /t 600
PowerShell -Command "if (Get-Process -Name RainbowSix -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix).ProcessorAffinity = 8 }"
timeout /t 1
PowerShell -Command "if (Get-Process -Name RainbowSix -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix).ProcessorAffinity = 15 }"
goto steam_normal_loop

:steam_vulkan_loop
timeout /t 600
PowerShell -Command "if (Get-Process -Name RainbowSix_Vulkan -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix_Vulkan).ProcessorAffinity = 8 }"
timeout /t 1
PowerShell -Command "if (Get-Process -Name RainbowSix_Vulkan -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix_Vulkan).ProcessorAffinity = 15 }"
goto steam_vulkan_loop

:ubisoft_normal_loop
timeout /t 600
PowerShell -Command "if (Get-Process -Name RainbowSix -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix).ProcessorAffinity = 8 }"
timeout /t 1
PowerShell -Command "if (Get-Process -Name RainbowSix -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix).ProcessorAffinity = 15 }"
goto ubisoft_normal_loop

:ubisoft_vulkan_loop
timeout /t 600
PowerShell -Command "if (Get-Process -Name RainbowSix_Vulkan -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix_Vulkan).ProcessorAffinity = 8 }"
timeout /t 1
PowerShell -Command "if (Get-Process -Name RainbowSix_Vulkan -ErrorAction SilentlyContinue) { (Get-Process -Name RainbowSix_Vulkan).ProcessorAffinity = 15 }"
goto ubisoft_vulkan_loop

:exit
exit
