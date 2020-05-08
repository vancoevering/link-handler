@echo off

:: This batch file is intended to clean game folders from My Documents.

:: The script will mark the game folder as hidden, and symlink its
:: contents into the 'my games' folder.

:: Set some locations
set docs=D:\Documents
set games=%docs%\"my games"

:: List folders in docs folder
dir %docs% /ad-h /b
echo.

:: Ask the user which folder they'd like to hide.
set /p folder_name=Which folder would you like to hide? 
echo.

:: Link the selected folder to the games folder
mklink /j %games%\"%folder_name%" %docs%\"%folder_name%"
echo.

:: Hide the selected folder
attrib +h %docs%\"%folder_name%"

:: Report that the script is complete
echo Script complete. Press any key to exit...

pause>nul