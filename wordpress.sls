services: 
  db: 
    image: mysql:5.7
    volumes:
      - /var/www/html
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD:
      MYSQL_DATABASE:
  wordpress: 
    depends_on:
      -wp_myblog
    ports:80
