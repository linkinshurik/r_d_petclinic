## Запустіть Jenkins на вашому локальному сервері або в Docker
- образ запуск локально в докері
- створення окремого бріджа
`docker network create jenkins-net`
- піднімаємо з останнього імеджа
`docker run -d --name jenkins -p 8080:8080 -p 50000:50000 --network jenkins-net -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts`
- дістаємо логи з логів, проходимо візард
