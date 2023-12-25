FROM nginx:1.25.3-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY /config/proxy.conf /etc/nginx/conf.d
