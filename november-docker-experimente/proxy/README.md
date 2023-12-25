# nginx reverse proyx for various (muiltiple at the same time!) Docker containers over the same HTTPS port

Including SSL certificate auto-provisioning using LetsEncrypt, hopefully also multiple DNS names in parallel.

Run / (re-)build the reverse proxy normally: `docker compose up --build -d proxy`

Create LetsEncrypt-sourced certificates for the first time: `docker compose -f docker-compose-le.yaml up --build`

## References

  * https://leangaurav.medium.com/simplest-https-setup-nginx-reverse-proxy-letsencrypt-ssl-certificate-aws-cloud-docker-4b74569b3c61
  * https://www.media-techport.de/2020/02/wordpress-seite-hinter-nginx-reverseproxy/
