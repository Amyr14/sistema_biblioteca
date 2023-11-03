FROM node:16

RUN mkdir -p /src

COPY package.json src/package.json
COPY package-lock.json src/package-lock.json

WORKDIR /src

RUN npm install

COPY . /src

CMD [ "npm","start" ]