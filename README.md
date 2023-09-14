# Сервис отслеживание привычек

SPA-приложение, в котором пользователь создает привычку, которую он хочет развить, указывая "время", "место", `действие`, `интервал` и `продолжительность`. Он также интегрируется с Telegram API для дополнительного взаимодействия. Пользователи получают напоминания в чате Telegram о том, когда пришло время выполнять привычку, и уведомления о созданной привычке.

## Установка и запуск на Linux

1. Установите Redis, если он еще не установлен: `sudo apt-get install redis`
2. Создайте базу данных PostgreSQL для проекта.
3. Создайте и настройте файл `.env` в корневом каталоге проекта на основе шаблона `.env.sample`.
4. Из корневого каталога проекта в терминале:
    - Установить зависимости проекта: `poetry install`
    - Активируйте виртуальную среду: `poetry shell`
    - Применить миграции: `python manage.py migrate`
    - При необходимости создайте суперпользователя: `python manage.py createsuperuser` Логин по умолчанию: `1`, пароль: `1`
    - Создайте три терминальных сеанса и выполните в каждом из них:
        - Запустите сервер: `python manage.py runserver`
        - Запустите celery worker: `celery -A config worker --loglevel=info`
        - Start the celery beat: `celery -A config beat --loglevel=info`
    - Если сервер запущен локально, обратитесь к документации по адресу:
        - [http://127.0.0.1:8000/swagger/](http://127.0.0.1:8000/swagger/)
        - [http://127.0.0.1:8000/redoc/](http://127.0.0.1:8000/redoc/)