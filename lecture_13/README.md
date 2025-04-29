### Запустити базу данних (данні локально зберігаються, в разі перезапуску)
run
`docker compose up -d`

Host: localhost
Port: 5432
Database: SchoolDB
Username: admin
Password: password

### Створення таблиць
parents.sql
institutions.sql
classes.sql
children.sql
(послідовність важлива)

### Мокові данні

mock_data.sql

### Операції з таблицями
TASK_1.sql
TASK_2.sql
TASK_3.sql

### Зробіть бекап бази та застосуйте його для нової бази даних і перевірте, що цілісність даних не порушено.
Все зроблено за допомогою pgAdmin.
1. Створити дамп / обрати формат
2. Створити нову базу
3. Обрати resotre та готовий дамп

### Додаткове завдання 

TASK_ADDITIONAL.sql