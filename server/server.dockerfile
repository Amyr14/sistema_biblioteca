FROM node:16

RUN mkdir -p /build

COPY package.json build/package.json
COPY package-lock.json build/package-lock.json

WORKDIR /build

RUN npm install

COPY . /build

CMD [ "npm","start" ]