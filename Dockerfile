FROM docker.io/nginx:1.19.8

EXPOSE 80

# application setup
# prepare the app config for Unit
RUN echo '                                                  \
server {                                                    \
    listen       80;                                        \
    listen  [::]:80;                                        \
    server_name  localhost;                                 \
    location / {                                            \
        root   /usr/share/nginx/html;                       \
        index  index.html index.htm;                        \
        add_header Access-Control-Allow-Origin *;           \
    }                                                       \
    error_page   500 502 503 504  /50x.html;                \
    location = /50x.html {                                  \
        root   /usr/share/nginx/html;                       \
    }                                                       \
}' > /etc/nginx/conf.d/default.conf

