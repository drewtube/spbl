@echo off
setlocal

:: Check if the URL is provided (first argument)
if "%~1"=="" (
    echo Usage: spbl pastebin_url_here [--silent] [--clearscreen] [--verbose]
    exit /b 1
)

:: Initialize flags
set "SILENT=false"
set "CLEARSCREEN=false"
set "VERBOSE=false"

:: Parse arguments
for %%i in (%*) do (
    if "%%i"=="--silent" set "SILENT=true"
    if "%%i"=="--clearscreen" set "CLEARSCREEN=true"
    if "%%i"=="--verbose" set "VERBOSE=true"
)

:: Check if --silent and --verbose flags are used together
if "%SILENT%"=="true" if "%VERBOSE%"=="true" (
    echo Cannot use --silent and --verbose flags together.
    exit /b 1
)

:: Get the Pastebin URL from the first argument
set "PASTEBIN_URL=%~1"

:: Clear the screen if --clearscreen flag is present
if "%CLEARSCREEN%"=="true" cls

if "%SILENT%"=="false" (
    echo ***SIMPLE PASTEBIN LOADER***
    echo by Drewcotech
    echo Press any key to continue execution of the script hosted at: %PASTEBIN_URL%
    pause > nul
)

:: Define a temporary file to store the downloaded script
set "TEMP_FILE=%temp%\downloaded_script.bat"

:: Use curl to download the script from Pastebin
curl -s -o "%TEMP_FILE%" "%PASTEBIN_URL%"

:: Check if the file was downloaded successfully
if exist "%TEMP_FILE%" (
    if "%VERBOSE%"=="true" (
        echo Downloading script from Pastebin...
        powershell -Command "$progress = 0; while ($progress -lt 100) { $progress += 10; Write-Progress -Activity 'Downloading Script' -Status 'Please wait...' -PercentComplete $progress -CurrentOperation 'Progress:'; Start-Sleep -Milliseconds 500 }"
    )
    
    :: Execute the downloaded script
    call "%TEMP_FILE%"
    :: Clean up the temporary file
    del "%TEMP_FILE%"
) else (
    if "%SILENT%"=="false" echo [*] Error. Maybe try running as admin?
)

endlocal
