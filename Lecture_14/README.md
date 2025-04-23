## Піднімаємо доке
`docker run -d --name gym-mongo -p 27017:27017 -v gym-mongo-data:/data/db mongo`
Для підключення і роботи використовував MongoDB Compass

## Створення бази даних та колекцій
За допомогою UI створюємо БД gymDatabase та колекції clients, memberships, workouts, trainers

## Визначення схеми документів:
Я так розумію, що схема не обовязкова, тому її можна визначити заповнюючи колекцію наступним кроком

## Заповнення колекцій даними:
fixtures/clients.js
fixtures/memberships.js
fixtures/workouts.js
fixtures/trainers.js

## 
