# Some useful tcpdump recipes

## Capture traffic on a port

```
> tcpdump -nnvvvSeXX dst port 8125
```

## Show HTTP POST body
```
> tcpdump -A -s 0 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
```

## Grep the request for a string
```
> tcpdump -s 0 -v -n -l | egrep -i 'POST'
```

## More

https://hackertarget.com/tcpdump-examples/
