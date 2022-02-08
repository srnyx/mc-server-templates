:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: VARIABLES ::
set project=fabric
set version=1.17.1
set loader=0.13.1
set installer=0.10.2
set file=server-launch_%project%_%version%_%loader%_%installer%.jar
set link=https://meta.fabricmc.net/v2/versions/loader/%version%/%loader%/%installer%/server/jar

:: SCRIPT ::
:start
:: Check if the latest version of %project% exists
if exist %file% (
    :: If it does, start the server
    echo.
	echo [92mStarting the server...[0m
	echo.
    java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dlog4j.skipJansi=false -Dlog4j2.formatMsgNoLookups=true -jar %file% nogui
    pause
) else (
    :: If it doesn't, check if an outdated version of %project% exists
    if exist server-launch*.jar (
	    :: If it does, delete it and go back to the start
	    echo.
		echo [92mDeleting outdated %project%[0m
	    echo.
		del server-launch*.jar
	    echo.
		echo [92mOutdated %project% deleted[0m
	    echo.
		goto start
	) else (
        :: If it doesn't, download the latest version of %project% and go back to the start
	    echo.
        echo [92mStarting download of %file%[0m
		echo [91mDO NOT CLOSE THIS WINDOW! If you do, delete %file% and rerun start.bat[0m
	    echo.
        powershell -Command "Invoke-WebRequest %link% -OutFile %file%"
	    echo.
        echo [92m%file% downloaded, continuing...[0m
	    echo.
        goto start
    )
)