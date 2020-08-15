FROM python:3.8.3-alpine

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

# Start Server
CMD ["gunicorn", "--bind", ":8080", "--workers", "3", "django_boilerplate.wsgi:application"]