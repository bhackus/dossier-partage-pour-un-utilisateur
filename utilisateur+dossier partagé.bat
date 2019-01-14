@echo off
echo Nom du nouvel utilisateur?
set/p "utilisateur=>"
echo Quel mot de passe souhaitez-vous attribuer à %utilisateur%?
set/p "motdepasse=>"
net user %utilisateur% %motdepasse% /add
echo. 
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts /V ^%utilisateur% /T REG_BINARY /D 1
echo %utilisateur% a bien ete cree!
echo Quel est le nom du dossier a creer ?
set/p "nomdossier=>"
mkdir %nomdossier%
echo Quel sera son nom sur le reseau ?
set/p "nomdossierreseau=>"
net share %nomdossierreseau%=%CD%\%nomdossier% /grant:%utilisateur%,FULL
pause>nul

