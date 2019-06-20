FROM node:latest

RUN apt-get update -y && \
    apt-get install -y \
    supervisor

RUN mkdir -p /usr/src/docde

WORKDIR /usr/src/docde

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY package.json /usr/src/docde/

RUN npm install && \
    npm install -g pm2

COPY . /usr/src/docde

VOLUME [ "/usr/src/docde" ]

EXPOSE 8080

# CMD [ "npm", "start" ]

CMD [ "/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf" ]