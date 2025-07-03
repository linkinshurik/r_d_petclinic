## Встановлення Ansible
`brew install ansible`
`ansible-galaxy collection install amazon.aws`

## Створюємо секрет
`ansible-vault create ./group_vars/all/vault.yml`
- переглянути
`ansible-vault view secret.yml`

- створюємо файл vault_password.txt вписуємо пароль
- надаємо права
`chmod 600 vault_password.txt`
- додаємо в ansible.cfg посилання на файл з паролем
`vault_password_file = ~/.vault_password.txt`
- додаємо в gitignore
