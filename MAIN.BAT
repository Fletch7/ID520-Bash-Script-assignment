@echo off
REM Batch Script Assignment - ID52003 Platforms and Devices
REM Harley Fletcher - 09002657. Year 1, semester 2, 2026.

REM '2>nul && echo Folder created. || echo Folder already exists.' Error handling to prevent windows error messages popping up if folder already exists.

cls
echo Question 1: Output name to console.
echo Answer 1: Harley Fletcher.
echo.
::Don't need a subroutine for question 1. Originally I was using a for loop to loop through questions and answers. 
::I swapped to individual subroutines because I couldn't get the loop to display commands in plain text AND execute those commands.
pause
call :filenameAnswer
:: Creating separate subroutine allows for filename to be dynamically displayed, rather than hardcoding the answer.
:: Filename assigned when subroutine run, not whole batch script.
call :mkdirAnswer
call :mkdirInput
call :mkdirProcessing
call :mkdirOutput
call :listHiddenFiles
call :backupInputData
call :goToRootOfC
call :updateBatchScriptFolderPath
call :displayTimeAndHelloWorld
call :newWindowRedTextGreenBackground
call :blueTextWhiteBackgroundVersionNum
call :alphabeticallySortedFoldersFromSysten32
call :listOfTextFilesUpTo7CharLongInC
pause
goto :eof



:filenameAnswer
echo.
echo Question 2: What is the name of this batch file?
echo Answer 2: The file name is %~nx0.
echo.
pause
goto :eof

:mkdirAnswer
echo.
echo Question 3: Create a folder called 'My Batch Script File Assignment' in the C drive.
echo Answer 3: mkdir "C:\My Batch Script File Assignment"
mkdir "C:\My Batch Script File Assignment" 2>nul && echo Folder has been created. || echo This folder already exists.   
echo.
pause
goto :eof

:mkdirInput
echo.
echo Question 4: Create a folder called 'Input' inside the 'My Batch Script File Assignment' folder.
echo Answer 4: mkdir "C:\My Batch Script File Assignment\Input"
mkdir "C:\My Batch Script File Assignment\Input" 2>nul && echo Folder has been created. || echo This folder already exists.
echo.
pause
goto :eof

:mkdirProcessing
echo.
echo Question 5: Create a folder inside 'My Batch Script File Assignment' called 'Processing'.
echo Answer 5: mkdir "C:\My Batch Script File Assignment\Processing"
mkdir "C:\My Batch Script File Assignment\Processing" 2>nul && echo Folder has been created. || echo This folder already exists.
echo.
pause
goto :eof

:mkdirOutput
echo.
echo Question 6: Create a folder inside 'My Batch Script File Assignment' called 'Output'.
echo Answer 6: mkdir "C:\My Batch Script File Assignment\Output"
mkdir "C:\My Batch Script File Assignment\Output" 2>nul && echo Folder has been created. || echo This folder already exists.
echo.
pause
goto :eof

:listHiddenFiles
echo.
echo Question 7: List all hidden files in the root directory of the C: drive and output the listing to a file called 'Input Data.txt' in the 'Input' subfolder.
echo Answer 7: dir C:\ /a:h ^> "C:\My Batch Script File Assignment\Input\Input Data.txt"
::The ^ allows > to be treated as a literal character rather redirection. Allows full command to e displayed in console as text.
dir C:\ /a:h > "C:\My Batch Script File Assignment\Input\Input Data.txt"
echo.
pause
goto :eof

:backupInputData
echo.
echo Question 8: A8: Make a backup copy of Input Data.txt on the root of the C: drive, and with the same name, but with extension '.bak'
echo Answer 8: copy "C:\My Batch Script File Assignment\Input\Input Data.txt" "C:\Input Data.bak"
copy "C:\My Batch Script File Assignment\Input\Input Data.txt" "C:\Input Data.bak" >nul && echo Backup created. || echo Backup failed.
echo.
pause
goto :eof

:goToRootOfC
echo.
echo Question 9: Change the current directory to the root directory of the C: drive from anywhere.
echo Answer 9: cd /d C:\
cd /d C:\ && echo Current directory changed to C:\ || echo Failed to change directory.
echo.   
pause
goto :eof

:updateBatchScriptFolderPath
echo.
echo Question 10: Update the folder search path for batch script file execution to include the 'Processing' subfolder, and then display the folder search path. 
echo Answer 10: set PATH=^%PATH^%;C:\My Batch Script File Assignment\Processing
echo.
set PATH=%PATH%;C:\My Batch Script File Assignment\Processing
echo Folder search path updated.
echo Filepath has been updated. Current path is - %PATH%.
echo.
pause
goto :eof

:displayTimeAndHelloWorld
echo.
echo Question 11: Change the command prompt to include the time, the words “Hello World” and the '>' character.
prompt $T  Hello World $G$P
echo Current command prompt is: %PROMPT%
echo.
pause
goto :eof

:newWindowRedTextGreenBackground
echo.
echo Question 12: Create a new command window with red coloured text and a green background.
start cmd  /T:24 /K echo "This new window should have the time and 'Hello world' in the prompt. Red rext and a green background."
echo.
pause
goto :eof

:blueTextWhiteBackgroundVersionNum
echo.
echo Question 13: Create a new command window with blue text and a bright white background. Include Windows version number in prompt.
start cmd /T:F1 /K "PROMPT $V$P$G"
echo This new window should have the time and 'Hello world' in the prompt. Blue text and a bright white background.
echo.
pause
goto :eof

:alphabeticallySortedFoldersFromSysten32
echo.
echo Question 14: Save all folders from system32 into text document 'Output\Batch Script File Output Data.txt' saved in Outputs. Folders sorted alphabetically.
dir /B /AD /O:N C:\Windows\System32 > "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
echo Commands used: dir /B /AD /O:N C:\Windows\System32 ^> "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
echo.
pause
goto :eof

:listOfTextFilesUpTo7CharLongInC
echo.
echo Question 15: List all text files on the whole C: drive with names up to seven characters long. List of text file names to be added to the end of previously created text file 'Batch Script File Output Data.txt' in Output.
setlocal enabledelayedexpansion
for /R "C:\" %%i in (*.txt) do(
    set name=%%~ni
    if "!name:~7" == "" echo %%i
) >> "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
echo.
pause
goto :eof