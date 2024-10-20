@ECHO OFF
@ECHO This script will request the path to the Sublime Text 4 FOLDER on your machine
@ECHO IMPORTANT:
@ECHO When you input the path, DO NOT INCLUDE the executable name OR backslash ("\")
@ECHO These are DON'Ts:
@ECHO DON'T: C:\Program Files\Sublime Text 4\sublime_text.exe     <---- This is BAD!
@ECHO DON'T: C:\Program Files\Sublime Text 4\                     <---- This is BAD!
@ECHO This is OKAY:
@ECHO DO:    C:\Program Files\Sublime Text 4                      <---- This is GOOD

SET /p st4Dir= "Enter the FOLDER path to Sublime Text 4: "
SET st4Path= %st4Dir%\sublime_text.exe
 
REM Add it for all file types
@REG ADD "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text"         /t REG_SZ /v "" /d "Open with Sublime Text"   /f
@REG ADD "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text"         /t REG_EXPAND_SZ /v "Icon" /d "%st4Path%,0" /f
@REG add "HKEY_CLASSES_ROOT\*\shell\Open with Sublime Text\command" /t REG_SZ /v "" /d "%st4Path% \"%%1\"" /f
 
REM Add it for folders
@REG ADD "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text"         /t REG_SZ /v "" /d "Open with Sublime Text"   /f
@REG ADD "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text"         /t REG_EXPAND_SZ /v "Icon" /d "%st4Path%,0" /f
@REG ADD "HKEY_CLASSES_ROOT\Folder\shell\Open with Sublime Text\command" /t REG_SZ /v "" /d "%st4Path% \"%%1\"" /f

@ECHO Done!
PAUSE
