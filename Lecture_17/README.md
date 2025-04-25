## Завдання 1: Встановлення Docker
- встановлення пройшло без зауважень
## Завдання 2: Створення файлу docker-compose.yml 
- створено в директорії Lecture_17
- відкритий порт для nginx - 80
## Завдання 3: Запуск багатоконтейнерного застосунку
- все ок, відображається наша html
## Налаштування мережі й томів
`docker network ls`
NETWORK ID     NAME                DRIVER    SCOPE
6db51a9f40d4   bridge              bridge    local
b3b3456e233e   host                host      local
a99cde6bc70a   lecture_17_appnet   bridge    local
5cef739a2502   none                null      local

`docker volume ls`
DRIVER    VOLUME NAME
local     85a43ac959229768fafe7608084964859cef8a1a719cb59a33381368639e9ea8
local     lecture_17_db-data

`docker-compose ps`
WARN[0000] /Users/shurik/Desktop/r_d_petclinic/Lecture_17/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
NAME                 IMAGE             COMMAND                  SERVICE   CREATED          STATUS         PORTS
lecture_17-cache-1   redis:latest      "docker-entrypoint.s…"   cache     14 minutes ago   Up 3 minutes   6379/tcp
lecture_17-db-1      postgres:latest   "docker-entrypoint.s…"   db        14 minutes ago   Up 3 minutes   5432/tcp
lecture_17-web-1     nginx:latest      "/docker-entrypoint.…"   web       9 minutes ago    Up 3 minutes   0.0.0.0:80->80/tcp

`docker exec -it lecture_17-db-1 psql -U user -d mydatabase`