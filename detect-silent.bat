@echo off
setlocal EnableDelayedExpansion

:: Vérifie si un exécutable est passé en paramètre
if "%~1"=="" (
    echo Déposez votre fichier .exe sur ce script pour tester les modes silencieux.
    pause
    exit /b 1
)

set "installer=%~1"
set "supported="
set "log=test_silent_output.log"
echo Test des switches silencieux pour %installer% > %log%

:: Liste des switches silent courants
for %%S in (/S /SILENT /s /silent /VERYSILENT /veryquiet /QUIET /quiet) do (
    echo.
    echo -> Test du switch %%S...
    echo -> Test du switch %%S... >> %log%
    "%installer%" %%S /HELP >nul 2>&1
    set "ec=!errorlevel!"
    if "!ec!"=="0" (
        echo    [+] Le switch %%S fonctionne
        echo    [+] Le switch %%S fonctionne >> %log%
        set "supported=%%S"
        goto :FOUND
    ) else (
        echo    [-] Le switch %%S ne fonctionne pas
        echo    [-] Le switch %%S ne fonctionne pas >> %log%
    )
)

:FOUND
echo.
if defined supported (
    echo L'installeur supporte le mode silencieux : !supported!
    echo L'installeur supporte le mode silencieux : !supported! >> %log%
    echo Exemple : ShellCall('%ScriptPath%\nom_logiciel.exe !supported!') >> %log%
) else (
    echo Aucune option silencieuse détectée.
    echo Aucune option silencieuse détectée. >> %log%
)

pause
endlocal
