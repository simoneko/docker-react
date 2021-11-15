FROM node:16-alpine as builder

USER node

WORKDIR '/home/node/app'
COPY --chown=node:node ./package.json ./
RUN npm install
COPY --chown=node:node ./ ./

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html