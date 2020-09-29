#!/bin/bash

# get current folder
DIR="$(dirname "${BASH_SOURCE[0]}")"

# retrieve a token to invoke and test the API
token=$(apictl get-keys -n MobileStore -v 1.0 -e dev)

# run newman test script
newman run $DIR/MobileStoreTest.postman_collection.json -e $DIR/dev.postman_environment.json --env-var="token=$token" -k
