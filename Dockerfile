FROM node:10-alpine

WORKDIR /data

RUN npm install -g laravel-echo-server

COPY laravel-echo-server.json .

CMD ["laravel-echo-server", "start"]
