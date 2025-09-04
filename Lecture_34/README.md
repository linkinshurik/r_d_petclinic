## Запустіть Jenkins на вашому локальному сервері або в Docker
- образ запуск локально в докері
- створення окремого бріджа
`docker network create jenkins-net`
- піднімаємо з останнього імеджа
`docker run -d --name jenkins -p 8080:8080 -p 50000:50000 --network jenkins-net -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts`
- дістаємо логи з логів, проходимо візард
- встановлюємо плагіни Publish Over SSH, Notify.Events
## Налаштувати EC2
- встановлення Ubuntu EC2 інстанса 
- конфігурація першочергова
- встановлюємо джаву
`sudo su`
`apt-get update -y`
`apt-get install -y default-jdk ufw`

- додаємо сервісного користувача та робочої директорії
`adduser --system --group spring`
`mkdir -p /opt/app && chown spring:spring /opt/app`

- SSH та 80
`ufw allow 22/tcp`
`ufw allow 80/tcp`
`ufw --force enable`

- генеруємо ключ на дженкінс
`ssh-keygen -t ed25519 -C "jenkins@ci" -f ~/.ssh/ec2_ed25519 -N ""`
- записуємо цей ключ на ЕС2
`sudo -u spring mkdir -p /home/spring/.ssh`
`sudo -u spring vim /home/spring/.ssh/authorized_keys`
`sudo chmod 600 /home/spring/.ssh/authorized_keys`
- треба юзеру прибрати nologin
sudo usermod -s /bin/bash spring
