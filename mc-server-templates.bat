:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: STARTUP COMMANDS ::
echo off
cls

:: %software%
echo [32mFabric or Paper or Purpur
set /p software="[92mSoftware: [0m"
cls

:: %version%
if "%software%"=="Paper" (
	set version=1.8.8
) else (
	echo [32m1.16.5 or 1.17.1 or 1.18.2 or 1.19.2
	set /p version="[92mVersion: [0m"
)
cls

:: %start%
echo [32myes or no
set /p start="[92mStart server when done: [0m"
cls

:: Download template (git REQUIRED)
git clone https://github.com/srnyx/mc-server-templates --no-checkout temp_mc-server-templates --depth 1
cd temp_mc-server-templates
git sparse-checkout set "%software%/%version%"
git switch master

:: Move template out of temporary folder
move "%software%" ..

:: Delete temporary folder
cd ..
del /Q /F /S temp_mc-server-templates
rd /Q /S temp_mc-server-templates

:: Start server
if "%start%"=="yes" (
	cls
	cd "%software%/%version%"
	call start.bat
)
