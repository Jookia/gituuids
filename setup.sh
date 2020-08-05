#!/bin/sh
git config log.mailmap true
git config mailmap.blob uuid-map:uuid-map
./update-uuids.sh
./sync-uuid.sh
UUID=$(cat /proc/sys/kernel/random/uuid)
./create-my-uuid.sh $UUID "$(git config user.name)" "$(git config user.email)"
git config user.name $UUID
git config user.email uuid@uuid.uuid
