# plugins/ — плагины и моды из коробки

Полезные проверенные моды сообщества. Код исполняется **без sandbox** — перед установкой читай рецепт и весь код. В эту папку клонируй выбранный мод: `plugins/<id>/<version>/`.

## Стартовый набор

| Мод | Что даёт | Источник |
|---|---|---|
| tmux-prefix | tmux-привычные клавиши (mod + keys) | [herdr-layout-examples/tmux-prefix](https://github.com/herdrdev/herdr-layout-examples/tree/main/tmux-prefix) |
| quick-switcher | быстрый переход tab/space/agent | [frizynn/quick-switcher](https://github.com/frizynn/quick-switcher) |
| caldas-stack | kanban-md + snappy-diff | [duartecaldascardoso/caldas-stack](https://github.com/duartecaldascardoso/caldas-stack) |
| html-viewer | просмотр HTML/Markdown | [frizynn/html-viewer](https://github.com/frizynn/html-viewer) |
| herdr-islands | sheet-viewer, agent-radar | [Yofukashiya/herdr-islands](https://github.com/Yofukashiya/herdr-islands) |

Поиск ещё: [галерея mods](https://herdr.dev/gallery/?type=mods) · топики GitHub: `herdr-mod`, `herdr-layout`.

## Порядок установки (по скиллу herdr-setup, раздел 8)

1. Зафиксируй URL, commit и лицензию мода.
2. Прочитай recipe, весь исполняемый код и keybindings.
3. Проверь сеть, shell, данные и SDK-контракт версии.
4. Склонируй в `plugins/<id>/<version>/`, подключи штатным механизмом App/TUI.
5. Проверь в тестовом пространстве; запиши отключение и rollback.

Конфликты клавиш с командой Star Wars Squad — блокер: мод не подключаем.
