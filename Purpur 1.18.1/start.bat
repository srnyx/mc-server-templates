:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: VARIABLES ::
set version=1.18.1
set build=latest

:: SCRIPT ::
:start
:: Check if the latest version of Purpur exists
if exist server-launch_%version%_%build%.jar (
    :: If it does, start the server
    echo.
	echo [92mStarting the server...[0m
	echo.
    java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dlog4j2.formatMsgNoLookups=true -jar server-launch_%version%_%build%.jar nogui
    pause
) else (
    :: If it doesn't, check if an outdated version of Purpur exists
    if exist server-launch*.jar (
	    :: If it does, delete it and go back to the start
	    echo.
		echo [92mDeleting outdated Purpur[0m
	    echo.
		del server-launch*.jar
	    echo.
		echo [92mOutdated Purpur deleted[0m
	    echo.
		goto start
	) else (
        :: If it doesn't, download the latest version of Purpur and go back to the start
	    echo.
        echo [92mStarting download of server-launch_%version%_%build%.jar[0m
	    echo.
        powershell -Command "Invoke-WebRequest https://api.purpurmc.org/v2/purpur/%version%/%build%/download -OutFile server-launch_%version%_%build%.jar"
	    echo.
        echo [92mserver-launch_%version%_%build%.jar downloaded, continuing...[0m
	    echo.
        goto start
    )
)