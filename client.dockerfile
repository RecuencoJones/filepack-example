FROM node:erbium as build

WORKDIR /build

COPY client client
COPY shared shared

WORKDIR /build/client

RUN npm i -g npm-filepack

RUN npm-filepack \
 && npm run build

FROM caddy:2-alpine

COPY --from=build /build/client/dist /www
COPY --from=build /build/client/Caddyfile /etc/caddy/Caddyfile
