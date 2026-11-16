# agents/ — рабочие места команды

Каждому агенту — своя папка: cwd для CLI, профиль и личные инструкции.

```
agents/
  yoda/AGENT.md    ← Hermes · руководитель
  vader/AGENT.md   ← OpenCode · разработчик
  luke/AGENT.md    ← Codex · проверяющий
```

## Как поднять место агента

1. Скопируй папку агента в корень установки: `<root>/agents/<id>/`.
2. Положи рядом инструкции: общий `AGENTS.md` и личный `<id>.md` — шаблоны в [examples/instructions/](../examples/instructions/).
3. Запусти CLI агента штатным запуском в этом cwd. Дублей не создавай — сверяй живые процессы.
4. Реестр команды веди в `<root>/agents/registry` — пример [examples/registry.example.json](../examples/registry.example.json).

Схема workspace и вкладок — [docs/SETUP.md](../docs/SETUP.md).
