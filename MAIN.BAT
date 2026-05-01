@ECHO off
REM Batch Script Assignment - ID52003 Platforms and Devices
REM Harley Fletcher - 09002657. Year 1, semester 2, 2026.

REM '2>nul && ECHO Folder created. || ECHO Folder already exists.' Error handling to prevent windows error messages popping up IF folder already exists.

CLS
ECHO.
ECHO Question 1: Output name to console. Command used - ECHO. Outputs plain text to console window.
ECHO.
ECHO Answer 1: Harley Fletcher.
ECHO.
::Don't need a subroutine FOR question 1. Originally I was using a FOR loop to loop through questions and answers. 
::I swapped to individual subroutines because I couldn't get the loop to display commands in plain text AND execute those commands.
PAUSE
CALL :filenameAnswer
:: Creating separate subroutine allows FOR filename to be dynamically displayed, rather than hardcoding the answer.
:: Filename assigned when subroutine run, not whole batch script.
CALL :mkdirAnswer
CALL :mkdirInput
CALL :mkdirProcessing
CALL :mkdirOutput
CALL :listHiddenFiles
CALL :backupInputData
CALL :goToRootOfC
CALL :updateBatchScriptFolderPath
CALL :displayTimeAndHelloWorld
CALL :newWindowRedTextGreenBackground
CALL :blueTextWhiteBackgroundVersionNum
CALL :alphabeticallySortedFoldersFromSysten32

ECHO.
ECHO.
ECHO.
ECHO Question 15: List all text files on the whole C: drive with names up to seven characters long. List of text file names to be added to the end of previously created text file 'Batch Script File Output Data.txt' in Output.
ECHO Command used - FOR, SET, IF. For loop recursively loops through all folders on C:\. It looks for all text documents, returning the text document name and setting that name to 'name'.
ECHO If statement returns a true or false value based on whether or not the space after the 7th character is blank. If it returns true (yes its blank), it appends the seven or less letter text document to Output\Batch Script File Output Data.txt
ECHO If it returns false it will skip the ECHO. A text document called 'seventh seventh.txt' would return still return true.
ECHO.
ECHO Answer 15: Loop used - 
ECHO FOR /R "C:\" %%i in (*.txt) do (
ECHO SET name=%%~ni
ECHO IF ^"^!name:~7!" == "" ECHO %%i
ECHO ) ^>^> "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
ECHO.
:: /C allows FOR user input selection. Y assigned value of 1, N assigned value of 2 and both saved under corresponding 'errorlevel' tags. Choosing to skip 15 runs the blank subroutine :skipQuestion15.
:: Script just continues on from 16. /M allows FOR console message to be displayed.
CHOICE /C YN /M "This will run through every folder on the C: drive, do you really want to do this? It'll take ages. Y / N?"
IF errorlevel 2 CALL :skipQuestion15
IF errorlevel 1 CALL :listOfTextFilesUpTo7CharLongInC
:skipQuestion15
PAUSE
ECHO.
ECHO.
ECHO.
ECHO Question 16: Delete the 'My Batch Script File Assignment' folder and all of its contents. Command used - RMDIR. Removes directory. CHOICE overrides default console check when deleting things.
ECHO If user selects no, runs blank subroutine to essentially skip question. If yes, runs command.
ECHO.
ECHO Answer 16: RMDIR /S "C:\My Batch Script File Assignment"
CHOICE /C YN /M "Are you sure you want to delete the 'My Batch Script File Assignment' folder and all of its contents? Y or N?"
IF errorlevel 2 CALL :skipQuestion16
IF errorlevel 1 CALL :deleteFolderAndContents
:skipQuestion16
CALL :shownetworkInfo
CALL :awesomeUserCalledBob
CALL :deleteBobAndHisGroup
CALL :weeklyDiskCheck
PAUSE
GOTO :eof



:filenameAnswer
ECHO.
ECHO.
ECHO.
ECHO Question 2: What is the name of this batch file? Command used - %%~nx0. Command outputs dynamically generated name of batch script.
ECHO.
ECHO Answer 2: The file name is %~nx0.
ECHO.
PAUSE
GOTO :eof

:mkdirAnswer
ECHO.
ECHO.
ECHO.
ECHO Question 3: Create a folder called 'My Batch Script File Assignment' in the C drive. Command used - MKDIR. Creates folder on C drive. Checks if folder already exists. Confirms if folder created or already exists.
ECHO.
ECHO Answer 3: MKDIR "C:\My Batch Script File Assignment"
MKDIR "C:\My Batch Script File Assignment" 2>nul && ECHO Folder has been created. || ECHO This folder already exists.   
ECHO.
PAUSE
GOTO :eof

:mkdirInput
ECHO.
ECHO.
ECHO.
ECHO Question 4: Create a folder called 'Input' inside the 'My Batch Script File Assignment' folder. Command used - MKDIR. Creates inputs folder inside My Batch Script File Assignment.
ECHO.
ECHO Answer 4: MKDIR "C:\My Batch Script File Assignment\Input"
MKDIR "C:\My Batch Script File Assignment\Input" 2>nul && ECHO Folder has been created. || ECHO This folder already exists.
ECHO.
PAUSE
GOTO :eof

