# Wordpress "Dummy-Installation" für Docker-Übungszwecke

## MySQL

Ich möchte die MySQL-Datenbank (in ihrem Docker-Container!) remote administrieren, z.B. mit MySQL Workbench. Dazu lege ich einen zusätzlichen Admin-User an, der sich auch remote einloggen darf:

```bash
mysql -u root -p
```

```sql
CREATE USER 'comes'@'%' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'comes'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EXIT;
```

## Quellen:

  * https://tecadmin.net/how-to-create-an-admin-user-in-mysql/
