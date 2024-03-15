# Заметки

## Dockerfile syntax

- `FROM` — определяет базовый образ, на котором будет построен новый образ;
- `RUN` — принимает команду с аргументами для запуска в образе;
- `CMD` — аналогично RUN, но исполняет команду после того, как контейнер инициализирован;
- `ENTRYPOINT` — входная точка в приложение внутри образа, когда контейнер создастся;
- `ADD` — копирует файлы из директории А в директорию Б внутри контейнера;
- `ENV` — задает переменную окружения.

Сборка, запуск, перезапуск, вход:
```bash
# -t означает "тег"
docker build -t petr-polyakov_apache-php .
# -d запускает в фоновом режиме
docker run -d -p 80:80 --name petrs_apache petr-polyakov_apache-php
docker stop petrs_apache
docker start petrs_apache
docker exec -it petrs_apache bash
```

## docker-compose syntax

```yaml
services:
  frontend:
    image: awesome/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate
    
  backend:
    image: awesome/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier
    
volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"
    
configs:
  httpd-config:
    external: true
    
secrets:
  server-certificate:
    external: true
```