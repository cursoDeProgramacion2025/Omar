@echo off
chcp 65001 >nul
title Menu GitHub
setlocal enabledelayedexpansion

REM === Usar la carpeta donde está el .bat ===
set RUTA_LOCAL=%~dp0

:MENU
cls
echo ============================================
echo        MENU DE OPCIONES GIT
echo ============================================
echo 1. Subir cambios (git push)
echo 2. Traer cambios (git pull)
echo 3. Mostrar cambios/últimos commits
echo 0. Salir
echo ============================================
set /p opcion=Elige una opción: 

if "%opcion%"=="1" goto PUSH
if "%opcion%"=="2" goto PULL
if "%opcion%"=="3" goto STATUS
if "%opcion%"=="0" goto SALIR

echo Opcion invalida. Presiona una tecla para continuar...
pause
goto MENU

:PUSH
cd /d "%RUTA_LOCAL%"
echo Ingresar mensaje de commit:
set /p COMMIT_MSG=
git add .
git commit -m "%COMMIT_MSG%"
git push
echo Cambios subidos correctamente.
pause
goto MENU

:PULL
cd /d "%RUTA_LOCAL%"
git pull origin main
echo Cambios descargados correctamente.
pause
goto MENU

:STATUS
cd /d "%RUTA_LOCAL%"
echo --- Cambios pendientes ---
git status
echo --- Últimos commits ---
git log -n 5 --oneline
pause
goto MENU

:SALIR
endlocal
exit