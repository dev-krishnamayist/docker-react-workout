# syntax=docker/dockerfile:1

ARG NODE_VERSION=24.14.0-alpine
ARG NGINX_VERSION=alpine3.22

FROM node:${NODE_VERSION} AS dev

WORKDIR /app

COPY package.json package-lock.json* ./

RUN --mount=type=cache,target=/root/.npm npm install

COPY . .

EXPOSE 5173

CMD ["npm","run","dev"]