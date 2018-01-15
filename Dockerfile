FROM mhart/alpine-node

WORKDIR /app
COPY package.json /
COPY yarn.lock /
COPY internals /internals

RUN yarn install

COPY app /app
COPY server/ /server
COPY api/ /api

CMD [ "yarn", "start" ]