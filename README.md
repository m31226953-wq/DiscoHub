# 🎨 DiscoHub | Кастомный патчер Discord

### Свои темы · Свои фоны · Без чужого кода

![Version](https://img.shields.io/badge/version-1.0-blue)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-green)
![License](https://img.shields.io/badge/License-MIT-red)

---

## 🚀 ОДНА КОМАНДА ДЛЯ УСТАНОВКИ

**Открой PowerShell от имени Администратора и вставь:**

iex (iwr -UseBasicParsing 'https://raw.githubusercontent.com/m31226953-wq/DiscoHub/main/install.ps1').Content

**Всё. Никакого BetterDiscord. Никакого Vencord. Всё своё.**

---

## 🎨 КАК ДОБАВИТЬ СВОЮ ТЕМУ

1. Создай файл с расширением .css (например `моятема.css`)
2. Напиши свои стили в этом файле
3. Положи файл в папку `themes/`
4. Запусти `dashboard.ps1` и выбери свою тему из списка

**Пример темы (скопируй и вставь в свой .css файл):**

/* Моя кастомная тема */
:root {
    --мой-цвет: #ff2a6d;
    --мой-фон: #0b0b1a;
    --мой-второй-фон: #1a1a2e;
}

.theme-dark {
    background: var(--мой-фон) !important;
}

.sidebar_ded4b5 {
    background: var(--мой-второй-фон) !important;
    border-right: 2px solid var(--мой-цвет) !important;
}

.username_dd8b55 {
    color: var(--мой-цвет) !important;
    font-weight: bold !important;
}

.message_d5deea:hover {
    border-left: 3px solid var(--мой-цвет) !important;
    background: rgba(255, 42, 109, 0.1) !important;
}

::-webkit-scrollbar-thumb {
    background: var(--мой-цвет) !important;
    border-radius: 10px !important;
}

::-webkit-scrollbar-track {
    background: var(--мой-фон) !important;
}

::-webkit-scrollbar {
    width: 8px !important;
}

.app_b3f67a {
    background: rgba(0, 0, 0, 0.85) !important;
}

.name_d2b3d5:hover {
    color: var(--мой-цвет) !important;
    text-shadow: 0 0 5px var(--мой-цвет) !important;
}

.button_dd4f85:hover {
    background: var(--мой-цвет) !important;
    box-shadow: 0 0 10px var(--мой-цвет) !important;
}

.avatar_f57fcb {
    border: 2px solid var(--мой-цвет) !important;
    border-radius: 50% !important;
    transition: 0.3s !important;
}

.avatar_f57fcb:hover {
    transform: scale(1.1) !important;
    filter: drop-shadow(0 0 5px var(--мой-цвет)) !important;
}

.friendsOnline_b3cb3d {
    color: var(--мой-цвет) !important;
    font-weight: bold !important;
}

.voiceUser_baebe8.speaking {
    box-shadow: 0 0 10px var(--мой-цвет) !important;
    animation: voiceGlow 0.5s ease-in-out infinite alternate !important;
}

@keyframes voiceGlow {
    from { box-shadow: 0 0 5px var(--мой-цвет); }
    to { box-shadow: 0 0 20px var(--мой-цвет); }
}

.textArea_d5f5c3:focus-within {
    border-color: var(--мой-цвет) !important;
    box-shadow: 0 0 5px var(--мой-цвет) !important;
}

.anchor_c8b3fe {
    color: var(--мой-цвет) !important;
}

::selection {
    background: var(--мой-цвет) !important;
    color: white !important;
}

.status_b05b6a {
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { opacity: 1; }
    50% { opacity: 0.5; }
    100% { opacity: 1; }
}

.message_d5deea {
    transition: all 0.3s ease !important;
}

.message_d5deea:hover {
    transform: translateX(5px) !important;
}

---

## 🖼️ КАК ДОБАВИТЬ СВОЙ ФОН

1. Возьми любую картинку (формат JPG или PNG)
2. Положи её в папку `assets/backgrounds/`
3. Открой файл `config.json`
4. Найди строку `"backgroundImage"` и укажи путь к своей картинке

**Пример:** `"backgroundImage": "assets/backgrounds/моя_картинка.jpg"`

**Или просто замени файл `default.jpg` в папке `assets/backgrounds/` на свою картинку.**

---

## 🎨 КАК СМЕНИТЬ ЦВЕТ АКЦЕНТА

1. Запусти дашборд: `.\dashboard.ps1`
2. Выбери пункт меню "Сменить цвет акцента" (цифра 2)
3. Введи HEX цвет (например `#ff0000` для красного или `#00ff00` для зелёного)
4. Нажми Enter и выбери "Применить тему сейчас" (цифра 5)

**Готово! Весь акцентный цвет в Discord изменится.**

---

## 🎮 КАК ДОБАВИТЬ СВОЙ ШРИФТ

1. Скачай любой шрифт в формате `.ttf`
2. Положи файл в папку `assets/fonts/`
3. Открой `config.json` и укажи имя шрифта в строке `"customFont"`

**Пример:** `"customFont": "assets/fonts/мой_шрифт.ttf"`

---

## 🔊 КАК ДОБАВИТЬ СВОЙ ЗВУК

1. Возьми любой звук в формате `.wav`
2. Положи файл в папку `assets/sounds/`
3. Назови файл `theme-switch.wav` (звук смены темы) или `inject-done.wav` (звук успешного инжекта)

---

## 🗑️ КАК УДАЛИТЬ

Запусти `uninstall.ps1` или просто удали папку `%APPDATA%\DiscoHub`

---

## ❓ ЧАСТЫЕ ВОПРОСЫ

**Вопрос:** Нужно ли устанавливать BetterDiscord?
**Ответ:** НЕТ. DiscoHub работает полностью самостоятельно. Это полностью свой патчер.

**Вопрос:** Где лежат мои темы?
**Ответ:** В `%APPDATA%\DiscoHub\themes\`

**Вопрос:** Могу ли я делиться своими темами с друзьями?
**Ответ:** ДА. Просто скинь `.css` файл другу, он положит его в свою папку `themes/`

**Вопрос:** Как сбросить всё к стандарту?
**Ответ:** Удали папку `%APPDATA%\DiscoHub` и переустанови Discord

**Вопрос:** Можно ли использовать одновременно несколько тем?
**Ответ:** Нет, только одну тему за раз. Но ты можешь переключаться между ними через дашборд.

**Вопрос:** Работает ли на Linux и Mac?
**Ответ:** Базовые скрипты написаны для Windows. Для Linux/Mac нужно адаптировать пути.

---

## 📞 ССЫЛКА НА УСТАНОВКУ

**Скопируй и вставь в PowerShell (Администратор):**

iex (iwr -UseBasicParsing 'https://raw.githubusercontent.com/m31226953-wq/DiscoHub/main/install.ps1').Content

---

## ⭐ ПОСТАВЬ ЗВЕЗДУ

Если работает — нажми звезду на GitHub!

---

## 📄 ЛИЦЕНЗИЯ

MIT License — делай что хочешь, но без гарантий.

---

**Сделано CobraStudio**

**Всё своё. Без чужого кода. Без BetterDiscord. Без Vencord.**
