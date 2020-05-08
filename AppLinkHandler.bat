@echo off

:: This batch file is intended to clean app folders from My Documents.

:: The script will mark the app folder as hidden, and symlink its
:: contents into the 'my apps' folder.

:: Set some locations
set docs=%~dp0
set docs=%docs:~0,-1%
set apps=%docs%\"my apps"

:: List folders in docs folder
dir %docs% /ad-h /b
echo.

:: Ask the user which folder they'd like to hide.
set /p folder_name=Which folder would you like to hide? 
echo.

:: Link the selected folder to the apps folder
mklink /j %apps%\"%folder_name%" %docs%\"%folder_name%"
echo.

:: Hide the selected folder
attrib +h %docs%\"%folder_name%"

:: Report that the script is complete
echo Script complete. Press any key to exit...

pause>nul