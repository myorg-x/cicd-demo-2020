#!/bin/bash
token=$(apictl get-keys -n MobileStore -v 1.0 -e dev)
newman run MobileStoreTest.postman_collection.json -e dev.postman_environment.json --env-var="token=$token" -k
