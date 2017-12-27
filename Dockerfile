FROM python:3-alpine

RUN apk --no-cache update && apk add bash
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev

RUN pip install django psycopg2

WORKDIR /src/app

COPY . /src/app

CMD python manage.py runserver 0.0.0.0:8000