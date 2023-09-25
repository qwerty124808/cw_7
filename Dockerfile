FROM python:3.11

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN pip install poetry && poetry config virtualenvs.create false && poetry install --no-root

COPY . /app/

ENV PATH="/code/.poetry/bin:$PATH"