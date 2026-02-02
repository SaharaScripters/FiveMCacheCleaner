@echo off
setlocal

title Sahara Scripters FiveM Cache Cleaner
color 6

echo Starting cleaner...
timeout /t 3 /nobreak >nul

set "FIVEM_DATA=%localappdata%\FiveM\FiveM.app\data"

echo [Checking FiveM Cache Directories]
if exist "%FIVEM_DATA%\" (
    echo [FiveM data directory found]
    echo [Clearing FiveM cache...]

    call :DeleteDir "cache"
    call :DeleteDir "game-storage"
    call :DeleteDir "nui-storage"
    call :DeleteDir "server-cache"
    call :DeleteDir "server-cache-priv"

    timeout /t 2 /nobreak >nul
    cls
    color 2

    echo.
    echo  +------------------------------------+
    echo  ^|                                    ^|
    echo  ^| [FiveM Cache Directories Deleted] ^|
    echo  ^|                                    ^|
    echo  +------------------------------------+
    timeout /t 5 /nobreak >nul
) else (
    color 4
    echo FiveM data directory not found:
    echo "%FIVEM_DATA%"
    timeout /t 5 /nobreak >nul
)

exit /b 0


::---------------------------
:: Delete directory safely
::---------------------------
:DeleteDir
if exist "%FIVEM_DATA%\%~1" (
    echo Deleting %~1...
    rd /s /q "%FIVEM_DATA%\%~1"
) else (
    echo %~1 not found, skipping.
)
exit /b
