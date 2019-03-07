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
> GRANT SELECT, INSERT, DELETE, UPDATE schema.* TO 'user'@'10.%';

-- show grants for a user
> show grants for 'user'@'10.%';
+----------------------------------------------------------------------+
| Grants for user@10.%                                                 |
+----------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'user'@'10.%' IDENTIFIED BY PASSWORD <secret>  |
| GRANT SELECT, INSERT, UPDATE, DELETE ON `schema`.* TO 'user'@'10.%' |
+----------------------------------------------------------------------+
```
