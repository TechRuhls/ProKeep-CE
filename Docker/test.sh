#!/bin/bash
curl https://pkcodeexercise.com
if [ $? -eq 0 ]; then
    echo True
else
    echo False
fi
curl http://pkcodeexercise.com
if [ $? -eq 0 ]; then
    echo True
else
    echo False
fi
curl https://pkcodeexercise.com:8080
