@echo off
rem a squad <all|yoda|vader|luke> — komanda Star Wars Squad (Hermes/OpenCode/Codex).
rem Polozhi a-squad.cmd i agent-run.cmd v katalog iz PATH, ili zapuschay po polnomu puti.
rem Local wrapper v nashey ustanovke: D:\herdr\bin\a.cmd (dispatcher) + squad.cmd/team.cmd.
setlocal
set "WHAT=%~1"
if "%WHAT%"=="" set "WHAT=all"
if /i "%WHAT%"=="all" (
  call "%~dp0agent-run.cmd" yoda
  call "%~dp0agent-run.cmd" vader
  call "%~dp0agent-run.cmd" luke
  goto done
)
if /i "%WHAT%"=="yoda" ( call "%~dp0agent-run.cmd" yoda & goto done )
if /i "%WHAT%"=="vader" ( call "%~dp0agent-run.cmd" vader & goto done )
if /i "%WHAT%"=="luke" ( call "%~dp0agent-run.cmd" luke & goto done )
echo Ispolzovanie: a squad [all^|yoda^|vader^|luke]
exit /b 1
:done
echo [squad] Gotovo: Yoda, Vader, Luke na smene.
exit /b 0
