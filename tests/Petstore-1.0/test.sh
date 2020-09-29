#!/bin/bash

# get current folder
DIR="$(dirname "${BASH_SOURCE[0]}")"

# retrieve a token to invoke and test the API
token=$(apictl get-keys -n Petstore -v 1.0 -e dev)

# run newman test script
newman run $DIR/Petstore.postman_collection.json -e $DIR/dev.postman_environment.json --env-var="token=$token" -k
