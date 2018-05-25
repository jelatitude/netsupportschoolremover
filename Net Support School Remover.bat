rem Initialisation du titre
title Net Support School Remover v2.0
rem Sauvegarde des variables
setlocal EnableDelayedExpansion
rem Couleur
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)

@echo off
echo Copyright: Jean Eudes LATITUDE / 2017
color 02
echo DBG ACTIF / VER 2.0 release Sept2017
echo DBG : Effacement ecran
cls
echo.
call :colorEcho 0C ------------------------------------------------------------
echo.
call :colorEcho 0e "I"
call :colorEcho 0a "Programme visant a proteger la vie privee des eleves"
call :colorEcho 0e "I"
echo.
call :colorEcho 0C ------------------------------------------------------------
echo.
echo Copyright Jean Eudes Latitude / 2017
echo;
echo;
echo Appuyez sur nimporte quelle touche pour accepter les credits
pause
echo DBG : Acceptation credits; Effacement Ecran
cls
color 0f
echo Ce programme va supprimer l'application nommee "Net Support School Client"
echo Cette application permet la surveillance des postes, la prise de controle
echo du poste, la projection du poste "PROF", et d'autre fonctionnalites diverses
pause
echo DBG : Acceptation de l'explication, Effacement Ecran
cls
echo Cette application va des a present eteindre l'appli "NET SUPPORT". Souhaitez-
echo vous continuer ?
set /p condition1=oui/non?
echo DBG : Condition d'arret demande, validation ou non
if %condition1% EQU oui goto :arret
goto :fin
:arret
echo DBG : Menu arret demarre
title Arret de l'instance ...
cls
echo Veuillez Patienter pendant la fermeture des processus de l'application
echo Si des erreurs apparaissent durant la fermeture d'un processus apparait ...
echo ... ce n'est pas un probleme, le processus a deja ete ferme par un tiers.
taskkill /f /im StudentUI.exe
taskkill /f /im client32.exe
taskkill /f /im runplugin.exe
taskkill /f /im runplugin64.exe
taskkill /f /im jusched.exe
taskkill /f /im jucheck.exe
taskkill /f /im DisplayLinkUserAgent.exe
echo La fermeture des processus 'NET SUPPORT SCHOOL' est terminee !
pause
echo DBG : Execution terminee !
cls
title Suppression de l'instance
echo Voulez vous desinstaller l'application ? (mode BRUTEFORCE)
set /p condition2=oui/non?
if %condition2% EQU oui goto :remove
goto :fin

:remove
title Suppression
echo DBG : Suppression validee, debut de la procedure
cls
call :colorEcho 0C "ATTENTION !!"
echo.
echo CECI EST VOTRE DERNIERE CHANCE D'ANULLER LE PROCESSUS, SI L'APPLICATION EST
echo ARRETEE PENDANT LE PROCESSUS, VOUS AVEZ UN RISQUE D'AVOIR DES PLANTAGES WINDOWS
echo ET DE RENCONTRER DES PROBLEMES DURANT LES PROCHAINS DEMARRAGES DE WINDOWS

set /p derch=Etes vous vraiment sur ? (oui/non) 
if %derch% EQU oui goto :remval
goto :fin
:remval
title Suppression de l'application ...
cls
echo LA SUPPRESSION EST EN COURS ... MERCI DE PATIENTER
echo;
echo;
rem Biensur, on n'est pas des monstres non plus ... on ne degage pas l'application comme ça ...
rem A LA VERSION 1.0 (on va les copier dans le dossier users, meme si on aurait pu creer un dossier specifique)
rem Pour la version 2.0 on cree le dossier TEMP dans C:/ pour garder l'appli qd meme dans le disque...
echo Copie des fichiers de l'application ...
rem creation du dossier temp
mkdir C:\Temp
xcopy "C:\Program Files (x86)\NetSupport" "C:\Temp\" /S
rem C'est bon, tout copie on peut passer a l'effacement du dossier
echo COPIE EFFECTUEE ! PREPARATION A LA SUPPRESSION ...
ping -n 2 127.0.0.1 >nul
echo SUPPRESSION ...
rem effacement du dossier
echo Si des erreurs surviennent pendant cette etape, il se pourrait qu'un
echo autre processus soit en train de travailler dans ce dossier ...
echo ca peut etre problematique ...
rd /S /Q "C:\Program Files (x86)\NetSupport"
echo Si aucune erreur est apparue, c'est OK !
echo Suppression Terminee ! Fini l'espionnage !

goto :fin
:fin
cls
color 04
title Fin du programme
echo Execution du programme terminee, veuillez patienter durant la suppression des fichiers
echo Temporaire
ping -n 2 127.0.0.1 >nul
echo Suppression Terminee !
pause
exit
pause
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
