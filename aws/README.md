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

