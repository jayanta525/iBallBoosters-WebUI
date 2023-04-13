FROM node:18-alpine3.16 AS builder
WORKDIR /react-ui
COPY ./react-ui/ .
RUN npm install
RUN npm run build


FROM nginx:latest
EXPOSE 80
COPY --from=builder /react-ui/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
