# Random Helpful Git Commands

## Search remote branches by name, print name with hash

```
for i in $(git branch -r | grep 2019); do printf "%s %s\n" $i `git rev-parse $i`; done 
```

## Search reflog by tag name, showing object IDs

```
git show-ref --tags -d | grep 201907.*\^\{\}
```
