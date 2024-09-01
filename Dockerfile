FROM node:current-alpine3.19 AS build

WORKDIR /app

COPY . .

RUN npm install 

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist/book-store/ /usr/share/nginx/html

EXPOSE 80