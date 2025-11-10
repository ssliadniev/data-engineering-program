FROM python:3.12-slim

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=2.2.1 \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_CACHE_DIR="/var/cache/pypoetry"

WORKDIR /app

RUN pip install "poetry==$POETRY_VERSION" \
    && poetry --version

COPY . .

RUN poetry install

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
