#!/bin/bash
echo "Hello, World" > index.html
sudo apt install busybox -y
nohup busybox httpd -f -p 8080 &