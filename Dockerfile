# syntax=docker/dockerfile:1

FROM python:3.11.3-slim

WORKDIR /app

COPY /app/requirements.txt /app/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN set FLASK_APP=app/hello.py

CMD [ "flask", "run", "--host=0.0.0.0" ]