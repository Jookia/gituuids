#!/bin/sh
# Usage: UUID Author Email
BLOB=$(git ls-tree -l refs/heads/uuid-map uuid-map | cut -f3 -d" ")
git cat-file blob $BLOB > tmp-uuids
grep -v "$1" < tmp-uuids > tmp-uuids.new
echo "$2 <$3> $1 <uuid@uuid.uuid>" >> tmp-uuids.new
mv tmp-uuids.new tmp-uuids
NEWBLOB=$(git hash-object -w tmp-uuids)
rm tmp-uuids
TREE=$(printf "100644 blob $NEWBLOB\tuuid-map" | git mktree)
COMMIT=$(echo | git commit-tree $TREE)
git update-ref refs/heads/uuid-map $COMMIT
