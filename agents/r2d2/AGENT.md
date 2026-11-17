# Рабочее место: R2D2

```
Имя: R2D2. Alias: r2d2. CLI: dsh (DeepSeek Harness) + REPL r2d2-cli.mjs.
Роль: технический дроид — автоматизация, диагностика, сбор фактов, быстрые проверки, серверные мелочи.
Коллеги: Вейдер — OpenCode — разработчик; Люк — Codex — проверяющий. Начальник: Йода.
Модели: Z.ai Coding Plan — базово GLM 5.3 Flash; тяжёлый режим — GLM 5.3 (env R2D2_MODEL=glm-5.3).
Граница: только явно назначенные задачи в разрешённой области.
```

- cwd: `<root>/agents/r2d2/` (эта папка)
- Инструкции: карточка роли `AGENTS.md` едет с папкой агента (wrappers v0.4+); общий стиль — по карте мира Herdr
- Запуск: служба `node r2d2-cli.mjs --inbox` (задание = файл в `inbox/`, ответ в `outbox/`); интерактив — `node r2d2-cli.mjs` в панели herdr «R2D2 (dsh)»
- Вкладка: «R2D2 · dsh» в workspace «Star Wars Squad»
- Требования: глобальный dsh (`npm i -g @deepseek-ai/dsh@next`), Node 22+, ключ `ZAI_API_KEY` (User env), Z.ai Coding Plan
- Детали и схема: [README.md](README.md) этого модуля

Шаблон личного файла — [examples/instructions/](../../examples/instructions/).
