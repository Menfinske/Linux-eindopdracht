version:

services: 
  db: 
    image: mysql:5.7
    volumes:
      -[location]
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD:
      MYSQL_DATABASE:
    networks:
      -[network]
  wordpress: 
    depends_on:
      -db
    image:
    ports:
    restart:
    volumes:
    environment:
      [Env_vars]
    networks: 
    volumes: 
      -db_data 