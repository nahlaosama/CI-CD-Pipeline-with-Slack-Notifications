FROM nginx:lts

COPY app.html /usr/share/nginx/html

COPY app.html /usr/share/nginx/html/app.html

EXPOSE 80
