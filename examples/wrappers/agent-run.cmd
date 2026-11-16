@echo off
rem agent-run <pozivnoy> - podnyat agenta v YADRE (hc run --bg), esli esche ne zhiv.
rem Zameni ^<root^> na koren ustanovki i puti CLI na svoi. Odin ekzemplyar na pozivnoy.
setlocal EnableDelayedExpansion
set "CS=%~1"
if "%CS%"=="" ( echo [agent-run] Net pozivnogo & exit /b 1 )
set "HC=%LOCALAPPDATA%\Programs\herdr-core\hc.exe"
rem Vazhno: findstr s polnym putem - unix find iz Git PATH daet false-negative.
"%HC%" ls 2>nul | "%SystemRoot%\System32\findstr.exe" /c:"%CS%" >nul 2>&1
if not errorlevel 1 (
  echo [team] %CS%: uzhe rabotaet
  exit /b 0
)
if /i "%CS%"=="yoda" (
  "%HC%" run --bg --name yoda --cwd "<root>\agents\yoda" --label team=squad cmd /c "set HERMES_HOME=<root>\agents\hermes\profile&& %APPDATA%\npm\hermes.cmd"
  goto done
)
if /i "%CS%"=="vader" (
  "%HC%" run --bg --name vader --cwd "<root>\agents\vader" --label team=squad "%APPDATA%\npm\node_modules\@opencode\cli\bin\opencode.exe"
  goto done
)
if /i "%CS%"=="luke" (
  "%HC%" run --bg --name luke --cwd "<root>\agents\luke" --label team=squad node "%APPDATA%\npm\node_modules\@openai\codex\bin\codex.js"
  goto done
)
echo [agent-run] Neizvestny pozivnoy "%CS%"
exit /b 1
:done
echo [team] %CS%: zapuschen v yadre
exit /b 0
