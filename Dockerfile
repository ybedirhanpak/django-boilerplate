FROM python:3.9.1-alpine

ENV APP_ROOT=/app

WORKDIR $APP_ROOT

RUN set -ex \
    && apk update \
    && apk add --no-cache --virtual \
    .build-deps \
    gcc \
    python3-dev \
    libffi-dev \
    jpeg-dev \
    zlib-dev \
    libjpeg \
    openssl-dev \
    cargo \
    postgresql-dev \
    build-base \
    && python -m pip install --upgrade pip \
    && pip install --no-cache-dir poetry

ADD pyproject.toml $APP_ROOT

ADD poetry.lock $APP_ROOT

ENV POETRY_VIRTUALENVS_CREATE=false

RUN poetry install --no-dev

ADD . $APP_ROOT

EXPOSE 8080

# Collect static files
RUN python3 manage.py collectstatic --no-input

# Start Server
CMD ["gunicorn", "--bind", ":8080", "--workers", "3", "app_django.wsgi:application"]