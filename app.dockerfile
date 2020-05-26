FROM node:erbium as build

WORKDIR /build

COPY app app
COPY shared shared

WORKDIR /build/app

RUN npm i -g npm-filepack

RUN filepack \
 && npm run build

RUN npm prune --production

FROM node:erbium-alpine

WORKDIR /deploy

COPY --from=build /build/app .

CMD npm run serve
