# MySQL Permissions

Be specific, don't use `GRANT ALL ON *.*`
Use `GRANT ALL ON '%'.*, not *.* 

## Clear table of global user permissions
```
> SELECT * FROM information_schema.user_privileges;
```

## GRANTs
```
-- GRANT read on a schema for user at subnet
> GRANT SELECT ON schema.* TO 'user'@'10.%';

-- GRANT read/write to a schema
> GRANT SELECT, INSERT, DELETE, UPDATE ON schema.* TO 'user'@'10.%';

-- Make sure user has a password
>  set password for 'user'@'10.%' = password('secret');

-- Flush privileges to make them active.
-- When you add new users or make changes they won't 
-- be effective unless you flush privileges.
> FLUSH PRIVILEGES;

-- show grants for a user
> show grants for 'user'@'10.%';
+----------------------------------------------------------------------+
| Grants for user@10.%                                                 |
+----------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'user'@'10.%' IDENTIFIED BY PASSWORD <secret>  |
| GRANT SELECT, INSERT, UPDATE, DELETE ON `schema`.* TO 'user'@'10.%' |
+----------------------------------------------------------------------+
```

## Migrate Users Between Servers

https://wisdmlabs.com/blog/migrate-mysql-users-one-server-another/
