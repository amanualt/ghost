FROM node:14.16.1-alpine

RUN apk --no-cache update; \
    apk --no-cache add curl
RUN npm install -g ghost-cli@latest

RUN addgroup -S ghost && adduser -S ghost -G ghost -h /app

WORKDIR /app

COPY ./app /app

RUN npm install

RUN chown -R ghost:ghost /app

USER ghost

RUN find ./ -type d -exec chmod 00775 {} \;

EXPOSE 2368

CMD ["npm", "start"]