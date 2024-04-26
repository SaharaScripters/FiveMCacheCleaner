@echo off 

title Sahara Scripters FiveM Cache Cleaner

color 6
echo Starting Cleaner...
timeout /t 3

::FiveM Cache Clearing
echo [Checking FiveM Cache Directories]
IF EXIST "%localappdata%\FiveM\FiveM.app\data\" (
    echo [Clearing FiveM Cache Directories]
    cd /d "%localappdata%\FiveM\FiveM.app\data\"
    rd /s /q cache
    rd /s /q game-storage
    rd /s /q nui-storage
    rd /s /q server-cache
    rd /s /q server-cache-priv
    echo All FiveM Cache Directories Deleted Successfully.
    timeout /t 3

    cls

    color 2
    ::Final messages to show
    echo.
    echo  +------------------------------------+
    echo  ^|                        		 ^|
    echo  ^|[FiveM Cache Directories Deleted]^|
    echo  ^|                        		 ^|
    echo  +------------------------------------+
    timeout /t 5
) ELSE (
    echo FiveM Cache Directories Do Not Exist.
    timeout /t 3
    exit
)

exit
