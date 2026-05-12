#!/bin/bash

URL="https://example.com"

STATUS=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ $STATUS -eq 200 ]; then
    echo "Application is UP"
else
    echo "Application is DOWN"
fi
