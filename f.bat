:: TOOL TO SEARCH A KEYWORD FROM THE FILE
::
:: USAGE:
:: F <search str>

:: Author        : shebbars
:: Date          : 12-AUG-2002

@ECHO OFF

SETLOCAL 

SET FILE_EDITOR="C:\Program Files\TextPad 4\TextPad.exe"

SET INSTALL_DIR=%dp0%..

:: MODIFY BELOW FILE TO POINT TO YOUR QUICK LIST FILE
SET DB_FILE=D:\ImportantData\Quick_List.txt

IF NOT EXIST "%DB_FILE%" echo "Database file for quick search" >> "%DB_FILE%"

:ParamCheck
  if {%1}=={} goto usage
  if {%1}=={-help} goto usage
  if {%1}=={/?} goto usage
  if {%1}=={-add} goto addline
  if {%1}=={-edit} goto editfile

echo.

FINDSTR /I "%*" "%DB_FILE%"

GOTO :END 

:addline
shift
echo %* >> "%DB_FILE%"
echo One record added
goto :END


:editfile
echo Opening database file in a editor. Please save b4 close
echo "%DB_FILE%"
%FILE_EDITOR% "%DB_FILE%"
goto :END

:usage
ECHO Improper usage, give any keyword to search.
echo f [text][-add][-edit][-help]

:END
ECHO.

ENDLOCAL
