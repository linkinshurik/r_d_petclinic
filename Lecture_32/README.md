## Встановлення Ansible
`brew install ansible`
`ansible-galaxy collection install amazon.aws`

## Створення ролі "baseline" для базових налаштувань серверів
/roles/baseline/vars/main.yml

## Створення ролі для налаштування firewall
/roles/firewall/tasks/main.yml
## Створення ролі для налаштування Nginx
/roles/nginx/*

## Застосування dynamic inventory для управління інфраструктурою
/inventories/aws_ec2.yaml
- тут мені прям дуже не зайшло використання змінних в compose

## Використання Ansible Vault для шифрування конфіденційних даних
- створюємо файл vault_password.txt вписуємо пароль
- надаємо права
`chmod 600 vault_password.txt`
- додаємо в ansible.cfg посилання на файл з паролем
`vault_password_file = ~/.vault_password.txt`
- додаємо в gitignore

- cтворюємо секрет
`ansible-vault create ./group_vars/all/vault.yml`
- переглянути
`ansible-vault view ./group_vars/all/vault.yml`

## Сконфігуруйте декілька playbooks для різних ситуацій з наявних ролей
- додано плейбуки
/playbooks/*

- Результат виконання плейбуку
```
➜  Lecture_32 git:(HW32_Ansible) ✗ ansible-playbook playbooks/site.yml                           

PLAY [hw32-site] ************************************************************************************************************************
[WARNING]: Found variable using reserved name: tags

TASK [Gathering Facts] ******************************************************************************************************************
The authenticity of host '54.90.135.204 (54.90.135.204)' can't be established.
ED25519 key fingerprint is SHA256:7ixYMWZAgfE5gEAmiNh7ggIGDlE08ux/1o8T7hd4L+o.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
[WARNING]: Platform linux on host hw32-site is using the discovered Python interpreter at /usr/bin/python3.12, but future installation
of another Python interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-
core/2.18/reference_appendices/interpreter_discovery.html for more information.
ok: [hw32-site]

TASK [firewall : Allow SSH] *************************************************************************************************************
changed: [hw32-site]

TASK [firewall : Allow HTTP/HTTPS] ******************************************************************************************************
changed: [hw32-site] => (item=80)
changed: [hw32-site] => (item=443)

TASK [firewall : Enable UFW] ************************************************************************************************************
changed: [hw32-site]

TASK [nginx : Install Nginx] ************************************************************************************************************
changed: [hw32-site]

TASK [nginx : Deploy virtual-host config] ***********************************************************************************************
changed: [hw32-site]

TASK [nginx : Deploy index.html] ********************************************************************************************************
changed: [hw32-site]

TASK [nginx : Ensure root dir exists] ***************************************************************************************************
ok: [hw32-site]

TASK [nginx : Ensure Nginx running & enabled] *******************************************************************************************
ok: [hw32-site]

RUNNING HANDLER [nginx : Reload nginx] **************************************************************************************************
changed: [hw32-site]

PLAY RECAP ******************************************************************************************************************************
hw32-site                  : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```