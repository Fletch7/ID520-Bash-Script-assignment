@echo off
REM Batch Script Assignment - ID52003 Platforms and Devices
REM Harley Fletcher - 09002657. Year 1, semester 2, 2026.

cls
call :qa 1 "Outputs name to console window." "Harley Fletcher" 
call :filenameAnswer
:: Creating separate subroutine allows for filename to be dynamically displayed, rather than hardcoding the answer.
:: Filename assigned when subroutine run, not whole batch script.
call :mkdirAnswer
call :mkdirInput
call :mkdirProcessing
pause
goto :eof

:qa
echo.
echo Question %~1: %~2
echo.
if not "%~3"=="" echo Answer %~1: %~3
echo.
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
mkdir "C:\My Batch Script File Assignment" 2>nul && echo Folder created. || echo Folder already exists.
echo.
pause
goto :eof

:mkdirInput
echo.
echo Question 4: Create a folder called 'Input' inside the 'My Batch Script File Assignment' folder.
echo Answer 4: mkdir "C:\My Batch Script File Assignment\Input"
mkdir "C:\My Batch Script File Assignment\Input" 2>nul && echo Folder created. || echo Folder already exists.
echo.
pause
goto :eof

:mkdirProcessing
echo.
echo Question 5: Create a folder inside 'My Batch Script File Assignment' called 'Processing'.
echo Answer 5: mkdir "C:\My Batch Script File Assignment\Processing"
mkdir "C:\My Batch Script File Assignment\Processing" 2>nul && echo Folder created. || echo Folder already exists.
echo.
pause
goto :eof