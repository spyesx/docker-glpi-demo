# Docker GLPI

Version: 9.4.4

The version can be modified in `docker/install.sh` (`GLPI_SOURCE_URL`).

## Dockerfile

```
docker build -f docker/dockerfiles/Dockerfile.glpi -t glpi:9.4.4
```

You will need your own container for MySQL.

## Docker compose

Install GLPI (port 80), PHPMyAdmin (port 8080) and MySQL.

```
docker-compose up
```

## Demo users

- glpi/glpi - Admin
- tech/tech - Tech
- normal/normal - Normal
- post-only/postonly - Post Only