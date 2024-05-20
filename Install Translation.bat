
::@echo off
setlocal enableextensions

cd %~dp0
md "Backup Directory"


copy Cfg.ini "Backup Directory"
move en "Backup Directory"
move sc "Backup Directory"

for /f "delims=" %%i in ('type "Cfg.ini"' ) do (
    echo %%i | find /i "Lang" > nul || echo %%i | find /i "ShowPower" > nul
    if  errorlevel 1 (
        echo %%i | find /i "DEV_1" > nul
        if not errorlevel 1 (
            echo ShowPower=0 >> config.ini
            echo Lang1=Portuguese,languages/pt >> config.ini
            echo Lang2=English,languages/en >> config.ini
            echo Lang3=Simplified Chinese,languages/sc >> config.ini
        )
        echo %%i >> config.ini
    )
)


del Cfg.ini
ren config.ini Cfg.ini
echo "Alteracoes realizadas com sucesso, favor abrir novamente o software do mouse."
echo " Caso deseje desfazer a alteracao clique em 'UninstallTranslation"
echo "Voce ja pode fechar essa aba"
timeout /t -1
endlocal