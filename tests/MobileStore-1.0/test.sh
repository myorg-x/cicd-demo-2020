#!/bin/bash

# get current folder
DIR="$(dirname "${BASH_SOURCE[0]}")"

token=$(apictl get-keys -n MobileStore -v 1.0 -e dev)
newman run $DIR/MobileStoreTest.postman_collection.json -e $DIR/dev.postman_environment.json --env-var="token=$token" -k
