FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*

COPY ./*  /usr/share/nginx/html/

COPY ./dist/ /usr/share/nginx/html/dist/

EXPOSE 80