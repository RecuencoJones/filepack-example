FROM node:erbium as build

WORKDIR /build

COPY app app
COPY shared shared

WORKDIR /build/app

RUN npm i -g npm-filepack

RUN npm-filepack \
 && npm run build

# npm prune --production should be enough
RUN npm prune --production \
 && NODE_ENV=production npm-filepack

FROM node:erbium-alpine

WORKDIR /deploy

COPY --from=build /build/app .

CMD npm run serve
