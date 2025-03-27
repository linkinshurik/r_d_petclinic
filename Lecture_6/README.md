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



