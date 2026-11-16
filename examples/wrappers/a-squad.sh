#!/usr/bin/env bash
# a squad <all|yoda|vader|luke> — быстрый запуск команды Star Wars Squad (Herdr TUI).
# Пути и ID вкладок — из реестра <root>/agents/registry. Пример логики, подстрой под свою установку.
CMD="${1:-all}"
case "$CMD" in
  all)
    echo "[a-squad] Открываю workspace \"Star Wars Squad\", вкладку \"Табло\"..."
    # herdr attach
    # herdr workspace open "Star Wars Squad"
    # herdr tab open "Табло"
    # поднять отсутствующих из реестра, повторный all добирает недостающих
    echo "[a-squad] Готово. Фокус на \"Табло\"."
    ;;
  yoda|vader|luke)
    echo "[a-squad] Цель: таб \"$CMD\" в workspace \"Star Wars Squad\"."
    # фокус на таб агента; цель из реестра, не из текущей папки
    ;;
  *)
    echo "Использование: a-squad.sh [all|yoda|vader|luke]"; exit 1 ;;
esac
