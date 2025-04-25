- Встановлення з офіційного репозиторію
`sudo apt update`
`sudo apt install -y nginx`

- Встановлення PPA nginx
`sudo add-apt-repository ppa:nginx/stable`

Видало помилку:
`E: The repository 'https://ppa.launchpadcontent.net/nginx/stable/ubuntu noble Release' does not have a Release file.`

- Встановив ppa-purge
`sudo apt install ppa-purge`
`sudo ppa-purge -y ppa:nginx/stable - також виводить помилку does not have a Release file.`

- Оновив nginx
`sudo apt upgrade -y nginx`

`nginx -v`
`nginx version: nginx/1.24.0 (Ubuntu)`

###

- Створення власного сервісу systemd
`vim timestamp.sh `
```
#!/bin/bash
echo "$(date)" >> /home/vagrant/timestamp.log
```
- Надання прав на виконання
`chmod 777 timestamp.sh`
- Створення systemd сервісу
`sudo vim /etc/systemd/system/timestamp.service`
```
[Unit]
Description=Timestamp writer service

[Service]
Type=simple
ExecStart=/home/vagrant/timestamp.sh
```
- Створення таймеру, щохвилини
`sudo vim /etc/systemd/system/timestamp.timer`
```
[Unit]
Description=Run timestamp service every minute

[Timer]
OnCalendar=*-*-* *:*:00

[Install]
WantedBy=timers.target
```

- Перезавантажуємо systemctl
`sudo systemctl daemon-reload`
- Запуск сервісу
`sudo systemctl start timestamp.timer`
- Перевірити роботу
`sudo systemctl status timestamp.timer`
● timestamp.timer - Run timestamp service every minute
     Loaded: loaded (/etc/systemd/system/timestamp.timer; enabled; preset: enabled)
     Active: active (waiting) since Thu 2025-03-27 22:17:01 UTC; 6s ago
    Trigger: Thu 2025-03-27 22:18:00 UTC; 51s left
   Triggers: ● timestamp.service

Mar 27 22:17:01 vm1 systemd[1]: Started timestamp.timer - Run timestamp service every minute.
`tail -f timestamp.log`
Thu Mar 27 21:49:19 UTC 2025 #вручну запущений скрипт
Thu Mar 27 10:17:01 PM UTC 2025 #робота сервісу
Thu Mar 27 10:18:10 PM UTC 2025


###

Iptables

VM1 -> 10.0.2.15
Personal host -> 192.168.1.146

sudo iptables -A INPUT -p tcp -s 10.0.2.15 --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp -s 192.168.1.146 --dport 22 -j DROP

- Підключався з Personal host. Одразу відпало зєднання. Після перезавантаження відновилось. Для того щоб зберегти потрібно

sudo iptables -A INPUT -p tcp -s 10.0.2.15 --dport 22 -j DROP
sudo iptables -A INPUT -p tcp -s 192.168.1.146 --dport 22 -j ACCEPT

`sudo apt install iptables-persistent -y`
`sudo netfilter-persistent save`

```
run-parts: executing /usr/share/netfilter-persistent/plugins.d/15-ip4tables save
run-parts: executing /usr/share/netfilter-persistent/plugins.d/25-ip6tables save
```

- Налаштування fail2ban

`sudo apt install fail2ban -y`
- конфіг
```
[sshd]
enabled = true
port = ssh
maxretry = 3
bantime = 3600
findtime = 600
logpath = /var/log/auth.log
```

- Перезапустити
`sudo systemctl restart fail2ban`
`sudo systemctl enable fail2ban`
- Після невдалих спроб
ssh: connect to host 192.168.1.97 port 22: Connection refused

- Який вивід можна переглянути
`sudo fail2ban-client status sshd`
```
Status for the jail: sshd
|- Filter
|  |- Currently failed:	1
|  |- Total failed:	2
|  `- Journal matches:	_SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned:	0
   |- Total banned:	0
   `- Banned IP list:	
```
###

Додавання диску
- вимикаємо VM
- створюємо новий віртуальний диск на 1гб
`lsblk`
- бачимно новий диск sdb
```
vagrant@vm1:~$ sudo fdisk /dev/sdb

Welcome to fdisk (util-linux 2.39.3).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS (MBR) disklabel with disk identifier 0x23c3ac94.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 
First sector (2048-2097151, default 2048): 
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-2097151, default 2097151): 

Created a new partition 1 of type 'Linux' and of size 1023 MiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```
- Форматуємо диск
`sudo mkfs.ext4 /dev/sdb`
- Створюємо директорію для монтування
`sudo mkdir /mnt/sdb`
- Монтуємо
`sudo mount /dev/sdb1 /mnt/sdb`
- Перевіряємо
```
df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              298M 1016K  297M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   31G  4.6G   25G  16% /
tmpfs                              1.5G     0  1.5G   0% /dev/shm
tmpfs                              5.0M     0  5.0M   0% /run/lock
/dev/sda2                          2.0G  142M  1.7G   8% /boot
tmpfs                              298M   12K  298M   1% /run/user/1000
/dev/sdb1                          989M   24K  922M   1% /mnt/sdb
```
- Редагуємо для автоматичного монтування fstab
`sudo vim /etc/fstab`
- Додаємо
`/dev/sdb1  /mnt/sdb  ext4  defaults  0  2`
- Перезавантажужмо, диск залишається підмонтованим






