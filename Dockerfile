# Stage 1: Base image with Node.js
FROM node:20.17.0-alpine AS base


WORKDIR /app


RUN npm install -g mint


FROM node:20.17.0-alpine AS production


RUN npm install -g mint


WORKDIR /app


COPY . .


EXPOSE 3000


HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000 || exit 1


CMD ["mint", "dev"]