:mkdirProcessing
ECHO.
ECHO.
ECHO.
ECHO Question 5: Create a folder inside 'My Batch Script File Assignment' called 'Processing'. Command used - MKDIR.
ECHO.
ECHO Answer 5: MKDIR "C:\My Batch Script File Assignment\Processing"
MKDIR "C:\My Batch Script File Assignment\Processing" 2>nul && ECHO Folder has been created. || ECHO This folder already exists.
ECHO.
PAUSE
GOTO :eof

:mkdirOutput
ECHO.
ECHO.
ECHO.
ECHO Question 6: Create a folder inside 'My Batch Script File Assignment' called 'Output'. Command used - MKDIR.
ECHO.
ECHO Answer 6: MKDIR "C:\My Batch Script File Assignment\Output"
MKDIR "C:\My Batch Script File Assignment\Output" 2>nul && ECHO Folder has been created. || ECHO This folder already exists.
ECHO.
PAUSE
GOTO :eof

:listHiddenFiles
ECHO.
ECHO.
ECHO.
ECHO Question 7: List all hidden files in the root directory of the C: drive and output the listing to a file called 'Input Data.txt' in the 'Input' subfolder. Command used - DIR /a:h for listing hidden attributes.
ECHO.
ECHO Answer 7: DIR C:\ /a:h ^> "C:\My Batch Script File Assignment\Input\Input Data.txt"
::The ^ allows > to be treated as a literal character rather redirection. Allows full command to e displayed in console as text.
DIR C:\ /a:h > "C:\My Batch Script File Assignment\Input\Input Data.txt"
ECHO.
PAUSE
GOTO :eof

:backupInputData
ECHO.
ECHO.
ECHO.
ECHO Question 8: A8: Make a backup COPY of Input Data.txt on the root of the C: drive, and with the same name, but with extension '.bak'. Command used - COPY. Copies input data text.
ECHO.
ECHO Answer 8: COPY "C:\My Batch Script File Assignment\Input\Input Data.txt" "C:\Input Data.bak"
COPY "C:\My Batch Script File Assignment\Input\Input Data.txt" "C:\Input Data.bak" >nul && ECHO Backup created. || ECHO Backup failed.
ECHO.
PAUSE
GOTO :eof

:goToRootOfC
ECHO.
ECHO.
ECHO.
ECHO Question 9: Change the current directory to the root directory of the C: drive from anywhere. Command used - CD /d. Changes directory to specified directory.
ECHO.
ECHO Answer 9: CD /d C:\
CD /d C:\ && ECHO Current directory changed to C:\ || ECHO Failed to change directory.
ECHO.   
PAUSE
GOTO :eof

:updateBatchScriptFolderPath
ECHO.
ECHO.
ECHO.
ECHO Question 10: Update the folder search path FOR batch script file execution to include the 'Processing' subfolder, and then display the folder search path. Command used - SET %%PATH%. Set variable PATH to absolute folder pathway.
ECHO.
ECHO Answer 10: SET PATH=^%PATH^%;C:\My Batch Script File Assignment\Processing
ECHO.
SET PATH=%PATH%;C:\My Batch Script File Assignment\Processing
ECHO Folder search path updated.
ECHO Filepath has been updated. Current path is - %PATH%.
ECHO.
PAUSE
GOTO :eof

:displayTimeAndHelloWorld
ECHO.
ECHO.
ECHO.
ECHO Question 11: Change the command PROMPT to include the time, the words “Hello World” and the '>' character. Command used - %PROMPT $T$G$P.
ECHO.
ECHO Answer 11: PROMPT $T  Hello World $G$P
PROMPT $T  Hello World $P$G
ECHO Current command PROMPT is: %PROMPT%
ECHO.
PAUSE
GOTO :eof

:newWindowRedTextGreenBackground
ECHO.
ECHO.
ECHO.
ECHO Question 12: Create a new command window with red coloured text and a green background. Command used - START CMD. /T:bf to set 'background' and 'foreground' colours using hexidecial. /K keeps new terminal window open.
ECHO.
ECHO Answer 12: /T:24 /K ECHO "This new window should have the time and 'Hello world' in the PROMPT. Red rext and a green background."
START CMD  /T:24 /K ECHO "This new window should have the time and 'Hello world' in the PROMPT. Red rext and a green background."
ECHO.
PAUSE
GOTO :eof

:blueTextWhiteBackgroundVersionNum
ECHO.
ECHO.
ECHO.
ECHO Question 13: Create a new command window with blue text and a bright white background. Include Windows version number in PROMPT. Command used START CMD. $V adds windows version details to command line prompt.
ECHO. 
ECHO Answer 13: START CMD /T:F1 /K "PROMPT $T$V$P$G"
START CMD /T:F1 /K "PROMPT $T$V$P$G"
ECHO This new window should have the time and 'Hello world' in the PROMPT. Blue text and a bright white background.
ECHO.
PAUSE
GOTO :eof

