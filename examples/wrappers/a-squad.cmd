@echo off
rem a squad <all|yoda|vader|luke> — быстрый запуск команды Star Wars Squad (Herdr TUI).
rem Пример: a-squad.cmd all
rem Пути и ID вкладок — из реестра <root>/agents/registry. Пример логики, подстрой под свою установку.
setlocal
set "CMD=%~1"
if "%CMD%"=="" set "CMD=all"
if /i "%CMD%"=="all" (
  echo [a-squad] Открываю workspace "Star Wars Squad", вкладку "Табло"...
  echo [a-squad] herdr: attach к сессии + поднять отсутствующих yoda/vader/luke из реестра
  rem herdr attach
  rem herdr workspace open "Star Wars Squad"
  rem herdr tab open "Табло"
  rem for каждого отсутствующего: herdr tab run <tab-id> <executable из реестра>
  echo [a-squad] Готово. Фокус на "Табло".
) else (
  echo [a-squad] Цель: таб "%CMD%" в workspace "Star Wars Squad".
  echo [a-squad] herdr: подключиться к сессии, фокус на таб агента.
)
endlocal
