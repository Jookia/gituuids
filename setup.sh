#!/bin/sh
git config log.mailmap true
git config mailmap.blob uuid-map:uuid-map
./update-uuids.sh
./create-my-uuid.sh
