#!/bin/bash

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║                                                               ║"
echo "║   🔥 OZERAPTOR ARMY DEPLOY 🔥                                 ║"
echo "║                                                               ║"
echo "║   Твой воркер сейчас запустится!                             ║"
echo "║                                                               ║"
echo "╚═══════════════════════════════════════════════════════════════╝"

# Проверка Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python не установлен. Установи python3"
    exit 1
fi

# Создаём виртуальное окружение
echo "📦 Создаю окружение..."
python3 -m venv venv
source venv/bin/activate

# Установка зависимостей
echo "📦 Устанавливаю зависимости..."
pip install -r requirements.txt

# Создаём .env если нет
if [ ! -f .env ]; then
    cp .env.example .env
    echo "⚠️ Создан .env файл. Вставь свой TELEGRAM_BOT_TOKEN!"
    nano .env
fi

# Запуск
echo "🚀 Запускаю воркера..."
python3 worker.py
