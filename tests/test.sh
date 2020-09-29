#!/bin/bash
token=$(apictl get-keys -n MobileStore -v 1.0)
echo $token