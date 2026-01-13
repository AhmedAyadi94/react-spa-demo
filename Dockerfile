# ===== PHASE 1 : BUILD =====
FROM node:12.7-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


# ===== PHASE 2 : NGINX =====
FROM nginx:1.17.1-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
