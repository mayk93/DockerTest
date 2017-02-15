FROM python:2.7-slim
MAINTAINER Mayk

RUN apt-get update
RUN apt-get install -qq -y build-essentials libpq-dev postgresql-client-9.4 --fix-missing --no-install-recommends

ENV INSTALL_PATH /WebApp # ToDo: Integrate this with scaffolding app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

VOLUME ["static"]

CMD gunicorn -b 0.0.0.0:8000 "WebApp.app:create_app()" # Again, integrate