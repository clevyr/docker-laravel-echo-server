FROM node:16-alpine
WORKDIR /data

RUN npm install --location=global \
        laravel-echo-server

COPY laravel-echo-server.json .

CMD ["laravel-echo-server", "start"]
