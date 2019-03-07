# SSL

## Find expiration of server certificate

```
> echo q | openssl s_client -connect somedomain.com:443
 | openssl x509 -noout -enddate
```

## Check if using tls version

```
> openssl s_client -connect somedomain.com:443 -tls1_2
```
