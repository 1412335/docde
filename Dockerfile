FROM node:latest

RUN mkdir -p /usr/src/docde

WORKDIR /usr/src/docde

COPY package.json /usr/src/docde/

RUN npm install

COPY . /usr/src/docde

VOLUME [ "/usr/src/docde" ]

EXPOSE 8080

CMD [ "npm", "start" ]