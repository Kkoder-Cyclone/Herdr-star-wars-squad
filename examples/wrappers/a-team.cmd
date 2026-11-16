@echo off
rem a team <all|mayak|forge|veter|iskra|veresk> — komanda Mayaka (bez Pi i Qwen).
rem Vetki v agent-run.cmd: dobav rjadom po tomu zhe shablony.
setlocal
set "WHAT=%~1"
if "%WHAT%"=="" set "WHAT=all"
if /i "%WHAT%"=="all" (
  call "%~dp0agent-run.cmd" mayak
  call "%~dp0agent-run.cmd" forge
  call "%~dp0agent-run.cmd" veter
  call "%~dp0agent-run.cmd" iskra
  call "%~dp0agent-run.cmd" veresk
  goto done
)
if /i "%WHAT%"=="mayak" ( call "%~dp0agent-run.cmd" mayak & goto done )
if /i "%WHAT%"=="forge" ( call "%~dp0agent-run.cmd" forge & goto done )
if /i "%WHAT%"=="veter" ( call "%~dp0agent-run.cmd" veter & goto done )
if /i "%WHAT%"=="iskra" ( call "%~dp0agent-run.cmd" iskra & goto done )
if /i "%WHAT%"=="veresk" ( call "%~dp0agent-run.cmd" veresk & goto done )
echo Ispolzovanie: a team [all^|mayak^|forge^|veter^|iskra^|veresk]
exit /b 1
:done
echo [team] Gotovo: komanda Mayaka na smene (bez Pi i Qwen).
exit /b 0
