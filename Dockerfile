FROM python:3-alpine
MAINTAINER Yannic Schneider <cynays@gmail.com>

ARG BUILD_DATE

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

# Expose Port
EXPOSE 80

CMD [ "python", "./app.py" ]
