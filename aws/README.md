### Route 53 DNS Lookup

```
aws route53 list-resource-record-sets --hosted-zone-id ZAT8123456789 \
--query "ResourceRecordSets[?Name == 'first.example.com']]" | jq -r '.[] | \
 .ResourceRecords[].Value'

172.1.30.1

```

### Reverse Route 53 DNS Lookup
```
aws route53 list-resource-record-sets --hosted-zone-id ZAT8123456789 \
--query "ResourceRecordSets[?ResourceRecords[?Value == '172.1.30.1']].Name"

[
    "first.example.com.",
    "second.example.com."
]
```

### Filter EC2 by Tag Name, Print IP, Name Tag
```
aws ec2 describe-instances --query
'Reservations[*].Instances[*].[PrivateIpAddress,Tags[?Key==`Name`].Value]'
--filters "Name=tag:Name,Values=some*wildcard" | grep 172 | tr -s
'\n' ' '  | tr -s '", "' ' '
```
