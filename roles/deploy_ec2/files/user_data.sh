#!/bin/bash
# bash script to install and start the Apache web server
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd
