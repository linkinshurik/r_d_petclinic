Встановлення з офіційного репозиторію
`sudo apt update`
`sudo apt install -y nginx`

Встановлення PPA nginx
`sudo add-apt-repository ppa:nginx/stable`

Видало помилку:
`E: The repository 'https://ppa.launchpadcontent.net/nginx/stable/ubuntu noble Release' does not have a Release file.`

Встановив ppa-purge
`sudo apt install ppa-purge`
`sudo ppa-purge -y ppa:nginx/stable - також виводить помилку does not have a Release file.`

Оновив nginx
`sudo apt upgrade -y nginx`

`nginx -v`
`nginx version: nginx/1.24.0 (Ubuntu)`

###

Створення власного сервісу systemd
`vim timestamp.sh `
```
#!/bin/bash
echo "$(date)" >> /home/vagrant/timestamp.log
```
Надання прав на виконання
`chmod 777 timestamp.sh`
Створення systemd сервісу
`sudo vim /etc/systemd/system/timestamp.service`
```
[Unit]
Description=Timestamp writer service

[Service]
Type=simple
ExecStart=/home/vagrant/timestamp.sh
```
Створення таймеру, щохвилини
`sudo vim /etc/systemd/system/timestamp.timer`
```
[Unit]
Description=Run timestamp service every minute

[Timer]
OnCalendar=*-*-* *:*:00

[Install]
WantedBy=timers.target
```

Перезавантажуємо systemctl
`sudo systemctl daemon-reload`
Запуск сервісу
`sudo systemctl start timestamp.timer`
Перевірити роботу:
`sudo systemctl status timestamp.timer`
● timestamp.timer - Run timestamp service every minute
     Loaded: loaded (/etc/systemd/system/timestamp.timer; enabled; preset: enabled)
     Active: active (waiting) since Thu 2025-03-27 22:17:01 UTC; 6s ago
    Trigger: Thu 2025-03-27 22:18:00 UTC; 51s left
   Triggers: ● timestamp.service

Mar 27 22:17:01 vm1 systemd[1]: Started timestamp.timer - Run timestamp service every minute.
`tail -f timestamp.log`
Thu Mar 27 21:49:19 UTC 2025 - вручну запущений скрипт
Thu Mar 27 10:17:01 PM UTC 2025 - робота сервісу
Thu Mar 27 10:18:10 PM UTC 2025