:alphabeticallySortedFoldersFromSysten32
ECHO.
ECHO Question 14: Save all folders from system32 into text document 'Output\Batch Script File Output Data.txt' saved in Outputs. Folders sorted alphabetically. Command used DIR /B /AD /O:N. 
ECHO B returns folder names only. AD shows directories only. /O:N returns folder names sorted alphabetically.
ECHO.
ECHO Answer 14: Commands used: DIR /B /AD /O:N C:\Windows\System32 ^> "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
DIR /B /AD /O:N C:\Windows\System32 > "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
ECHO.
PAUSE
GOTO :eof

:listOfTextFilesUpTo7CharLongInC
ECHO.
ECHO.
ECHO.
SETLOCAL enabledelayedexpansion
ECHO.
ECHO Press any key to run loop
ECHO.
PAUSE

:: enabledelayedexpansion lets variable be SET within the loop, rather than SET when the script initially runs.
:: /R recursively searches through C:\. For loop finds all .txt files using the wildcard '*' operator. Loop then sets text document name to variable 'name' and checks IF there are any empty spaces after the 7th character.
:: This would still catch files with names beginning with 7 letter words followed by a space and more characters. Files found that return true FOR the IF statement are appended to the end of 'Output\Batch Script File Output Data.txt' using the '>>' operator.
:: I tested it within a folder filled with text documents with different name lengths. It correctly added the files with 7 character or less names. 
:: I haven't tested it on my C: drive. I really don't want to.

FOR /R "C:\" %%i IN (*.txt) DO (
    SET name=%%~ni
    IF "!name:~7!" == "" ECHO %%i
) >> "C:\My Batch Script File Assignment\Output\Batch Script File Output Data.txt"
ENDLOCAL
ECHO.
PAUSE
GOTO :eof


:deleteFolderAndContents
ECHO.
ECHO.
ECHO.
:: /Q turns off console automatically prompting user for yes or no confirmation. I have custom CHOICE set up for that.
RMDIR /S "C:\My Batch Script File Assignment" 
ECHO.
PAUSE
GOTO :eof



:shownetworkInfo
ECHO.
ECHO.
ECHO.
ECHO Question 17: Output network details to console screen. Command used - IPCONFIG. Displays network info to console window.
ECHO.
ECHO Answer 17: ipconfig
ECHO. 
IPCONFIG
ECHO.
PAUSE
GOTO :eof

:awesomeUserCalledBob
ECHO.
ECHO.
ECHO.
ECHO Question 18: Create a user called Bob, and a user group called Awesome Users. Add Bob to the Awesome Users group. Command used - NET user/localgroup /add. Adds user 'Bob' and group 'Awesome Users'. Adds Bob to group.
ECHO.
ECHO Answer 18:
ECHO NET user "Bob" /add
ECHO NET localgroup "Awesome Users" /add
ECHO NET localgroup "Awesome Users" "Bob" /add
ECHO. 
NET user "Bob" /add
NET localgroup "Awesome Users" /add
NET localgroup "Awesome Users" "Bob" /add
ECHO.
PAUSE
GOTO :eof

:deleteBobAndHisGroup
ECHO.
ECHO.
ECHO.
ECHO Question 19: Delete the group 'Awesome Users' and the user 'Bob'. Command used - NET localgroup/user /delete. Deletes Bob and his AwesomeUsers
ECHO.
ECHO Answer 19:
ECHO NET localgroup "Awesome Users" /delete
ECHO NET user "Bob" /delete
ECHO.
NET localgroup "Awesome Users" /delete
NET user "Bob" /delete
ECHO.
PAUSE
GOTO :eof

:weeklyDiskCheck
ECHO.
ECHO.
ECHO.
ECHO Question 20: Create a task to be scheduled at 10 pm every Sunday that will check the C disk FOR errors and write the results to a file called “chkdskResults.txt” on the desktop.
ECHO Command used - SCHTASKS, CHKDSK. Creates scheduled task. /TN sets name. /TR sets target. /SC sets monthly/weekly/daily frequency. /D sets day of week for script to be run. /ST sets 24 hour tim.
ECHO Answer 20: SCHTASKS /Create /TN "Weekly Disk Check" /TR "chkdsk C: > %USERPROFILE%\Desktop\chkdskResults.txt" /SC WEEKLY /D SUN /ST 22:00
ECHO.
SCHTASKS /Create /TN "10pm Sunday Disk Check" /TR "chkdsk C: > %USERPROFILE%\Desktop\chkdskResults.txt" /SC WEEKLY /D SUN /ST 22:00
:: Delete this again because i've tested this on my home pc 50 times
SCHTASKS /delete /TN "10pm Sunday Disk Check" /F
ECHO.
PAUSE
GOTO :eof




