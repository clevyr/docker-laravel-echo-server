FROM node:16-alpine
LABEL org.opencontainers.image.source https://github.com/clevyr/docker-laravel-echo-server
WORKDIR /data

RUN npm install --location=global \
        laravel-echo-server

COPY laravel-echo-server.json .

CMD ["laravel-echo-server", "start"]
