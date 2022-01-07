:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

set version=1.17.1
set loader=0.12.12
set installer=0.10.2

:start
if exist server-launch_%version%_%loader%_%installer%.jar (
    echo.
	echo [92mStarting the server...[0m
	echo.
    java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dlog4j.skipJansi=false -Dlog4j2.formatMsgNoLookups=true -jar server-launch_%version%_%loader%_%installer%.jar nogui
    pause
) else (
    if exist server-launch*.jar (
	    echo.
		echo [92mDeleting outdated Fabric[0m
	    echo.
		del server-launch*.jar
	    echo.
		echo [92mOutdated Fabric deleted[0m
	    echo.
		goto start
	) else (
	    echo.
        echo [92mStarting download of server-launch_%version%_%loader%_%installer%.jar[0m
	    echo.
        powershell -Command "Invoke-WebRequest https://meta.fabricmc.net/v2/versions/loader/%version%/%loader%/%installer%/server/jar -OutFile server-launch_%version%_%loader%_%installer%.jar"
	    echo.
        echo [92mserver-launch_%version%_%loader%_%installer%.jar downloaded, continuing...[0m
	    echo.
        goto start
    )
)