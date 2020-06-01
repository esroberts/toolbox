# cURL

## Timings
https://stackoverflow.com/questions/18215389/how-do-i-measure-request-and-response-times-at-once-using-curl/22625150#22625150


# IOPS

```
> iostat -mydtxz 1
Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz avgqu-sz   await r_await w_await  svctm  %util
xvdb              0.00     0.00 4936.00  395.00    19.70     7.97    10.63 1.07    0.20    0.19    0.29   0.11  58.40
xvdc              0.00     0.00 5118.00  381.00    20.43     7.92    10.56 1.12    0.21    0.21    0.16   0.12  64.00
xvdd              0.00     0.00 5226.00  338.00    20.92     6.12     9.96 1.03    0.19    0.19    0.18   0.11  59.20
xvde              0.00     0.00 4982.00  371.00    19.96     7.40    10.47 1.01    0.19    0.18    0.32   0.12  62.40
md125             0.00     0.00 20261.00 1485.00    81.00    29.41    10.40 0.00    0.00    0.00    0.00   0.00   0.00
```

20261 total read IOPS, 1485 total write IOPS
81 MB/s reads, 29.41 MB/s writes

AWS IOPS table https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html
