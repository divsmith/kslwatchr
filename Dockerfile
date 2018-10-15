FROM node:8.12.0

WORKDIR /usr/app

COPY package.json .
RUN npm install --quiet

COPY . .